#!/bin/bash
#  A simple script to display time and date, lists all logged users,
#+ and gives the uptime of the system.  Saved to a log file.

DATE_TIME=$(date)
LOGGED_IN=$(who)
UP_TIME=$(uptime)
echo $DATE_TIME  >> system_info.txt
echo $LOGGED_IN  >> system_info.txt
echo $UP_TIME  >> system_info.txt
echo "____________" >> system_info.txt

exit
