::不显示批处理命令输入过程，如果不加进来，你会发现，各种难看的东东。
@echo off

::显示当前路径和文件名称，批处理一多，若是不知道是哪个批处理出问题的那就就麻烦了，不加这个，你不知道这个批处理是干嘛的。
::旁边有个快捷方式，用来放到其它位置，想要更新，直接双击就好了。
::"::"表示跳过这个语句，用来添加注释。也可以用rem。
title %~dp0 %-n0
	
::此处修改commit的备注
set CommitContent="%date% %time%"

::此处设置Git仓库目录的路径
set projectpath=D:\BatScript

::从我的源文件拷贝最近更新的脚本
::复制arcade相关脚本
xcopy /y /f D:\BatScript\Robbbert\store1\*.bat %projectpath%\xuehrs\MAME_BATCH\ARCADE_BATCH_Beta\
::复制FBNeo相关脚本
xcopy /y /f D:\BatScript\finalburnneo\FBNeo\*.bat %projectpath%\xuehrs\MAME_BATCH\FBNeo_BATCH_Beta\

::将命令处理目录切换到%projectpath%路径
cd /d %projectpath%\xuehrs\MAME_BATCH\



::从git云仓库获取最新文件
::git pull

::查看git最近操作内容
::git log

::把所有已经变动的文件加入临时缓存
git add .

::提交变动内容，说明我更新了什么东西。为什么要这样做等等...
git commit -m %CommitContent%

::将本地文件上传到git云服务器
::git push origin master
git push

if %errorlevel% 0 ( echo 您的git运行正常 ) 
if %errorlevel% 128 ( echo 您的git没找到你要上传的git仓库 ) 



echo %errorlevel%
::128??? 为什么报错，不是这个路径？已经解决！
::0 表示通过~~~

::显示最近三次文件变动
::git log -3 --stat

::显示详细文件变动内容
::有了这条命令，它会自动暂停，可以不用下面命令了，按空格键翻页，按q退出命令
::git log -p *



::修改暂停时候，通知消息“请按任意键继续”为“请按任意键退出”
echo.
echo 请按任意键退出. . . && pause > nul