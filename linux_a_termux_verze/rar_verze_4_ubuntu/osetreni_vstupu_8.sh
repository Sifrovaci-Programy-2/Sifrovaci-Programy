#!/usr/bin/lua

print("zadej nazev souboru archivu")
print('mohou byt pouzity znaky [1-0],[a-z],[A-Z], znak "-" a znak "_" misto mezerniku')
print("maximalni delka nazvu je 64 znaku, klavesa <Enter> program ukonci")
::nazev::
print()
print("         1         2         3         4         5         6")
print("1234567890123456789012345678901234567890123456789012345678901234")
print("---------|---------|---------|---------|---------|---------|---|")

nazev_archivu = tostring(io.read())
print(nazev_archivu)
print("delka nazvu je "..#nazev_archivu)

if #nazev_archivu > 64 then
print("nazev je delsi ne 64 znaku opakuj zadani")
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

for xx = 1,#nazev_archivu do
nazev_znak = (string.sub(nazev_archivu,xx,xx))

print(nazev_znak)
b_znak = string.byte(nazev_znak)
print(b_znak)

if b_znak >= 48 and b_znak <= 57 or b_znak >= 65 and b_znak <= 90 or b_znak >= 97 and b_znak <= 122 or b_znak == 45 or b_znak == 95

then
print("nazev prosel")
else
print("nazev NEprosel")
end
end --xx

