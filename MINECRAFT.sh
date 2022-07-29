#!/usr/bin/env bash
source vars.sh
set -x
cd $serverDirInstalled
java -jar $serverJar
