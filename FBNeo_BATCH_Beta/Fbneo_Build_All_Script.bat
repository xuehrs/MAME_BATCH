::设置默认不显示输入命令行模式
@echo off

::指定该脚本正常运行情况报告内容写入“程序编译情况.txt”
set files=程序编译情况.txt

::清除无关显示的任意字符
cls

::显示在命令行文件窗口显示脚本运行环境（它会显示脚本路径和名称，方便查报错）
title %~dp0%~n0

::告诉你脚本是干什么的，然后按需求判断执行。
:choice
echo ======================================================================
echo 这是用来编译Fbneo所有脚本的总开关，方便以后一键批处理自动化编译。
echo.
echo 请根据需求执行相关内容(执行以下脚本请使用小写字母)
echo.
echo.
echo 输入 [Y]继续执行 / [N]我误点了，我想退出当前脚本 / [E]进行编译环境检测并且返回报告
echo.
set /P yesno=请根据需求输入相关命令并且回车:

::继续执行下个步骤
if /i "%yesno%"=="y" goto :aaa
::进行编译环境检测并且返回报告
if /i "%yesno%"=="e" goto :Environment
::我误点了，我想退出当前脚本
if /i "%yesno%"=="n" goto :Quit

:Environment
::清除无关显示的任意字符
cls

if not exist makefile echo 你的电脑没有下载FBN源码,按任意键带你去GIT_FBNEO源码仓库 && pause > nul && start iexplore https://github.com/libretro/FBNeo
echo 正在判断批处理所在的路径有没有下载FBN源码...
type makefile | find "FB Neo"
if errorlevel 1 ( echo %date% %time% 批处理所在的路径没有FBN源码！>> %files% ) else ( echo %date% %time% 批处理所在的路径已经拥有FBN源码！>> %files% )

echo 正在判断你的电脑是否已经安装git...
git --version | findstr "windows"
if errorlevel 1 ( echo %date% %time% 你的电脑没有安装git！>> %files% ) else ( echo %date% %time% 你的电脑已经安装git！>> %files% )

set sed="D:\Program Files\Git\usr\bin\sed.exe"
if not exist %sed% echo 你电脑没有sed工具，请搜索sed所在路径并且修改为sed工具所在的正确路径。
echo 正在判断你的电脑是否已经安装sed...
%sed% --version | findstr "GNU sed"
if errorlevel 1 ( echo %date% %time% 你的电脑没有安装sed！>> %files% ) else ( echo %date% %time% 你的电脑已经安装sed！>> %files% )

set vs2019="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat"
if not exist %vs2019% echo 你电脑没有安装vs2019，请搜索vs2019所在路径并且修改为vs2019工具所在的正确路径。
echo 正在判断你的电脑是否已经安装vs2019...
@call %vs2019% x64 | findstr "Visual Studio 2019"
if errorlevel 1 ( echo %date% %time% 你的电脑没有安装vs2019！>> %files% ) else ( echo %date% %time% 你的电脑已经安装vs2019！>> %files% )

set dxsdk="C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Utilities\bin\Dx_Setenv.cmd"
if not exist %dxsdk% echo 你电脑没有安装dxsdk，请搜索dxsdk所在路径并且修改为dxsdk工具所在的正确路径。
::echo 正在判断你的电脑是否已经安装dxsdk...
::@call %dxsdk% x64 | findstr "Dx x64"
::if errorlevel 1 ( echo %date% %time% 你的电脑没有安装dxsdk！>> %files% ) else ( echo %date% %time% 你的电脑已经安装dxsdk！>> %files% )

@path=%~dp0\mingw345\bin;%~dp0\Perl64\bin;%~dp0\nasm64;%PATH%

pause
goto :eof






:Quit
echo existing ..
pause
exit









::这里用来做判断，通过接收你输入的需求来实行相关命令
:Choose

echo 请输入 [Y]继续编译 / [N]退出当前脚本 / [M]进入自我嘲讽模式 / [O]进入此脚本的作者GIT仓库嘲讽作者 / [P]迷路中... / [Q]想寻找ARCADE编译指南吗？，并回车！


set /p yesno=
if /i "%yesno%" == "y" goto :begin
if /i "%yesno%" == "n" goto :begin1
if /i "%yesno%" == "m" goto :begin2
if /i "%yesno%" == "o" goto :begin3
if /i "%yesno%" == "p" call :begin4
if /i "%yesno%" == "q" goto :begin5
goto end



:begin1
echo 你确定继续吗？，[*]任意键或回车键继续 / [n]返回上个命令，并回车！
set /p yesno=
if /i "%yesno%" == "n" cls && goto :Choose
echo 你是一个守规则的人，再见！我的陌生人！ && pause > nul && exit

:begin2
echo 你确定继续吗？，[*]任意键或回车键继续 / [n]返回上个命令，并回车！
set /p yesno=
if /i "%yesno%" == "n" cls && goto :Choose
echo 我觉得这世界上比我帅的人不多了！ && pause > nul && exit




@echo off

rem this is to for user to choose
:choice
echo ################################################
echo ##this is a choice example
echo ##choose:
echo ##      A=choose A
echo ##      B=choose B
echo ##      C=choose C
echo ##      D=choose D
echo ##      q=exit:
echo ##
echo ################################################
rem check the choice info 
set /P yesno=pls choose your yesno:
if /i "%yesno%"=="A" goto yesnoA
if /i "%yesno%"=="B" goto yesnoB
if /i "%yesno%"=="C" goto yesnoC
if /i "%yesno%"=="D" goto yesnoD
if /i "%yesno%"=="q" goto Quit

:yesnoA
echo your choosed A
goto choice

:yesnoB
echo your choosed B
goto choice

:yesnoC
echo your choosed C
goto choice

:yesnoD
echo your choosed D
goto choice

:Quit
echo existing ..
pause
exit




echo 
call "D:\BatScript\finalburnneo\FBNeo\git_update_mini.bat"

@echo off
title %~dp0
echo =======================================================================
echo 开始新的编译...
echo 时间：%date% %time%
echo =======================================================================
echo ===================================================== >> 程序编译情况.txt
echo 开始新的编译... >> 程序编译情况.txt
echo 时间：%date% %time% >> 程序编译情况.txt
call compile_arcade_32-bit.bat
cd %~dp0
call compile_arcade_64-bit.bat
cd %~dp0
call compile_mess_32-bit.bat
cd %~dp0
call compile_mess_64-bit.bat
cd %~dp0
start explorer %~dp0\ArcadeProgramFiles\
start notepad %~dp0程序编译情况.txt
echo.
echo 请按任意键退出. . . && pause > nul




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
%sed% -i s/"DEBUG	= 1"/"#DEBUG	= 1"/g makefile


call   "E:\EMU_SRC\compile_VS2019\SetPathall64.bat"
mingw32-make vc

echo=
echo Visual Studio 2019 Compile FB Alpha Ok!
echo=

pause