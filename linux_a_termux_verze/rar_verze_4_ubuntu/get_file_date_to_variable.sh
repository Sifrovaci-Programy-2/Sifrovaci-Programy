#!/usr/bin/bash

if [ -z "$1" ]
then
echo $0' "NazevSouboru"'
exit 1
fi

echo $1
datum_souboru=$(date -r $1 +"%d_%m_%Y_%H_%M")
echo $datum_souboru
ls -lh $1
ls --full-time $1


