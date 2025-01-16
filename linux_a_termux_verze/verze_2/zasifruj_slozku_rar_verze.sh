#!/usr/bin/lua
--[[
pouziva normalne ve windows nainstalovanej WinRar
RAR 5.50   Copyright (c) 1993-2017 Alexander Roshal   11 Aug 2017
Lua 5.2.4  Copyright (C) 1994-2015 Lua.org, PUC-Rio
pozn. soubor hesel na rok po minutach prohledava cca 90 vterin, 1050000 radku
]]--
os.execute("clear")
rok_ted = tostring(os.date("%Y"))
--rok_ted = "2023" aby nenasel heslo v celem souboru (ted pameti oproti powershell, viz. obrazek)

soubor = "email_kody_" .. rok_ted .. "_ubuntu.txt"
print(soubor)
--cesta = "/home/pi/r/"
cesta = "/home/pi/c/work/"
--cesta_rar_slozka = "/home/pi/r/"
cesta_rar_slozka = "/home/pi/c/work/"

datum_ted = tostring(os.date("%d_%m_%Y-%H_%M"))
--datum_ted = "01_10_2024-11_55" -- test nenasel nic
--print(type(datum_ted))
print(datum_ted.." < cas ted")
nalezeno_radek = 0
--os.execute("sleep 3")
--os.exit()
file2 = io.open(cesta..soubor , "r")
if not file2 then
print("neexistuje soubor "..cesta..soubor.." napred vygenerovat soubor klicu")
print("pouzit soubor generuj_hesla.lua")
os.execute("sleep 3")
os.exit()
end

pocitadlo_1 = 0
for radek in file2:lines() do
pocitadlo_1 = pocitadlo_1 + 1
--print(radek)
if datum_ted == radek then
nalezeno_radek = 1
--print("nalezeno radek")
print(radek.." << cas nalezeny v souboru klicu na radku ".. pocitadlo_1)
heslo = (file2:read())
--print(heslo)
break
else
--print("nenalezeno radek")
end -- if

end
file2:close()

if nalezeno_radek == 0 then
print("nenalezen aktualni datum v souboru klicu")
os.exit()
end
-- vytvoreni slozky a jeji zazipovani z heslem
slozka_rar = cesta_rar_slozka .. datum_ted .. "/"
soubor_rar = cesta_rar_slozka .. datum_ted .. ".rar"
c1 = "mkdir " .. slozka_rar
os.execute(c1)
print("byla vytvorena nova slozka v ceste "..slozka_rar)
print("do teto slozky nakopirovat vsechny soubory text, obrazky ale i treba dalsi plnou slozku")
print('az to bude hotove tak napsat "pokracovat" za zmacknout < Enter >')
print("cokoliv jineho program ukonci a slozku smaze")
pokracovat = tostring(io.read())

if pokracovat ~= "pokracovat" then
c2 = "rm -rf " .. slozka_rar
os.execute(c2)
print("slozka " .. slozka_rar .. " byla smazana")
os.execute("sleep 1")
print("program ukoncen")
os.exit()
end

--[[
WinRar
rar a -r -m5 -hpHESLO -pHESLO Atari800.rar Atari800/
rar t -pHESLO Atari800.rar
rar x -pHESLO Atari800.rar
]]--

-- zapakovani slozky a test archivu rar
c3 = "rar a -r -m5 -hp"..heslo.." ".."-p"..heslo.." "..soubor_rar.." "..slozka_rar.." && sleep 3; rar t -p"..heslo.." "..soubor_rar
--print(c3)
os.execute(c3)

print("byl vytvoren zasifrovany soubor "..soubor_rar)
print("dat do jako prilohu k emailu, nazdilet na ulozto.cz apod.")
print("konec")
--



