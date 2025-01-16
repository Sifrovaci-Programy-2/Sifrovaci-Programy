#!/usr/bin/lua
--[[
This is Zip 3.0 (July 5th 2008), by Info-ZIP.
Zip 3.0 (July 5th 2008).
Lua 5.2.4  Copyright (C) 1994-2015 Lua.org, PUC-Rio
pozn. soubor hesel na rok po minutach prohledava cca 90 vterin, 1050000 radku 
]]--

os.execute("clear")
if arg[1] == nil then
print(arg[0].." 07_10_2022-13_58.zip")
print("apod.")
os.exit()
end
rok_nazev=string.sub(arg[1],7,10)

vybrany_soubor_zip = arg[1]
print(vybrany_soubor_zip)
hledej_datum = string.sub(vybrany_soubor_zip,1,16)
print(hledej_datum)
--os.exit()

soubor = "email_kody_" .. rok_nazev .. "_ubuntu.txt"
print(soubor)
--cesta = "/home/pi/r/"
cesta = "/home/pi/c/work/"
--cesta_zip_slozka = "/home/pi/r/"
cesta_zip_slozka = "/home/pi/c/work/"

--
--hledej_datum = "01_10_2024-11_55" -- test aby nenasel nic

print(hledej_datum.." < cas souboru zip")
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
if hledej_datum == radek then
nalezeno_radek = 1
--print("nalezeno radek")
print(radek.." << cas nalezeny v souboru klicu na radku ".. pocitadlo_1)
heslo = (file2:read())
print(heslo)
print("")
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

-- unzip
c1 = "unzip -t -P '"..heslo.."' "..cesta_zip_slozka..vybrany_soubor_zip
--print(c1)
os.execute(c1)
os.execute("sleep 3")

c2 = "unzip -x -P '"..heslo.."' "..cesta_zip_slozka..vybrany_soubor_zip.." -d "..cesta_zip_slozka
print(c2)
print("hotovo")
os.execute(c2)

--


