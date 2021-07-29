module wx.PrintPreview;
public import wx.common;
public import wx.Panel;
public import wx.Frame;
public import wx.ScrolledWindow;
public import wx.PrintData;
public import wx.Printer;

//-----------------------------------------------------------------------------

extern(D) class ПредпросмотрПечати : ВизОбъект
{
    //private this(ЦелУкз вхобъ);
    public this(Отпечатка отпечатка, Отпечатка отпечаткаДляПечати, ДанныеДиалогаПечати данные);
    public this(Отпечатка отпечатка, Отпечатка отпечаткаДляПечати);
    public this(Отпечатка отпечатка, Отпечатка отпечаткаДляПечати, ДанныеПечати данные);
    public static ВизОбъект Нов(ЦелУкз укз);
    public бул устТекущСтраницу(цел номСтраницы);
    public цел текущСтраница();
    public проц текущСтраница(цел значение);
    public проц отпечатка(Отпечатка значение);
    public Отпечатка отпечатка();
    public Отпечатка отпечаткаДляПечати();
    public проц рамка(Рамка значение);
    public Рамка рамка();
    public Окно канвас();
    public проц канвас(Окно значение);
    public бул окрасьСтраницу(Окно канвас, inout КонтекстУстройства ку);
    public бул нарисуйПустуюСтраницу(Окно канвас, inout КонтекстУстройства ку);
    public бул отобразиСтраницу(цел номСтраницы);
    public ДанныеДиалогаПечати данныеДиалогаПечати();
    public проц зум(цел значение);
    public цел зум();
    public цел максСтраница();
    public цел минСтраница();
    public бул Ок();
    public проц Ок(бул значение);
    public бул печать(бул интерактивно);
    public проц определиМасштабирование();
}

//-----------------------------------------------------------------------------
extern(D) class РамкаПредпросмотра : Рамка
{
    //private this(ЦелУкз вхобъ);
    public this(ПредпросмотрПечати предпросмотр, Окно родитель, ткст титул = "Предпросмотр Печати", Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = ДЕФ_СТИЛЬ_РАМКИ, ткст имя = "рамка");
    public проц иниц();
    public проц создайКанвас();
    public проц создайКонтролБар();
}

//-----------------------------------------------------------------------------
extern(D) class КонтролБарПредпросмотра : Панель
{
    const цел ПЕЧАТЬ       =  1;
    const цел ПРЕДЫДУШАЯ    =  2;
    const цел СЛЕДУЮЩАЯ        =  4;
    const цел ЗУМ        =  8;
    const цел ПЕРВАЯ       = 16;
    const цел ПОСЛЕДНЯЯ        = 32;
    const цел ПЕРЕЙТИ_К        = 64;

    const цел ДЕФ_ПРЕДПРОСМОТР     = ПРЕДЫДУШАЯ|СЛЕДУЮЩАЯ|ЗУМ
            |ПЕРВАЯ|ПЕРЕЙТИ_К|ПОСЛЕДНЯЯ;

    // Ids for controls
    const цел ПРЕДПРОСМ_ЗАКР      = 1;
    const цел ПРЕДПРОСМ_СЛЕДЩ       = 2;
    const цел ПРЕДПРОСМ_ПРЕДШ   = 3;
    const цел ПРЕДПРОСМ_ПЕЧАТЬ      = 4;
    const цел ПРЕДПРОСМ_ЗУМ       = 5;
    const цел ПРЕДПРОСМ_ПЕРВ      = 6;
    const цел ПРЕДПРОСМ_ПОСЛЕДН       = 7;
    const цел ПРЕДПРОСМ_ПЕРЕЙТИК       = 8;

    //private this(ЦелУкз вхобъ);

    public this(ПредпросмотрПечати предпросмотр, цел buttons, Окно родитель, Точка поз=ДЕФПОЗ, Размер размер=ДЕФРАЗМ, цел стиль=ТАБ_ТРАВЕРЗА, ткст имя="панель");
    public проц создайКнопки();
    public цел зумКонтрола();
    public проц зумКонтрола(цел значение);
    public ПредпросмотрПечати предпросмотрПечати();
}

//-----------------------------------------------------------------------------

extern(D) class КанвасПредпросмотра : ОкноСПрокруткой
{
    //private this(ЦелУкз вхобъ);
    public this(ПредпросмотрПечати предпросмотр, Окно родитель, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = 0, ткст имя = "canvas");
}
