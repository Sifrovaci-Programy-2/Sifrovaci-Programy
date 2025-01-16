os.execute("cls")
print()

os.execute("dir ARCHIVY > soub_rar.txt")
os.execute("sleep 5")
--os.exit()

t={}
file = io.open("soub_rar.txt", "r")
while true do
radek=(file:read())
if radek ~= nil then
--print(radek)

table.insert(t,radek)
else
break
end

end --while

file:close()

--print(#t)


pwd=t[1]
--print(pwd)


t2={}
for aa = 4,#t - 2 do
hl1=" RAR "
nal1=string.find(t[aa],hl1)

if nal1 ~= nil then
vloz_adresar = string.sub(t[aa],1,8)
vloz_adresar=vloz_adresar .. ".rar"
--print(vloz_adresar)
table.insert(t2,vloz_adresar)
end

end

t=nil

if #t2 == 0 then
print('nenalezen adresar "ARCHIVY" a nebo vnem nejsou zadne soubory *.rar')
print("konec programu")
os.execute("del soub_rar.txt")
os.execute("sleep 10")
os.exit()
end


for bb = 1,#t2 do
print(bb.." " ..t2[bb])
end

print("?")
volba_soubor=tonumber(io.read())
--print(volba_soubor)

if volba_soubor < 1 or volba_soubor > #t2 then
print("spatne zadani")
print("konec programu")
os.execute("sleep 10")
os.exit()
end

--print(type(volba_soubor))
--os.exit()

vybran_rar=(t2[volba_soubor])
print(vybran_rar)
os.execute("del soub_rar.txt")
os.execute("sleep 10")


hledej_datum = string.sub(vybran_rar,1,8)
--print(hledej_datum)
--os.exit()

cesta = "HESLA/"
cesta_rar_slozka = "ARCHIVY"

soubor = "rok" .. string.sub(vybran_rar,5,6) .. ".txt"
--print(soubor)
--os.exit()

nalezeno_radek = 0
--os.execute("sleep 3")
file2 = io.open(cesta..soubor , "r")
if not file2 then
print("neexistuje soubor "..cesta..soubor)
print("napred vygenerovat soubor klicu")
print("pouzit soubor generuj.lua")
os.execute("sleep 3")
os.exit()
end

print("byl otevren soubor hesel "..cesta..soubor)
--hledej_datum = "56782399" -- testovaci nic nenajde
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
print("konec programu")
os.execute("sleep 10")
os.exit()
end
os.execute("pause")
--os.execute("sleep 10")
c1 = "rar t -p"..heslo.." "..cesta_rar_slozka.."\\"..vybran_rar
--print(c1)
os.execute(c1)
os.execute("sleep 10")
-- rar x -pahoj ARCHIVY/chess.rar ARCHIVY/
c2 = "rar x -p"..heslo.." "..cesta_rar_slozka.."\\"..vybran_rar.." "..cesta_rar_slozka.."//"
-- rar x -y -p = -y prepisuje jiz existujisi bez ptani (yes)
--print(c2)
os.execute(c2)
print(heslo)
os.execute("sleep 10")
os.exit()

--


