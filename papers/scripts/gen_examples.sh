#!/bin/bash

URL="https://sbseg24.github.io/papers"

DIR=files

for FILE in $(ls $DIR/*.pdf | sort -r)
do 
    NAME=$(basename $FILE .pdf)
    echo "<div class=\"slide-example\">"
    echo "<h3>$NAME</h3>"
    if [ ! -f $(echo $FILE | sed 's/\.pdf//').github ]
    then
        echo "<a href=\"$URL/$FILE\" target=\"_blank\">Slides in PDF</a>"
    fi
    if [ -f $DIR/$NAME.txt ]
    then
        LINK=$(cat $DIR/$NAME.txt)
        echo "<a href=\"$LINK\" target=\"_blank\">Slides online at Google Drive</a>"
    elif [ -f $DIR/$NAME.can ]
    then
        LINK=$(cat $DIR/$NAME.can)
        echo "<a href=\"$LINK\" target=\"_blank\">Slides online at Canvas</a>"
    elif [ -f $DIR/$NAME.pptx ]
    then
        LINK=$URL/$DIR/$NAME.pptx
        echo "<a href=\"$LINK\" target=\"_blank\">Slides in PPTX</a>"
    elif [ -f $DIR/$NAME.tex ]
    then
        LINK=$URL/$DIR/$NAME.tex
        echo "<a href=\"$LINK\" target=\"_blank\">Slides in TEX</a>"
    elif [ -f $DIR/$NAME.github ]
    then
        LINK=$(cat $DIR/$NAME.github)
        echo "<a href=\"$LINK\" target=\"_blank\">Slides Template on GitHub</a>"
    elif [ -f $DIR/$NAME.zip ]
    then
        LINK=$URL/$DIR/$NAME.zip
        echo "<a href=\"$LINK\" target=\"_blank\">Slides in LaTeX</a>"
    fi 
    echo "</div>"
    echo ""
done
