:::This file was developed for Dinrus Programming Language by Vitaliy Kulich
:::Copyright is by Dinrus Group.

:back
:::Setting environment variables
@set this=%DINRUS%\..\dev\dinrus\DinrusViz\DinrusVizWXD\DinrusWX
@set R=%DINRUS%\..\imp\dinrus
@set LIBS=%DINRUS%\..\lib\sysimport
@set LDIR=%DINRUS%\..\lib
@set DMD=%DINRUS%\dmd.exe
@set DMC=%DINRUS%\dmc.exe
@set LIB=%DINRUS%\dmlib.exe
@set IMPLIB=%DINRUS%\implib.exe
@set LS=%DINRUS%\ls2.exe
@set PACK=%DINRUS%\upx.exe

::goto Lib

:::Deleting previous objects
@del %LDIR%\DinrusVizWXD.lib
@del %LDIR%\DinrusVizWXD.bak
@del %this%\*.rsp
@del %this%\*.obj
@del %this%\*.map
@del %this%\*.dll
@del %this%\src\rt\*.obj
@del %this%\*.lib
@del %this%\*.exe

:::Making dirs for di files in \imp\dinrus\
::: and copying imports from .\export folder to them

::mkdir %R%\wx
::copy %this%\..\export\wx\*.d  %R%\wx\*.di 

::mkdir %R%\wx\aui
::copy %this%\..\export\wx\aui\*.d  %R%\wx\aui\*.di


:Base
:::Creating respond file
:::%this%\src\io\*d %this%\src\io\device\*.d %this%\src\io\stream\*.d
:::%LS% -d %this%\src\io\*d %this%\src\io\device\*.d %this%\src\io\stream\*.d 
%LS% -d %this%\wx\*.d>>%this%\objs.rsp
%LS% -d %this%\wx\aui\*.d>>%this%\objs.rsp
:::Make Dinrus.Base.dll

@if exist %DINRUS%\rulada.exe %DINRUS%\rulada.exe

%DMD% -g -O -debug -version=Tango -of%this%\DinrusVizWXD.dll @%this%\objs.rsp %this%\base.def %this%\base.res %LDIR%\DinrusWX-2.8.12DLL.lib %LDIR%\rulada_eng\tango.lib

@if not exist %this%\DinrusVizWXD.dll pause
@if exist %this%\DinrusVizWXD.dll goto nextStep
@del %this%\objs.rsp
@goto Base

pause

:nextStep
:::Make its export lib
%IMPLIB% /system /p:256 %this%\DinrusVizWXD.lib %this%\DinrusVizWXD.dll
%IMPLIB% /system /p:256  %this%\DinrusVizWXDDLL.lib %this%\DinrusVizWXD.dll
copy %this%\DinrusVizWXDDLL.lib %LDIR%
::copy %this%\Dinrus.Base.dll %DINRUS%
::copy %this%\Dinrus.Base.dll c:\Windows\system32

:::To compress
:%PACK% %this%\Dinrus.Base.dll

:::Clean
@del %this%\*.obj

cd %this%\..
%LS% -d export\wx\*.d>>%this%\..\objs.rsp
%LS% -d export\wx\aui\*.d>>%this%\..\objs.rsp
dinrus
%DMD% -lib -of%this%\DinrusViz.lib @objs.rsp
pause
exit

