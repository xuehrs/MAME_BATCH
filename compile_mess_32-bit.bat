@echo off
setlocal enabledelayedexpansion
set CONFIG_ARCHITECTURE=x86
call E:\EMU_SRC\compile_msys\msys32-2016-01-02\win32\env.bat
gcc --version | findstr "5.3.0"
if errorlevel 1 ( echo %date% %time% %~n0 compile build environment NO! >> ����������.txt ) else ( echo %date% %time% %~n0 compile build environment OK! >> ����������.txt )
echo %~n0...
title %~n0...
make -j5 SUBTARGET=mess OSD=winui PTR64=0 BUILDDIR=build_mess
cd %~dp0
if exist arcade32.exe (echo %date% %time% %~n0 OK! >> ����������.txt) else (echo %date% %time% %~n0 NO! >> ����������.txt)
ren arcade32.exe arcade32_mess.exe
xcopy /y /F arcade32_mess.exe %~dp0\ArcadeProgramFiles\ >> ����������.txt
::pause

