#!/usr/bin/lua
--#!/data/data/com.termux/files/usr/bin/lua
-- vyber sobe dle libosti, ubuntu nebo termux verze
--napsano v lua 5.2.4


cesta_soubory_klicu="/home/pi/bash/verze_6.2_bash/keys/"
--             tento ^ radek upravit podel svoji situace


if arg[1] == nil
then
print(arg[0].." OutputKeyFile")
print(arg[0].." osoba1-osoba2")
print("seznam klicu v adresari "..cesta_soubory_klicu)
cmd_1="ls "..cesta_soubory_klicu
--print(cmd_1)
os.execute(cmd_1)
os.exit()
end

key_name=arg[1]

--kontrola jestli nazev klice "key_name" jiz neexistuje v ceste "cesta_soubory_klicu"
--aby se neprepsal omylem puvodni
test = (io.open(cesta_soubory_klicu..key_name, "r"))
--print(test)
if test ~= nil then
print("nazev souboru "..key_name.." v adresari "..cesta_soubory_klicu..key_name.." jiz existuje")
print("prepsal by se jeho puvodni obsah, zvolte jiny nazev")
print("seznam klicu v adresari "..cesta_soubory_klicu)
cmd_2="ls "..cesta_soubory_klicu
os.execute(cmd_2)
os.exit()
end

math.randomseed(os.time())

t={"","","","","","","","","","1","2","3","4","5","6","7","8","9","0","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u",
"v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}
lt = #t

matrix_vodorovne=61 -- 61 = 10-71
matrix_svisle=125 -- ma bejt 0-125 a v hodnote klice ma bej pismeno "A" apod.

mix_max=500

file = io.open(cesta_soubory_klicu..key_name, "w")
file:write("matrix_vodorovne="..matrix_vodorovne)
file:write("\n")
file:write("matrix_svisle="..(matrix_svisle + 1))
file:write("\n")

matrix_delka=matrix_vodorovne * ( matrix_svisle + 1 )
file:write("matrix_delka="..matrix_delka)
file:write("\n")

file:write("declare -A matrix=(")
file:write("\n")


for aa = 0,matrix_svisle do
print("# "..aa..",10-"..(matrix_vodorovne + 10))

file:write("# "..aa..",10-"..(matrix_vodorovne + 10))
file:write("\n")

for mix = 1, mix_max do
rnd_1=math.random(10,71)
rnd_2=math.random(10,71)
--print(rnd_1)
--print(rnd_2)
pom=t[rnd_1]
--print(pom)
t[rnd_1]=t[rnd_2]
t[rnd_2]=pom
end -- mix


for bb=10,10+matrix_vodorovne do
prvek="["..aa..","..bb..']="'..t[bb]..'"'
print(prvek)
file:write(prvek)
file:write("\n")

end -- bb
end -- aa

file:write(')')
file:write("\n")

file:close()


print("matrix_vodorovne="..matrix_vodorovne)
print("matrix_svisle="..(matrix_svisle + 1))
print("matrix_delka="..matrix_delka)
--
