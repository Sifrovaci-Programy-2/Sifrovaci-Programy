#!/data/data/com.termux/files/usr/bin/lua
-- Lua 5.2.4

--os.execute("clear")
if #arg == 0 then
print("napoveda")
print(arg[0] .. " 2022")
print(arg[0] .. " 2022 test")
print(arg[0] .. " 2023")
print(arg[0] .. " 2023 test")
print("atd.")
os.exit()
end

soubor = "email_kody_" .. arg[1] .. ".txt"
cesta = "/data/data/com.termux/files/home/storage/external-1/zaloha/slozka_souboru_hesel/"

math.randomseed(os.time())
t={"1","2","3","4","5","6","7","8","9","0","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u",
"v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}
lt = #t

zacatek_roku = 0
stamp_ted = os.time()
letos_rok = os.date("%Y")
--print(letos_rok.." < letosni rok")

if arg[1] == letos_rok then
print("zadany rok je letosni, budou vygenerovany hesla od ted do konce roku")
print("(paklize je prestupnej rok tak se bere v uvahu 29.2.2024 apod.)")
stamp_od_kdy = stamp_ted
else
print("budou vygenerovana hesla pro cely rok ".. arg[1])
print("(paklize je prestupnej rok tak se bere v uvahu 29.2.2024 apod.)")
stamp_od_kdy = os.time{hour = 00, minute = 00, day = 01, month = 01, year = arg[1]}
stamp_ted = stamp_od_kdy
zacatek_roku = 1
end

if arg[2] == "test" then
print("provede se test, nebudou se generovat hesla")
soubor = "email_kody_" .. arg[1] .. "-test.txt"
delka_hesla_od = 0
delka_hesla_do = 0
else
delka_hesla_od = 120 -- delka hesla
delka_hesla_do = 127
end

print("ukladam soubor "..cesta..soubor)

krok_plus_vterin = 60 -- po minutach
stamp_do_kdy = os.time{hour = 00, minute = 00, day = 31, month = 12, year = arg[1]}
if zacatek_roku == 0 then
stamp_do_kdy = stamp_do_kdy + 86400 -- tak nak udelany aby to fungovalo
else
stamp_do_kdy = stamp_do_kdy + 86340 -- kdyztak jeste poladit kdyby bylo potreba
end

print(stamp_ted.." stamp ted")
print(stamp_od_kdy.." stamp ted upraveny")
print(stamp_do_kdy.." stamp do kdy")

stamp_rozdil=(os.difftime(stamp_do_kdy, stamp_ted))
print(stamp_rozdil.." rozdil vterin")

file = io.open(cesta..soubor, "w")
for aa = stamp_ted,stamp_do_kdy,krok_plus_vterin do
zapis_datum = (os.date("%d_%m_%Y-%H_%M", aa))
file:write(zapis_datum)
file:write("\n")

-- micha klice t{}
if arg[2] ~= "test" then
for cc = 1,math.random(3,5) do
r1 = math.random(1,lt)
r2 = math.random(1,lt)
x1 = t[r1]
x2 = t[r2]
t[r1] = x2
t[r2] = x1
--print(r1.." - "..t[r1].."   "..r1.." - "..t[r2])
end -- for cc
--print "-------"
--os.execute("sleep 1")
end -- if arg[2]
--

heslo = ""
heslo_delka = math.random(delka_hesla_od,delka_hesla_do) -- delka hesla na radku v poctu znaku od,do 300 350 lze menit
for bb = 1,heslo_delka do
rnd = math.random(1,lt)
heslo=heslo..t[rnd]
end -- bb
if arg[2] ~= "test" then
file:write(heslo)
file:write("\n")
end --if arg{2}
end -- aa
file:close()
print("hotovo")
print(zapis_datum.. " < posledni datum zapsane do souboru "..cesta..soubor )
