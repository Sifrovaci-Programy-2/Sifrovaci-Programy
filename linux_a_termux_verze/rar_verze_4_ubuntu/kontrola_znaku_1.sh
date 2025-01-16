#!/usr/bin/lua

--[[
"-" 45
0-9 = 48-57
A-Z = 65-90
"_" 95
a-z = 97-122
]]--


znak = tostring(io.read())
print(znak)
b=string.byte(znak)
print(b)

if b >= 48 and b <=57
then
print("cisla")
end

