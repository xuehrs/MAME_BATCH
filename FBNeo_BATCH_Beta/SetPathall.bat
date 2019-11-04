@echo=
@echo Setting up FBA compilation environment
@echo=

@call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x86
::@call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x86_x64
::@call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
::@call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x64_x86

@call "C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Utilities\bin\Dx_Setenv.cmd" x86

@path=%~dp0\mingw345\bin;%~dp0\Perl64\bin;%~dp0\nasm;%PATH%