cls

$delka_args = $args.length
#echo "celkem args $delka_args"
 
if ($delka_args -clike 0) {
#echo "zadny argument"
echo "vsechny_roky.exe 0"
sleep 5
Exit
}

[string] $scriptName = pwd
$scriptName += "\"
$scriptName += $MyInvocation.MyCommand.Name
$host.UI.RawUI.WindowTitle = $scriptName

<#
.\vsechny_roky.ps1 0 1 2 3 4
.\vsechny_roky.ps1 0 > ../email_kody_2022.txt
.\vsechny_roky.ps1 1 > ../email_kody_2023.txt
atd.
0 je letosek do ted do konce roku , 1 je pristi rok cely atd.
#>

$table = @("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
"1","2","3","4","5","6","7","8","9","0")
$delka_table = $table.Length

$min_znaku_heslo = 120 # minimalni delka hesla
$max_znaku_heslo = 127 # maximalni delka hesla (rar max. 127 delka hesla)

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

# otevre stream pro zapis vystupu do souboru (bez nutnosti presmerovani vystupu > )
$output_file="email_kody_"
$output_file+=$rok
$output_file+=".txt"
$stream = [System.IO.StreamWriter]::new($output_file)

if ($rok_ted -clike $rok){
#echo "letosek"
$zacatek_rok = (get-date)
$ted = [datetime] $zacatek_rok

$konec_rok = "12/31/"
$konec_rok += (get-date).Year
$konec_rok += " 00:00"
$end_date = [datetime] $konec_rok

}else{
#echo "na pres rok"

$zacatek_rok = "01/01/"
$zacatek_rok += $rok
$zacatek_rok += " 00:00"

$konec_rok = "12/31/"
$konec_rok += $rok
$konec_rok += " 00:00"
$end_date = [datetime] $konec_rok
}#echo $zacatek_rok$ted = [datetime] $zacatek_rok#echo $konec_rok$end_date = [datetime] $konec_rok
#echo $end_date" < datum konec"
#                       mm/dd/yyyy HH:MM
$rozdil_vterin = New-TimeSpan -Start $zacatek_rok -End $end_date#echo $rozdil_vterin$max = [int32] $rozdil_vterin.TotalSeconds # < $max$max = $max + 86400 # bylo o den min ?#echo $max#echo "----"
# main loop
for ($sec = 1; $sec -le $max ; $sec=$sec + 60){ # + 60 je krok po minute
$cas_plus = $ted.AddSeconds(+$sec)
$cas_out = "{0:dd_MM_yyyy-HH_mm}" -f $cas_plus # <<< dobra funce ( string format )

# heslo
$celkem_znaku_heslo = Get-Random -Minimum $min_znaku_heslo -Maximum $max_znaku_heslo
[string] $pass = ""
for ($bb = 1; $bb -le $celkem_znaku_heslo; $bb ++){
$rnd = Get-Random -Minimum 0 -Maximum $delka_table
$pass += $table[$rnd]
}
#echo $cas_out
$stream.WriteLine("$cas_out")
#echo $pass
$stream.WriteLine("$pass")
}
}

$stream.close()

