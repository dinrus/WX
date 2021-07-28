@echo off
del *.map *.obj
pause
rulada
for %%i in (*.d) do dmd %%i  -L/exet:nt/su:windows:4.0 -L+RuladaWX.lib+tango.lib
for %%j in (*.exe) do upx %%j
exit