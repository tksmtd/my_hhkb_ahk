Stop-Process -Name "Autohotkey"

Start-Sleep -s 1

. "C:\Program Files\AutoHotkey\AutoHotkey.exe" ./MyScript.ahk

Start-Sleep -m 300

. "C:\Program Files\AutoHotkey\AutoHotkey.exe" ./jp2usKeylayout.ahk
