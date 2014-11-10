#!/bin/sh

install () {
echo "Welcome to MBSEE\nWe will install the loop and server in this folder"
wget https://raw.githubusercontent.com/ctrlbadger/MBSS-Minecraft-Bash-Server-Script/master/SamLoop.sh
echo "Then install the command in the /bin/usr"
cd /bin/usr
wget https://raw.githubusercontent.com/ctrlbadger/MBSS-Minecraft-Bash-Server-Script/master/Server
}

install
echo "To start the server type 'Server' in the command line followed by the appropriate arguments"
exit
