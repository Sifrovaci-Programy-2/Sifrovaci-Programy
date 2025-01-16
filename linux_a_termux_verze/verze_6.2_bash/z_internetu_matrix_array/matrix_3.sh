#!/usr/bin/bash

pole_znaky=( [10]="a" {b..z} {A..Z} {0..9} )
d_pole_znaky=${#pole_znaky[@]}

declare -A matrix
num_rows=6
# vodorovne
num_columns=12
# svisle

for ((i=1;i<=num_rows;i++)) do
    for ((j=1;j<=num_columns;j++)) do
#        matrix[$i,$j]=$RANDOM
        matrix[$i,$j]=$(( $RANDOM % $d_pole_znaky + 10 ))
    done
done

f1="%$((${#num_rows}+1))s"
f2=" %9s"

printf "$f1" ''
for ((i=1;i<=num_rows;i++)) do
    printf "$f2" $i
done
echo

for ((j=1;j<=num_columns;j++)) do
    printf "$f1" $j
    for ((i=1;i<=num_rows;i++)) do
        printf "$f2" ${matrix[$i,$j]}
    done
    echo
done

