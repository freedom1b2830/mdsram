#!/usr/bin/env bash
source vars.sh
set -x
cd $serverDirInstalled
java -jar $serverJar -nogui

#eula
sed -i 's/eula=false/eula=true/' eula.txt
#server.prop online mode
sed -i 's/online-mode=true/online-mode=false/' server.properties



java -jar $serverJar -nogui
