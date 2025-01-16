title generovat_hesla_2026.bat
@echo off
echo budou vygenerovana nova hesla pro rok 2026 opravdu pokracovat ?
echo Ctrl+C pro ukonceni, nebo zmacknout nejakou klavesu pro pokracovani
pause
lua52.exe generuj_hesla_pro_verzi_6.lua 2026
pause
@echo on
