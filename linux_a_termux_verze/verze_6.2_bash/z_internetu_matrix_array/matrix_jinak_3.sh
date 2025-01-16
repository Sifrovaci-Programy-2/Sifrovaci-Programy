#!/usr/bin/bash

# a0-3[0..4]

rnd () {
echo $(( $RANDOM % 9 + 1 ))
}

for i in {0..4}; do
eval "declare -a a$i=( $(for j in {0..4}; do rnd; done ) )"
declare -p a$i

export a$i
done
