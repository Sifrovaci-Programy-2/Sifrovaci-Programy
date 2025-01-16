cls

# louskacek hesel 15 znaku, pouzito je 0-9, a-z, A-Z ( tzn. vsechny alfanumericky znaky ) a znaky se muzou libovolne opakovat
# udajne 15 znaku dlouhy nahodny heslo lze povazovat za bezpecny

# A=65, Z=90, a=97, z=122, 0=48, 1=49, 9=57
$pole_ascii=@(48,57,65,90)
$d_pole_ascii=$pole_ascii.Length

# definuje $pole_znaky
$pole_znaky=@()
for ( $aa = 0; $aa -le $d_pole_ascii -2; $aa++ ) {
$od = $pole_ascii[$aa]
$do = $pole_ascii[$aa+1]
for ( $bb = $od; $bb -le $do; $bb++ ) {
$znak = [char] $bb
$pole_znaky+=$znak
}
$aa++
}

# konec definice $pole_znaky a 15 vnorenejch cyklu a v prostredku je echo
# ale muze tam bej misto echa cokoliv jineho, samozdrejme
$pocitadlo=1
$d_pole_znaky = $pole_znaky.Length-1 

for ( $z1=0; $z1 -le $d_pole_znaky; $z1++ ){
for ( $z2=0; $z2 -le $d_pole_znaky; $z2++ ){
for ( $z3=0; $z3 -le $d_pole_znaky; $z3++ ){
for ( $z4=0; $z4 -le $d_pole_znaky; $z4++ ){
for ( $z5=0; $z5 -le $d_pole_znaky; $z5++ ){

for ( $z6=0; $z6 -le $d_pole_znaky; $z6++ ){
for ( $z7=0; $z7 -le $d_pole_znaky; $z7++ ){
for ( $z8=0; $z8 -le $d_pole_znaky; $z8++ ){
for ( $z9=0; $z9 -le $d_pole_znaky; $z9++ ){
for ( $z10=0; $z10 -le $d_pole_znaky; $z10++){

for ( $z11=0; $z11 -le $d_pole_znaky; $z11++ ){
for ( $z12=0; $z12 -le $d_pole_znaky; $z12++ ){
for ( $z13=0; $z13 -le $d_pole_znaky; $z13++ ){
for ( $z14=0; $z14 -le $d_pole_znaky; $z14++ ){
for ( $z15=0; $z15 -le $d_pole_znaky; $z15++ ){

$out=""
$out+=[string] $pocitadlo
$out+=" - "
$out+=$pole_znaky[$z1]
$out+=$pole_znaky[$z2]
$out+=$pole_znaky[$z3]
$out+=$pole_znaky[$z4]
$out+=$pole_znaky[$z5]

$out+=$pole_znaky[$z6]
$out+=$pole_znaky[$z7]
$out+=$pole_znaky[$z8]
$out+=$pole_znaky[$z9]
$out+=$pole_znaky[$z10]

$out+=$pole_znaky[$z11]
$out+=$pole_znaky[$z12]
$out+=$pole_znaky[$z13]
$out+=$pole_znaky[$z14]
$out+=$pole_znaky[$z15]

echo $out
$pocitadlo++

}}}}} }}}}} }}}}}

$pocitadlo--
echo $pocitadlo

sleep 20

# presmerovani vystupu do souboru prikazem - .\louskacek_hesla_15_znaku_1.ps1 > R:\output.txt
# ale bude to trvat x hodin a doporucuje se zapisovat na ramdisk, v mym pripade tedy jednotka R:\

