module wx.MessageDialog;
public import wx.common;
public import wx.Dialog;

extern(D) class ДиалогСообщение : Диалог
{
    public const ткст стрЗагаДиалогСообщения = "Message";

    //private this(ЦелУкз вхобъ);
    public this(Окно родитель, ткст сооб, ткст заголовок=стрЗагаДиалогСообщения, цел стиль=ОК | ЦЕНТР, Точка поз = ДЕФПОЗ);
    public override цел покажиМодально();

}

static цел сообщи(ткст сооб,ткст заголовок=ДиалогСообщение.стрЗагаДиалогСообщения,цел стиль=Диалог.ОК | Диалог.ЦЕНТР, Окно родитель=пусто, цел x=-1, цел y=-1);

static цел сообщи(Окно родитель,ткст сооб,ткст заголовок=ДиалогСообщение.стрЗагаДиалогСообщения,цел стиль=Диалог.ОК | Диалог.ЦЕНТР, Точка поз=Диалог.ДЕФПОЗ);