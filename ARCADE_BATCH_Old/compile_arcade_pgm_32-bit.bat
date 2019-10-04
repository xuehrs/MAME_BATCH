@echo off
setlocal enabledelayedexpansion
set CONFIG_ARCHITECTURE=x86
call E:\EMU_SRC\compile_msys\msys32-2016-01-02\win32\env.bat
gcc --version | findstr "5.3.0"
if errorlevel 1 ( echo %date% %time% %~n0 compile build environment NO! >> 程序编译情况.txt ) else ( echo %date% %time% %~n0 compile build environment OK! >> 程序编译情况.txt )
echo %~n0...
title %~n0...
make -j5 SOURCES=src\mame\drivers\pgm.cpp,src\mame\video\pgm.cpp SUBTARGET=arcade OSD=winui PTR64=0 REGENIE=1 BUILDDIR=build_arcade_pgm
cd %~dp0
if exist arcade32.exe (echo %date% %time% %~n0 OK! >> 程序编译情况.txt) else (echo %date% %time% %~n0 NO! >> 程序编译情况.txt)
ren arcade32.exe arcade32_pgm.exe
xcopy /y /f arcade32_pgm.exe %~dp0\ArcadeProgramFiles\ >> 程序编译情况.txt
pause
exit -1


::pgm

D:\BatScript\Robbbert\store1\docs\release\src\mame\drivers\pgm.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\pgm.cpp
D:\BatScript\Robbbert\store1\src\mame\video\pgm.cpp

