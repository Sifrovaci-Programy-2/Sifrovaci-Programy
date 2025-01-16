cls

# Base 36 vypis znaku

# definuje pole
# A=65, Z=90, a=97, z=122, 0=48, 1=49, 9=57
$pole_ascii=@(48,57,65,90) # 00-ZZ - Base 32
#$pole_ascii=@(48,57,97,122,65,90) # 00-ZZ Base 62
$d_pole_ascii=$pole_ascii.Length

$pole_output=@()

$pole=@()
for ( $cc = 0; $cc -le $d_pole_ascii -2; $cc++ ) {
$od = $pole_ascii[$cc]
$do = $pole_ascii[$cc+1]
for ( $dd = $od; $dd -le $do; $dd++ ) {
$znk = [char] $dd
$pole+=$znk
}
$cc++
}

$d_pole = $pole.Length
echo "Base $d_pole"
sleep 3

$poc_1 = 0
for ($i = 0; $i -le 1295; $i++ ){ # 00-ZZ - 1296
$poc_2 = 0
for ( $aa = 0; $aa -le $d_pole -1; $aa++) {
for ( $bb = 0; $bb -le $d_pole -1; $bb++) {
$poc_2++
if ( $i -eq $poc_2 -1 ) {
$x1=$aa
$x2=$bb
}
}
}

$dvojice=$pole[$x1]
$dvojice+=$pole[$x2]

$out_1 = [string] $poc_1
$out_1 += " "
$out_1 += $dvojice
echo $out_1
$pole_output += $out_1
$poc_1++
}

sleep 1
Set-Content -Path "R:\Base_36.txt" -Encoding ASCII -Value $pole_output

sleep 5


