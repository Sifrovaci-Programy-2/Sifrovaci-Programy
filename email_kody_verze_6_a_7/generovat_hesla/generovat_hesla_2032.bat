title generovat_hesla_2032.bat
@echo off
echo budou vygenerovana nova hesla pro rok 2032 opravdu pokracovat ?
echo Ctrl+C pro ukonceni, nebo zmacknout nejakou klavesu pro 
pause
lua52.exe generuj_hesla_pro_verzi_6.lua 2032
pause
@echo on
