#!/bin/bash

source scl_source enable gcc-toolset-9

git clone --recursive ${REPO_URL} ${NAME}
cd ${NAME}
git checkout ${REPO_COMMIT}

mkdir -p build/
cd build
CFLAGS='-Wno-narrowing' cmake .. "-DCMAKE_INSTALL_PREFIX=/foss/tools/${NAME}/${REPO_COMMIT}"
make -j$(nproc)
make install