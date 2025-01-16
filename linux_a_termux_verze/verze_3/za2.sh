#!/usr/bin/lua
--Lua 5.2.4  Copyright (C) 1994-2015 Lua.org, PUC-Rio

os.execute("clear")
rok_ted = tostring(os.date("%Y"))
--rok_ted = "2023" testovaci ( aby otevrel soubor hesel pri jinej rok nez letosni )

soubor = "email_kody_" .. rok_ted .. ".txt"
print(soubor)

cesta = "/home/pi/c/work/soubory_hesel/" -- zde upravit tyto dva radky podle sebe
cesta_rar_slozka = "/home/pi/c/work/"

datum_ted = tostring(os.date("%d_%m_%Y-%H_%M"))
datum_ted = "08_11_2022-11_55xx" -- test aby nenasel datum ( jak dlouho bude prochazet cely soubor hesel az do konce )
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

-- zapakovani slozky a test archivu rar
c3 = "rar a -r -m5 -hp"..heslo.." ".."-p"..heslo.." "..soubor_rar.." "..slozka_rar.." && sleep 3; rar t -p"..heslo.." "..soubor_rar
--print(c3)
os.execute(c3)

--



