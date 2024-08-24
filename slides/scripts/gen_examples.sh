#!/bin/bash

URL="https://sbseg24.github.io/slides"

DIR=files

for FILE in $(ls $DIR/*.pdf | sort -r)
do 
    NAME=$(basename $FILE .pdf)
    echo "<div class=\"slide-example\">"
    echo "<h3>$NAME</h3>"
    echo "<a href=\"$URL/$FILE\" target=\"_blank\">Slides in PDF</a>"
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
    elif [ -f $DIR/$NAME.zip ]
    then
        LINK=$URL/$DIR/$NAME.zip
        echo "<a href=\"$LINK\" target=\"_blank\">Slides in LaTeX</a>"
    fi 
    echo "</div>"
    echo ""
done
