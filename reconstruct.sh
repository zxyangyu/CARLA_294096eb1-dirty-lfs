#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

file_name="CARLA_294096eb1-dirty.tar.gz"
expected_hash="739688863a43993334877f28d5be8af90197cbb13c50df3c4e5356dc657b7c35"
parts=("$file_name".part-*)

if [[ ${#parts[@]} -ne 297 || ! -f "${parts[0]}" ]]; then
    echo "Expected 297 parts. Run 'git lfs pull' and try again." >&2
    exit 1
fi

cat "${parts[@]}" > "$file_name"

if command -v sha256sum >/dev/null 2>&1; then
    actual_hash="$(sha256sum "$file_name" | awk '{print $1}')"
else
    actual_hash="$(shasum -a 256 "$file_name" | awk '{print $1}')"
fi

if [[ "$actual_hash" != "$expected_hash" ]]; then
    echo "SHA-256 mismatch: expected $expected_hash, got $actual_hash" >&2
    exit 1
fi

echo "SHA-256 verified: $PWD/$file_name"
