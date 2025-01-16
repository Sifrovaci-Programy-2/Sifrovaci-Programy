#!/data/data/com.termux/files/usr/bin/lua
-- zip 3.0
-- Lua 5.2.4

os.execute("clear")
rok_ted = tostring(os.date("%Y"))

--rok_ted = "2025" -- testovaci ( aby otevrel soubor hesel pri jinej rok nez letosni )

soubor = "email_kody_" .. rok_ted .. ".txt"
--print(soubor)

cesta = "/data/data/com.termux/files/home/storage/external-1/zaloha/slozka_souboru_hesel/"
cesta_zip_slozka = "/data/data/com.termux/files/home/storage/external-1/archivy/"

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
-- vytvoreni slozky a jeji zazipovani z heslem
slozka_zip = cesta_zip_slozka .. datum_ted .. "/"
soubor_zip = cesta_zip_slozka .. datum_ted .. ".zip"
c1 = "mkdir " .. slozka_zip
os.execute(c1)
print("")
print("byla vytvorena nova slozka "..slozka_zip)
print("nakopiruj do ni veskery obsah prilohy pro email")
print('napis "pokracovat" a stiskni <Enter> cokolik jineho ukonci program')
pokracovat = tostring(io.read())

if pokracovat ~= "pokracovat" then
c2 = "rm -rf " .. slozka_zip
os.execute(c2)
print("slozka " .. slozka_zip .. " byla smazana")
os.execute("sleep 1")
print("program ukoncen")
os.exit()
end

-- zapakovani slozky a test archivu zip
c3 = "zip -r -9 -y -P '"..heslo.."' "..soubor_zip.." "..slozka_zip.." && sleep 3; unzip -t -P '"..heslo.."' "..soubor_zip

-- zmena time stamp u zip souboru aby byl stejny jako datum v nazvu
--print(datum_ted.."<")
zmen_zip_stamp = string.sub(datum_ted,7,10)..string.sub(datum_ted,4,5)..string.sub(datum_ted,1,2)..string.sub(datum_ted,12,13)..string.sub(datum_ted,15,16)
--print(zmen_zip_stamp.."<<<")
--print(c3)
os.execute(c3)
c4 = "touch -t " .. zmen_zip_stamp .. " " .. soubor_zip
--print(c4)
os.execute("sleep 1")
os.execute(c4)
print(heslo)
--
