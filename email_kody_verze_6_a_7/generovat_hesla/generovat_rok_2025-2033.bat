@echo off
title rok 2025 - 2033
echo budou vygenerovany hesla pro rok 2025-2033
pause
for /L %%R IN (25,1,33) DO lua52.exe generuj_hesla_pro_verzi_6.lua 20%%R
REM           od,krok,do
REM echo %%R
pause
@echo on

