#!/bin/bash

stringZ=abcABC123ABCabc

echo ${stringZ/abc/xyz}     #  xyzABC123ABCabc

echo ${stringZ//abc/xyz}    #  xyzABC123ABCxyz

echo ------------------
echo "$stringZ"
echo ------------------

                            #  The string itself is not altered!

#  Can the match and replacement strings be parameterized?
match=abc
repl=000
echo ${stringZ/$match/$repl}
#
echo ${stringZ//$match/$repl}
echo 
echo "Yes!"
echo

#  What happens if no $replacement string is supplied?
echo ${stringZ/abc}         #  
echo ${stringZ//abc}
#  A simple deletion takes place.
