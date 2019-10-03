@echo off
setlocal enabledelayedexpansion
set CONFIG_ARCHITECTURE=x86
call E:\EMU_SRC\compile_msys\msys32-2016-01-02\win32\env.bat
gcc --version | findstr "5.3.0"
if errorlevel 1 ( echo %date% %time% %~n0 compile build environment NO! >> 程序编译情况.txt ) else ( echo %date% %time% %~n0 compile build environment OK! >> 程序编译情况.txt )
echo %~n0...
title %~n0...
make SOURCES=src/mame/drivers/gb.cpp SOURCES=src/mame/drivers/gba.cpp SOURCES=src/mame/drivers/sms.cpp SOURCES=src/mame/drivers/megadriv.cpp SOURCES=src/mame/drivers/nes.cpp SOURCES=src/mame/drivers/nes_vt.cpp SOURCES=src/mame/drivers/ngp.cpp SOURCES=src/mame/drivers/pce.cpp SOURCES=src/mame/drivers/sg1000.cpp SOURCES=src/mame/drivers/snes.cpp SOURCES=src/mame/drivers/wswan.cpp SOURCES=src/mame/drivers/ss.cpp SOURCES=src/mame/drivers/ps.cpp SOURCES=src/mame/drivers/neogeocd.cpp SUBTARGET=mess OSD=winui PTR64=0 BUILDDIR=build_mess_mini
cd %~dp0
if exist arcade32.exe (echo %date% %time% %~n0 OK! >> 程序编译情况.txt) else (echo %date% %time% %~n0 NO! >> 程序编译情况.txt)
ren arcade32.exe arcade32_mess_mini.exe
xcopy /y /f arcade32_mess_mini.exe %~dp0\ArcadeProgramFiles\ >> 程序编译情况.txt
pause

