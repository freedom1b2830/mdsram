#!/usr/bin/env bash
source vars.sh
set -x
pacman -Syy wget git --needed --noconfirm



pacstrap --needed --noconfirm $install_ram $packages

mkdir -pv $serverDir
wget https://api.papermc.io/v2/projects/paper/versions/1.19.1/builds/88/downloads/paper-1.19.1-88.jar -c -O $serverJar

#minecraft scripts
cp $serverInstallScript $serverInstallScriptFullPath
cp $own_variables $own_variablesInstalled
arch-chroot $install_ram /$serverInstallScript
