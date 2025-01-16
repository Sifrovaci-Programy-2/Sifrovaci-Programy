#!/usr/bin/lua
--[[
This is Zip 3.0 (July 5th 2008), by Info-ZIP.
Zip 3.0 (July 5th 2008).
Lua 5.2.4  Copyright (C) 1994-2015 Lua.org, PUC-Rio
pozn. soubor hesel na rok po minutach prohledava cca 90 vterin, 1050000 radku
]]--
os.execute("clear")
rok_ted = tostring(os.date("%Y"))

soubor = "email_kody_" .. rok_ted .. "_ubuntu.txt"
print(soubor)
--cesta = "/home/pi/r/"
cesta = "/home/pi/c/work/"
--cesta_zip_slozka = "/home/pi/r/"
cesta_zip_slozka = "/home/pi/c/work/"

datum_ted = tostring(os.date("%d_%m_%Y-%H_%M"))
--datum_ted = "01_10_2024-11_55" -- test nenasel nic
--print(type(datum_ted))
print(datum_ted.."< cas ted")
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
slozka_zip = cesta_zip_slozka .. datum_ted .. "/"
soubor_zip = cesta_zip_slozka .. datum_ted .. ".zip"
c1 = "mkdir " .. slozka_zip
os.execute(c1)
print("byla vytvorena nova slozka v ceste "..slozka_zip)
print("do teto slozky nakopirovat vsechny soubory text, obrazky ale i treba dalsi plnou slozku")
print('az to bude hotove tak napsat "pokracovat" za zmacknout < Enter >')
print("cokoliv jineho program ukonci a slozku smaze")
pokracovat = tostring(io.read())

if pokracovat ~= "pokracovat" then
c2 = "rm -rf " .. slozka_zip
os.execute(c2)
print("slozka " .. slozka_zip .. " byla smazana")
os.execute("sleep 1")
print("program ukoncen")
os.exit()
end
-- zapakovani slozky
c3 = "zip -r -9 -y -UN=UTF8 -P '"..heslo.."' "..soubor_zip.." "..slozka_zip.." && ".."sleep 3; unzip -t -P '"..heslo.."' "..soubor_zip
--print(c3)
os.execute(c3)
print("byl vytvoren zasifrovany soubor "..soubor_zip )
print("dat do jako prilohu k emailu, nazdilet na ulozto.cz apod.")
print("konec")
--

