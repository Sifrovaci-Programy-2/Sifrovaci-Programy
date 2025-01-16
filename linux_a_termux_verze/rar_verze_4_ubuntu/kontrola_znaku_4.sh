#!/usr/bin/lua

--[[
"-" 45
0-9 = 48-57
A-Z = 65-90
"_" 95
a-z = 97-122
]]--


nazev = tostring(io.read())

for aa = 1,#nazev do
znak = (string.sub(nazev,aa,aa))

print(znak)
b = string.byte(znak)
print(b)

--if b >= 48 and b <= 57 and b >= 65 and b <= 90 and b >= 97 and b <= 122
--if b >= 48 and b <= 57 or b >= 65 and b <= 90 or b >= 97 and b <= 122
if b >= 48 and b <= 57 or b >= 65 and b <= 90 or b >= 97 and b <= 122 or b == 45 or b == 95

then
print("proslo")
else
print("NEproslo")
end

end --aa

