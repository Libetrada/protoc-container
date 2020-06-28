#!/bin/bash
set -euo pipefail

args=("$@")
if [ "${#args[@]}" -lt 2 ]; then args+=(protos/*.proto); fi

exec protoc -Iprotos --doc_out=/out "${args[@]}"
