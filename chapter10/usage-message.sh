#!/bin/bash
#  usage-message.sh

: ${1?"Usage:  $0  ARGUMENT"}
#  Script exits here if command-line parameter absent.
#+ with following error message.
#  usage-message.sh: 1: Usage: usge-massage.sh  ARGUMENT

echo "These two lines echo only if command-line parameter given."
echo "command-line parameter = \"$@\""
echo "$#"
echo "$@"
echo "$*"
echo "$_"
echo "$$"
echo "$!"

exit 0      #  Will exit here only if command-line parameter present.

#  Check the exit status, both with and without command-line parameter.
#  If command-line param present, the "$?" is 0.
#  If not "$?" is 1
