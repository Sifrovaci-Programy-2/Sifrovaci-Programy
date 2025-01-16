#!/usr/bin/bash

if [ -z "$2" ]
then
h=${0##*/}
echo $h" NazevKlicu Pocetklicu"
echo "napr."
echo $h" osoba1-osoba2-klic-cislo_ 10"
exit 1
fi

nazev=$1
pocet=$2

for ((aa = 1; aa <= $pocet; aa++)); do

if [[ aa -lt 10 ]]; then
generuj_v6.2_lua.sh $nazev"0"$aa
echo "nazev klice = "$nazev"0"$aa
else
generuj_v6.2_lua.sh $nazev$aa
echo "nazev klice = "$nazev$aa
fi

vteriny=$(( $cekej_vterin + $RANDOM % 5 + 5 ))
desetiny=$(( $RANDOM % 10 + 0 ))
cekej="sleep "$vteriny"."$desetiny

echo $aa"/"$pocet" cekam "$cekej" vterin"

eval $cekej
# nahodny cekani je kvuli funkci math.randomseed(os.time()) v generatoru verze lua
# kdyz to nejni tak dva soubory za sebou muzou bejt stejny !
done

