#!/usr/bin/bash

rm -f TEST

touch TEST
echo 'by vytoren novy soubor "TEST"'

date -r TEST +"%d_%m_%Y_%H_%M"
echo "puvodni casove razitko souboru"
ls --full-time TEST
#sleep 1

touch -t 202012242256 TEST
echo "zmenene casove razitko souboru"
date -r TEST +"%d_%m_%Y_%H_%M"
ls --full-time TEST
