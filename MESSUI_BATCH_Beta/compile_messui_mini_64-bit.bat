@echo off
::此脚本目前只需要设置下set msys=“”，找到msys里面的bat文件就可以了。带了“”可以带空格的
::里面的内容归我维护就好,如果你看得懂，可以自己改下。

setlocal enabledelayedexpansion
::脚本互转系统位数，改下面三个参数就可以了
set CONFIG_ARCHITECTURE=x64
set gccv="8.3.0"
set msys="E:\EMU_SRC\compile_msys\msys64-32-2019-03-25\win32\env.bat"



::======我是华丽的分割线===============================================================================

::MAKE相关编译参数
::-j后面表示使用多少核心编译，使用%j%调用。
set j=-j5

::自动判断批处理脚本文件名称，判断PTR64应该设置0还是1
set name=%~n0
echo %name% | findstr "64" && set PTR64=1

::指定核心目标(TARGET)：mame，ldplayer
::指定子目标(SUBTARGET)：mame、arcade、mess、tiny等
::生成脚本将从scripts/target/$(TARGET)/$(SUBTARGET).lua开始编译
set SUBTARGET=mess

::指定osd层：windows、sdl等
::生成脚本将从scripts/src/osd/$(OSD).lua开始编译
set OSD=messui

::指定BUILD生成路径，在make编译时，将预编译的文件改为你想指定的路径（防止使用不同gcc造成编译异常）
set BUILDDIR=build_messui

::更改构建参数（比如sdl和native）必须添加。添加了这个参数，只是编译了不到300个文件。
set REGENIE=1

::精简必备，添加这个参数表示我只想单独编译某某cpp驱动，最好要把声音，视频、处理器等驱动加进来
set SOURCES=src\devices\sound\gb.cpp,src\mame\drivers\gb.cpp,src\mame\machine\gb.cpp,src\mame\drivers\gba.cpp,src\mame\drivers\sms.cpp,src\mame\machine\sms.cpp,src\mame\drivers\megadriv.cpp,src\mame\machine\megadriv.cpp,src\mame\drivers\nes.cpp,src\mame\machine\nes.cpp,src\mame\video\nes.cpp,src\mame\drivers\nes_vt.cpp,src\mame\drivers\ngp.cpp,src\mame\drivers\pce.cpp,src\mame\machine\pce.cpp,src\mame\drivers\sg1000.cpp,src\mame\drivers\snes.cpp,src\mame\machine\snes.cpp,src\mame\audio\wswan.cpp,src\mame\drivers\wswan.cpp,src\mame\machine\wswan.cpp,src\mame\video\wswan.cpp,src\mame\drivers\neogeocd.cpp,src\devices\cpu\saturn\saturn.cpp,src\mame\drivers\saturn.cpp,src\mame\machine\saturn.cpp,src\devices\cpu\psx\psx.cpp,src\devices\video\psx.cpp,src\mame\drivers\psx.cpp,src\mame\machine\psxcd.cpp,src\devices\cpu\psx\psxdasm.cpp,src\mame\drivers\neogeocd.cpp

::原来的标准编译参数为，用来做参考。可以按照下面代码给上面set设置的参数修正下。
::make -j5 PTR64=0 SUBTARGET=mess OSD=messui BUILDDIR=build_messui

::======我是华丽的分割线===============================================================================

::测试区域



echo 你看看编译脚本是否命令正常显示，如果不正常，你修改相关参数。
echo make SOURCES=%SOURCES% SUBTARGET=%SUBTARGET% PTR64=%PTR64% BUILDDIR=%BUILDDIR% %j% OSD=%OSD% REGENIE=%REGENIE%
echo.

echo 正在强制退出调用此脚本的主进程,如果你发现make没有问题，并且请注释改测试区域相关代码
echo 按任意键退出 && pause > nul && exit



::======我是华丽的分割线===============================================================================

::你必须知道make之后生成的exe是什么名称
::设置此编译生成程序默认exe名称
set mame=messui

::修改默认生成exe程序的名称为
set mamename=messui_mini

::指定该脚本正常运行情况报告内容写入“程序编译情况.txt”
set files=程序编译情况.txt


::======我是华丽的分割线===============================================================================
::正式运行此脚本

::命令菜单窗口显示日期、时间、批处理所在的路径和批处理文件名称 
title %date% %time% %~dp0 %~n0...

::临时添加编译环境
call %msys%
::判断已经添加的编译环境是否符合编译需求，并把它写入“程序编译情况.txt“txt文本中。
gcc --version | findstr %gccv%
if errorlevel 1 ( echo %date% %time% %~n0 compile build environment NO! >> %files% ) else ( echo %date% %time% %~n0 compile build environment OK! >> %files% )

::开始编译
make SOURCES=%SOURCES% SUBTARGET=%SUBTARGET% PTR64=%PTR64% BUILDDIR=%BUILDDIR% -j5 OSD=winui REGENIE=1

::防止MAKE完毕后，不在当前目录操作。必须重新进入脚本所在的文件目录，方便以后对exe文件进行，备份、重命名、打包等操作。
cd %~dp0

::判断脚本编译好的的程序是否已经生成，并把它写入“程序编译情况.txt“txt文本中。
if exist %mame%.exe ( echo %date% %time% %~n0 compile %mame%.exe OK! >> %files% ) else ( echo %date% %time% %~n0 compile %mame%.exe NO! >> %files% )

::将生成的exe文件重命名标准的exe名称，方便以后查找，并把它写入“程序编译情况.txt“txt文本中。
ren %mame%.exe %mamename%.exe
if errorlevel 1 ( echo %date% %time% %~n0 %mame%.exe Program Set Name NO! >> %files% ) else ( echo %date% %time% %~n0 %mame%.exe Program Set Name OK! >> %files% )

::备份下已经重命名的exe文件到当前目录所在的文件夹ArcadeProgramFiles\，防止不小心丢失，并把它的运行情况写入“程序编译情况.txt“txt文本中。
xcopy /y /f %mamename%.exe %~dp0\ArcadeProgramFiles\
if errorlevel 1 ( echo %date% %time% %~n0 Copy %mamename%.exe to ArcadeProgramFiles Folder NO! >> %files% ) else ( echo %date% %time% %~n0 Copy %mamename%.exe to ArcadeProgramFiles Folder OK! >> %files% )

::修改暂停时候，通知消息“请按任意键继续”为“请按任意键退出”
echo.
echo 请按任意键退出. . . && pause > nul

::用来给调用的的脚本报告命令是否正常，不会强制退出调用此脚本的主进程。并且返回110参数给父进程。
exit /b 110



::精简的家用机cpp
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


