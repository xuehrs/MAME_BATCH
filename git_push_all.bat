@echo off
setlocal enabledelayedexpansion
::set path=D:\Program Files\Git\usr\bin;%PATH%
title %~dp0 %-n0
	
::此处修改commit的备注
set CommitContent="%date% %time%"


::此处设置Git仓库目录的路径
set projectpath=D:\BatScript\xuehrs\MAME_BATCH

xcopy /y /f D:\BatScript\Robbbert\store1\*.bat %projectpath%\ARCADE_BATCH_Beta\

cd /d %projectpath%





::哈哈1发发打发士大夫

::git pull
::git log
git add *
git commit -m %CommitContent%
::git commit -a %CommitContent%
git push origin master
::显示最近三次文件变动
::git log -3 --stat
::显示详细文件变动内容
git log -p *

echo.
echo 请按任意键退出. . . && pause > nul