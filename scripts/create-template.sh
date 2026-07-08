#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMPLATES_DIR="${ROOT_DIR}/templates"
TEMPLATE_PYTHON_PACKAGE="template_app"

usage() {
  cat <<'EOF'
Usage:
  ./scripts/create-template.sh <template-name> <destination-directory>

Examples:
  ./scripts/create-template.sh python my-python-app
  ./scripts/create-template.sh golang my-go-service
EOF
}

slugify() {
  echo "$1" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//'
}

python_package_name() {
  echo "$1" | tr '-' '_' | sed -E 's/[^a-z0-9_]+/_/g'
}

replace_placeholders() {
  local target_dir="$1"
  local project_name="$2"
  local project_slug="$3"
  local python_package="$4"

  while IFS= read -r -d '' file; do
    perl -0pi -e "s/__PROJECT_NAME__/${project_name}/g; s/template_app/${project_slug}/g; s/__PYTHON_PACKAGE__/${python_package}/g; s/${TEMPLATE_PYTHON_PACKAGE}/${python_package}/g" "$file"
  done < <(find "$target_dir" -type f \
    ! -path '*/.git/*' \
    ! -path '*/node_modules/*' \
    -print0)
}

rename_placeholder_paths() {
  local target_dir="$1"
  local project_name="$2"
  local project_slug="$3"
  local python_package="$4"

  while IFS= read -r -d '' path; do
    local renamed_path="$path"
    renamed_path="${renamed_path//__PROJECT_NAME__/${project_name}}"
    renamed_path="${renamed_path//template_app/${project_slug}}"
    renamed_path="${renamed_path//__PYTHON_PACKAGE__/${python_package}}"

    if [[ "$path" != "$renamed_path" ]]; then
      mv "$path" "$renamed_path"
    fi
  done < <(find "$target_dir" -depth \( \
    -name '*__PROJECT_NAME__*' -o \
    -name '*template_app*' -o \
    -name '*__PYTHON_PACKAGE__*' \
  \) -print0)
}

rename_python_package_dir() {
  local target_dir="$1"
  local python_package="$2"
  local source_dir="${target_dir}/src/${TEMPLATE_PYTHON_PACKAGE}"
  local destination_dir="${target_dir}/src/${python_package}"

  if [[ -d "${source_dir}" && "${source_dir}" != "${destination_dir}" ]]; then
    if [[ -d "${destination_dir}" ]]; then
      rmdir "${destination_dir}"
    fi
    mv "${source_dir}" "${destination_dir}"
  fi
}

main() {
  if [[ $# -ne 2 ]]; then
    usage
    exit 1
  fi

  local template_name="$1"
  local destination_name="$2"
  local template_dir="${TEMPLATES_DIR}/${template_name}"
  local destination_dir="${ROOT_DIR}/${destination_name}"
  local project_slug
  local python_package

  if [[ ! -d "${template_dir}" ]]; then
    echo "Error: unknown template '${template_name}'." >&2
    echo "Available templates:" >&2
    find "${TEMPLATES_DIR}" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sort >&2
    exit 1
  fi

  if [[ -e "${destination_dir}" ]]; then
    echo "Error: destination '${destination_name}' already exists." >&2
    exit 1
  fi

  project_slug="$(slugify "${destination_name}")"
  python_package="$(python_package_name "${project_slug}")"

  cp -R "${template_dir}" "${destination_dir}"
  replace_placeholders "${destination_dir}" "${destination_name}" "${project_slug}" "${python_package}"
  rename_placeholder_paths "${destination_dir}" "${destination_name}" "${project_slug}" "${python_package}"
  rename_python_package_dir "${destination_dir}" "${python_package}"

  echo "Created '${destination_name}' from template '${template_name}'."
}

main "$@"
