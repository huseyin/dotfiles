#!/usr/bin/env bash

shopt -s globstar

enter ../..
        for f in etc/*/** usr/*/**; do
                cp -r $f /$f
        done
leave
