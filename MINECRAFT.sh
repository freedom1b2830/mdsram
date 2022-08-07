#!/usr/bin/env bash
source vars.sh
set -x
cd $serverDirInstalled

#TODO CHECK IF CONFIGURED***


cd plugins
git clone https://github.com/freedom1b2830/minecraft-plugin-autobuilder freedom1b2830-plugin-autobuilder-SOURCES
cd freedom1b2830-plugin-autobuilder-SOURCES
./update.sh

cd ../..

java -jar $serverJar -nogui

#eula
sed -i 's/eula=false/eula=true/' eula.txt
#server.prop online mode
sed -i 's/online-mode=true/online-mode=false/' server.properties

#server.prop rcon
sed -i 's/enable-rcon=false/enable-rcon=true/' server.properties
cat server.properties|grep "rcon.password" -v > server.properties2
echo "rcon.password="$rcon_passwd >> server.properties2
mv server.properties2 server.properties

java -jar $serverJar -nogui
