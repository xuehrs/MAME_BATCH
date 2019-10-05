@echo off
cls

git fetch --all
git reset --hard origin/master
git pull

call   "E:\EMU_SRC\compile_mingw345\SetPath.bat"
mingw32-make mingw345

echo=
echo MinGW with GCC 3.4.5 Compile FB Alpha Ok!
echo=

pause