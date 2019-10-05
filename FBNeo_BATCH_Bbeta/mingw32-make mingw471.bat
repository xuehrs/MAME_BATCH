@echo off
cls

git fetch --all
git reset --hard origin/master
git pull

call   "E:\EMU_SRC\compile_mingw471\SetPath.bat"
mingw32-make mingw471

echo=
echo MinGW64 with GCC 4.7.1 Compile FB Alpha Ok!
echo=

pause