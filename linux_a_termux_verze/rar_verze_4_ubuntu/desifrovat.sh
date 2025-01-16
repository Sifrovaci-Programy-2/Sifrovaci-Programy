#!/usr/bin/lua
--RAR 5.50
--Lua 5.2.4

os.execute("clear")
if arg[1] == nil then
print(arg[0].." 07_10_2022-13_58.rar")
print("apod.")
os.exit()
end
rok_nazev=string.sub(arg[1],7,10)

vybrany_soubor_rar = arg[1]
--print(vybrany_soubor_rar)
hledej_datum = string.sub(vybrany_soubor_rar,1,16)

soubor = "email_kody_" .. rok_nazev .. ".txt" -- 3 radky upravit podle situace
cesta = '/home/pi/c/Documents and Settings/DELL/Dokumenty/slozka_souboru_hesel_ubuntu/'
cesta_rar_slozka = '/home/pi/c/Documents\\ and\\ Settings/DELL/Dokumenty/archivy_ubuntu/'

--hledej_datum = "xxxx" -- test aby nenasel nic a pritom prosel celej soubor hesel ( jak dlouho to bude trvat )

nalezeno_radek = 0
--os.execute("sleep 3")
file2 = io.open(cesta..soubor , "r")
if not file2 then
print("neexistuje soubor "..cesta..soubor)
print("napred vygenerovat soubor klicu")
print("pouzit soubor generuj_hesla.sh")
os.execute("sleep 3")
os.exit()
end

print("byl otevren soubor hesel "..cesta..soubor)
print(hledej_datum.." < datum hledany v souboru hesel")


pocitadlo_1 = 0
for radek in file2:lines() do
pocitadlo_1 = pocitadlo_1 + 1
--print(radek)
if hledej_datum == radek then
nalezeno_radek = 1
--print("nalezeno radek")
print(radek.." < nalezeno datum v souboru hesel radek ".. pocitadlo_1)
heslo = (file2:read())
--print(heslo)
print("")
break
else
--print("nenalezeno radek")
end -- if

end
file2:close()

if nalezeno_radek == 0 then
print("toto datum v souboru hesel nenalezeno")
os.exit()
end
os.execute("sleep 3")


c2 = "rar t -p"..heslo.." "..vybrany_soubor_rar.." && sleep 5; rar x -p"..heslo.." -y "..vybrany_soubor_rar
--print(c2)
os.execute(c2)
os.execute("sleep 3")
print(heslo)
--
