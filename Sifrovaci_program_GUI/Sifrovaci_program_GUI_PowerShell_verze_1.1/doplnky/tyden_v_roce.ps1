cls
# zobrazuje cislo tydne v roce
function Get-ExtendedDate {
$ted = Get-Date
Add-Member -MemberType ScriptMethod -Name GetWeekOfYear -Value {Get-Date -UFormat %V} -InputObject $ted
return $ted
}

$pom = Get-ExtendedDate
echo $pom
#echo $ted
$den_v_roce = $pom.DayOfYear
echo "je $den_v_roce den v roce"

# cislo tydne 
$tyden_v_roce = $pom.GetWeekOfYear()
echo "cislo tydne je $tyden_v_roce"

sleep 10

