//-----------------------------------------------------------------------------
// wxD/Samples - Hello.d
// converted to wxD from http://www.wxwidgets.org/wiki/index.php/Hello_World
//-----------------------------------------------------------------------------

import wx.wx;

 /**
  * This class shows a окно containing a statusbar with the текст 'Hello World'
  */
public class ПриветМирПрил : Приложение
{
	public override бул поИниц()
	{
        Рамка рамка = new Рамка(пусто, ЛЮБОЙ, "Привет wxWidgets Мир");
        рамка.создайСтатусБар();
        рамка.текстСостояния = "Привет Мир-р-р-р-рррр";
        рамка.показ(да);
        топОкно = рамка;
        return да;
	}
}

цел main()
{
	ПриветМирПрил прил = new ПриветМирПрил();
	прил.пуск();
	return 0;
}
