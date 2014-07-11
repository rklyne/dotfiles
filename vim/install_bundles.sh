#!/usr/bin/env bash

mkdir bundle
for r in `cat repos`; do (cd bundle; git clone --depth 1 $r) ; done

