@echo off
title %~dp0
	
::�˴��޸�commit�ı�ע
set CommitContent="%date% %time%"


::�˴�����Git Ŀ¼��·��
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
echo �밴������˳�. . . && pause > nul