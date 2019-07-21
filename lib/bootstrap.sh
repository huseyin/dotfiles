#!/usr/bin/env bash

# shellcheck disable=1090
source <(curl -fsSL https://she.alaturka.io/source) -boot

run processors/pre
run scripts/bootstrap
run processors/post
