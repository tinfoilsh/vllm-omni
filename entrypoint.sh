#!/bin/bash

set -e

MODEL="$1"
shift

exec vllm serve "$MODEL" --omni "$@"
