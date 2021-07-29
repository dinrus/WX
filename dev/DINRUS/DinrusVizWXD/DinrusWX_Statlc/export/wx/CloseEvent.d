module wx.CloseEvent;
public import wx.common;
public import wx.Event;

//-----------------------------------------------------------------------------

extern(D) class СобытиеЗакрытия : Событие
{
    public this(ЦелУкз вхобъ);
    public this(ТипСобытия тип = super.Тип.СОБ_НУЛЛ, цел идок = 0);
    public бул разлогин();
    public проц разлогин(бул значение);
    public проц запрет();
    public проц запрет(бул вето);
    public проц можноЗапрещать(бул значение);
    public бул можноЗапрещать();
    public бул дайЗапрет();
    //private static Событие Нов(ЦелУкз объ);
    // //static this();
}
