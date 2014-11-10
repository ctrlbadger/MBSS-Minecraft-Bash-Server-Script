#!/bin/sh

#Settings
JAR='minecraft_server.1.8.jar'
INVOCATION="java -Xmx1024M -Xms1024M -jar $JAR"
SUM=60
WARN=60
SAVEALL=15
SAVELOOP=1

WARN2=$((WARN / 2))
WARN3=$((WARN2 - 10))

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
   echo b
   screen -dmS mc1.8 $INVOCATION
   while [ "$SAVELOOP" -lt "$SUM" ]; do
      echo SAVEALL
      sleep $(($SAVEALL * 60))
      screen -S mc -X -p 0 stuff "save-all$(printf \\r)"
      SAVELOOP=$(($SAVELOOP + $SAVEALL))
   done
   SAVELOOP=1
   SAVEALL=1
   echo STOPPING
   screen -S mc -X -p 0 stuff "say SERVER RESTART IN $WARN SECONDS$(printf \\r)"
   sleep $WARN2
   screen -S mc -X -p 0 stuff "say SERVER RESTART IN $WARN2 SECONDS$(printf \\r)"
   sleep $WARN3
   screen -S mc -X -p 0 stuff "say SERVER RESTART IN 10 SECONDS$(printf \\r)"
   sleep 5
   screen -S mc -X -p 0 stuff "say SERVER RESTART IN 5 SECONDS$(printf \\r)"
   sleep 5
   screen -S mc -X -p 0 stuff "stop $(printf \\r)"
   echo a
   killall java
done
