#!/usr/bin/env bash

# shellcheck disable=1090
source <(curl -fsSL https://she.alaturka.io/source) -boot

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
leave
