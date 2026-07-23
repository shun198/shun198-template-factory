#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

COMMON_FILES=(
  "README.md"
  "AGENTS.md"
  "CLAUDE.md"
  "Makefile"
  ".vscode/launch.json"
  ".github/workflows/ci.yml"
  "docs/architecture.md"
  "docs/decision-log.md"
)

COMMON_COMMANDS=(
  "setup"
  "test"
  "lint"
  "format"
)

TEMPLATE_NAMES=(
  "golang"
  "terraform-google-cloud"
  "nestjs"
  "python"
  "nextjs"
)

template_dir() {
  echo "${ROOT_DIR}/templates/$1"
}

require_file() {
  local file_path="$1"
  if [[ ! -f "${file_path}" ]]; then
    echo "Missing required file: ${file_path}" >&2
    exit 1
  fi
}

require_dir() {
  local dir_path="$1"
  if [[ ! -d "${dir_path}" ]]; then
    echo "Missing required directory: ${dir_path}" >&2
    exit 1
  fi
}

require_make_target() {
  local file_path="$1"
  local target_name="$2"
  if ! grep -Eq "^${target_name}:" "${file_path}"; then
    echo "Missing make target '${target_name}' in ${file_path}" >&2
    exit 1
  fi
}

validate_root_files() {
  require_file "${ROOT_DIR}/README.md"
  require_file "${ROOT_DIR}/AGENTS.md"
  require_file "${ROOT_DIR}/CLAUDE.md"
  require_file "${ROOT_DIR}/Makefile"
  require_file "${ROOT_DIR}/.github/workflows/ci.yml"
  require_file "${ROOT_DIR}/docs/architecture.md"
  require_file "${ROOT_DIR}/docs/template-policy.md"
  require_file "${ROOT_DIR}/docs/decision-log.md"
}

validate_template_common() {
  local name="$1"
  local dir
  dir="$(template_dir "${name}")"

  require_dir "${dir}"
  require_dir "${dir}/tests"

  for rel in "${COMMON_FILES[@]}"; do
    require_file "${dir}/${rel}"
  done

  for target in "${COMMON_COMMANDS[@]}"; do
    require_make_target "${dir}/Makefile" "${target}"
  done
}

validate_template_specific() {
  local name="$1"
  local dir
  local makefile
  dir="$(template_dir "${name}")"
  makefile="$(template_dir "${name}")/Makefile"

  case "${name}" in
    golang)
      require_file "${dir}/.env.example"
      require_make_target "${makefile}" "dev"
      ;;
    terraform-google-cloud)
      require_make_target "${makefile}" "init"
      require_make_target "${makefile}" "plan"
      require_make_target "${makefile}" "apply"
      require_make_target "${makefile}" "destroy"
      require_make_target "${makefile}" "validate"
      ;;
    nestjs)
      require_file "${dir}/.env.example"
      require_make_target "${makefile}" "dev"
      ;;
    python)
      require_file "${dir}/.env.example"
      require_make_target "${makefile}" "dev"
      require_make_target "${makefile}" "typecheck"
      ;;
    nextjs)
      require_file "${dir}/.env.example"
      require_file "${dir}/.dockerignore"
      require_make_target "${makefile}" "dev"
      require_make_target "${makefile}" "build"
      ;;
  esac
}

validate_python_generation() {
  local temp_project="tmp-python-validate-project"
  local temp_dir="${ROOT_DIR}/${temp_project}"

  rm -rf "${temp_dir}"
  "${ROOT_DIR}/scripts/create-template.sh" python "${temp_project}" >/dev/null

  if [[ ! -d "${temp_dir}/src/${temp_project//-/_}" ]]; then
    echo "Generated Python package directory is missing: ${temp_dir}/src/${temp_project//-/_}" >&2
    rm -rf "${temp_dir}"
    exit 1
  fi

  rm -rf "${temp_dir}"
}

validate_nextjs_generation() {
  local temp_project='tmp-nextjs-&-$-\-validate-project'
  local temp_dir="${ROOT_DIR}/${temp_project}"

  rm -rf "${temp_dir}"
  "${ROOT_DIR}/scripts/create-template.sh" nextjs "${temp_project}" >/dev/null

  if grep -R -E '__PROJECT_NAME__|__PROJECT_SLUG__|\*\*PROJECT_NAME\*\*' "${temp_dir}" >/dev/null; then
    echo "Generated Next.js project contains unresolved placeholders" >&2
    rm -rf "${temp_dir}"
    exit 1
  fi

  if ! grep -Fqx "NEXT_PUBLIC_APP_NAME=${temp_project}" "${temp_dir}/.env.example"; then
    echo "Generated Next.js project did not preserve the literal project name" >&2
    rm -rf "${temp_dir}"
    exit 1
  fi

  rm -rf "${temp_dir}"
}

validate_terraform_if_available() {
  if command -v terraform >/dev/null 2>&1; then
    terraform fmt -check -recursive "${ROOT_DIR}/templates/terraform-google-cloud"

    local env_dir
    for env_dir in "${ROOT_DIR}/templates/terraform-google-cloud/envs/dev" "${ROOT_DIR}/templates/terraform-google-cloud/envs/prod"; do
      local tf_log
      tf_log="$(mktemp)"

      if (
        cd "${env_dir}"
        terraform init -backend=false >"${tf_log}" 2>&1 && terraform validate >>"${tf_log}" 2>&1
      ); then
        echo "terraform validate completed for ${env_dir##*/}"
      elif grep -Eq 'registry\.terraform\.io|no such host|Failed to query available provider packages' "${tf_log}"; then
        echo "terraform init/validate skipped for ${env_dir##*/} because providers could not be resolved in the current environment"
      else
        cat "${tf_log}" >&2
        rm -f "${tf_log}"
        exit 1
      fi

      rm -f "${tf_log}"
    done
  else
    echo "terraform not found; skipping terraform fmt/validate"
  fi
}

main() {
  validate_root_files

  for name in "${TEMPLATE_NAMES[@]}"; do
    validate_template_common "${name}"
    validate_template_specific "${name}"
  done

  validate_python_generation
  validate_nextjs_generation
  validate_terraform_if_available
  echo "Template validation completed successfully."
}

main "$@"
