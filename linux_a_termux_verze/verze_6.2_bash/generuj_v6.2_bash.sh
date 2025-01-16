#!/usr/bin/bash

cesta_soubory_klicu="/home/pi/bash/verze_6.2_bash/keys/"
#              tento ^ radek upravit podel svoji situace

if [ -z "$1" ]; then
h=${0##*/}
echo $h" OutputKeyFile"
echo $h" osoba1-osoba2"
echo "seznam klicu v adresari "$cesta_soubory_klicu
ls $cesta_soubory_klicu
exit 0
fi

# kontrola jestli nazev klice $1 jiz neexistuje v ceste $cesta_soubory_klicu
# aby se neprepsal omylem puvodni
ls $cesta_soubory_klicu$1 1>/dev/null 2>/dev/null
if [ "$?" == "0" ]; then
echo "nazev souboru "$1" v adresari "$cesta_soubory_klicu$1" jiz existuje"
echo "prepsal by se jeho puvodni obsah, zvolte jiny nazev"
echo "seznam klicu v adresari "$cesta_soubory_klicu
ls $cesta_soubory_klicu
exit 0
fi

#

pole_znaky=( [10]="a" {b..z} {A..Z} {0..9} )
d_pole_znaky=${#pole_znaky[@]}

max_mix=400

#declare -A matrix # -A to make NAMEs associative arrays
declare -a matrix

matrix_vodorovne=61 # 61 = 10-71
matrix_svisle=125 # ma bejt 0-125 a v hodnote klice ma bej pismeno "A" apod.

# testovaci 
#matrix_vodorovne=2 # 61 = 10-71
#matrix_svisle=1 # ma bejt 0-125 a v hodnote klice ma bej pismeno "A" apod.

#

echo "matrix_vodorovne="$matrix_vodorovne > $cesta_soubory_klicu$1
echo "matrix_svisle="$((matrix_svisle + 1 )) >> $cesta_soubory_klicu$1
echo "matrix_delka="$(($matrix_vodorovne * $(( matrix_svisle + 1 )) )) >> $cesta_soubory_klicu$1

echo "declare -A matrix=(" >> $cesta_soubory_klicu$1

for (( aa = 0; aa <= matrix_svisle; aa++ )) do
echo "# "$aa",10-"$((matrix_vodorovne + 10 ))
echo "# "$aa",10-"$((matrix_vodorovne + 10 )) >> $cesta_soubory_klicu$1


for (( mix = 1; mix <= $max_mix; mix++)); do
rnd_1=$(( $RANDOM % $d_pole_znaky + 10 ))
rnd_2=$(( $RANDOM % $d_pole_znaky + 10 ))
#echo $rnd_1
#echo $rnd_2
pom=${pole_znaky[$rnd_1]}
#echo $pom
pole_znaky[$rnd_1]=${pole_znaky[$rnd_2]}
pole_znaky[$rnd_2]=$pom
done


for (( bb = 10; bb <= 10 + matrix_vodorovne; bb++ )) do
# declare -A matrix2=([1,1]="11" [1,2]="12" [2,1]="21" [2,2]="22") takto ma vypadat vystup
vloz=${pole_znaky[$bb]}
#echo $vloz"<"
matrix[$aa,$bb]=$vloz

prvek="["$aa","$bb']="'${pole_znaky[$bb]}'" '
echo $prvek
echo $prvek >> $cesta_soubory_klicu$1
#out_1+=$prvek
done
done

echo ")" >> $cesta_soubory_klicu$1

#

echo "matrix_vodorovne="$matrix_vodorovne
echo "matrix_svisle="$((matrix_svisle + 1 ))
echo "matrix_delka="$(($matrix_vodorovne * $(( matrix_svisle + 1 )) ))


