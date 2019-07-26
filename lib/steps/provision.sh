#!/usr/bin/env bash

# shellcheck disable=1090
source <(curl -fsSL https://she.alaturka.io/source) -boot

enter "$(dirname "$0")/../scripts"
        enter ./base
                run font
                run operator
                run staff
                run timezone
        leave

        enter ./development
                run debian
                run shell
        leave

        enter ./other
                run zsh
                run mc
                run tmux
        leave
leave
