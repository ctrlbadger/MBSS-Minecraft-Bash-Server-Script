#!/bin/sh

install () {
  echo "Welcome to MBSEE\nWe will install the loop and server in this folder"
  wget -q https://raw.githubusercontent.com/ctrlbadger/MBSS-Minecraft-Bash-Server-Script/master/SamLoop.sh
  echo "Downloading minecraft server 1.8 jar"
  wget -q https://s3.amazonaws.com/Minecraft.Download/versions/1.8/minecraft_server.1.8.jar
}

reinstall () {
  echo "Deleting files then installing them again"
  rm SamLoop.sh
  rm minecraft_server.1.8.jar
  wget -q https://raw.githubusercontent.com/ctrlbadger/MBSS-Minecraft-Bash-Server-Script/master/SamLoop.sh
  wget -q https://s3.amazonaws.com/Minecraft.Download/versions/1.8/minecraft_server.1.8.jar
}
echo ["Do you want to (I)nstall|(D)elete|(R)einstall"
read Install
if [Install == "I"]; then
  install
else
  reinstall
fi

echo "To start the server type 'Server' in the command line followed by the appropriate arguments"
exit
