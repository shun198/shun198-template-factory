#!/usr/bin/env bash
set -euo pipefail

UV="${UV:-uv}"
generated_files=()
proto_files=()

while IFS= read -r file; do
  generated_files+=("${file}")
done < <(find src -type f \( \
  -name '*_pb2.py' -o \
  -name '*_pb2.pyi' -o \
  -name '*_pb2_grpc.py' \
\) | sort)

for file in "${generated_files[@]}"; do
  rm -f -- "${file}"
done

while IFS= read -r file; do
  proto_files+=("${file}")
done < <(find proto -name '*.proto' -type f | sort)

if [[ ${#proto_files[@]} -eq 0 ]]; then
  echo "No .proto files found under proto/." >&2
  exit 1
fi

"${UV}" run python -m grpc_tools.protoc \
  -I proto \
  --python_out=src \
  --pyi_out=src \
  --grpc_python_out=src \
  "${proto_files[@]}"
