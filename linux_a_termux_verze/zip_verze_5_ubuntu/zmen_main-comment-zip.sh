#!/usr/bin/bash

clear
if [ -z "$1" ]
then
echo $0" archiv.zip"
exit 1
fi

nano main_comment_file.txt
cat main_comment_file.txt
zip -z < main_comment_file.txt $1
unzip -l $1
unzip -z $1
echo "--------------------"
cti_list_zip.sh $1

