#!/usr/bin/bash

if [ -z "$1" ]
then
h=${0##*/}
echo $h" achive_name_v6_bash.zip"
exit 0
fi

unzip -l $1 | head -n 12
