#!/data/data/com.termux/files/usr/bin/lua

-- termux verze 4 cte datum z komentare (parametr "-c") z archivu zip
-- Lua 5.2.4
-- Zip 3.0
-- UnZip 6.00

os.execute("clear")
if arg[1] == nil then
print(arg[0].." nazev_archivu.zip")
print("apod.")
os.exit()
end

vybrany_soubor_zip = arg[1]
print("vybrany soubor - "..vybrany_soubor_zip)

--precte -c komentar vybraneho archivu.zip
t_list={}
Hnd, ErrStr = io.popen("unzip -l "..arg[1])
if Hnd then
for Str in Hnd:lines() do
--io.write(Str, "\n")
--print(Str.."<")
table.insert(t_list, Str)
end
Hnd:close()
else
--io.write(ErrStr, "\n")
--print(ErrStr.."<<")
end

--print(#t)

for aa = #t_list,1,-1 do
--print(aa)
--print(t[aa])
--os.execute("sleep 0.5")
if t_list[aa] == "  Length      Date    Time    Name" then
nalezeno_Lenght=aa
--print(nalezeno_Lenght.."<")
break
end
end --aa

if nalezeno_Lenght ~= nil then
hledej_datum = t_list[nalezeno_Lenght + 3]
else
print("nenalezen komentar souboru zip, konec programu")
os.execute("sleep 5")
os.exit()
end

delka_hledej_datum = string.len(hledej_datum)

if delka_hledej_datum ~= 16 then
print("chybni komentar archivu, konec programu")
os.execute("sleep 5")
end

print("datum archivu nactene z komentare archivu - "..hledej_datum)
rok_nazev=string.sub(hledej_datum,7,10)
--print(">"..rok_nazev.."<")
--os.exit()

soubor = "email_kody_"..rok_nazev..".txt"
cesta = "/data/data/com.termux/files/home/storage/external-1/zaloha/slozka_souboru_hesel/"
cesta_zip_slozka = "/data/data/com.termux/files/home/storage/external-1/archivy/"

--hledej_datum = "xxxx" -- test aby nenasel nic a pritom prosel celej soubor hesel ( jak dlouho to bude trvat )
--rok_nazev = "2026" -- testovaci radek ( aby nenasel soubor hesel )


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

--vybrany_soubor_zip = "smaz_test.zip" -- prejmenovat treba jpg na smaz_test.zip ( aby neprosel testem ) -- testovaci radek

--c2 = "unzip -x -P '"..heslo.."' "..vybrany_soubor_zip.." -d "..cesta_zip_slozka
--c2 = "unzip -t -P '"..heslo.."' "..vybrany_soubor_zip.." && sleep 5; unzip -x -P '"..heslo.."' "..vybrany_soubor_zip.." -d "..cesta_zip_slozka 
c2 = "unzip -t -P '"..heslo.."' "..vybrany_soubor_zip.." && sleep 5; unzip -x -P '"..heslo.."' "..vybrany_soubor_zip.." -d "..cesta_zip_slozka 

--print(c2)
os.execute(c2)
print(heslo)
--

