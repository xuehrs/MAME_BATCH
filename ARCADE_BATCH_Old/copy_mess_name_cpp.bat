@echo off
set from=%~dp0
set to=%~dp0docs\release


for /d %%i in (*) do (
  if not %%i==[Filter] (
    if exist "%~dp0%%i\.svn\" (
		echo.
        echo ���ڸ���svn��Ŀ %%i
        @cd %cd%\%%i && @svn update
    ) else if exist "%~dp0%%i\.git\" (
		echo.
        echo ���ڸ���git��Ŀ %%i
        @cd %cd%\%%i && @git pull
    ) else (
        echo.
        echo -- �����ļ��� %%i
        cd "%~dp0%%i\
        for /d %%j in (*) do (
            if not %%j==[Filter] (
                if exist "%~dp0%%i\%%j\.svn\" (
                    echo ���ڸ���svn��Ŀ %%j
                    @cd %~dp0%%i\%%j && @svn update
                ) else if exist "%~dp0%%i\%%j\.git\" (
                    echo ���ڸ���git��Ŀ %%j
                    @cd %~dp0%%i\%%j && @git pull
                )
            )
        )
    )
   )
)

echo.
echo �밴������˳�. . . && pause > nul