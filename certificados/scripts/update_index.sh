#!/bin/bash

./scripts/gen_certificados.sh > body.html

cat header.html	body.html footer.html > index.html

