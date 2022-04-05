#!/bin/bash

source scl_source enable gcc-toolset-9

git clone ${REPO_URL} ${NAME}
cd ${NAME}

autoreconf -f -i

git checkout ${REPO_COMMIT}

./configure --prefix=/foss/tools/${NAME}/${REPO_COMMIT}
make -j$(nproc)
make install
