@echo off
set from=%~dp0
set to=%~dp0docs\release


for /d %%i in (*) do (
  if not %%i==[Filter] (
    if exist "%~dp0%%i\.svn\" (
		echo.
        echo 正在更新svn项目 %%i
        @cd %cd%\%%i && @svn update
    ) else if exist "%~dp0%%i\.git\" (
		echo.
        echo 正在更新git项目 %%i
        @cd %cd%\%%i && @git pull
    ) else (
        echo.
        echo -- 进入文件夹 %%i
        cd "%~dp0%%i\
        for /d %%j in (*) do (
            if not %%j==[Filter] (
                if exist "%~dp0%%i\%%j\.svn\" (
                    echo 正在更新svn项目 %%j
                    @cd %~dp0%%i\%%j && @svn update
                ) else if exist "%~dp0%%i\%%j\.git\" (
                    echo 正在更新git项目 %%j
                    @cd %~dp0%%i\%%j && @git pull
                )
            )
        )
    )
   )
)

echo.
echo 请按任意键退出. . . && pause > nul