#!/usr/bin/env bash
source vars.sh
set -x
cd mcrcon
./mcrcon -H $1 -p $rcon_passwd -t
