#!/data/data/com.termux/files/usr/bin/bash
# zasifrovat_v4.sh
clear
c="/data/data/com.termux/files/home/storage/external-1/archivy/"
echo -e '\033[0;32m'${c:27:${#c}}
for i in $c*.zip
do
echo -e '\033[0;36mnazev:   '${i:${#c}:${#i}}
b=$(unzip -z $i)
echo -e '\033[0;33mcomment:'${b:${#i}+10:${#b}}
d=$(cti_list_zip.sh $i)
echo -e '\033[0mdatum:   '$d
done
