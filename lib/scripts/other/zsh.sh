#!/bin/bash

set -euo pipefail; [[ -z ${TRACE:-} ]] || set -x

export DEBIAN_FRONTEND=noninteractive

cd "$(dirname "$0")/../.."

operator=${operator:-$(id -rnu 1000 2>/dev/null)}

apt-get -y install --no-install-recommends zsh

chsh -s "$(command -v zsh)" "$operator"

su - "$operator" -c 'touch ~/.zshrc'

for i in zprofile zshrc zlogin; do
        mkdir -p "/etc/zsh/$i.d"
        if [[ -f "/etc/zsh/$i" ]] && [[ ! -f /etc/zsh/$i.d/0dist.sh ]]; then
                mv "/etc/zsh/$i" "/etc/zsh/$i.d/0dist.sh"
        fi
done
