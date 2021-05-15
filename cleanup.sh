#!/bin/bash
# Cleanup, version 3


LOG_DIR=/var/log
ROOT_UID=0      # Only users with $UID 0 have root privileges.
LINES=50        # Default number of lines saved.
E_XCD=86        # Can't change directory?
E_NOTROOT=87    # Non-root exit error.

# Run as root, of course.
if [ "$UID" -ne "$ROOT_UID" ]
then
    echo "Must be root to run this script."
fi



if [ -n "$1" ]
# Test whether command-line argument is present. (not empty)
then
    lines=$1
else
    lines=$LINES    # Default, if not specified on command-line.
fi

cd $LOG_DIR

if [ "$PWD" != "$LOG_DIR" ]     # or   if [ `pwd` != "$LOG_DIR" ]
                                # Not in /var/log?
then
    echo "Can't change to $LOG_DIR."
    exit $E_XD
fi      # Doublecheck if in right directory before messing with log file.



tail -n $lines messages > mesg.tmp  # save last section of message log file.
mv mesg.tmp messages                # Rename it as system log file.

cat /dev/null > wtmp    # ': > wtmp' and '> wtmp' have the same effect.
echo "Log files cleaned up."
# Note that there are other log files in /var/log not affectd
#+by this script.

exit 0
# A zero return value from the script upon exit indicates success
#+to the shell.
