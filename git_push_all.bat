::����ʾ����������������̣�������ӽ�������ᷢ�֣������ѿ��Ķ�����
@echo off

::��ʾ��ǰ·�����ļ����ƣ�������һ�࣬���ǲ�֪�����ĸ��������������Ǿ;��鷳�ˣ�����������㲻֪������������Ǹ���ġ�
::�Ա��и���ݷ�ʽ�������ŵ�����λ�ã���Ҫ���£�ֱ��˫���ͺ��ˡ�
::"::"��ʾ���������䣬�������ע�͡�Ҳ������rem��
title %~dp0 %-n0
	
::�˴��޸�commit�ı�ע
set CommitContent="%date% %time%"

::�˴�����Git�ֿ�Ŀ¼��·��
set projectpath=D:\BatScript\xuehrs\MAME_BATCH

::���ҵ�Դ�ļ�����������µĽű�
xcopy /y /f D:\BatScript\Robbbert\store1\*.bat %projectpath%\ARCADE_BATCH_Beta\

::�������Ŀ¼�л���%projectpath%·��
cd /d %projectpath%



::��git�Ʋֿ��ȡ�����ļ�
::git pull

::�鿴git�����������
::git log

::�������Ѿ��䶯���ļ�������ʱ����
git add .

::�ύ�䶯���ݣ�˵���Ҹ�����ʲô������ΪʲôҪ�������ȵ�...
git commit -m %CommitContent%

::�������ļ��ϴ���git�Ʒ�����
git push origin master

::��ʾ��������ļ��䶯
::git log -3 --stat

::��ʾ��ϸ�ļ��䶯����
git log -p *

::��������һ����������Զ���ͣ�����Բ������������ˣ����ո����ҳ����q�˳�����
::echo.
::echo �밴������˳�. . . && pause > nul