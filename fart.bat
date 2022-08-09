@echo off
if %1==-f goto write
echo %3
fart_echo %1 %2 %3
goto :eof
:write
fart_to_file %2 %3 %4