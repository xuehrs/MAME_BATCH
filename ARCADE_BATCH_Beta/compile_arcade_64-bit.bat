@echo off
setlocal enabledelayedexpansion
set CONFIG_ARCHITECTURE=x64
call E:\EMU_SRC\compile_msys\msys64-32-2019-03-25\win32\env.bat
gcc --version | findstr "8.3.0"
if errorlevel 1 ( echo %date% %time% %~n0 compile build environment NO! >> 程序编译情况.txt ) else ( echo %date% %time% %~n0 compile build environment OK! >> 程序编译情况.txt )
echo %~n0...
title %~n0...
make -j5 SUBTARGET=arcade OSD=winui PTR64=1 BUILDDIR=build_arcade
cd %~dp0
if exist arcade64.exe (echo %date% %time% %~n0 OK! >> 程序编译情况.txt) else (echo %date% %time% %~n0 NO! >> 程序编译情况.txt)

xcopy /y /f arcade64.exe %~dp0\ArcadeProgramFiles\ >> 程序编译情况.txt
::pause
