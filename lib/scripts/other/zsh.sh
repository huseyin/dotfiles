#!/bin/bash

set -euo pipefail; [[ -z ${TRACE:-} ]] || set -x

export DEBIAN_FRONTEND=noninteractive

operator=${operator:-$(id -rnu 1000 2>/dev/null)}

apt-get -y install --no-install-recommends zsh

chsh -s "$(command -v zsh)" "$operator"

# Tmux extension
mkdir -p /etc/tmux/conf.d
cat >/etc/tmux/conf.d/zsh.conf <<-'EOF'
	set -g default-shell /usr/bin/zsh
EOF

# Mute Zsh for new users
su - "$operator" -c 'touch ~/.zshrc'
