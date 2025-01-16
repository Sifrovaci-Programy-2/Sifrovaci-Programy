title generovat_hesla_2030.bat
@echo off
echo budou vygenerovana nova hesla pro rok 2030 opravdu pokracovat ?
echo Ctrl+C pro ukonceni, nebo zmacknout nejakou klavesu pro 
pause
lua52.exe generuj_hesla_pro_verzi_6.lua 2030
pause
@echo on
