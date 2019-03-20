#! /bin/bash

# for x in "${release[@]}" 
# do
# cp -r $x .
# echo "$x copied"
# done
RELEASEFOLDER=~/Documents/stars/classes
if [ -d "$RELEASEFOLDER" ]
then
  RELEASECLASSES=(classes/*)
  xml="meta.xml"
  cd ..
  cd tools
  MASTERCLASSES=(classes/*)

  for x in "${RELEASECLASSES[@]}" 
  do
  echo ---"$x"---
    for y in "${MASTERCLASSES[@]}"
    do
    echo ---"$y"---
      if [ "$x-$xml" == "$y" ]
        then
          echo "$x-$xml and $y MATCH!"
          cp "$y" $RELEASEFOLDER
      fi
    done
  done

  cd ..
  cd stars
  git add .
  git commit -m "class meta-xml files"
  git push
fi