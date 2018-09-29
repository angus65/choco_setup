@echo off
REM ********************************************************
REM    This script must be executed from an 
REM    Administrative Command Prompt
REM ********************************************************

SET DIR=%~dp0%

%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "((new-object net.webclient).DownloadFile('https://chocolatey.org/install.ps1','install.ps1'))"
%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& '%DIR%install.ps1' %*"
SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin


call RefreshEnv

choco install --execution-timeout=10800 -y %DIR%packages_2.config

echo.
echo.
echo "You should probably reboot to ensure that any environment variables are properly accessible by the installed software."
echo.
pause
