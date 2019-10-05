@echo off
cls

git fetch --all
git reset --hard origin/master
git pull

call   "E:\EMU_SRC\compile_mingw510\SetPath.bat"
mingw32-make mingw510

echo=
echo MinGW64 with GCC 5.1.0 Compile FB Alpha Ok!
echo=

pause