#!/usr/bin/env bash
source vars.sh
set -x

pacman -Sy wget git --needed --noconfirm ||exit

pacstrap $install_ram $packages ||exit

mkdir -pv $serverDir ||exit
wget https://api.papermc.io/v2/projects/paper/versions/1.19.1/builds/88/downloads/paper-1.19.1-88.jar -c -O $serverJarFull ||exit

#minecraft scripts
cp $serverInstallScript $serverInstallScriptFullPath ||exit
cp $own_variables $own_variablesInstalled ||exit
arch-chroot $install_ram /$serverInstallScript
