import dinrus, cidrus;

void main()
{
сис("dinrus");
сис("del .\\compile.obj");
scope флы = списпап(".\\wx", "*.d"); 
    foreach (ф; флы)
	{
		скажифнс("Компилируется модуль: "~ф);
		сис("%DINRUS%\\dmd -c "~ф);	
	}
	сис("%DINRUS%\\ls2 -d *.obj>>objs.rsp");
	сис("%DINRUS%\\implib /system /p:256 .\\DinrusVizWXD.lib .\\DinrusVizWXD.dll");
	сис("del .\\DinrusViz.lib");
	сис("%DINRUS%\\dmd -lib -ofDinrusViz.lib @objs.rsp");	
	сис("del *.map *.obj *.rsp");	
	
	нс;
	таб;
	
	if(естьФайл(".\\DinrusViz.lib")) скажинс("ГОТОВО! Создана библиотека DinrusViz.lib");
      else {скажинс("ОШИБКА! DinrusViz.lib не создана."); пз; выход(0);	}
	  
	сис("%DINRUS%\\dmd .\\Hello.d .\\DinrusViz.lib .\\DinrusVizWXD.lib %DINRUS%\\..\\lib\\DinrusExeMain.lib");
	
	if(естьФайл(".\\Hello.exe")) скажинс("ГОТОВО! Создан .\\Hello.exe");
      else {скажинс("ОШИБКА! .\\Hello.exe не создан."); пз;	выход(0);}

	сис("%DINRUS%\\dmlib -p256 .\\DinrusViz.lib .\\DinrusVizWXD.lib");
	скажинс("ГОТОВО! Библиотека DinrusViz.lib объединена с .\\DinrusVizWXD.lib");
	сис("%DINRUS%\\dmd .\\Hello.d .\\DinrusViz.lib %DINRUS%\\..\\lib\\DinrusExeMain.lib");
    пз;	
 }


