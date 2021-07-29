module wx.ArtProvider;
public import wx.common;
public import wx.Bitmap;
public import wx.Icon;
public import wx.Window;

public enum ПАртИд
{
    ДобавьЗакладку = 1,
    УдалиЗакладку,
    БоковаяПанель,
    НастройкиСправки,
    Справочник,
    ПапкаСправки,
    СтраницаСправки,
    Вернуться,
    ИдтиВперёд,
    ИдтиВверх,
    ИдтиВниз,
    ИдтиКРодителю,
    ИдтиДомой,
    ОткрытьФайл,
    Печать,
    Справка,
    Подсказка,
    ВидОтчёта,
    ВидСписка,
    НовПапка,
    Том,
    ИдтиНаПапкуВыше,
    ИсполнимыйФайл,
    НормальныйФайл,
    ТикМетка,
    КроссМетка,
    Ошибка,
    Вопрос,
    Предупреждение,
    Информация,
    ОтсутствуетКартинка
}

//---------------------------------------------------------------------

public enum ПАртКлиент
{
    Тулбар = 1,
    Меню,
    ИконкаРамки,
    КомДиалог,
    ОбзревательСправки,
    БоксСообщения,
    Кнопка,
    Другое
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxArtProvider_GetBitmap(цел артид, цел артКлиент, inout Размер размер);
extern (C) ЦелУкз wxArtProvider_GetIcon(цел артид, цел артКлиент, inout Размер размер);
//! \endcond

//---------------------------------------------------------------------

export class АртПровайдер
{
    export static Битмап дайБитмап(ПАртИд ид)
    {
        return дайБитмап(ид, ПАртКлиент.Другое, Окно.ДЕФРАЗМ);
    }

    export static Битмап дайБитмап(ПАртИд ид, ПАртКлиент клиент)
    {
        return дайБитмап(ид, клиент, Окно.ДЕФРАЗМ);
    }

    export static Битмап дайБитмап(ПАртИд ид, ПАртКлиент клиент, Размер размер)
    {
        return new Битмап(wxArtProvider_GetBitmap(cast(цел)ид, cast(цел)клиент, размер));
    }

    //---------------------------------------------------------------------

    export static Пиктограмма дайПиктограмму(ПАртИд ид)
    {
        return дайПиктограмму(ид, ПАртКлиент.Другое, Окно.ДЕФРАЗМ);
    }

    export static Пиктограмма дайПиктограмму(ПАртИд ид, ПАртКлиент клиент)
    {
        return дайПиктограмму(ид, клиент, Окно.ДЕФРАЗМ);
    }

    export static Пиктограмма дайПиктограмму(ПАртИд ид, ПАртКлиент клиент, Размер размер)
    {
        return new Пиктограмма(wxArtProvider_GetIcon(cast(цел)ид, cast(цел)клиент, размер));
    }
}