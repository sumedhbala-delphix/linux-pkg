#!/usr/bin/env bash
#
# Copyright 2018, 2020 Delphix
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# shellcheck disable=SC2034

DEFAULT_PACKAGE_GIT_URL="https://github.com/delphix/fio.git"

#UPSTREAM_GIT_URL=https://github.com/axboe/fio.git
#UPSTREAM_GIT_BRANCH=master

function prepare() {
        logmust install_pkgs \
            libaio-dev \
            librdmacm-dev \
            libibverbs-dev \
            librbd-dev \
            libgtk2.0-dev \
            libcairo2-dev \
            libnuma-dev \
            flex \
            bison \
            libglusterfs-dev \
            libpmem-dev \
            libpmemblk-dev
}


function build() {
        logmust cd "$WORKDIR/repo/"
        logmust dpkg-buildpackage -b -us -uc
        logmust mv $WORKDIR/*deb "$WORKDIR/artifacts/"
}
