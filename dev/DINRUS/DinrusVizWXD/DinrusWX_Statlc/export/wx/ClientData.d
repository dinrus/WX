module wx.ClientData;
public import wx.common;

//---------------------------------------------------------------------

extern(D) class ДанныеКлиента : ВизОбъект
{
    public this(ЦелУкз вхобъ);
    //private this(ЦелУкз вхобъ, бул памСобств);
    public this();
    ~this();
    static ВизОбъект Нов(ЦелУкз укз);
}

//---------------------------------------------------------------------

extern(D) class ТкстДанныеКлиента : ДанныеКлиента
{
    public this();
    public this(ткст данные);
    public this(ЦелУкз вхобъ);
    //private this(ЦелУкз вхобъ, бул памСобств);
    ~this();
    public ткст данные();
    public проц данные(ткст значение);
}

