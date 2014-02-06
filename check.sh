#!/bin/sh
# This script will generate file with number of connections for the particular service
#
# This script can be called as inifinite loop via the shell
# Or can be set as crontab task to be called every minute:
# crontab -e
# * * * * * <location of this script file>/check.sh
#

#Set the time, how often (seconds) you want your script to dump the connections info into the log file
SLEEP=5

echo "$(date) ; <monitored ip> ; <app-name> ' $(netstat -na | grep 8009 | grep <monitored ip> | wc -l)" >> logfile.txt
sleep $SLEEP

#You can rerun the script multiple time within one minute
#echo "$(date) ; <monitored ip> ; <app-name> ' $(netstat -na | grep 8009 | grep <monitored ip> | wc -l)" >> logfile.txt
#sleep $SLEEP
