@echo off
::�˽ű�Ŀǰֻ��Ҫ������set msys=�������ҵ�msys�����bat�ļ��Ϳ����ˡ����ˡ������Դ��ո��
::��������ݹ���ά���ͺ�,����㿴�ö��������Լ����¡�

setlocal enabledelayedexpansion
::�ű���תϵͳλ�������������������Ϳ�����
set CONFIG_ARCHITECTURE=x64
set gccv="8.3.0"
set msys="E:\EMU_SRC\compile_msys\msys64-32-2019-03-25\win32\env.bat"



::======���ǻ����ķָ���===============================================================================

::MAKE��ر������
::-j�����ʾʹ�ö��ٺ��ı��룬ʹ��%j%���á�
set j=-j5

::�Զ��ж�������ű��ļ����ƣ��ж�PTR64Ӧ������0����1
set name=%~n0
echo %name% | findstr "64" && set PTR64=1

::ָ������Ŀ��(TARGET)��mame��ldplayer
::ָ����Ŀ��(SUBTARGET)��mame��arcade��mess��tiny��
::���ɽű�����scripts/target/$(TARGET)/$(SUBTARGET).lua��ʼ����
set SUBTARGET=mess

::ָ��osd�㣺windows��sdl��
::���ɽű�����scripts/src/osd/$(OSD).lua��ʼ����
set OSD=messui

::ָ��BUILD����·������make����ʱ����Ԥ������ļ���Ϊ����ָ����·������ֹʹ�ò�ͬgcc��ɱ����쳣��
set BUILDDIR=build_messui

::���Ĺ�������������sdl��native��������ӡ���������������ֻ�Ǳ����˲���300���ļ���
set REGENIE=1

::����ر���������������ʾ��ֻ�뵥������ĳĳcpp���������Ҫ����������Ƶ���������������ӽ���
set SOURCES=src\devices\sound\gb.cpp,src\mame\drivers\gb.cpp,src\mame\machine\gb.cpp,src\mame\drivers\gba.cpp,src\mame\drivers\sms.cpp,src\mame\machine\sms.cpp,src\mame\drivers\megadriv.cpp,src\mame\machine\megadriv.cpp,src\mame\drivers\nes.cpp,src\mame\machine\nes.cpp,src\mame\video\nes.cpp,src\mame\drivers\nes_vt.cpp,src\mame\drivers\ngp.cpp,src\mame\drivers\pce.cpp,src\mame\machine\pce.cpp,src\mame\drivers\sg1000.cpp,src\mame\drivers\snes.cpp,src\mame\machine\snes.cpp,src\mame\audio\wswan.cpp,src\mame\drivers\wswan.cpp,src\mame\machine\wswan.cpp,src\mame\video\wswan.cpp,src\mame\drivers\neogeocd.cpp,src\devices\cpu\saturn\saturn.cpp,src\mame\drivers\saturn.cpp,src\mame\machine\saturn.cpp,src\devices\cpu\psx\psx.cpp,src\devices\video\psx.cpp,src\mame\drivers\psx.cpp,src\mame\machine\psxcd.cpp,src\devices\cpu\psx\psxdasm.cpp,src\mame\drivers\neogeocd.cpp

::ԭ���ı�׼�������Ϊ���������ο������԰���������������set���õĲ��������¡�
::make -j5 PTR64=0 SUBTARGET=mess OSD=messui BUILDDIR=build_messui

::======���ǻ����ķָ���===============================================================================

::��������



echo �㿴������ű��Ƿ�����������ʾ����������������޸���ز�����
echo make SOURCES=%SOURCES% SUBTARGET=%SUBTARGET% PTR64=%PTR64% BUILDDIR=%BUILDDIR% %j% OSD=%OSD% REGENIE=%REGENIE%
echo.

echo ����ǿ���˳����ô˽ű���������,����㷢��makeû�����⣬������ע�͸Ĳ���������ش���
echo ��������˳� && pause > nul && exit



::======���ǻ����ķָ���===============================================================================

::�����֪��make֮�����ɵ�exe��ʲô����
::���ô˱������ɳ���Ĭ��exe����
set mame=messui

::�޸�Ĭ������exe���������Ϊ
set mamename=messui_mini

::ָ���ýű��������������������д�롰����������.txt��
set files=����������.txt


::======���ǻ����ķָ���===============================================================================
::��ʽ���д˽ű�

