#!/usr/bin/env bash

set -euo pipefail; [[ -z ${TRACE:-} ]] || set -x

export DEBIAN_FRONTEND=noninteractive

shopt -s globstar

pushd ../..
for f in etc/*/** usr/*/**; do
    cp -r $f /$f
done
popd
