#!/usr/bin/lua
--os.execute("clear")
t={}
Hnd, ErrStr = io.popen("unzip -l "..arg[1])
if Hnd then
for Str in Hnd:lines() do
--io.write(Str, "\n")
--print(Str.."<")
table.insert(t, Str)
end
Hnd:close()
else
--io.write(ErrStr, "\n")
--print(ErrStr.."<<")
end

--print(#t)

for aa = #t,1,-1 do
--print(aa)
--print(t[aa])
--os.execute("sleep 0.5")
if t[aa] == "  Length      Date    Time    Name" then
nalezeno_Lenght=aa
--print(nalezeno_Lenght.."<")
break
end
end --aa

if nalezeno_Lenght ~= nil then
heslo_komentar = t[nalezeno_Lenght + 3]
else
print("nenalezen komentar souboru zip, konec programu")
os.execute("sleep 5")
os.exit()
end

delka_heslo_komentar = string.len(heslo_komentar)

if delka_heslo_komentar ~= 16 then
print("chybni komentar archivu, konec programu")
os.execute("sleep 5")
end


print(heslo_komentar)

