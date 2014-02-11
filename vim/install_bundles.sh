#!/usr/bin/env bash

for r in `cat repos`; do (cd bundle; git clone $r) ; done

