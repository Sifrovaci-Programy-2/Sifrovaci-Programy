@echo off
title rok 2025 - 2033 TEST
for /L %%R IN (25,1,33) DO lua52.exe generuj_hesla_pro_verzi_6.lua 20%%R test
REM           od,krok,do
REM echo %%R
pause
@echo on

