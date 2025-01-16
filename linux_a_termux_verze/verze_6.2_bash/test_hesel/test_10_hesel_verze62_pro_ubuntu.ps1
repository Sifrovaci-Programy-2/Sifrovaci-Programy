cls
Remove-Variable i ,ii -ErrorAction SilentlyContinue
$hesla_old=@(
"mReyV1FSffJyib7xAPHRmWZ0L61P2EBa0XJkxi4VYUIUVeTidMDDsKtifBqIiFEdOuWeP2Say4fSAtkemwMhff2951bg3qx5ebl1mrj3U84EzteNrK22TYcRs17f7O"
"s3KjP1J9wduLuCTyNUsNBLO3xY8WOsfhmYNYYkKGtsX6sxISPJNLLGy1CMaCdebzCwoSdmzqIU82qjxG6tcgnCqP8KolcsNxlUjGnR8g6QmhkIDzCs32A118DX3KlY"
"rYAsGQnxUCjnzgpoOaffjyaQa1qeJZ5y4Qpj9kWnyf1ITuNAKDUFZiuBmEacJ3Byfl6s2yC90boUOlUo1nM0fTqg7N191vqyCBTrUl8H4WeuTikeYIUFTp4MVNRLYY"
"KgPGdlkgFDNNuECLBwS22e494CEbC39l8yfzyNADK6kDLGtItARvsQpwMr4mUdgnaPgo4wiJ06oU29WM6yZycyrj5vzqCNjAGfkaCmDGJdQfe5sEEiEUcb9UeOT5mA"
"Z5gc9E9KglBz07iV4NCU6UA96HhrWFhvOX2u84Q6g31ZxL0GGhvy32BkfOTrAhqu7KGv2cXxnjVxGv2I7jGSZjiBjuItJb1s3Ta3O651Wbp3aes2VIDG6QLMRlq9hS"
"hFaRE7dVIg41C58xqEpvV3TfMQFZgxTewnoZtMnL33Bl6WdMATp9W6SrHgHXOB67xoSjudcizIFMmkE7iLLO4APwvE62uumUTRVYmSqgo4wFHLW1OFFR6wh1nLb8b2"
"R6iNrSdBk1ut49yQQJrstakUEJ9E4hpXYF3SaUKABxIy6VM7uhE88wjZR2bkwzosV98T0NxbMm2AM2irPEalSl5LbxJcFPM28jl9J46aqZO1SM6fWjGNo3YI4w8jVE"
"a0PbJjxsHbK7etbxn1FdtIB45iiSmM8R6zkRyvsDam0Dfpnw9w2U41ojNiI8K0wh1WGGhU48E1lIfFObjIbN85dEkLfkdI3URsbK4fpBSvZ7p4Tn4DeJo7KBDr88EO"
"o5LhPTxWrfotOzC1DsOKsaIRBeJFBPgptghD38GoZ92whxjiEp3aoZCUB5F1WnFw18TjRkdg8ASLwBsfTA6hcGojqltxXr1lehA2JlmcZ56HQVh7SvJX258LYFi9d7"
"oSuLMGGLeMlKcThu4hZdHb13rrKPxNDltfPfT7orGHo9d0RqG66UX4XkhXHDICts8mik3lGE2cG4JwKOeaS2B5IQJdoHfx3I8XEIZHQISNHt0ucwRchQxYvRo7GiVV"
)

$hesla=@()
$hesla+=$hesla_old[0]

$d_hesla_old=$hesla_old.Length

for ( $i=1; $i -le $d_hesla_old -1; $i++ ){
#echo (($i +1))
$hesla+=$hesla_old[$i]

<# nahore v poly $hesla je 10 hesel k archivum zip vse vytvoreno jednim klicem - autoruv-klic-cislo-1
   bude se testovat opakovani znaku na pozici 0,1,2,3 atd. v ruznych heslech jak jdou po sobe 
#>  

$pole_vysledky=@()

for ( $aa=0; $aa -le $hesla[0].Length -1; $aa++ ) { # delka kazdeho hesla je 0-125 znaku ( 126 zanku celkem )
$pole_jeden_sloupec_ze_vsech_hesel=@()

for ( $bb=0; $bb -le $hesla.Length -1; $bb++ ) {
$pole_jeden_sloupec_ze_vsech_hesel+=$hesla[$bb].Substring($aa,1)
}

#echo $pole_jeden_sloupec_ze_vsech_hesel
Remove-Variable pole, x, item, x, qq, suma -ErrorAction SilentlyContinue

$x=@()
#$x += $pole_jeden_sloupec_ze_vsech_hesel | Group | Where{$_.Count -gt 1} | Select-Object Count
$x += $pole_jeden_sloupec_ze_vsech_hesel | Group -CaseSensitive | Where{$_.Count -gt 1} | Select-Object Count
# paklize nejni prepinac "-CaseSensitive" povazuje napr. "d" a "D" za stejnej znak !!!
# takze default je CaseSensitive  off

$suma=0
if ( $x.Length -ne 0 ) {
foreach ( $item in $x ) {
[string] $qq = $item
#echo $qq
$suma += [int32] $qq.Substring(8,$qq.Length -9)
}
}

#echo $suma
$pole_vysledky+=$suma
}

$ii=(($i+1))
Write-host -ForegroundColor yellow "toto je vypis $ii pouzitich hesel vzniklych z jednoho souboru klice pod sebou:"
for ( $cc=0; $cc -le $hesla.Length -1; $cc++ ) {
echo $hesla[$cc]
}

$vysledky_string_out_1=""
$vysledky_string_out_2=""
for ( $dd=0; $dd -le $pole_vysledky.Length -1; $dd++ ) {

if ( $pole_vysledky[$dd] -lt 10 ) {
$vysledky_string_out_1 += $pole_vysledky[$dd]
} else {
$vloz_1 = [string] $pole_vysledky[$dd]
$vloz_1 = $vloz_1.Substring(0,1)
$vysledky_string_out_1+=$vloz_1 # kdy je $suma >= 10
#$vysledky_string_out_1+="1" # kdy je $suma >= 10
}

if ( $pole_vysledky[$dd] -lt 10 ) {
$vysledky_string_out_2+=" "
} else {
$vloz_2 = [string] $pole_vysledky[$dd]
$vloz_2 = $vloz_2.Substring(1,1)
$vysledky_string_out_2+=$vloz_2 # kdy je $suma >= 10
#$vysledky_string_out_2+="0" # kdy je $suma >= 10
}
}

Write-host -ForegroundColor Cyan $vysledky_string_out_1
Write-host -ForegroundColor Cyan $vysledky_string_out_2 # radek nuly pro desitky ( paklize $suma >= 10 ) jsou dva znaky uz

$total_suma=0
for ($ee=0; $ee -le $pole_vysledky.Length -1; $ee++ ) {
$total_suma+=$pole_vysledky[$ee]
}

#$procent = (291/1260).ToString("P")
$celkem_znaku_v_heslech = (( $hesla[0].Length * $hesla.Length))
$procent = ($total_suma/$celkem_znaku_v_heslech).ToString("P") # toto je specialni vypocet procent ze dvou cisel v PowerShellu
Write-host -ForegroundColor yellow "soucet vsech stejnych znaku ve vsech sloupcich je : $total_suma to je $procent procent z $celkem_znaku_v_heslech znaku celkem"

sleep 10
cls
} # for i


