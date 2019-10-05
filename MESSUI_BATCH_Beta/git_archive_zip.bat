@echo off
cls

rem echo %date%
::取前10的字符串
set date=%date:~0,10%
rem echo %date%
::去掉日期中的-
set date=%date:-=%   
rem echo %date%

::去掉日期中的/
set date=%date:/=%   
rem echo %date%


rem echo %time%
set time=%time:~0,8%
rem echo %time%
::去掉时间中的:
set time=%time::=%   
rem echo %time%
::去掉时的前面空格
if "%time:~0,1%"==" " set "time=0%time:~1%"
rem echo %time%


set filename=%date:~0,4%年%date:~4,2%月%date:~6,2%日%time:~0,2%时%time:~2,2%分%time:~4,2%秒
git archive --format zip --output "archive_%filename%".zip master

echo archive_%filename%.zip打包完成。

echo.
echo 请按任意键退出. . . && pause > nul