#!/bin/bash

# Just 3 commands to install lilyjazz on my system
# Crappy mode...

LILYPOND_VERSION=$(lilypond -vs | head -1 | sed "s/GNU LilyPond //")

if [ $(id -u) -ne 0 ]; then
    echo "Are you root ?"
    exit 1
fi


for i in lilyjazz/otf/*; do
    ln -s ${PWD}/$i /usr/share/lilypond/${LILYPOND_VERSION}/fonts/otf/
done

for i in lilyjazz/svg/*; do
    ln -s ${PWD}/$i /usr/share/lilypond/${LILYPOND_VERSION}/fonts/svg/
done
ln -s ${PWD}/lilyjazz/supplementary-files/lilyjazz-text/lilyjazz-text.otf /usr/share/lilypond/${LILYPOND_VERSION}/fonts/otf/

ln -s ${PWD}/lilyjazz/supplementary-files/lilyjazz-chord/lilyjazz-chord.otf /usr/share/lilypond/${LILYPOND_VERSION}/fonts/otf/

## Clean part
#rm /usr/share/lilypond/2.19.82/fonts/svg/lilyjazz-*
#rm /usr/share/lilypond/2.19.82/fonts/otf/lilyjazz-*
