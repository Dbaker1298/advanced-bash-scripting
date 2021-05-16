#!/bin/bash
#  cvt.sh:
#  Converts all the MacPaint image files in a directory to "pbm" format.

#  Uses the "macptopbm" binary from teh "netpbm" package,
#+ which is maintained by Brian Henderso (bryanh@giraffe-data.com).
#  Netpbm is a standard part of most Linux distros.

OPERATION=mactopbm
SUFFIX=pbm          #  New filename suffix.

if [ -n "$1" ]
then
    directory=$1    #  If directory name given as a script argument ...
else 
    directory=$PWD  #  Otherwise use current working directory.
fi

#  Assumes all file in the target directory are MapPaint image files,
#+ with a ".mac" filename suffix.

for file in $directory/*    #  Filename globbing.
do
    filename=${file%.*c}    #  Strip ".mac" suffix off filename
                            #+ ('.*c' matches everything
                            #+ between '.' and 'c', inclusive).
    $OPERATION $file    > "$filename.$SUFFIX"
                            #  Redirect conversion to new filename.
    rm -f $file             #  Delete original file after converting.
    echo "$filename.$SUFFIX"#  Log what is happening to stdout
done

exit 0

#  *** And here's another way to do it. ***  #

#!/bin/bash
#  Batch convert into different graphic formats.
#  Assumes imagemagick installed (standard in most Linux distros).

INFMT=png   #  Can be tif, jpg, gif, etc.
OUTFMT=pdf  #  Can be tif, jpg, gif, etc.

for pic in *"$INFMT"
do 
    p2=$(ls "$pic" | sed -e s/\.$INFMT//)
    # echo $p2
      convert "$pic" $p2.$OUTFMT
  done

  exit $?
