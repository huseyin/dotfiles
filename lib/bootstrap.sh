#!/usr/bin/env bash

# shellcheck disable=1090
source <(curl -fsSL https://she.alaturka.io/source) -boot

enter ./lib/processors; run pre;     leave
enter ./lib/scripts;    run scripts; leave
enter ./lib/processors; run post;    leave
