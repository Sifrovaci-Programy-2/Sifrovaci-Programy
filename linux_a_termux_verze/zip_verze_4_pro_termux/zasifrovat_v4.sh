#!/data/data/com.termux/files/usr/bin/lua

-- termux verze 4 cte datum z komentare (parametr "-c") z archivu zip
-- Lua 5.2.4
-- Zip 3.0
-- UnZip 6.00

os.execute("clear")
rok_ted = tostring(os.date("%Y"))

--rok_ted = "2025" -- testovaci ( aby otevrel soubor hesel pri jinej rok nez letosni )

soubor = "email_kody_" .. rok_ted .. ".txt"
--print(soubor)

cesta = "/data/data/com.termux/files/home/storage/external-1/zaloha/slozka_souboru_hesel/"
cesta_zip_slozka = "/data/data/com.termux/files/home/storage/external-1/archivy/"
komentar_zip = "/data/data/com.termux/files/home/KomentarZip.txt" -- sem dat co nejkratsi cestu jinak nefunguje (zadny lomitka apod.)

datum_ted = tostring(os.date("%d_%m_"))
datum_ted = datum_ted .. rok_ted
datum_ted = datum_ted .. tostring(os.date("-%H_%M"))

--datum_ted = datum_ted .. "XX" -- test aby nenasel datum ( jak dlouho bude prochazet cely soubor hesel az do konce )

nalezeno_radek = 0
--os.execute("sleep 3")
file2 = io.open(cesta..soubor , "r")
if not file2 then
print("neexistuje soubor "..cesta..soubor)
print("napred vygenerovat soubor hesel")
print("pouzit soubor generuj_hesla.sh")
os.execute("sleep 3")
os.exit()
else
print("byl otevren soubor hesel "..cesta..soubor)
print(datum_ted.." < datum hledany v souboru hesel")
end

pocitadlo_1 = 0
for radek in file2:lines() do
pocitadlo_1 = pocitadlo_1 + 1
--print(radek)
if datum_ted == radek then
nalezeno_radek = 1
--print("nalezeno radek")
print(radek.." < nalezeno datum v souboru hesel radek ".. pocitadlo_1)
heslo = (file2:read())
--print(heslo)
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

-- zadani nazevu slozky a ostreni vstupu max. 64 znaku delka
print("zadej nazev souboru archivu zip")
print('mohou byt pouzity znaky [1-0],[a-z],[A-Z], znak "-" a znak "_" misto mezerniku')
print("maximalni delka nazvu je 64 znaku, klavesa <Enter> program ukonci")
::nazev::
print()
print("         1         2         3         4         5         6")
print("1234567890123456789012345678901234567890123456789012345678901234")
print("---------|---------|---------|---------|---------|---------|---|")

