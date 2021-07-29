//Язык программирования Динрус
//https://github.com/DinrusGroup
//https://github.com/dinrus
module TestVizWXD;
pragma(lib,"DinrusExeMain.lib");

import wx.wx;

/**
* Этот класс показывает окошко со строкой состояния, в которой текст 'Hello World'
*/
public class ПриветМирПрил : Приложение
{
	public override бул поИниц()
	{
        Рамка рамка = new Рамка(пусто, ЛЮБОЙ, "Привет wxWidgets Мир");
        рамка.создайСтатусБар();
        рамка.текстСостояния ("Привет Мир-р-р-р-рррр");
        рамка.показ(да);
        топОкно(рамка);
        return да;
	}
}

цел main()
{
	ПриветМирПрил прил = new ПриветМирПрил();
	прил.пуск();
	return 0;
}