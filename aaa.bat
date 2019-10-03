@echo off
title %~dp0
	
::此处修改commit的备注
set CommitContent="%date% %time%"


::此处设置Git 目录的路径
set projectpath=D:\BatScript\xuehrs\MAME_BATCH

cd /d %projectpath%

::git pull
::git log
git add *
git commit -m %CommitContent%
git push origin master

echo.
echo 请按任意键退出. . . && pause > nul