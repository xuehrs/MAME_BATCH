::����ʾ����������������̣�������ӽ�������ᷢ�֣������ѿ��Ķ�����
@echo off

::��ʾ��ǰ·�����ļ����ƣ�������һ�࣬���ǲ�֪�����ĸ��������������Ǿ;��鷳�ˣ�����������㲻֪������������Ǹ���ġ�
::�Ա��и���ݷ�ʽ�������ŵ�����λ�ã���Ҫ���£�ֱ��˫���ͺ��ˡ�
::"::"��ʾ���������䣬�������ע�͡�Ҳ������rem��
title %~dp0 %-n0
	
::�˴��޸�commit�ı�ע
set CommitContent="%date% %time%"

::�˴�����Git�ֿ�Ŀ¼��·��
set projectpath=D:\BatScript

::���ҵ�Դ�ļ�����������µĽű�
::����arcade��ؽű�
xcopy /y /f D:\BatScript\Robbbert\store1\*.bat %projectpath%\xuehrs\MAME_BATCH\ARCADE_BATCH_Beta\
::����FBNeo��ؽű�
xcopy /y /f D:\BatScript\finalburnneo\FBNeo\*.bat %projectpath%\xuehrs\MAME_BATCH\FBNeo_BATCH_Beta\

::�������Ŀ¼�л���%projectpath%·��
cd /d %projectpath%\xuehrs\MAME_BATCH\



::��git�Ʋֿ��ȡ�����ļ�
::git pull

::�鿴git�����������
::git log

::�������Ѿ��䶯���ļ�������ʱ����
git add .

::�ύ�䶯���ݣ�˵���Ҹ�����ʲô������ΪʲôҪ�������ȵ�...
git commit -m %CommitContent%

::�������ļ��ϴ���git�Ʒ�����
::git push origin master
git push

if %errorlevel% 0 ( echo ����git�������� ) 
if %errorlevel% 128 ( echo ����gitû�ҵ���Ҫ�ϴ���git�ֿ� ) 



echo %errorlevel%
::128??? Ϊʲô�����������·�����Ѿ������
::0 ��ʾͨ��~~~

::��ʾ��������ļ��䶯
::git log -3 --stat

::��ʾ��ϸ�ļ��䶯����
::����������������Զ���ͣ�����Բ������������ˣ����ո����ҳ����q�˳�����
::git log -p *



::�޸���ͣʱ��֪ͨ��Ϣ���밴�����������Ϊ���밴������˳���
echo.
echo �밴������˳�. . . && pause > nul