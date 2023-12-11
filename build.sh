#!/bin/bash

set -eux -o pipefail

docker build . -f .devops/full-vulkan.Dockerfile -t llama-cpp-builder:local

mkdir -p build

docker run -it --rm \
    -v "$(pwd):$(pwd)" \
    -w "$(pwd)" \
    -u "$(id -u):$(id -g)" \
    llama-cpp-builder:local \
    /bin/bash -c "cd build && cmake .. -DLLAMA_VULKAN=ON && make -j 10"
