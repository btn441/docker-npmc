#!/bin/bash

bash docker-compose.sh $@
bash docker-compose.override.sh $@
bash dirs.sh $@

mv Makefile ../Makefile

rm -rf .git
rm -rf dirs
rm banner.png
rm LICENSE
rm dirs.sh
rm docker-compose.sh
rm docker-compose.override.sh
rm install.sh