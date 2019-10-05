@echo off
setlocal enabledelayedexpansion
set CONFIG_ARCHITECTURE=x86
call E:\EMU_SRC\compile_msys\msys32-2016-01-02\win32\env.bat
gcc --version | findstr "5.3.0"
if errorlevel 1 ( echo %date% %time% %~n0 compile build environment NO! >> 程序编译情况.txt ) else ( echo %date% %time% %~n0 compile build environment OK! >> 程序编译情况.txt )
echo %~n0...
title %~n0...
make -j5 SOURCES=src/mame/drivers/neogeo.cpp,src\mame\video\neogeo.cpp SUBTARGET=arcade OSD=winui PTR64=0 REGENIE=1 BUILDDIR=build_arcade_neogeo
cd %~dp0
if exist arcade32.exe (echo %date% %time% %~n0 OK! >> 程序编译情况.txt) else (echo %date% %time% %~n0 NO! >> 程序编译情况.txt)
ren arcade32.exe arcade32_neogeo.exe
xcopy /y /f arcade32_neogeo.exe %~dp0\ArcadeProgramFiles\ >> 程序编译情况.txt
pause
exit -1


::neogeo

D:\BatScript\Robbbert\store1\docs\release\src\mame\drivers\neogeo.cpp
D:\BatScript\Robbbert\store1\docs\release\src\mame\video\neogeo.cpp

