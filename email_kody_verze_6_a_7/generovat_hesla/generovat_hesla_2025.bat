title generovat_hesla_2025.bat
@echo off
echo budou vygenerovana nova hesla pro rok 2025 opravdu pokracovat ?
echo Ctrl+C pro ukonceni, nebo zmacknout nejakou klavesu pro pokracovani
pause
lua52.exe generuj_hesla_pro_verzi_6.lua 2025
pause
@echo on
