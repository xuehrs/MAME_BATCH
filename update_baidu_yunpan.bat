@echo off


cd D:\Program Files\BaiduPCS-Go\
title %~dp0
echo �������ϴ����ٶ�����
start .\BaiduPCS-Go.exe
.\BaiduPCS-Go.exe u D:\BatScript\Robbbert\store1\ArcadeProgramFiles /����/ARCADE��������ļ�
.\BaiduPCS-Go.exe u D:\BatScript\finalburnneo\FBNeo\*.exe /����/ARCADE��������ļ�
taskkill /f /im BaiduPCS-Go.exe
pause