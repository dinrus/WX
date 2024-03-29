module wx.ScrolledWindow;
public import wx.common;
public import wx.Panel;

//---------------------------------------------------------------------

extern(D) class ОкноСПрокруткой : Панель
{
    enum
    {
        СтильОкнаСПрокруткой = (ГПРОКРУТ | ВПРОКРУТ),
    }

    public this(ЦелУкз вхобъ);
    public this(Окно родитель, цел ид /*= ЛЮБОЙ*/, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = СтильОкнаСПрокруткой, ткст имя = СтрИмениПанели);
    public this(Окно родитель, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = СтильОкнаСПрокруткой, ткст имя = СтрИмениПанели);
    public  проц приПеретяге(КонтекстУстройства ку);
    public override проц подготовьКУ(КонтекстУстройства ку);
    public проц устСкроллбары(цел пикселейНаЕдцуХ, цел пикселейНаЕдцуУ, цел безЕдцХ, цел безЕдцУ);
    public проц устСкроллбары(цел пикселейНаЕдцуХ, цел пикселейНаЕдцуУ, цел безЕдцХ, цел безЕдцУ, цел x, цел y);
    public проц устСкроллбары(цел пикселейНаЕдцуХ, цел пикселейНаЕдцуУ, цел безЕдцХ, цел безЕдцУ, цел x, цел y, бул неОсвежать);
    //private проц приОтрисовке(Объект отправитель, Событие e);
    public Точка стартОбзора();
    public проц дайСтартОбзора(inout цел x, inout цел y);
    public проц дайПикселиПрокруткиНаЕдиницу(inout цел хЕдц, inout цел уЕдц);
    public проц вычислиПрокрПозицию(цел x, цел y, inout цел xx, inout цел yy);
    public проц вычислиНепрокрПозицию(цел x, цел y, inout цел xx, inout цел yy);
    public проц дайВиртРазм(inout цел x, inout цел y);
    public проц промотай(цел x, цел y);
    public проц устрРейтПрокрутки(цел xstep, цел ystep);
    public проц целевоеОкно(Окно значение);
}