nazev_archivu = tostring(io.read())
--print(nazev_archivu)
--print("delka nazvu je "..#nazev_archivu)

if #nazev_archivu > 64 then
print("nazev je delsi nez 64 znaku opakuj zadani, nebo klavesa <Enter> pro ukonceni programu")
nazev_archivu = nil
goto nazev
end

if #nazev_archivu == 0 then
print("konec programu")
os.execute("sleep 5")
os.exit()
end

--[[
"-" 45
0-9 = 48-57
A-Z = 65-90
"_" 95
a-z = 97-122
]]--

nazev_archivu_prosel = 1

for xx = 1,#nazev_archivu do
nazev_znak = (string.sub(nazev_archivu,xx,xx))

--print(nazev_znak)
b_znak = string.byte(nazev_znak)
--print(b_znak)

if b_znak >= 48 and b_znak <= 57 or b_znak >= 65 and b_znak <= 90 or b_znak >= 97 and b_znak <= 122 or b_znak == 45 or b_znak == 95 then
--print("znak prosel")
else
--print("znak NEprosel")
nazev_archivu_prosel = 0
break
end
end --xx

if nazev_archivu_prosel == 0 then
print("neplatny znak(y) v nazvu, opakuj zadani, nebo klavesa <Enter> pro ukonceni programu")
nazev_archivu = nil
goto nazev
end
--print("nazev - "..nazev_archivu)

slozka_zip = cesta_zip_slozka .. nazev_archivu .. "/"
soubor_zip = cesta_zip_slozka .. nazev_archivu .. ".zip"

--zapise soubor kometare z datumem pro nacteni komentare pro zip
file3 = io.open(komentar_zip, "w")
file3:write(datum_ted)
file3:write("\n")
file3:close()
os.execute("sleep 1")

--kontrola jestli existuje soubor komentare a kontrola jeho obsahu
--komentar_zip = "/data/data/com.termux/files/home/KomentarZip.txtxxx" -testovaci
--datum_ted="01_02_2023-13_20" -- testovaci
--os.execute("sleep 30") -- testovaci

file4 = io.open(komentar_zip, "r")
if file4 ~= nil then
--print("soubor komentare existuje")
datum_file_comment = (file4:read())
file4:close()
--print(datum_file_comment)
--print(datum_ted)
else
print("nenalezen soubor komentare pro archiv zip, program ukoncen")
os.execute("sleep 5")
os.exit()
end

if datum_ted ~= datum_file_comment then
print("spatny obsah souboru komentare archivu zip , program ukoncen")
c22 = "rm -rf ".. komentar_zip
--print(c22)
os.execute(c22)
os.execute("sleep 5")
os.exit()
end

-- vytvoreni slozky a jeji zazipovani z heslem
c1 = "mkdir " .. slozka_zip
os.execute(c1)
print("")
print("byla vytvorena nova slozka "..cesta_zip_slozka)
print(nazev_archivu.."/")
print()
print("nakopiruj do ni veskery obsah prilohy pro email")
print('napis "pokracovat" a stiskni <Enter> cokolik jineho ukonci program')
pokracovat = tostring(io.read())

if pokracovat ~= "pokracovat" then
c2 = "rm -rf " .. slozka_zip.."; rm -rf ".. komentar_zip
--print(c2)
os.execute(c2)
print("slozka " .. slozka_zip .. " byla smazana")
print("soubor " .. komentar_zip .. " byl smazan")
print("program ukoncen")
os.execute("sleep 5")
os.exit()
end

-- zapakovani slozky a test archivu zip
--c3 = "zip -r -9 -y -UN=UTF8 -P '"..heslo.."' "..soubor_zip.." "..slozka_zip.." && ".."sleep 3; unzip -t -P '"..heslo.."' "..soubor_zip
--c3 = "zip -r -9 -y -UN=UTF8 -P '"..heslo.."' -c < komentar.txt "..soubor_zip.." "..slozka_zip.." && ".."sleep 3; unzip -t -P '"..heslo.."' "..soubor_zip
--c3 = "zip -r -9 -y -UN=UTF8 -P '"..heslo.."' -c < "..komentar_zip.." "..soubor_zip.." "..slozka_zip.." && ".."sleep 3; unzip -t -P '"..heslo.."' "..soubor_zip
--fungovalo c3 = "zip -r -9 -P '"..heslo.."' ".." -c < a.txt "..soubor_zip.." "..slozka_zip.." && ".."sleep 3; unzip -t -P '"..heslo.."' "..soubor_zip
--c3 = "zip -r -9 -y -UN=UTF8 -P '"..heslo.."' -c < "..komentar_zip.." "..soubor_zip.." "..slozka_zip.." && ".."sleep 3; unzip -t -P '"..heslo.."' "..soubor_zip
c3 = "zip -r -9 -y -UN=UTF8 -P '"..heslo.."' -c < "..komentar_zip.." "..soubor_zip.." "..slozka_zip.." && ".."sleep 3; unzip -t -P '"..heslo.."' "..soubor_zip.. " && rm -v "..komentar_zip
--vzor - zip -r -9 -Pabc -c < komentar.txt test-3.zip slozka2/
--print(c3)
os.execute(c3)

--zmena time stamp u zip souboru aby byl stejny jako datum v nazvu
--print(datum_ted.."<")
zmen_zip_stamp = string.sub(datum_ted,7,10)..string.sub(datum_ted,4,5)..string.sub(datum_ted,1,2)..string.sub(datum_ted,12,13)..string.sub(datum_ted,15,16)
--print(zmen_zip_stamp)
c4 = "touch -t " .. zmen_zip_stamp .. " " .. soubor_zip
--print(c4)
os.execute("sleep 2")
os.execute(c4)
print(heslo)
os.execute("sleep 5")
os.exit()
--


