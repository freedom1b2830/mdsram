#!/usr/bin/env bash
source vars.sh

pacstrap --needed --noconfirm $install_ram $packages

mkdir -pv $serverDir
wget https://api.papermc.io/v2/projects/paper/versions/1.19.1/builds/88/downloads/paper-1.19.1-88.jar -O $serverJar

#minecraft scripts
cp $serverInstallScript $serverInstallScriptFullPath
arch-chroot $install_ram bash -c $serverInstallScriptFullPath
