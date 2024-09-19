#!/bin/bash

URL="https://sbseg24.github.io/certificados"

generate_html() {
    local DIR=$1
    while IFS=\; read -r LINHA
    do
        LINHA=$(echo $LINHA | sed 's/"//g')
        read -r AUTORES
        AUTORES=$(echo $AUTORES | sed 's/"//g')
        TIPO=$(echo $LINHA | cut -d"," -f1)
        PDF=$(echo $LINHA | cut -d"," -f2)
        TITULO=$(echo $LINHA | cut -d"," -f3 | sed 's/"//g')
        echo "<div class=\"slide-example\">"
        echo "<a href=\"$URL/$DIR/$PDF\" target=\"_blank\"><h3>[$TIPO] $TITULO</h3></a>"
        echo "$AUTORES"
        echo "</div>"
        echo ""
    done < "$DIR.csv"
}

for i in sf # tp ctdseg wticg
do
    cat "files/$i.html"
    generate_html "files/$i"
done
