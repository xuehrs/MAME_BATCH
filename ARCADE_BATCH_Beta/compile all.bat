@echo off
title %~dp0
echo =======================================================================
echo 开始新的编译...
echo 时间：%date% %time%
echo =======================================================================
echo ===================================================== >> 程序编译情况.txt
echo 开始新的编译... >> 程序编译情况.txt
echo 时间：%date% %time% >> 程序编译情况.txt
call compile_arcade_32-bit.bat
cd %~dp0
call compile_arcade_64-bit.bat
cd %~dp0
call compile_mess_32-bit.bat
cd %~dp0
call compile_mess_64-bit.bat
cd %~dp0
start explorer %~dp0\ArcadeProgramFiles\
start notepad %~dp0程序编译情况.txt
echo.
echo 请按任意键退出. . . && pause > nul

