@echo off
set "fileURL=https://github.com/Rezaaaahx/Resources/releases/download/windows/DevManView.exe"
set "fileName=DevManView.exe"
mkdir "%SystemDrive%\NOVA\DevManView" >nul 2>&1
set "downloadsFolder=%SystemDrive%\NOVA\DevManView"
chcp 65001 >nul 2>&1

curl -s -L "%fileURL%" -o "%downloadsFolder%\%fileName%" >nul 2>&1

chcp 437 >nul 2>&1

timeout 2 >nul 2>&1

"%SystemDrive%\NOVA\DevManView\DevManView.exe" /enable "Microsoft Print to PDF" >nul 2>&1
"%SystemDrive%\NOVA\DevManView\DevManView.exe" /enable "Root Print Queue" >nul 2>&1

timeout 2 >nul 2>&1

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\usbprint" /v Start /t REG_DWORD /d 2 /f

schtasks /Change /TN "Microsoft\Windows\Printing\EduPrintProv" /Enable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Printing\PrinterCleanupTask" /Enable >nul 2>&1

sc config Spooler start= auto >nul 2>&1
sc config PrintWorkflowUserSvc_dc2a4 start= auto >nul 2>&1
sc config PrintNotify start= auto >nul 2>&1
sc config PrintWorkflow start= auto >nul 2>&1

