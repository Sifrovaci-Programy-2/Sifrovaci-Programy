cls
[string] $scriptName = pwd
$scriptName += "\"
$scriptName += $MyInvocation.MyCommand.Name
$host.UI.RawUI.WindowTitle = $scriptName

<#

slouzi jenom pro kontrolu jestli spravne sedi konce roku kde byl trochu problem
hesla se negenerujou zadni tzn. rychla kontrola jenom


PS C:\Users\DELL\Documents\ps1> .\vsechny_roky_test.ps1 0 1 2 3 4 5 6 7 8 9 10
toto zadat do konzole
0 je letosek do ted do konce roku , 1 je pristi rok cely atd.
rok 2023 bude "letosek" 0 atd.

#>

$rok_ted = (get-date).Year
$rok_ted = [string] $rok_ted
#echo $rok_ted
# echo $rok_ted.GetType()
#exit
foreach ($r in $args){
$rok = (get-date).Year + $r
$rok = [string] $rok
#echo $rok
#echo $rok.GetType()

if ($rok_ted -clike $rok){
#echo "letosek"
$zacatek_rok = (get-date)
$ted = [datetime] $zacatek_rok

$konec_rok = "12/31/"
$konec_rok += (get-date).Year
$konec_rok += " 00:00"
$end_date = [datetime] $konec_rok

#echo $end_date
}else{
#echo "na pres rok"

$zacatek_rok = "01/01/"
$zacatek_rok += $rok
$zacatek_rok += " 00:00"
# V LUA - stamp_od_kdy = os.time{hour = 00, minute = 00, day = 01, month = 01, year = 2023} 

$konec_rok = "12/31/"
$konec_rok += $rok
$konec_rok += " 00:00"
# V LUA stamp_do_kdy = os.time{hour = 00, minute = 00, day = 31, month = 12, year = 2023} tam proble ale nejni ?
$end_date = [datetime] $konec_rok
}#echo $zacatek_rok$ted = [datetime] $zacatek_rokecho $konec_rok" <  zacatek ( prehozenej mesic a den ) " # pro kontrolu staci$end_date = [datetime] $konec_rok
#echo $end_date" < datum konec"
#                       mm/dd/yyyy HH:MM
$rozdil_vterin = New-TimeSpan -Start $zacatek_rok -End $end_date#echo $rozdil_vterin# 31536000 vterin normalni rok, 31622400 vterin prestupnej rok 2024,2026 atd. ( 86400 rozdil vterin )$max = [int32] $rozdil_vterin.TotalSeconds # < $max# pridan den ve vterinach jinak koncilo vzdy v 30_12_yyyy-23_59 misto 31_12_yyyy-23_59 <<<<$max = $max + 86400 # bylo o den min ?  asi zase problem z letni a zimnim casem ?? <<<<<<<<echo $max" < vterin celkem"#echo "----"
# main loop
for ($sec = 1; $sec -le $max ; $sec=$sec + 60){ # + 60 je krok po minute
$cas_plus = $ted.AddSeconds(+$sec)
$cas_out = "{0:dd_MM_yyyy-HH_mm}" -f $cas_plus # <<< dobra funce ( string format )

<#
# heslo
$celkem_znaku_heslo = Get-Random -Minimum $min_znaku_heslo -Maximum $max_znaku_heslo
[string] $pass = ""
for ($bb = 1; $bb -le $celkem_znaku_heslo; $bb ++){
$rnd = Get-Random -Minimum 0 -Maximum $delka_table
$pass += $table[$rnd]
}
#>
#echo $cas_out
#echo $pass
}
echo $cas_out" < cas ktery bude po pruchodu smyckou ( kontrola posledni heslo v roce)"
echo $pass
ECHO "------------------"

<# 
.\vsechny_roky_2_test.ps1 1 1 da se generovat stejnej rok z ruznejma heslama
.\vsechny_roky_2_test.ps1 1 > r:\2023_A.txt
.\vsechny_roky_2_test.ps1 1 > r:\2023_B.txt
#>
}

