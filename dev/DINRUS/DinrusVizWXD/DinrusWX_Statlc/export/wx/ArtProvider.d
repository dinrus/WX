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

extern(D) class АртПровайдер
{
    public static Битмап дайБитмап(ПАртИд ид);
    public static Битмап дайБитмап(ПАртИд ид, ПАртКлиент клиент);
    public static Битмап дайБитмап(ПАртИд ид, ПАртКлиент клиент, Размер размер);
    public static Пиктограмма дайПиктограмму(ПАртИд ид);
    public static Пиктограмма дайПиктограмму(ПАртИд ид, ПАртКлиент клиент);
    public static Пиктограмма дайПиктограмму(ПАртИд ид, ПАртКлиент клиент, Размер размер);
}
