#!/bin/sh
set -e

if [ -z "${INPUT_RACK:-}" ]; then
  echo "::error::Required input 'rack' is missing"
  exit 1
fi
if [ -z "${INPUT_APP:-}" ]; then
  echo "::error::Required input 'app' is missing"
  exit 1
fi

echo "Building"
export CONVOX_RACK=$INPUT_RACK
if [ "$INPUT_CACHED" = "false" ]; then
  release=$(convox build --app $INPUT_APP --description "$INPUT_DESCRIPTION" --id --no-cache)
else
  release=$(convox build --app $INPUT_APP --description "$INPUT_DESCRIPTION" --id)
fi

if [ -z "$release" ]
then
  echo "Build failed"
  exit 1
fi
echo "release=$release" >> "$GITHUB_OUTPUT"
echo "RELEASE=$release" >> "$GITHUB_ENV"
