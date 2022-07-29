#OS
install_ram="/dev/shm"
packages="base htop maven git wget curl linux{,-firmware}"

#Script
own_variables="vars.sh"
own_variablesInstalled=$install_ram/$own_variables

#MINECRAFT
serverInstallScript="MINECRAFT.sh"
serverInstallScriptFullPath=$install_ram/$serverInstallScript
serverDirInstalled="SERVER"
serverDir=$install_ram/$serverDirInstalled
serverStartScript=$serverDir/"start.sh"
serverJar="server.jar"
serverJarFull=$serverDir/$serverJar

