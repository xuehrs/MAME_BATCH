@echo off


cd D:\Program Files\BaiduPCS-Go\
title %~dp0
echo 批处理上传到百度云盘
start .\BaiduPCS-Go.exe
.\BaiduPCS-Go.exe u D:\BatScript\Robbbert\store1\ArcadeProgramFiles /分享/ARCADE编译相关文件
pause