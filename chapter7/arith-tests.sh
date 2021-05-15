#!/bin/bash
#  arith-tests.sh
#  Arithmetic tests.

#  The (( ... )) construct evaluates and tests numerical expressions.
#  Exit status opposite fom [ ... ] construct!

(( 0 ))
echo "Exit status of \"(( 0 ))\" is $?."        # 1

(( 1 ))
echo "Exit status of \"(( 1 ))\" is $?."        # 0

(( 5 > 4 ))                                     # true
echo "Exit statsu of \"(( 5 > 4 ))\" is $?."    # 0

(( 5 > 9 ))                                     # false
echo "Exit status of \"(( 5 > 9 ))\" is $?."    # 1

(( 5 == 5 ))                                    # true
echo "Exit status of \"(( 5 == 5 ))\" is $?."   # 0
#  (( 5 = 5 ))  gives an error message.

(( 5 - 5 ))                                     # 0
echo "Exit status of \"(( 5 - 5 ))\" is $?."    # 1

(( 5 / 4 ))                                     # Division is ok.
echo "Exit status of \"(( 5 / 4 ))\" is $?."    # 0

(( 1 / 2 ))                                     # Division result less than 1.
echo "Exit status of \"(( 1 / 2 ))\" is $?."    # Rounded off to 0.
                                                # 1

(( 1 / 0 )) 2> /dev/null                        # Illegal division by 0.
echo "Exit status fo \"(( 1 / 0 ))\" is $?."    # 1

#  What effect does the "2>/dev/null" have?
#  What would happen if it were removed?
#  Try removing then running the script.

#==================================================#

#  (( ... )) also useful in an if-then test.

var1=5
var2=4

if (( var1 > var2 ))
then    # Note: Nor $var1, $var2.  Why?
    echo "$var1 is greater than $var2"
fi

exit 0
