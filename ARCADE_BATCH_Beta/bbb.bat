@echo off
echo ���ļ������õ�ǰĿ¼��MinGw gcc g++��������
echo ��ȷ����ǰ�ļ�������MinGw ��Ŀ¼��
echo                          ----By CHC 2014.4.9
::�޸���                   ----By CHC 2014.7.19
pause
setlocal enabledelayedexpansion
set str1=\bin
set str2=\include
set str3=\lib
set _path=%path%
echo "%cd%!str1!"
echo "%cd%!str2!"
echo "%cd%!str3!"
for /L %%i in (1,1,3) do (
if not exist "%cd%!str%%i!" (
echo ������%cd%!str%%i!���Ŀ¼
goto end
)
)
echo ��Ҫ����������·��Ϊ�������� �Ƿ�ȷ��[Y/N]
set /p yesno=
if /i "!yesno!" == "y" goto begin
goto end
 
:begin
echo !_path!>tx.txt
 
for /L %%i in (1,1,3) do (
echo ���� %cd%!str%%i! �Ƿ���ڻ���������
type tx.txt|findstr /C:"%cd%!str%%i!">nul&&(
rem �ҵ�str1
echo %cd%!str%%i!�Ѵ���
)||(
rem ˵�����������в��������·�� ��ӽ�path
echo �����ڻ���������
set _path=!_path!;%cd%!str%%i!
)
)
set _path=!_path!;
echo ȥ���Ѵ��ڵ�·�� ����������� ��õ�·��Ϊ
echo !_path!
echo �ٴ�ȷ���Ƿ�Ҫ��·����ӵ���������[Y/N]
set /p yesno=
if "!yesno!" == "y" goto begin1
goto end
 
:begin1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v path /t REG_EXPAND_SZ /d "!_path!" /f
 
:end
echo good bye~!!!
pause
��������������������������������
��Ȩ����������ΪCSDN������chcxchc����ԭ�����£���ѭ CC 4.0 BY-SA ��ȨЭ�飬ת���븽��ԭ�ĳ������Ӽ���������
ԭ�����ӣ�https://blog.csdn.net/inf_force/article/details/37957887