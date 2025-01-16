#!/usr/bin/lua
povolene_znaky_v_nazvu={"-","_","1","2","3","4","5","6","7","8","9","0","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}

--print(#povolene_znaky_v_nazvu)

for ee = 1,#povolene_znaky_v_nazvu do
--print(povolene_znaky_v_nazvu[ee])
end
print("zadej nazev souboru archivu")
print('mohou byt pouzity znaky [1-0],[a-z],[A-Z], znak "-" a znak "_" misto mezerniku')
print("maximalni delka nazvu je 64 znaku, klavesa <Enter> program ukonci")
::label_zadani::
print()
print("         1         2         3         4         5         6")
print("1234567890123456789012345678901234567890123456789012345678901234")
print("---------|---------|---------|---------|---------|---------|---|")

nazev_archivu = tostring(io.read())
print(nazev_archivu)
print("delka nazvu je "..#nazev_archivu)

if #nazev_archivu > 64 then
print("nazev je delsi ne 64 znaku opakuj zadani")
goto label_zadani
end


if #nazev_archivu == 0 then
print("exit")
end

--print(type(nazev_archivu))






