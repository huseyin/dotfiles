#!/usr/bin/env bash

# shellcheck disable=1090
source <(curl -fsSL https://she.alaturka.io/source) -boot

shopt -s globstar

enter "$(dirname "$0")/../.."
        for f in etc/*/** usr/*/**; do
                cp -r $f /$f
        done
leave
