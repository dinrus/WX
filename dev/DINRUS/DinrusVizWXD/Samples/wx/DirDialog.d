module wx.DirDialog;
public import wx.common;
public import wx.Dialog;

//-----------------------------------------------------------------------------

extern(D) class ДиалогПапка : Диалог
{
    enum {  КНОПКА_НОВАЯ_ПАПКА_ДП  = 0x0080 }
    enum {  ДЕФ_СТИЛЬ_ДП = (ДЕФ_СТИЛЬ_ДИАЛОГА | ПЕРЕМЕР_ГРАНИЦ | КНОПКА_НОВАЯ_ПАПКА_ДП) }

    public const ткст СтрПромптаВыбораПапки = "Выберите папку";
    public const ткст СтрИмениДиалогаВыбораПапки = "ДиалогПапка";

    public this(ЦелУкз вхобъ);
    public this(Окно родитель, ткст титул = СтрПромптаВыбораПапки, ткст дефПуть = "", цел стиль = ДЕФ_СТИЛЬ_ДП, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, ткст имя = СтрИмениДиалогаВыбораПапки);
    public проц путь(ткст значение);
    public ткст путь();
    public проц сообщение(ткст значение);
    public ткст сообщение();
    public override цел покажиМодально();
    public проц стиль(цел значение);
    public цел стиль();
}

extern(D) ткст выборПапки(ткст сообщение = пусто,
                                        ткст дефПуть = пусто,
                                        цел стиль = ДиалогПапка.ДЕФ_СТИЛЬ_ДП,
                                        Точка поз = Диалог.ДЕФПОЗ,
                                        Окно родитель = пусто);
