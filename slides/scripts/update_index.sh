#!/bin/bash

./scripts/gen_examples.sh > body.html

cat header.html	body.html footer.html > index.html

