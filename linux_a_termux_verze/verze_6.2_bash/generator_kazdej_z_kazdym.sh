#!/usr/bin/bash

jmena=(
"aaa" # aaa pro lepsi predlednost pri testovani
"bbb"
#"Petr"
#"Milan"
"ccc"
"ddd"
#tady ti predchozi radky editovat, pridavat odebirat pripadne zakomentovat radek(y)
)

znak_mezi_jmeny="-"
#lze menit tento ^ znak mezi jmeny

key_n=""
#key_n="_01"
#key_n="_02"
# jeste takovej napad, ze muze existovat vice klicu dvou jmen a pouzivat vzdy jiny
# toho se muze docilit pri opakovanem spusteni scriptu a zmenou promene $key_n
# pokud zustane $key_n="" prida se za nazev prazny znak ( takze vlasne bez zmeny v nazvu )


# zde konci oblast "edit"


d_jmena=${#jmena[@]}
pocitadlo=1
celkovy_pocet_klicu=0
for (( aa = 0; aa < $d_jmena; aa++ )); do
for (( bb = 0; bb < $d_jmena; bb++ )); do
if [[ aa -ne bb ]]; then
(( celkovy_pocet_klicu++ ))
fi
done
done


for (( cc = 0; cc < $d_jmena; cc++ )); do
for (( dd = 0; dd < $d_jmena; dd++ )); do

if [[ cc -ne dd ]]; then
# sam ze sebou by nedavalo smysl
nazev=${jmena[$cc]}
nazev+=$znak_mezi_jmeny
nazev+=${jmena[$dd]}
nazev+=$key_n
if [[ $1 != "-exec" ]]; then
echo $nazev
fi

if [[ $1 = "-exec" ]]; then
generuj_v6.2_lua.sh $nazev
#echo "zde bude exec"
echo "nazev klice = "$nazev

vteriny=$(( $cekej_vterin + $RANDOM % 5 + 5 ))
desetiny=$(( $RANDOM % 10 + 0 ))
cekej="sleep "$vteriny"."$desetiny

echo $pocitadlo"/"$celkovy_pocet_klicu" cekam "$cekej" vterin"
(( pocitadlo++ ))
#echo $cekej
eval $cekej
fi

fi

done
done

if [[ $1 != "-exec" ]]; then
echo "bude vygenerovano techto "$celkovy_pocet_klicu" predchazejicich klicu"
echo ""
echo "toto slouzi pouze pro kontrolu, nyni spustit script z parametrem -exec"
echo "pro samotne vygenerovani vsech zobrazenych klicu"
e_1=${0##*/}
echo $e_1" -exec"
fi

