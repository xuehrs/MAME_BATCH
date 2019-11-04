# FinalBurn Neo
官方论坛: https://neo-source.com

它基于仿真器FinalBurn和旧版本的[MAME](https://www.mamedev.org)

此FinalBurn Neo许可协议请查询[FinalBurn Neo官方仓库]( https://github.com/libretro/FBNeo )

[相关PPX论坛](https://www.ppxclub.com/forum.php?mod=viewthread&tid=693831&page=1&extra=#pid8114341)

使用方法：

安装vs2019、dxsdk、git、mingw345、Perl64、nasm64，并且将其添加到系统环境。

以我Win10 x64为列：

通过打开文件内容，你可以看到。...\MAME_BATCH\FBNeo_BATCH_Beta\SetPathall64.bat

```
::这是vs2019环境
@call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
::这是dxsdk环境
@call "C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Utilities\bin\Dx_Setenv.cmd" x64
::这是该脚本所在的文件环境，也就是该环境脚本是和mingw345放在一起的。
@path=%~dp0\mingw345\bin;%~dp0\Perl64\bin;%~dp0\nasm64;%PATH%
```

![image-20191104193140427](C:\Users\lihaidong\AppData\Roaming\Typora\typora-user-images\image-20191104193140427.png)

备注：vs2019需要安装 Desktop development C++。具体请看与本文件所在的building.txt文件

里面提供了各种工具文件下载地址

按照需要，将该mingw32-make vc2019 xxxxx工具内容指定到正确的脚本环境所在路径。

顺便将该开头的脚本放到fbneo源码文件里面。双击运行，自动编译中。

如果你遇到git更新脚本各种冲突问题，请运行git_update_mini。强制覆盖fbneo源码。

按照需求双击就好。祝你好运。。。

