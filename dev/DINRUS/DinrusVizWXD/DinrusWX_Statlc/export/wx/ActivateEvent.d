module wx.ActivateEvent;
public import wx.common;
public import wx.Event;

//-----------------------------------------------------------------------------

extern(D) class СобытиеАктивации : Событие
{
    public this(ЦелУкз вхобъ);
    public this(ТипСобытия тип = super.Тип.СОБ_НУЛЛ, бул активен = да, цел ид = 0);
    public бул активен();
    //private static Событие Нов(ЦелУкз объ);
    // //static this();
}
