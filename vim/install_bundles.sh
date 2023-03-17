#!/usr/bin/env bash

mkdir bundle
for r in `cat repos | grep -v "#"`; do (cd bundle; git clone --depth 1 $r || (cd $r; git pull)) ; done

