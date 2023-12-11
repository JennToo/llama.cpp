#!/bin/bash

set -eux -o pipefail

docker build . -f .devops/full-vulkan.Dockerfile -t llama-cpp-builder:local

docker run -it --rm \
    -v "$(pwd):$(pwd)" \
    -w "$(pwd)" \
    -u "$(id -u):$(id -g)" \
    llama-cpp-builder:local \
    make -j 10 LLAMA_VULKAN=1
