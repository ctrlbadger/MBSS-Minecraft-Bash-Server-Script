#!/bin/sh
Loop = "https://raw.githubusercontent.com/ctrlbadger/MBSS-Minecraft-Bash-Server-Script/master/SamLoop.sh"
Com = "https://s3.amazonaws.com/Minecraft.Download/versions/1.8/minecraft_server.1.8.jar"

install () {
  echo "Welcome to MBSEE\nWe will install the loop and server in this folder"
  wget -q "$Loop"
  echo "Downloading minecraft server 1.8 jar"
  wget -q "$Com"
}

reinstall () {
  echo "Deleting files then installing them again"
  rm SamLoop.sh
  rm minecraft_server.1.8.jar
  wget -q "$Loop"
  wget -q "$Com"
}
echo ["Do you want to (I)nstall|(R)einstall"
read Install
if [Install == "I"]; then
  install
else
  reinstall
fi
echo "To start the server type 'Server' in the command line followed by the appropriate arguments"
exit
