cls
Remove-Variable matrix,volba_klice,nazev_klice -ErrorAction SilentlyContinue

# tady editovat sestu do slaozky "keys" podle svoji situace
#$cesta_do_adresare_keys="C:\Users\DELL\Documents\ps1\_GUI\Sifrovaci_program_GUI_PowerShell_verze_1.2\keys\" # absolutni cesta
$cesta_do_adresare_keys = "..\..\keys\" # relativni cesta, odsud ( soubory museji zustat na svem miste kde sou ted,jinak upravit )
#

Write-host -ForegroundColor Yellow "keys view v1.3 lite"
echo "zadej nazev klice z adresare"
echo "$cesta_do_adresare_keys"
echo "napr. big_key_1"
echo "?"
[string] $volba_klice = Read-Host
#echo $volba_klice
$nazev_klice = $cesta_do_adresare_keys + $volba_klice
#echo $nazev_klice
Write-host -ForegroundColor Yellow $nazev_klice

# test jestli existuje zvoleny soubor
$file_exist_test = Test-Path $nazev_klice
if ($file_exist_test -clike "False"){
Write-host -ForegroundColor red "nenalezen soubor $nazev_klice"
echo "konec programu"
sleep 5
exit
}

# easter egg vylepsenej ( velikonocni vajicko, prekvapeni )
if (( $volba_klice -clike "dexovo" ) -or ( $volba_klice -clike "fery" )) {
echo "ATARI 8-BIT FOREVER !"
sleep 5
exit 1
}elseif ( $volba_klice -clike "technomorous" ) { # 5.11.2024 pridano vylepseni este, techno klipl
echo "Power PC forever !"
sleep 5
exit 1
}

# prazdny matrix 1295 vodorovne a 126 svisle
$matrix=[System.Collections.ArrayList]::new()

for ( $aa = 0; $aa -le 125; $aa++ ) { # radku pod sebou
# delka 1296 klicu na kazdym radku
$vv=@()
for ( $bb = 0; $bb -le 1295; $bb++ ) { # 0-1295 - 126x1295 = 163296 policek
$vv+=""
}
$matrix.Add($vv) > $null # pozor musi bej odeslat do > null jinak pise radky cisla a zdrzuje to
# bez > $null vypise 0-125 radek
}

# zde nacita klic to matice
$stream_reader_1 = [System.IO.StreamReader]::new($nazev_klice)

for ( $dd = 0; $dd -le 125; $dd++){
for ( $ee = 0; $ee -le 1295; $ee++){
$line_read = ($stream_reader_1.ReadLine()) 
$matrix[$dd][$ee]=$line_read
}
}
$stream_reader_1.close()


# matrix do souboru
$pole_out=@()
$pole_out+="keys view v1.3 lite - $volba_klice"
$pole_out+=""

$poc_1=1
$jeden_radek="000--"
for ( $ff = 0; $ff -le 125; $ff++){ # 126 znaku hesla, radky 0-125
for ( $gg = 0; $gg -le 1295; $gg++){ # 0-1295 - 126x1295 = 163296 policek v1.3 lite
$jeden_radek+=$matrix[$ff][$gg]
}

#echo $jeden_radek
$pole_out+=$jeden_radek

if ( $poc_1 -lt 10 ) { 
$jeden_radek="00"
$jeden_radek+=[string]$poc_1
$jeden_radek+="--"
}
elseif ( $poc_1 -gt 9 -and $poc_1 -lt 100 ) {
$jeden_radek="0"
$jeden_radek+=[string]$poc_1
$jeden_radek+="--"
}
elseif ( $poc_1 -gt 99 ) {
$jeden_radek=""
$jeden_radek+=[string]$poc_1
$jeden_radek+="--"
}

$poc_1++
}

# ulozeni do souboru
echo "zapisuji data do souboru :"
$out_file_name="keys_view-"+$volba_klice+".txt"
echo $out_file_name

Set-Content -Path $out_file_name -Encoding ASCII -Value $pole_out

sleep 3

