#!/bin/bash

URL="https://sbseg24.github.io/papers"

generate_html() {
    local dir=$1
    local file=$2
    while IFS=\; read -r title location authors
    do
        echo "<div class=\"slide-example\">"
        echo "<a href=\"$URL/$dir/$location.pdf\" target=\"_blank\"><h3>$title</h3></a>"
        echo "$authors"
        echo "</div>"
        echo ""
    done < "$file"
}

#echo "<h1>Trilha Principal</h1>"
#generate_html "files/tp" "slides1.csv"

echo "<h1>Trilha Principal – Trabalhos Completos</h1>"
generate_html "files/TP/Completos" "slides_tp_completos.csv"


echo "<h1>XVIII Workshop de Trabalhos de Iniciação Científica e de Graduação (WTICG)</h1>"
generate_html "files/WTICG/01" "slides_wticg1.csv"
generate_html "files/WTICG/02" "slides_wticg2.csv"
generate_html "files/WTICG/03" "slides_wticg3.csv"
generate_html "files/WTICG/04" "slides_wticg4.csv"

echo "<h1>VIII Salão de Ferramentas</h1>"
generate_html "files/SF" "slides_sf.csv"
