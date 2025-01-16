#!/usr/bin/bash
clear
# pro - zip_verze_5_ubuntu
# ln -s /home/pi/c/Documents and Settings/DELL/Dokumenty/archivy_ubuntu/

c="/home/pi/archivy_ubuntu/"
echo -e '\033[0;32m'$c
for i in $c*.zip
do
echo -e '\033[0;36mnazev:   '${i:${#c}:${#i}}
b=$(unzip -z $i)
echo -e '\033[0;33mcomment:'${b:${#i}+10:${#b}}
d=$(cti_list_zip.sh $i)
echo -e '\033[0mdatum:   '$d
done
