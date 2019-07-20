#!/usr/bin/env bash

# shellcheck disable=1090
source <(curl -fsSL https://she.alaturka.io/source) -boot

enter ./catalog
	enter ./base
		try font
		try staff
		try timezone
	leave
leave
