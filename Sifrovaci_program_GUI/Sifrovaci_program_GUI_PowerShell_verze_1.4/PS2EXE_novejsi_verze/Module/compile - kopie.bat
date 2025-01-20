type compile.bat
pause

powershell_ise.exe ps2exe.ps1
pause


Invoke-ps2exe -inputFile ..\..\desifruj.ps1 -outputFile ..\..\desifruj.exe -x86 -STA -version 1.4 -title "desifruj.exe" -iconFile ..\..\icon.ico
Invoke-ps2exe -inputFile ..\..\zasifruj.ps1 -outputFile ..\..\zasifruj.exe -x86 -STA -version 1.4 -title "zasifruj.exe" -iconFile ..\..\icon.ico
Invoke-ps2exe -inputFile ..\..\generuj_klic.ps1 -outputFile ..\..\generuj_klic.exe -x86 -STA -version 1.4 -title "generuj_klic.exe"
Invoke-ps2exe -inputFile ..\..\new_folder.ps1 -outputFile ..\..\new_folder.exe -x86 -STA -version 1.4 -title "new_folder.exe"
Invoke-ps2exe -inputFile ..\..\sha1sum_all_zip_files_in_this_folder.ps1 -outputFile ..\..\sha1sum_all_zip_files_in_this_folder.exe -x86 -STA -version 1.4 -title "sha1sum_all_zip_files_in_this_folder.exe"
Invoke-ps2exe -inputFile ..\..\zobraz_tip.ps1 -outputFile ..\..\zobraz_tip.exe -x86 -STA -version 1.4 -title "zobraz_tip.exe"
Invoke-ps2exe -inputFile ..\..\doplnky\keys_view\keys_view.ps1 -outputFile ..\..\doplnky\keys_view\keys_view.exe  -x86 -STA -version 1.4 -title "keys_view.exe"











