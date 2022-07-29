#!/usr/bin/env bash
source vars.sh
set -x
cd $serverDir
java -jar $serverJar
