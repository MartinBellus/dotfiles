@echo off
call fart_echo %1 %2 %3 > temp.txt
type temp.txt > %3
del temp.txt