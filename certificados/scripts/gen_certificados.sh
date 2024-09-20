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
        TITULO=$(echo $LINHA | cut -d"," -f3-)
        echo "<div class=\"slide-example\">"
        echo "<h3>$TIPO:</h3>"
        echo "<a href=\"$URL/$DIR/$PDF\" target=\"_blank\"><h3>$TITULO</h3></a>"
        echo "$AUTORES"
        echo "</div>"
        echo ""
    done < "$DIR.csv"
}

generate_html_revisor() {
    local DIR=$1
    while IFS=\; read -r LINHA
    do
        LINHA=$(echo $LINHA | sed 's/"//g')
        PDF=$(echo $LINHA | cut -d"," -f2)
        TITULO=$(echo $LINHA | cut -d"," -f3-)
        echo "<a href=\"$URL/$DIR/$PDF\" target=\"_blank\"><h3>$TITULO</h3></a>"
    done < "$DIR.csv"
}

for i in tp ctdseg sf wticg cta
do
    cat "files/$i.html"
    generate_html "files/$i"
    if [ -d "files/$i/revisores" ]
    then
        echo "<div class=\"slide-example\">"
        echo "<h3>Revisores(as) destaque:</h3>"
        generate_html_revisor "files/$i/revisores"
        echo "</div>"
        echo ""
    fi
done
