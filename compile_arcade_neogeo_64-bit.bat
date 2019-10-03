@echo off
setlocal enabledelayedexpansion
set CONFIG_ARCHITECTURE=x64
call E:\EMU_SRC\compile_msys\msys64-32-2019-03-25\win32\env.bat
gcc --version | findstr "8.3.0"
if errorlevel 1 ( echo %date% %time% %~n0 compile build environment NO! >> 程序编译情况.txt ) else ( echo %date% %time% %~n0 compile build environment OK! >> 程序编译情况.txt )
echo %~n0...
title %~n0...
make SOURCES=src/mame/drivers/neogeo.cpp -j5 SUBTARGET=arcade OSD=winui PTR64=1 BUILDDIR=build_arcade_neogeo
cd %~dp0
if exist arcade64.exe (echo %date% %time% %~n0 OK! >> 程序编译情况.txt) else (echo %date% %time% %~n0 NO! >> 程序编译情况.txt)
ren arcade64.exe arcade64_neogeo.exe
xcopy /y /F arcade64_neogeo.exe %~dp0\ArcadeProgramFiles\ >> 程序编译情况.txt
::pause


::更改构建参数（比如sdl和native）必须添加：REGENIE=1 
::添加各种其他工具：TOOLS=1 
::切换编译核心数量：-j5 
::添加便携式SDL：OSD=sdl 
::添加Qt5：USE_QTDEBUG=1 
::api文档：doxygen
::单独编译pacman.cpp：make SOURCES=src/mame/drivers/pacman.cpp REGENIE=1
::更改build文件名称：BUILDDIR
::使用Microsoft Build Engine来构建构建解决方案：MSBUILD = 1
::显示完整命令VERBOSE=1
::OPTIMIZE设置优化级别。默认值为3，以提高性能为代价，但是会增加可执行文件的大小。设置为0以禁用优化（可以使调试更加容易），设置为1表示不进行空间/速度折衷并且对编译时间影响不大的基本优化，设置为2则 可以启用大多数优化来提高性能，减小大小，或 s仅启用通常不会增加可执行文件大小的优化。支持值的确切集合取决于您的编译器。
::TARGETOS=windows win32，unix，macosx
::SUBTARGET=mame, arcade, mess, tiny, etc