::����˵�������ʾ���ڡ�ʱ�䡢���������ڵ�·�����������ļ����� 
title %date% %time% %~dp0 %~n0...

::��ʱ��ӱ��뻷��
call %msys%
::�ж��Ѿ���ӵı��뻷���Ƿ���ϱ������󣬲�����д�롰����������.txt��txt�ı��С�
gcc --version | findstr %gccv%
if errorlevel 1 ( echo %date% %time% %~n0 compile build environment NO! >> %files% ) else ( echo %date% %time% %~n0 compile build environment OK! >> %files% )

::��ʼ����
make SOURCES=%SOURCES% SUBTARGET=%SUBTARGET% PTR64=%PTR64% BUILDDIR=%BUILDDIR% -j5 OSD=winui REGENIE=1

::��ֹMAKE��Ϻ󣬲��ڵ�ǰĿ¼�������������½���ű����ڵ��ļ�Ŀ¼�������Ժ��exe�ļ����У����ݡ�������������Ȳ�����
cd %~dp0

::�жϽű�����õĵĳ����Ƿ��Ѿ����ɣ�������д�롰����������.txt��txt�ı��С�
if exist %mame%.exe ( echo %date% %time% %~n0 compile %mame%.exe OK! >> %files% ) else ( echo %date% %time% %~n0 compile %mame%.exe NO! >> %files% )

::�����ɵ�exe�ļ���������׼��exe���ƣ������Ժ���ң�������д�롰����������.txt��txt�ı��С�
ren %mame%.exe %mamename%.exe
if errorlevel 1 ( echo %date% %time% %~n0 %mame%.exe Program Set Name NO! >> %files% ) else ( echo %date% %time% %~n0 %mame%.exe Program Set Name OK! >> %files% )

::�������Ѿ���������exe�ļ�����ǰĿ¼���ڵ��ļ���ArcadeProgramFiles\����ֹ��С�Ķ�ʧ�����������������д�롰����������.txt��txt�ı��С�
xcopy /y /f %mamename%.exe %~dp0\ArcadeProgramFiles\
if errorlevel 1 ( echo %date% %time% %~n0 Copy %mamename%.exe to ArcadeProgramFiles Folder NO! >> %files% ) else ( echo %date% %time% %~n0 Copy %mamename%.exe to ArcadeProgramFiles Folder OK! >> %files% )

::�޸���ͣʱ��֪ͨ��Ϣ���밴�����������Ϊ���밴������˳���
echo.
echo �밴������˳�. . . && pause > nul

::���������õĵĽű����������Ƿ�����������ǿ���˳����ô˽ű��������̡����ҷ���110�����������̡�
exit /b 110



::����ļ��û�cpp
::gb gba sms megadriv nes nes_vt ngp pce sg1000 snes wswan ss ps neogeocd

D:\BatScript\Robbbert\store1\src\devices\sound\gb.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\gb.cpp
D:\BatScript\Robbbert\store1\src\mame\machine\gb.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\gba.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\sms.cpp
D:\BatScript\Robbbert\store1\src\mame\machine\sms.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\megadriv.cpp
D:\BatScript\Robbbert\store1\src\mame\machine\megadriv.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\nes.cpp
D:\BatScript\Robbbert\store1\src\mame\machine\nes.cpp
D:\BatScript\Robbbert\store1\src\mame\video\nes.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\nes_vt.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\ngp.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\pce.cpp
D:\BatScript\Robbbert\store1\src\mame\machine\pce.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\sg1000.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\snes.cpp
D:\BatScript\Robbbert\store1\src\mame\machine\snes.cpp
D:\BatScript\Robbbert\store1\src\mame\audio\wswan.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\wswan.cpp
D:\BatScript\Robbbert\store1\src\mame\machine\wswan.cpp
D:\BatScript\Robbbert\store1\src\mame\video\wswan.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\neogeocd.cpp
D:\BatScript\Robbbert\store1\src\devices\cpu\saturn\saturn.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\saturn.cpp
D:\BatScript\Robbbert\store1\src\mame\machine\saturn.cpp
D:\BatScript\Robbbert\store1\src\devices\cpu\psx\psx.cpp
D:\BatScript\Robbbert\store1\src\devices\video\psx.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\psx.cpp
D:\BatScript\Robbbert\store1\src\mame\machine\psxcd.cpp
D:\BatScript\Robbbert\store1\src\devices\cpu\psx\psxdasm.cpp
D:\BatScript\Robbbert\store1\src\mame\drivers\neogeocd.cpp


