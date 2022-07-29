#OS
install_ram="/dev/shm"
packages="base htop maven git wget curl linux{,-firmware}"

#MINECRAFT
serverInstallScript="MINECRAFT.sh"
serverInstallScriptFullPath=$install_ram/$serverInstallScript
serverDir=$install_ram/SERVER
serverStartScript=$serverDir/"start.sh"
serverJar=$serverDir/"server.jar"


