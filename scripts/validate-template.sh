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
  "python"
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
    python)
      require_file "${dir}/.env.example"
      require_make_target "${makefile}" "dev"
      require_make_target "${makefile}" "typecheck"
      ;;
  esac
}

main() {
  validate_root_files

  for name in "${TEMPLATE_NAMES[@]}"; do
    validate_template_common "${name}"
    validate_template_specific "${name}"
  done

  echo "Template validation completed successfully."
}

main "$@"
