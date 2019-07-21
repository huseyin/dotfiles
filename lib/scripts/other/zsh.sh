#!/bin/bash

set -euo pipefail; [[ -z ${TRACE:-} ]] || set -x

export DEBIAN_FRONTEND=noninteractive

cd "$(dirname "$0")/../.."

operator=${operator:-$(id -rnu 1000 2>/dev/null)}

apt-get -y install --no-install-recommends zsh

chsh -s "$(command -v zsh)" "$operator"

# Mute Zsh for new users
su - "$operator" -c 'touch ~/.zshrc'
