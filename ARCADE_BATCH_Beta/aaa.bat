@echo off
where gcc
rem 判断是否安装了gcc,没有就退出
if errorlevel 1 (
    echo MinGW/gcc NOT FOUND.
    exit -1
)
echo MinGW/gcc found.
pause
rem 通过查找版本信息中是否有sjlj或seh字符串的判断是否能编译64位程序
gcc --version |findstr "sjlj seh"
if errorlevel 1 (
    echo unsupported x86_64 build
    )else call:gcc_x86_64 
pause
rem 通过查找版本信息中是否有sjlj或dwarf字符串的判断是否能编译32位程序
gcc --version |findstr "sjlj dwarf"
if errorlevel 1 (
    echo unsupported x86 build  
    )else call:gcc_x86
goto :end

pause
pause
pause