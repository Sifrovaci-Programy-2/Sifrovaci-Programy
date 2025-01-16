-- popis zde
os.execute("cls")
print("")
rok_ted = tostring(os.date("%y"))
print(rok_ted)
--rok_ted="24" --test


soubor = "ROK" .. rok_ted .. ".TXT"
--print(soubor)

cesta = "HESLA/"
cesta_rar_slozka = "ARCHIVY"

datum_ted = tostring(os.date("%d%m"))
datum_ted = datum_ted .. rok_ted
datum_ted = datum_ted .. tostring(os.date("%H"))
print(datum_ted)

--datum_ted="31122423" -- test


nalezeno_radek = 0
os.execute("sleep 3")
file2 = io.open(cesta..soubor , "r")
if not file2 then
print("neexistuje soubor "..cesta..soubor)
print("napred vygenerovat soubory hesel")
print("GENERUJ.BAT")
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
c1 = "mkdir " .. cesta_rar_slozka
--print(c1)
os.execute(c1)

slozka_rar = cesta_rar_slozka .. "\\" ..datum_ted
soubor_rar = cesta_rar_slozka .. "\\" .. datum_ted .. ".RAR"
c11 = "mkdir " .. slozka_rar
--print(c11)
--os.exit()
os.execute(c11)

print("")
print("byla vytvorena nova slozka "..cesta_rar_slozka.."\\"..datum_ted)
print("byl vytvoren soubor pro spusteni "..cesta_rar_slozka.."\\"..datum_ted..".BAT")
--print(heslo)
--os.exit()

-- vytvoreni batky pro komprimaci
--[[
arch_rar a -r -m0 -pAHOJ 07052309.RAR 07052309/
arch_rar a -r -m0 -p7lUuoDgLi1u60tn 07052310.RAR 07052310/

sleep 5
arch_rar k -pAHOJ 07052309.RAR
sleep 5
arch_rar t -pAHOJ 07052309.RAR
sleep 5
]]--

bat_file=cesta_rar_slozka.."//"..datum_ted..".BAT"
--print(bat_file)
file3 = io.open(bat_file, "w")
file3:write("@echo off")
file3:write("\n")
file3:write("rar a -r -m5 -p"..heslo.. " "..datum_ted..".RAR "..datum_ted)
file3:write("\n")
file3:write("sleep 5")
file3:write("\n")
file3:write("rar k -p"..heslo.." "..datum_ted..".RAR")
file3:write("\n")
file3:write("sleep 5")
file3:write("\n")
file3:write("rar t -p"..heslo.." "..datum_ted..".RAR")
file3:write("\n")
file3:write("sleep 5")
file3:write("\n")
file3:write("@echo on")
file3:write("\n")

file3:close()

print("")
print("napln slozku "..cesta_rar_slozka.."\\"..datum_ted)
print("a potom spust soubor "..cesta_rar_slozka.."\\"..datum_ted..".BAT")
os.execute("pause")
os.exit()

--

