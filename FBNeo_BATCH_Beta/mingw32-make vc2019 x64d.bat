@echo off
cls

title %~dp0%~n0

::git fetch --all
::git reset --hard origin/master
::git pull



set sed="D:\Program Files\Git\usr\bin\sed.exe"
%sed% -i s/"#BUILD_A68K = 1"/"BUILD_A68K = 1"/g makefile
%sed% -i s/"BUILD_A68K = 1"/"BUILD_A68K = 1"/g makefile
%sed% -i s/"#BUILD_X86_ASM = 1"/"BUILD_X86_ASM = 1"/g makefile
%sed% -i s/"BUILD_X86_ASM = 1"/"#BUILD_X86_ASM = 1"/g makefile
%sed% -i s/"#BUILD_X64_EXE = 1"/"BUILD_X64_EXE = 1"/g makefile
%sed% -i s/"BUILD_X64_EXE = 1"/"BUILD_X64_EXE = 1"/g makefile
%sed% -i s/"#BUILD_VS_XP_TARGET = 1"/"BUILD_VS_XP_TARGET = 1"/g makefile
%sed% -i s/"BUILD_VS_XP_TARGET = 1"/"#BUILD_VS_XP_TARGET = 1"/g makefile
%sed% -i s/"#DEBUG	= 1"/"DEBUG	= 1"/g makefile
%sed% -i s/"DEBUG	= 1"/"DEBUG	= 1"/g makefile


call   "E:\EMU_SRC\compile_VS2019\SetPathall64.bat"
mingw32-make vc

echo=
echo Visual Studio 2019 Compile FB Alpha Ok!
echo=

pause