@echo off
echo 本文件将设置当前目录的MinGw gcc g++环境变量
echo 请确保当前文件放置在MinGw 根目录下
echo                          ----By CHC 2014.4.9
::修改于                   ----By CHC 2014.7.19
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
echo 不存在%cd%!str%%i!这个目录
goto end
)
)
echo 将要设置这三个路径为环境变量 是否确定[Y/N]
set /p yesno=
if /i "!yesno!" == "y" goto begin
goto end
 
:begin
echo !_path!>tx.txt
 
for /L %%i in (1,1,3) do (
echo 查找 %cd%!str%%i! 是否存在环境变量中
type tx.txt|findstr /C:"%cd%!str%%i!">nul&&(
rem 找到str1
echo %cd%!str%%i!已存在
)||(
rem 说明环境变量中不存在这个路径 添加进path
echo 不存在环境变量中
set _path=!_path!;%cd%!str%%i!
)
)
set _path=!_path!;
echo 去除已存在的路径 重新整理过后 获得的路径为
echo !_path!
echo 再次确认是否要将路径添加到环境变量[Y/N]
set /p yesno=
if "!yesno!" == "y" goto begin1
goto end
 
:begin1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v path /t REG_EXPAND_SZ /d "!_path!" /f
 
:end
echo good bye~!!!
pause
————————————————
版权声明：本文为CSDN博主「chcxchc」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/inf_force/article/details/37957887