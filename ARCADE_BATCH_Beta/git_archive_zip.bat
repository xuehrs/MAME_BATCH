@echo off
cls

rem echo %date%
::ȡǰ10���ַ���
set date=%date:~0,10%
rem echo %date%
::ȥ�������е�-
set date=%date:-=%   
rem echo %date%

::ȥ�������е�/
set date=%date:/=%   
rem echo %date%


rem echo %time%
set time=%time:~0,8%
rem echo %time%
::ȥ��ʱ���е�:
set time=%time::=%   
rem echo %time%
::ȥ��ʱ��ǰ��ո�
if "%time:~0,1%"==" " set "time=0%time:~1%"
rem echo %time%


set filename=%date:~0,4%��%date:~4,2%��%date:~6,2%��%time:~0,2%ʱ%time:~2,2%��%time:~4,2%��
git archive --format zip --output "archive_%filename%".zip master

echo archive_%filename%.zip�����ɡ�

echo.
echo �밴������˳�. . . && pause > nul