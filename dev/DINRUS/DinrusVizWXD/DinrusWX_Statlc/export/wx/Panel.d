module wx.Panel;
public import wx.common;
public import wx.Window;
public import wx.Button;

extern(D) class Панель : Окно
{

    public this(ЦелУкз вхобъ);
    public this();
    public this(Окно родитель, цел ид /*= ЛЮБОЙ*/, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = ТАБ_ТРАВЕРЗА|БЕЗ_БОРДЮРА, ткст имя = СтрИмениПанели);
    public this(Окно родитель, Точка поз=ДЕФПОЗ, Размер размер=ДЕФРАЗМ, цел стиль=ТАБ_ТРАВЕРЗА|БЕЗ_БОРДЮРА, ткст имя=СтрИмениПанели);
    public бул создай(Окно родитель, цел ид, inout Точка поз, inout Размер размер, цел стиль, ткст имя);
    public Кнопка дефЭлт();
    public проц дефЭлт(Кнопка значение);
    public override проц иницДиалог();
}
