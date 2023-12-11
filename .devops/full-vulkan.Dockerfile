ARG UBUNTU_VERSION=23.10

FROM ubuntu:$UBUNTU_VERSION as build

RUN apt-get update && \
    apt-get install -y build-essential python3 python3-pip git

RUN apt-get install -y libvulkan-dev glslc cmake
ENV LC_ALL=C.utf8
