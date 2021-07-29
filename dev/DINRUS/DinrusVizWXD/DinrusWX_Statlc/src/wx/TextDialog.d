module wx.TextDialog;
public import wx.common;
public import wx.Dialog;

//-----------------------------------------------------------------------------

extern(D) class ДиалогВводаТекста : Диалог
{
    enum
    {
        СтильДиалогаВводаТекста = (ОК | ОТМЕНА | ЦЕНТР),
    }
    public const ткст СтрТекстПодсказкиПользователю = "Введите текст";

    public this(ЦелУкз вхобъ);
    public  this(Окно родитель, ткст сообщение=СтрТекстПодсказкиПользователю, ткст заголовок="", ткст значение="", цел стиль=СтильДиалогаВводаТекста, Точка поз=ДЕФПОЗ);
    public ткст значение();
    public проц значение(ткст значение);
    public override цел покажиМодально();
}

//-----------------------------------------------------------------------------

extern(D) ткст получиПарольОтПользователя(ткст сообщение, ткст заголовок=ДиалогВводаТекста.СтрТекстПодсказкиПользователю, ткст defaultзначение="", Окно родитель=пусто);

//-----------------------------------------------------------------------------

extern(D) ткст получиТекстОтПользователя(ткст сообщение, ткст заголовок=ДиалогВводаТекста.СтрТекстПодсказкиПользователю, ткст defaultзначение="", Окно родитель=пусто, цел x=-1, цел y=-1, бул центр=да);
