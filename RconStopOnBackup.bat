cd /d %~dp0
call RconSetting.bat
powershell -ExecutionPolicy Bypass -Command ".\RconStopOnBackup.ps1 -ServerFileName %serverJar%"