@echo off
title %~dp0
echo =======================================================================
echo ��ʼ�µı���...
echo ʱ�䣺%date% %time%
echo =======================================================================
echo ===================================================== >> ����������.txt
echo ��ʼ�µı���... >> ����������.txt
echo ʱ�䣺%date% %time% >> ����������.txt
call compile_arcade_32-bit.bat
cd %~dp0
call compile_arcade_64-bit.bat
cd %~dp0
call compile_mess_32-bit.bat
cd %~dp0
call compile_mess_64-bit.bat
cd %~dp0
start explorer %~dp0\ArcadeProgramFiles\
start notepad %~dp0����������.txt
echo.
echo �밴������˳�. . . && pause > nul

