@echo off
title %~dp0
	
::�˴��޸�commit�ı�ע
set CommitContent="%date% %time%"


::�˴�����Git Ŀ¼��·��
set projectpath=D:\BatScript\xuehrs\MAME_BATCH

cd /d %projectpath%

::git pull
::git log
git add *
git commit -m %CommitContent%
git push origin master

echo.
echo �밴������˳�. . . && pause > nul