::����Ĭ�ϲ���ʾ����������ģʽ
@echo off

::ָ���ýű��������������������д�롰����������.txt��
set files=����������.txt

::����޹���ʾ�������ַ�
cls

::��ʾ���������ļ�������ʾ�ű����л�����������ʾ�ű�·�������ƣ�����鱨��
title %~dp0%~n0

::������ű��Ǹ�ʲô�ģ�Ȼ�������ж�ִ�С�
:choice
echo ======================================================================
echo ������������Fbneo���нű����ܿ��أ������Ժ�һ���������Զ������롣
echo.
echo ���������ִ���������(ִ�����½ű���ʹ��Сд��ĸ)
echo.
echo.
echo ���� [Y]����ִ�� / [N]������ˣ������˳���ǰ�ű� / [E]���б��뻷����Ⲣ�ҷ��ر���
echo.
set /P yesno=��������������������һس�:

::����ִ���¸�����
if /i "%yesno%"=="y" goto :aaa
::���б��뻷����Ⲣ�ҷ��ر���
if /i "%yesno%"=="e" goto :Environment
::������ˣ������˳���ǰ�ű�
if /i "%yesno%"=="n" goto :Quit

:Environment
::����޹���ʾ�������ַ�
cls

if not exist makefile echo ��ĵ���û������FBNԴ��,�����������ȥGIT_FBNEOԴ��ֿ� && pause > nul && start iexplore https://github.com/libretro/FBNeo
echo �����ж����������ڵ�·����û������FBNԴ��...
type makefile | find "FB Neo"
if errorlevel 1 ( echo %date% %time% ���������ڵ�·��û��FBNԴ�룡>> %files% ) else ( echo %date% %time% ���������ڵ�·���Ѿ�ӵ��FBNԴ�룡>> %files% )

echo �����ж���ĵ����Ƿ��Ѿ���װgit...
git --version | findstr "windows"
if errorlevel 1 ( echo %date% %time% ��ĵ���û�а�װgit��>> %files% ) else ( echo %date% %time% ��ĵ����Ѿ���װgit��>> %files% )

set sed="D:\Program Files\Git\usr\bin\sed.exe"
if not exist %sed% echo �����û��sed���ߣ�������sed����·�������޸�Ϊsed�������ڵ���ȷ·����
echo �����ж���ĵ����Ƿ��Ѿ���װsed...
%sed% --version | findstr "GNU sed"
if errorlevel 1 ( echo %date% %time% ��ĵ���û�а�װsed��>> %files% ) else ( echo %date% %time% ��ĵ����Ѿ���װsed��>> %files% )

set vs2019="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat"
if not exist %vs2019% echo �����û�а�װvs2019��������vs2019����·�������޸�Ϊvs2019�������ڵ���ȷ·����
echo �����ж���ĵ����Ƿ��Ѿ���װvs2019...
@call %vs2019% x64 | findstr "Visual Studio 2019"
if errorlevel 1 ( echo %date% %time% ��ĵ���û�а�װvs2019��>> %files% ) else ( echo %date% %time% ��ĵ����Ѿ���װvs2019��>> %files% )

set dxsdk="C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Utilities\bin\Dx_Setenv.cmd"
if not exist %dxsdk% echo �����û�а�װdxsdk��������dxsdk����·�������޸�Ϊdxsdk�������ڵ���ȷ·����
::echo �����ж���ĵ����Ƿ��Ѿ���װdxsdk...
::@call %dxsdk% x64 | findstr "Dx x64"
::if errorlevel 1 ( echo %date% %time% ��ĵ���û�а�װdxsdk��>> %files% ) else ( echo %date% %time% ��ĵ����Ѿ���װdxsdk��>> %files% )

@path=%~dp0\mingw345\bin;%~dp0\Perl64\bin;%~dp0\nasm64;%PATH%

pause
goto :eof






:Quit
echo existing ..
pause
exit









::�����������жϣ�ͨ�������������������ʵ���������
:Choose

echo ������ [Y]�������� / [N]�˳���ǰ�ű� / [M]�������ҳ���ģʽ / [O]����˽ű�������GIT�ֿ⳰������ / [P]��·��... / [Q]��Ѱ��ARCADE����ָ���𣿣����س���


set /p yesno=
if /i "%yesno%" == "y" goto :begin
if /i "%yesno%" == "n" goto :begin1
if /i "%yesno%" == "m" goto :begin2
if /i "%yesno%" == "o" goto :begin3
if /i "%yesno%" == "p" call :begin4
if /i "%yesno%" == "q" goto :begin5
goto end



:begin1
echo ��ȷ�������𣿣�[*]�������س������� / [n]�����ϸ�������س���
set /p yesno=
if /i "%yesno%" == "n" cls && goto :Choose
echo ����һ���ع�����ˣ��ټ����ҵ�İ���ˣ� && pause > nul && exit

:begin2
echo ��ȷ�������𣿣�[*]�������س������� / [n]�����ϸ�������س���
set /p yesno=
if /i "%yesno%" == "n" cls && goto :Choose
echo �Ҿ����������ϱ���˧���˲����ˣ� && pause > nul && exit




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
echo ��ʼ�µı���...
echo ʱ�䣺%date% %time%
echo =======================================================================
echo ===================================================== >> ����������.txt
echo ��ʼ�µı���... >> ����������.txt
echo ʱ�䣺%date% %time% >> ����������.txt
call compile_arcade_32-bit.bat
cd %~dp0
call compile_arcade_64-bit.bat
cd %~dp0
call compile_mess_32-bit.bat
cd %~dp0
call compile_mess_64-bit.bat
cd %~dp0
start explorer %~dp0\ArcadeProgramFiles\
start notepad %~dp0����������.txt
echo.
echo �밴������˳�. . . && pause > nul




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