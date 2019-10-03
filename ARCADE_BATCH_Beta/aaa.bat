@echo off
where gcc
rem �ж��Ƿ�װ��gcc,û�о��˳�
if errorlevel 1 (
    echo MinGW/gcc NOT FOUND.
    exit -1
)
echo MinGW/gcc found.
pause
rem ͨ�����Ұ汾��Ϣ���Ƿ���sjlj��seh�ַ������ж��Ƿ��ܱ���64λ����
gcc --version |findstr "sjlj seh"
if errorlevel 1 (
    echo unsupported x86_64 build
    )else call:gcc_x86_64 
pause
rem ͨ�����Ұ汾��Ϣ���Ƿ���sjlj��dwarf�ַ������ж��Ƿ��ܱ���32λ����
gcc --version |findstr "sjlj dwarf"
if errorlevel 1 (
    echo unsupported x86 build  
    )else call:gcc_x86
goto :end

pause
pause
pause