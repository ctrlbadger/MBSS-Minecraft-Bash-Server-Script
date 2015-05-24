#!/bin/sh
#Initialising downloads
GetLoop = "https://raw.githubusercontent.com/ctrlbadger/MBSS-Minecraft-Bash-Server-Script/master/SamLoop.sh"
GetJar = "https://s3.amazonaws.com/Minecraft.Download/versions/1.8.4/minecraft_server.1.8.4.jar"
Sure = 1
function install {  #Install Function: Used to install the script and jar
  printf "Welcome to MBSEE\nWe will install the loop script and minecraft.jar in this folder"
  wget -q "$GetLoop"
  printf "Downloading minecraft server 1.8 jar"
  wget -q "$GetJar"
}
#Reinstall Function
function reinstall {
  printf "\nDeleting files then installing them again"
  printf "\nAre you sure you want to delete than reinstall your files? Y/N :"
  read Sure
  if [ $Sure == "Y" ];
  then
    rm SamLoop.sh
    rm minecraft_server.1.8.4.jar
    wget -q "$GetLoop"
    wget -q "$GetJar"
  else
    printf "Ok, thanks for telling me!"
    exit
  fi
}

echo "Do you want to (I)nstall|(R)einstall"
read Install
if [ $Install == "I" ]; then
  install
else
  reinstall
fi
printf "To start the server type 'Server' in the command line followed by the appropriate arguments"
exit
