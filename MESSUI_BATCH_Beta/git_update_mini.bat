@echo off
cls

git fetch --all
git reset --hard origin/master
git pull

echo.
echo 请按任意键退出. . . && pause > nul
