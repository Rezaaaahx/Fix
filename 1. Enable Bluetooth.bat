@echo off
set "fileURL=https://github.com/Rezaaaahx/Resources/releases/download/windows/DevManView.exe"
set "fileName=DevManView.exe"
mkdir "%SystemDrive%\NOVA\DevManView" >nul 2>&1
set "downloadsFolder=%SystemDrive%\NOVA\DevManView"
chcp 65001 >nul 2>&1

curl -s -L "%fileURL%" -o "%downloadsFolder%\%fileName%" >nul 2>&1

chcp 437 >nul 2>&1

timeout 2 >nul 2>&1

"%SystemDrive%\NOVA\DevManView\DevManView.exe" /enable "Generic Bluetooth Adapter" >nul 2>&1
"%SystemDrive%\NOVA\DevManView\DevManView.exe" /enable "Bluetooth" >nul 2>&1

timeout 2 >nul 2>&1

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\b06bdrv" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthA2dp" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthEnum" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthHFEnum" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthLEEnum" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthMini" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTHMODEM" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTHPORT" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTHUSB" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HidBth" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Microsoft_Bluetooth_AvrcpTransport" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RFCOMM" /v "Start" /t REG_DWORD /d 2 /f

sc config BTAGService start= auto >nul 2>&1
sc config bthserv start= auto >nul 2>&1
sc config BluetoothUserService_6f6a6 start= auto >nul 2>&1

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v "Value" /t REG_SZ /d "Allow" /f 
cls

echo If it doesn't work, install bluetooth drivers!

timeout 4 >nul 2>&1
