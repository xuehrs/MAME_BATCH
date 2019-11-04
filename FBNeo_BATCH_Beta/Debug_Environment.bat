::设置默认显示输入命令行模式
@echo no

set sed="D:\Program Files\Git\usr\bin\sed.exe"

echo 正在判断你的电脑是否已经安装sed...
type makefile | find "FB Neo"
if errorlevel 1 ( echo %date% %time% 你的电脑没有安装sed！) else ( echo %date% %time% 你的电脑已经安装sed！)
pause



