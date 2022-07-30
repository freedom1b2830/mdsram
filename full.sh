#!/usr/bin/env bash
source vars.sh
set -x

#this repo
git pull
git submodule update --init --recursive

#live os
pacman -Sy archlinux-keyring  --needed --noconfirm ||exit
pacman -S --needed --noconfirm htop wget git  openssh ||exit

mkdir /root/.ssh -pv
cp $ssh_pub_key /root/.ssh/authorized_keys

#/etc/ssh/sshd_config: PubkeyAuthentication yes
sed -i 's/\#PubkeyAuthentication/PubkeyAuthentication/' /etc/ssh/sshd_config
systemctl restart sshd

#target(in ram) OS
pacstrap $install_ram archlinux-keyring --needed ||exit
pacstrap $install_ram $packages --needed ||exit

mkdir -pv $serverDir ||exit
wget https://api.papermc.io/v2/projects/paper/versions/1.19.1/builds/88/downloads/paper-1.19.1-88.jar -c -O $serverJarFull ||exit

#minecraft scripts
cp $serverInstallScript $serverInstallScriptFullPath ||exit
cp $own_variables $own_variablesInstalled ||exit
arch-chroot $install_ram /$serverInstallScript
