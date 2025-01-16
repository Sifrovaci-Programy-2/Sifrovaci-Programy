cls
# tohle to nak funguje jenom v editoru ?
Remove-Variable i ,ii -ErrorAction SilentlyContinue
$hesla_old=@(
"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"
)


function screenshot($path){
  $width = 0;
  $height = 0;
  $workingAreaX = 0;
  $workingAreaY = 0;

  $screen = [System.Windows.Forms.Screen]::AllScreens;

  foreach ($item in $screen)
  {
    if($workingAreaX -gt $item.WorkingArea.X)
    {
      $workingAreaX = $item.WorkingArea.X;
    }

    if($workingAreaY -gt $item.WorkingArea.Y)
    {
      $workingAreaY = $item.WorkingArea.Y;
    }

    $width = $width + $item.Bounds.Width;

    if($item.Bounds.Height -gt $height)
    {
      $height = $item.Bounds.Height;
    }
  }

  $bounds = [Drawing.Rectangle]::FromLTRB($workingAreaX, $workingAreaY, $width, $height);
  $bmp = New-Object Drawing.Bitmap $width, $height;
  $graphics = [Drawing.Graphics]::FromImage($bmp);

  $graphics.CopyFromScreen($bounds.Location, [Drawing.Point]::Empty, $bounds.size);

  $bmp.Save($path);

  $graphics.Dispose();
  $bmp.Dispose();
}

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

<#
$suma=0
if ( $x.Length -ne 0 ) {
foreach ( $item in $x ) {
[string] $qq = $item
#echo $qq
$suma += [int32] $qq.Substring(8,$qq.Length -9)
}
}
#>

# toto odsud opraveno 20.10.2024
# a dela to ze kdyz se neco opakuje vece nezli 1x tak ostatni stejne opakovani anuluje
$suma=0
if ( $x.Length -ne 0 ) {
foreach ( $item in $x ) {
#echo $item
[string] $qq = $item
#echo $qq"<"
$qqq = [int32] $qq.Substring(8,$qq.Length -9)
if ( $qqq -gt 2 ){
$qqq = 2
$suma += $qqq
}else{
$suma += [int32] $qq.Substring(8,$qq.Length -9)
}
# a az sem, tady to konci 20.10.2024

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

sleep 5

$dt="Screenshot-"
$dt += (get-date).ToString("dd_MM_yyyy_HH-mm-ss");
screenshot "$dt.jpg"
sleep 1

cls
} # for i


