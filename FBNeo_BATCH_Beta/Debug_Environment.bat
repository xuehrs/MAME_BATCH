::����Ĭ����ʾ����������ģʽ
@echo no

set sed="D:\Program Files\Git\usr\bin\sed.exe"

echo �����ж���ĵ����Ƿ��Ѿ���װsed...
type makefile | find "FB Neo"
if errorlevel 1 ( echo %date% %time% ��ĵ���û�а�װsed��) else ( echo %date% %time% ��ĵ����Ѿ���װsed��)
pause



