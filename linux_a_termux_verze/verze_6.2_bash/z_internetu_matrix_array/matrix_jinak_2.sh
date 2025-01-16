#!/usr/bin/bash

# a0-3[0..4]

rnd () {
echo $(( $RANDOM % 9 + 1 ))
}

for i in {0..3}; do
eval "declare -a a$i=( $(for j in {1..4}; do rnd; done ) )"
declare -p a$i
done
