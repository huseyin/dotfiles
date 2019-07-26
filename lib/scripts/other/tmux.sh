#!/bin/bash

set -euo pipefail; [[ -z ${TRACE:-} ]] || set -x

export DEBIAN_FRONTEND=noninteractive

apt-get -y install --no-install-recommends tmux

operator=${operator:-$(id -rnu 1000 2>/dev/null)}
chsh -s "$(command -v tmux)" "$operator"

shopt -s nullglob
if [[ -n $(echo /etc/update-motd.d/*) ]]; then
        chmod -x /etc/update-motd.d/*
fi
