@echo off
setlocal enabledelayedexpansion
::set path=D:\Program Files\Git\usr\bin;%PATH%
title %~dp0 %-n0
	
::�˴��޸�commit�ı�ע
set CommitContent="%date% %time%"


::�˴�����Git�ֿ�Ŀ¼��·��
set projectpath=D:\BatScript\xuehrs\MAME_BATCH

xcopy /y /f D:\BatScript\Robbbert\store1\*.bat %projectpath%\ARCADE_BATCH_Beta\

cd /d %projectpath%





::����1������ʿ���

::git pull
::git log
git add *
git commit -m %CommitContent%
::git commit -a %CommitContent%
git push origin master
::��ʾ��������ļ��䶯
::git log -3 --stat
::��ʾ��ϸ�ļ��䶯����
git log -p *

echo.
echo �밴������˳�. . . && pause > nul