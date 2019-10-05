@echo off
cls

git fetch --all
git reset --hard origin/master
git pull

call   "E:\EMU_SRC\compile_mingw345\SetPath.bat"
mingw32-make mingw452 -mno-cygwin

echo _
echo FB Alpha Compilation using MS Visual C++ 2015 (x86) done.
echo MinGW64 with GCC 4.5.2 编译 FB Alpha 成功
echo _

pause