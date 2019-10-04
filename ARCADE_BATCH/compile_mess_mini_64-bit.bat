@echo off
::此脚本目前只需要设置下set msys=“”，找到msys里面的bat文件就可以了。带了“”可以带空格的
::里面的内容归我维护就好,如果你看得懂，可以自己改下。

setlocal enabledelayedexpansion
::脚本互转系统位数，该下面三个就可以了
set CONFIG_ARCHITECTURE=x64
set gccv="8.3.0"
set msys="E:\EMU_SRC\compile_msys\msys64-32-2019-03-25\win32\env.bat"
::set msys=E:\EMU_SRC\compile_msys\msys64-32-2019-03-25\win32\env.bat


set PTR64=0
echo %name% | findstr "64" && set PTR64=1
set name=%~n0
set arcade=arcade%CONFIG_ARCHITECTURE:~1,2%
set files=程序编译情况.txt


set arcadename=%arcade%_%name:~8,9%
set SUBTARGET=%name:~8,4%
set BUILDDIR=build_%name:~8,9%
set SOURCES=src\devices\sound\gb.cpp,src\mame\drivers\gb.cpp,src\mame\machine\gb.cpp,src\mame\drivers\gba.cpp,src\mame\drivers\sms.cpp,src\mame\machine\sms.cpp,src\mame\drivers\megadriv.cpp,src\mame\machine\megadriv.cpp,src\mame\drivers\nes.cpp,src\mame\machine\nes.cpp,src\mame\video\nes.cpp,src\mame\drivers\nes_vt.cpp,src\mame\drivers\ngp.cpp,src\mame\drivers\pce.cpp,src\mame\machine\pce.cpp,src\mame\drivers\sg1000.cpp,src\mame\drivers\snes.cpp,src\mame\machine\snes.cpp,src\mame\audio\wswan.cpp,src\mame\drivers\wswan.cpp,src\mame\machine\wswan.cpp,src\mame\video\wswan.cpp,src\mame\drivers\neogeocd.cpp,src\devices\cpu\saturn\saturn.cpp,src\mame\drivers\saturn.cpp,src\mame\machine\saturn.cpp,src\devices\cpu\psx\psx.cpp,src\devices\video\psx.cpp,src\mame\drivers\psx.cpp,src\mame\machine\psxcd.cpp,src\devices\cpu\psx\psxdasm.cpp,src\mame\drivers\neogeocd.cpp


call %msys%
gcc --version | findstr %gccv%
if errorlevel 1 ( echo %date% %time% %~n0 compile build environment NO! >> %files% ) else ( echo %date% %time% %~n0 compile build environment OK! >> %files% )
echo %~n0...
title %~n0...
make SOURCES=%SOURCES% SUBTARGET=%SUBTARGET% PTR64=%PTR64% BUILDDIR=%BUILDDIR% -j5 OSD=winui REGENIE=1
echo make SOURCES=%SOURCES% SUBTARGET=%SUBTARGET% PTR64=%PTR64% BUILDDIR=%BUILDDIR% -j5 OSD=winui REGENIE=1
cd %~dp0
if exist %arcade%.exe ( echo %date% %time% %~n0 compile programme OK! >> %files% ) else ( echo %date% %time% %~n0 compile programme NO! >> %files% )
ren %arcade%.exe %arcadename%.exe
if errorlevel 1 ( echo %date% %time% %~n0 Program Set Name NO! >> %files% ) else ( echo %date% %time% %~n0 Program Set Name OK! >> %files% )
xcopy /y /f %arcadename%.exe %~dp0\ArcadeProgramFiles\
if errorlevel 1 ( echo %date% %time% %~n0 Copy to ArcadeProgramFiles Folder NO! >> %files% ) else ( echo %date% %time% %~n0 Copy to ArcadeProgramFiles Folder OK! >> %files% )
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


