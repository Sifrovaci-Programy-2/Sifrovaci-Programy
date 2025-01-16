cls
$celkem_heslel = 30 # zde editovat dle potreby

# generuje nekolik hesel pod sebou a ulozi je do textoveho souboru
# slouzi pak pro vlozeni po scriptu pro testovani hesel
# proste zjednoduseni aby se nemuselo nic zipovat
$pole=@(97,122,65,90,49,57) # znaky 0-9, a-z, A-Z jako v generatoru klicu, celkem 62 ruznych znaku muze obsahovat heslo
$d_pole=$pole.Length
$table=@()
for ( $aa = 0; $aa -le $d_pole -2; $aa++ ) {
$od = $pole[$aa]
$do = $pole[$aa+1]
for ( $bb = $od; $bb -le $do; $bb++ ) {
$z = [char] $bb
$table+=$z
}
$aa++
}
$table+="0"

$delka_table = $table.Length #62 znaku
$pole_hesla=@()
#$celkem_heslel = 10

for ($hesla=1; $hesla -le $celkem_heslel; $hesla++){
$heslo='"'
for ($aa = 0; $aa -le 125 ; $aa++) {
$rnd_num = Get-Random -Minimum 0 -Maximum 61
$x=$table[$rnd_num]
#echo "$aa  $x"
$heslo+=$x
}
$heslo+='"'

echo $heslo
#echo $heslo.Length
$pole_hesla+=$heslo
sleep 2
} # for $hesel

#$pole_hesla
echo ""
$pole_hesla.Length

# zapis hesel do souboru $filename
$filename="vlozit_hesla_do_testu.txt"
Remove-Item -Path $filename -Force -ErrorAction SilentlyContinue
sleep 1
Set-Content -Path $filename -Encoding ASCII -Value $pole_hesla
#Set-Content -Encoding ASCII -Value $table

echo "byl vytvoren soubor $filename obsah tohoto souboru vloz do souboru"
echo '"testovani_opakovani_znaku_v_heslech_5E.ps1" do promene $hesla_old'

sleep 10

