#!/usr/bin/lua

print("zadej nazev souboru archivu rar, zip")
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
--

print("nazev - "..nazev_archivu)

