module wx.Listbook;
public import wx.common;
public import wx.Control;
public import wx.ImageList;

//-----------------------------------------------------------------------------

extern(D) class СобытиеЛистбука : Событие
{
    public this(ЦелУкз вхобъ);
    public this(ТипСобытия типКоманды, цел ид, цел члоВыб, цел члоСтарВыб);
    //static Событие Нов(ЦелУкз укз);
    public цел выделение();
    public проц выделение(цел значение);
    public цел старВыделение();
    public проц старВыделение(цел значение);
    public проц запрет();
    public проц позволить();
    public бул позволено();
    ////static this();
}

//-----------------------------------------------------------------------------

extern(D) class Листбук : Контрол
{
    public const цел ДЕФОЛТ		= 0;
    public const цел ВЕРХ		= 0x1;
    public const цел НИЗ		= 0x2;
    public const цел ЛЕВО		= 0x4;
    public const цел ПРАВО		= 0x8;
    public const цел РАСКЛАД_ПО_МАСКЕ	= 0xf;

    public this(ЦелУкз вхобъ);
    public this();
    public this(Окно родитель, цел ид, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = 0, ткст имя = "");
    //public static ВизОбъект Нов(ЦелУкз вхобъ);
    public this(Окно родитель, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = 0, ткст имя = "");
    public цел выделение();
    public проц выделение(цел значение);
    public бул устТекстСтраницы(цел ч, ткст стрТекст);
    public ткст дайТекстСтраницы(цел ч);
    public цел дайРисунокСтраницы(цел ч);
    public бул устРисунокСтраницы(цел ч, цел идРисунка);
    public Размер вычислиРазмерИзСтраницы(Размер стрРазм);
    public бул вставьСтраницу(цел ч, Окно страница, ткст текст);
    public бул вставьСтраницу(цел ч, Окно страница, ткст текст, бул выделить);
    public бул вставьСтраницу(цел ч, Окно страница, ткст текст, бул выделить, цел идРисунка);
    public проц списокРисунков(СписокРисунков значение);
    public СписокРисунков списокРисунков();
    public бул вертикален();
    public цел счётСтраниц();
    public Окно дайСтраницу(цел ч);
    public проц присвойСписокРисунков(СписокРисунков списокРисунков);
    public проц размерСтраницы(Размер значение);
    public бул удалиСтраницу(цел члоСтр);
    public бул удалиСтраницу2(цел члоСтр);
    public бул удалиВсеСтраницы();
    public бул добавьСтраницу(Окно страница, ткст текст, бул выделить, цел идРисунка);
    public проц продвиньВыделение(бул вперёд);
    public проц PageChange_Add(ДатчикСобытий значение);
    public проц PageChange_Remove(ДатчикСобытий значение);
    public проц PageChanging_Add(ДатчикСобытий значение);
    public проц PageChanging_Remove(ДатчикСобытий значение);
}

