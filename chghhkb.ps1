Stop-Process -Name "AutohotkeyU64"

Start-Sleep -s 1

. "C:\Program Files\AutoHotkey\AutoHotkeyU64.exe" ./MyScript.ahk

Start-Sleep -m 300

. "C:\Program Files\AutoHotkey\AutoHotkeyU64.exe" ./jp2usKeylayout.ahk
