@echo off
set var=%1
echo compiling file
g++ .\%1
if errorlevel 1 goto :eof
echo compiled succesfully
if [%2] == [] goto manualinp
.\a.exe < %2 > ./%var:~0,-4%.out
goto :here
:manualinp
.\a.exe 
:here
pause
del .\a.exe
