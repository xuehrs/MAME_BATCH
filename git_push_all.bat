@echo off
title %~dp0
	
::此处修改commit的备注
set CommitContent="%date% %time%"


::此处设置Git 目录的路径
set projectpath=D:\BatScript\xuehrs\MAME_BATCH

xcopy /y /f D:\BatScript\Robbbert\store1\*.bat %projectpath%\ARCADE_BATCH_Beta\

cd /d %projectpath%

::git pull
::git log
git add *
git commit -m %CommitContent%
::git commit -a %CommitContent%
git push origin master
git log -1 --stat
git log  file
git log -p file

echo.
echo 请按任意键退出. . . && pause > nul