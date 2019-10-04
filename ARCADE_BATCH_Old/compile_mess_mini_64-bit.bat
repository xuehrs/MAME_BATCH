@echo off
setlocal enabledelayedexpansion
set CONFIG_ARCHITECTURE=x64
call E:\EMU_SRC\compile_msys\msys64-32-2019-03-25\win32\env.bat
gcc --version | findstr "8.3.0"
if errorlevel 1 ( echo %date% %time% %~n0 compile build environment NO! >> 程序编译情况.txt ) else ( echo %date% %time% %~n0 compile build environment OK! >> 程序编译情况.txt )
echo %~n0...
title %~n0...
make -j5 SOURCES=src\devices\sound\gb.cpp,src\mame\drivers\gb.cpp,src\mame\machine\gb.cpp,src\mame\drivers\gba.cpp,src\mame\drivers\sms.cpp,src\mame\machine\sms.cpp,src\mame\drivers\megadriv.cpp,src\mame\machine\megadriv.cpp,src\mame\drivers\nes.cpp,src\mame\machine\nes.cpp,src\mame\video\nes.cpp,src\mame\drivers\nes_vt.cpp,src\mame\drivers\ngp.cpp,src\mame\drivers\pce.cpp,src\mame\machine\pce.cpp,src\mame\drivers\sg1000.cpp,src\mame\drivers\snes.cpp,src\mame\machine\snes.cpp,src\mame\audio\wswan.cpp,src\mame\drivers\wswan.cpp,src\mame\machine\wswan.cpp,src\mame\video\wswan.cpp,src\mame\drivers\neogeocd.cpp,src\devices\cpu\saturn\saturn.cpp,src\mame\drivers\saturn.cpp,src\mame\machine\saturn.cpp,src\devices\cpu\psx\psx.cpp,src\devices\video\psx.cpp,src\mame\drivers\psx.cpp,src\mame\machine\psxcd.cpp,src\devices\cpu\psx\psxdasm.cpp,src\mame\drivers\neogeocd.cpp SUBTARGET=mess OSD=winui PTR64=1 REGENIE=1 BUILDDIR=build_mess_mini
cd %~dp0
if exist arcade64.exe (echo %date% %time% %~n0 OK! >> 程序编译情况.txt) else (echo %date% %time% %~n0 NO! >> 程序编译情况.txt)
ren arcade64.exe arcade64_mess_mini.exe
xcopy /y /f arcade64_mess_mini.exe %~dp0\ArcadeProgramFiles\ >> 程序编译情况.txt
pause
exit -1


::gb gba sms megadriv nes nes_vt ngp pce sg1000 snes wswan ss ps neogeocd

D:\BatScript\Robbbert\store1\src\devices\sound\gb.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\gb.cpp
D:\BatScript\Robbbert\store1\src\mame\machine\gb.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\gba.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\sms.cpp
D:\BatScript\Robbbert\store1\src\mame\machine\sms.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\megadriv.cpp
D:\BatScript\Robbbert\store1\src\mame\machine\megadriv.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\nes.cpp
D:\BatScript\Robbbert\store1\src\mame\machine\nes.cpp
D:\BatScript\Robbbert\store1\src\mame\video\nes.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\nes_vt.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\ngp.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\pce.cpp
D:\BatScript\Robbbert\store1\src\mame\machine\pce.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\sg1000.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\snes.cpp
D:\BatScript\Robbbert\store1\src\mame\machine\snes.cpp
D:\BatScript\Robbbert\store1\src\mame\audio\wswan.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\wswan.cpp
D:\BatScript\Robbbert\store1\src\mame\machine\wswan.cpp
D:\BatScript\Robbbert\store1\src\mame\video\wswan.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\neogeocd.cpp
D:\BatScript\Robbbert\store1\src\devices\cpu\saturn\saturn.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\saturn.cpp
D:\BatScript\Robbbert\store1\src\mame\machine\saturn.cpp
D:\BatScript\Robbbert\store1\src\devices\cpu\psx\psx.cpp
D:\BatScript\Robbbert\store1\src\devices\video\psx.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\psx.cpp
D:\BatScript\Robbbert\store1\src\mame\machine\psxcd.cpp
D:\BatScript\Robbbert\store1\src\devices\cpu\psx\psxdasm.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\neogeocd.cpp


