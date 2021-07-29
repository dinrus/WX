module wx.Accelerator;
public import wx.common;
public import wx.MenuItem;

extern(D) class ЗаписьАкселератора : ВизОбъект
{
    public const цел Норма	= 0x0000;
    public const цел Альт	= 0x0001;
    public const цел Ктрл	= 0x0002;
    public const цел Шифт	= 0x0004;

    public this(ЦелУкз вхобъ);
    public this();
    public this(цел флаги);
    public this(цел флаги, цел кодКл);
    public this(цел флаги, цел кодКл, цел кмд);
    public this(цел флаги, цел кодКл, цел кмд, ЭлтМеню элт);
    public проц установи(цел флаги, цел кодКл, цел кмд);
    public проц установи(цел флаги, цел кодКл, цел кмд, ЭлтМеню элт);
    public ЭлтМеню элтМеню();
    public цел флаги();
    public цел кодКл();
    public цел команда();
    ~this();
    public static ЗаписьАкселератора дайАксельИзТкст(ткст ярлык);
    public static ВизОбъект Нов(ЦелУкз укз);
}

///////////////////////////////////////////////
extern(D) class ТаблицаАкселераторов : ВизОбъект
{
    public this(ЦелУкз вхобъ);
    public this();
    public бул Ок();
    public static ВизОбъект Нов(ЦелУкз укз);
}

