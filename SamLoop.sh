#!/usr/bin/env bash

#Settings
JAR='minecraft_server.1.8.jar'
INVOCATION="java -Xmx1024M -Xms1024M -jar $JAR"
TIMES=4
SAVEALL=15
SAVELOOP=1
LOOP="SERVER A"

clear
echo "   _____                             _____           _       _   "
echo "  / ____|                           / ____|         (_)     | |  "
echo " | (___   ___ _ ____   _____ _ __  | (___   ___ _ __ _ _ __ | |_ "
echo "  \___ \ / _ \ '__\ \ / / _ \ '__|  \___ \ / __| '__| | '_ \| __|"
echo "  ____) |  __/ |   \ V /  __/ |     ____) | (__| |  | | |_) | |_ "
echo " |_____/ \___|_|    \_/ \___|_|    |_____/ \___|_|  |_| .__/ \__|"
echo "                                                      | |        "
echo "                                                      |_|        "



while true;
do
   echo "$LOOP"
   screen -dmS mc1.8 "$INVOCATION"
   while [ "$SAVELOOP" -le "$TIMES" ]; do
      sleep $"($SAVEALL * 60)"
      echo "SAVEALL"
      screen -S mc -X -p 0 stuff "save-all$(printf \\r)"
      SAVELOOP=$((SAVELOOP + 1))
   done
   SAVELOOP=1
   SAVEALL=15
   echo STOPPING
   screen -S mc1.8 -X -p 0 stuff "stop$(printf \\r)"
   sleep 15
   killall java
   screen -wipe
done
