#!/bin/bash
#  background-loop.sh

for i in 1 2 3 4 5 6 7 8 9 10               #  First loop.
do
    echo -n "$i "
done &      #  Run this in the background
            #  Will sometimes execute after second loop.

echo        #  This 'echo' will sometimes not display.

for i in 11 12 13 14 15 16 17 18 19 20      #  Second loop.
do 
    echo -n "$i "
done

echo        # This 'echo' sometimes will not display.

# ======================================================================

# The expected output from the script:
# 1 2 3 4 5 6 7 8 9 10
# 11 12 13 14 15 16 17 18 19 20 

# Sometimes, though, you get:
# 11 12 13 14 15 16 17 18 19 20
# 1 2 3 4 5 6  7 8 9 10 bozo $
# The second 'echo' doesn't execute, why?

# Occasionaly also:
# 1 .. 20

# Very rarely, the foreground loop preempts the background one.j

exit 0

# page 20 for this code.
