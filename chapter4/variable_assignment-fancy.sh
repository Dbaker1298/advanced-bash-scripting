#!/bin/bash

a=23        # Simple case
echo $a
b=$a
echo $b

# Now, getting a little bit fancier (command substituion).

a=`echo Hello!`     # Assigns result of 'echo' command to 'a' ...
echo $a
# Note that including an exclamation mark (!) within a 
#+command substitution construct will not work from the command-line,
#+since this triggers the bash "history mechanism."
# Inside a script, however, the history funtions are disabled by default.

a=`ls -l`           # Assigns result of 'ls -l' command to 'a'
echo $a             # Unquoted, however, it removes tabs and newlines.
echo
echo "$a"           # The quoted variable preserves whitespace.


exit 0

