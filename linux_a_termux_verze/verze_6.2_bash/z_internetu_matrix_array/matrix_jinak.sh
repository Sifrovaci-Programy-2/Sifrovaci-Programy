#!/usr/bin/bash

# a0-3[0..4]

for i in {0..3}; do
rnd=$(( $RANDOM % 5 + 1 ))
eval "declare -a a$i=( $(for j in {1..4}; do echo $rnd; done ) )"
declare -p a$i
done
