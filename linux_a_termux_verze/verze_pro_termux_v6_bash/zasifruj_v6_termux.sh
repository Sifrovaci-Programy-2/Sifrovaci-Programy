#!/data/data/com.termux/files/usr/bin/bash
# Zip 3.0, UnZip 6.00

# pozor v archivovanem adresari musi byt alespon 3 soubory a nebo 3 slozky a nebo 2 soubory a slozka apod.
# proste 3 polozky jinak se nezapisou spravne vsechny radky file komentaru ( neni do ceho )
# v pripade opaku je tedy NUTNE vytvorit ciste z tohoto duvodu napr. prikazem touch aaa/smazat1.txt aaa/smazat2.txt aaa/smazat3.># a prikazem "unzip -l aaa_v6.zip | head -n 11" potom jeste radeji zkontrolovat vsechny informace

cesta_soubory_hesel="/data/data/com.termux/files/home/storage/external-1/zaloha/keys/"

if [ -z "$2" ]; then
h=${0##*/}
echo $h" SouborHesel zip_folder/"
echo "seznam klicu v adresari "$cesta_soubory_hesel
ls $cesta_soubory_hesel
exit 0
fi

zip_folder=$2

# kontola jestli je lomitko na konci $2 nazev pakovaneho adresare
k=$zip_folder
d_k=${#k}
posledni_znak=${k:${#k}-1:${#k}}
if [ "$posledni_znak" != "/" ] && [ "$d_k" != "0" ]; then
echo "pridavam lomitko na konec nazvu adresare"
zip_folder=$zip_folder"/"
echo $zip_folder
fi

# kontrola existence adresare $2
ls $zip_folder 1>/dev/null 2>/dev/null
if [ "$?" != "0" ]; then
echo "adresar neexistuje"
exit 0
fi

# kontola min. 3 sobory v adresari
# tento blok udela preventive to co je napsano nahore
delete_smazat1=0
delete_smazat2=0
delete_smazat3=0
nf=$( ls $zip_folder | wc -l )
#echo $nf
if [ "$nf" -eq "2" ]; then
touch $zip_folder"smazat1.txt"
delete_smazat1=1
elif [ "$nf" -eq "1" ]; then
touch $zip_folder"smazat1.txt" $zip_folder"smazat2.txt"
delete_smazat1=1
delete_smazat2=1
elif [ "$nf" -eq "0" ]; then
touch $zip_folder"smazat1.txt" $zip_folder"smazat2.txt" $zip_folder"smazat3.txt"
delete_smazat1=1
delete_smazat2=1
delete_smazat3=1
fi

soubor_hesel=$1
# kontrola jestli existuje soubor hesel $1
ls $cesta_soubory_hesel$1 1>/dev/null 2>/dev/null
if [ "$?" != "0" ]; then
echo "soubor klice z nazvem "$1" neexistuje"
exit 0
fi

# takze jediny kde by mohla nastat chyba by bylo kdyby $2 obsahoval prazny znaky
# treba kdyby se adresar jmenoval "aa\ bb\ cc" apod.

soubor_hesel_2=$cesta_soubory_hesel$soubor_hesel
echo "nacteny soubor hesel ="
echo $soubor_hesel_2
source $soubor_hesel_2

soubor_hesel=${soubor_hesel##*/}
# vyhaze vsechny lomitka z cesty, kvuli nazvu archivu

echo "nazev souboru hesel = "$1
echo "pocet poly v souboru "$1" = "$n_x", tzn. n_0 az n_"$(($n_x - 1))

heslo=""
zip_file_comment=""
for (( aa = 0; aa <= $n_x - 1; aa++ ));do

#echo $(( $RANDOM % 62 + 10 ))
rnd=$(( $RANDOM % 62 + 10 ))
#echo $aa" "$rnd
zip_file_comment+=${rnd}

# heslo+=${n_X[$rnd]}
cmd_1='heslo+=${n_'
cmd_1+=$aa
cmd_1+='[$rnd]}'
#echo $cmd_1
eval $cmd_1
done

echo "zip_file_comment = "
echo $zip_file_comment
d_zip_file_comment=${#zip_file_comment}
echo "delka zip_file_comment = "$d_zip_file_comment" znaku"

echo "heslo = "
echo $heslo
d_heslo=${#heslo}
echo "delka hesla = "$d_heslo" znaku"

archiv_zip_nazev=${zip_folder:0:${#zip_folder}-1}"_v6.zip"
echo "nazev archivu zip je"
echo $archiv_zip_nazev
datum_ted=$(date +'%d.%m.%Y %H:%M')
echo "datum vytvoreni tohoto archivu je "$datum_ted

#

rm -f zip_file_comment.txt
sleep 0.3
echo $zip_file_comment > zip_file_comment.txt
sleep 0.3
echo $soubor_hesel >>zip_file_comment.txt
sleep 0.3
echo "datum vytvoreni tohoto archivu je "$datum_ted >>zip_file_comment.txt
sha=$(sha1sum $cesta_soubory_hesel$soubor_hesel)
sha2=${sha:0:40}
echo "sha1sum souboru klicu je "
echo $sha2
echo $sha2 >>zip_file_comment.txt

sleep 5

#echo "cat zip_file_comment.txt = "
#cat zip_file_comment.txt

cmd_1="zip -r -9 -y -UN=UTF8 -P "
cmd_1+="'$heslo'"
cmd_1+=" -c < 'zip_file_comment.txt' "
cmd_1+=$archiv_zip_nazev
cmd_1+=" "$zip_folder
eval $cmd_1
sleep 1

cmd_2="unzip -t -P "
cmd_2+="'$heslo' "
cmd_2+=$archiv_zip_nazev
eval $cmd_2
sleep 0.2

cmd_3="unzip -l "
cmd_3+=$archiv_zip_nazev
eval $cmd_3
sleep 0.2

rm -f zip_file_comment.txt

# vymaze z adresare $2 soubor(y) smazatX, paklize byl nejaky znich vytvoreny
# aby to po sobe nenechavalo nekde bordel
if [ "$delete_smazat1" -eq "1" ]; then
#echo $zip_folder"smazat1.txt"
rm -f $zip_folder"smazat1.txt"
sleep 0.2
fi

if [ "$delete_smazat2" -eq "1" ]; then
#echo $zip_folder"smazat2.txt"
rm -f $zip_folder"smazat2.txt"
sleep 0.2
fi

if [ "$delete_smazat3" -eq "1" ]; then
#echo $zip_folder"smazat3.txt"
rm -f $zip_folder"smazat3.txt"
sleep 0.2
fi

