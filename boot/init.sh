#!/bin/bash

set -euo pipefail; [[ -z ${TRACE:-} ]] || set -x

export DEBIAN_FRONTEND=noninteractive

user=${user:-$(id -rnu 1000 2>/dev/null)}

cp -r /root/.ssh /home/$user
chown -R $user:$user /home/$user/.ssh
