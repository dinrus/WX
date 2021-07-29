module wx.HTML;
public import wx.common;
public import wx.ScrolledWindow;
public import wx.Frame;
public import wx.Config;
public import wx.PrintData;
public import wx.MouseEvent;

public enum ПтипУЛРГЯР
{
    Страница,
    Рисунок,
    Другое
}
//-----------------------------------------------------------------------------
public enum ПСтатусОткрыванияГЯР
{
    Открыть,
    Блокировать,
    Перенаправить
}
//-----------------------------------------------------------------------------
extern(D) class ТэгГЯР : ВизОбъект
{
    public this(ЦелУкз вхобъ);
    public static ВизОбъект Нов(ЦелУкз укз);
    //private static ТэгГЯР найдиОбъ(ЦелУкз укз);
    public ТэгГЯР родитель();
    public ТэгГЯР первПасынок();
    public ТэгГЯР последнПасынок();
    public ТэгГЯР отпрыски();
    public ТэгГЯР предшПасынок();
    public ТэгГЯР следщПасынок();
    public ТэгГЯР следщТэг();
    public ткст имя();
    public бул естьПарам(ткст par);
    public ткст дайПарам(ткст par, бул with_commas);
    public бул дайПарамКакЦвет(ткст par, Цвет цв);
    public бул дайПарамКакЦел(ткст par, out цел цв);
    public цел сканируйПарам(ткст par, ткст format, ВизОбъект парам);
    public ткст всеПарамы();
    public бул естьОкончание();
    public цел позНачала();
    public цел позКонца1();
    public цел позКонца2();
}
extern(D)  abstract class ФильтрГЯР : ВизОбъект
{
    public this(ЦелУкз вхобъ);
}
//-----------------------------------------------------------------------------
extern(D) class ЯчейкаГЯР : ВизОбъект
{
   
    public this(ЦелУкз вхобъ);
    public this();
    public static ВизОбъект Нов(ЦелУкз укз);
    public static ЯчейкаГЯР найдиОбъ(ЦелУкз укз);
    public проц родитель(ЯчейкаКонтейнераГЯР значение);
    public ЯчейкаКонтейнераГЯР родитель();
    public цел Х();
    public цел У();
    public цел ширь();
    public цел высь();
    public цел позХ();
    public цел позУ();
    public Точка позиция();
    public проц  позиция(Точка тчк);
    public Размер размер();
    public Прямоугольник прям();
    public цел спуск();
    public  ткст ид();
    public  проц ид(ткст значение);
    public ЯчейкаГЯР следщ();
    public проц следщ(ЯчейкаГЯР значение);
    public проц устПоз(цел x, цел y);
    public проц ссылка(ИнфОСсылкеГЯР значение);
    public  проц раскладка(цел w);
    public  проц рисуй(КонтекстУстройства ку, цел x, цел y, цел view_y1, цел view_y2, ИнфОбОтображенииГЯР инфо);
    public  проц рисуйНевидимо(КонтекстУстройства ку, цел x, цел y, ИнфОбОтображенииГЯР инфо);
    public  ЯчейкаГЯР найди(цел условие, ВизОбъект парам);
    public  проц поНажатиюМыши(Окно родитель, цел x, цел y, СобытиеМыши соб);
    public  бул устройРазрывСтр(inout цел разрывСтр);
    public проц можетБытьНаРазрывеСтр(бул значение);
    public  бул терминальнаяЯчейка_ли();
    public ЯчейкаГЯР найдиЯчейкуПоПоз(цел x, цел y);
}
//-----------------------------------------------------------------------------
extern(D) class ЯчейкаШрифтаГЯР : ЯчейкаГЯР
{
    public this(ЦелУкз вхобъ);
    public this(Шрифт шрифт);
    public override проц рисуй(КонтекстУстройства ку, цел x, цел y, цел view_y1, цел view_y2, ИнфОбОтображенииГЯР инфо);
    public override проц рисуйНевидимо(КонтекстУстройства ку, цел x, цел y, ИнфОбОтображенииГЯР инфо);
}
//-----------------------------------------------------------------------------
extern(D) class ЯчейкаКонтейнераГЯР : ЯчейкаГЯР
{
    public this(ЦелУкз вхобъ);
    public this(ЯчейкаКонтейнераГЯР родитель);
    public static ВизОбъект Нов(ЦелУкз укз);
    public override проц раскладка(цел w);
    public override проц рисуй(КонтекстУстройства ку, цел x, цел y, цел view_y1, цел view_y2, ИнфОбОтображенииГЯР инфо);
    public override проц рисуйНевидимо(КонтекстУстройства ку, цел x, цел y, ИнфОбОтображенииГЯР инфо);
    public override бул устройРазрывСтр(inout цел разрывСтр);
    public проц вставьЯчейку(ЯчейкаГЯР ячейка);
    public проц разместиГориз(цел значение);
    public цел разместиГориз();
    public проц разместиВерт(цел значение);
    public цел разместиВерт();
    public проц устОтступ(цел i, цел what, цел единицы);
    public цел дайОтступ(цел инд);
    public цел дайЕдцыОтступа(цел инд);
    public проц расположи(ТэгГЯР значение);
    public проц устПлавШирину(цел w, цел единицы);
    public проц устПлавШирину(ТэгГЯР тэг, дво масштаб_пикселя);
    public проц устМинВысоту(цел h, цел раскладка);
    public проц цветФона(Цвет значение);
    public Цвет цветФона();
    public проц устБордюр(Цвет clr1, Цвет clr2);
    public  ИнфОСсылкеГЯР дайСсылку(цел x, цел y);
    public override ЯчейкаГЯР найди(цел условие, ВизОбъект парам);
    public override проц поНажатиюМыши(Окно родитель, цел x, цел y, СобытиеМыши соб);
    public override бул терминальнаяЯчейка_ли();
    public override ЯчейкаГЯР найдиЯчейкуПоПоз(цел x, цел y);
}
//-----------------------------------------------------------------------------
extern(D) class ЯчейкаЦветаГЯР : ЯчейкаГЯР
{
    public this(ЦелУкз вхобъ);
    public  this(Цвет цв, цел флаги);
    public override проц рисуй(КонтекстУстройства ку, цел x, цел y, цел view_y1, цел view_y2, ИнфОбОтображенииГЯР инфо);
    public override проц рисуйНевидимо(КонтекстУстройства ку, цел x, цел y, ИнфОбОтображенииГЯР инфо);
}
//-----------------------------------------------------------------------------
extern(D) class ИнфОСсылкеГЯР : ВизОбъект
{
    public this(ЦелУкз вхобъ);
    public  this();
    public static ВизОбъект Нов(ЦелУкз укз);
    public проц событие(СобытиеМыши значение);
    public СобытиеМыши событие();
    public ткст гиперссылка();
    public ткст цель();
    public ЯчейкаГЯР ячейкаГЯР();
    public проц ячейкаГЯР(ЯчейкаГЯР значение);
}
//-----------------------------------------------------------------------------
extern(D) class ЯчейкаВиджетаГЯР : ЯчейкаГЯР
{
    public this(ЦелУкз вхобъ);
    public this(Окно окно, цел w);
    public override проц рисуй(КонтекстУстройства ку, цел x, цел y, цел view_y1, цел view_y2, ИнфОбОтображенииГЯР инфо);
    public override проц рисуйНевидимо(КонтекстУстройства ку, цел x, цел y, ИнфОбОтображенииГЯР инфо);
    public override проц раскладка(цел w);
}
//-----------------------------------------------------------------------------
extern(D) class ЯчейкаСловаГЯР : ЯчейкаГЯР
{
    public this(ЦелУкз вхобъ);
    public  this(ткст слово, КонтекстУстройства ку);
    public override проц рисуй(КонтекстУстройства ку, цел x, цел y, цел view_y1, цел view_y2, ИнфОбОтображенииГЯР инфо);
}
//-----------------------------------------------------------------------------
extern(D) class ФильтрПлоскогоТекстаГЯР : ФильтрГЯР
{
    public this(ЦелУкз вхобъ);
}
//-----------------------------------------------------------------------------
extern(D) class МодульТэговГЯР : ВизОбъект // TODO: Module
{
    public this(ЦелУкз вхобъ);
    public this();
    public бул поИниц();
    public проц поВыходу();
    public проц заполниТаблицуОбработчиков(ПарсерГЯРОкна  парсер);
}
//-----------------------------------------------------------------------------
extern(D)  abstract class ОбработчикТэгаГЯРОкна : ОбработчикТэгаГЯР
{
    public this(ЦелУкз вхобъ);
}
//-----------------------------------------------------------------------------
extern(D) class ПарсерГЯРОкна : ПарсерГЯР
{
    public this(ЦелУкз вхобъ);
    public this(ОкноГЯР окно);
    public static ВизОбъект Нов(ЦелУкз укз);
    public override проц иницПарсер(ткст исток);
    public override проц парсерВыполнен();
    public override ВизОбъект продукт();
    public проц устКУ(КонтекстУстройства ку, дво масштаб_пикселя);
    public КонтекстУстройства дайКУ();
    public дво масштабПикселя();
    public цел высьСим();
    public цел ширьСим();
    public ОкноГЯР окно();
    public проц устШрифты(ткст нормФас, ткст фиксФас, цел[] размы);
    public проц добавьМодуль(МодульТэговГЯР mod);
    public проц удалиМодуль(МодульТэговГЯР mod);
    public ЯчейкаКонтейнераГЯР контейнер();
    public ЯчейкаКонтейнераГЯР устКонтейнер(ЯчейкаКонтейнераГЯР конт);
    public ЯчейкаКонтейнераГЯР откройКонтейнер();
    public ЯчейкаКонтейнераГЯР закройКонтейнер();
    public цел размШрифта();
    public проц размШрифта(цел значение);
    public цел полужирныйШрифт();
    public проц полужирныйШрифт(цел значение);
    public цел курсивныйШрифт();
    public проц курсивныйШрифт(цел значение);
    public цел шрифтПодчёркнут();
    public проц шрифтПодчёркнут(цел значение);
    public цел шрифтФиксирован();
    public проц шрифтФиксирован(цел значение);
    public ткст фасШрифта();
    public проц фасШрифта(ткст значение);
    public цел расположи();
    public проц расположи(цел значение);
    public Цвет цветСсылки();
    public проц цветСсылки(Цвет значение);
    public Цвет действитЦвет();
    public проц действитЦвет(Цвет значение);
    public ИнфОСсылкеГЯР ссылка();
    public проц ссылка(ИнфОСсылкеГЯР значение);
    public Шрифт создайТекущШрифт();
}
//-----------------------------------------------------------------------------
extern(D)  abstract class ОбработчикТэгаГЯР : ВизОбъект
{
    public this(ЦелУкз вхобъ);
    public проц парсер(ПарсерГЯР значение);
    public abstract ткст дайПоддерживаемыеТэги();
    public abstract бул обработайТэг(ТэгГЯР тэг);
}
//-----------------------------------------------------------------------------
extern(D) class ПарсерСущностейГЯР : ВизОбъект
{
    public this(ЦелУкз вхобъ);
    public  this();
    public проц кодировка(ПКодировкаШрифта значение);
    public ткст разбор(ткст ввод);
    public char дайСимСущности(ткст сущность);
    public char дайСимДляКода(цел код);
}
//-----------------------------------------------------------------------------
extern(D)  abstract class ПарсерГЯР : ВизОбъект
{
    public this(ЦелУкз вхобъ);
    public ВизОбъект разбор(ткст исток);
    public  проц иницПарсер(ткст исток);
    public  проц парсерВыполнен();
    public проц стопРазбор();
    public проц выполниРазбор(цел начПоз, цел конПоз);
    public проц выполниРазбор();
    public ТэгГЯР дайТекТэг();
    public abstract ВизОбъект продукт();
    public проц добавьОбработчикТэга(ОбработчикТэгаГЯР обработчик);
    public проц суньОбработчикТэга(ОбработчикТэгаГЯР обработчик, ткст тэги);
    public проц выньОбработчикТэга();
    public ткст источник();
    public проц источник(ткст значение);
    public проц истокИСохрСост(ткст значение);
    public бул восстановиСостояние();
    public ткст извлекиИнфоГарнитуре(ткст маркап);
}
//-----------------------------------------------------------------------------
extern(D)  abstract class ПроцессорГЯР : ВизОбъект
{
    public this(ЦелУкз вхобъ);
    public abstract ткст процесс(ткст текст);
    public цел приоритет();
    public проц активен(бул значение);
    public бул активен();
}
//-----------------------------------------------------------------------------
extern(D) class ИнфОбОтображенииГЯР : ВизОбъект
{
    public this(ЦелУкз вхобъ);
    //private this(ЦелУкз вхобъ, бул памСобств);
    public this();
    ~this();
    public ВыделениеГЯР выделение();
    public проц выделение(ВыделениеГЯР значение);
}
//-----------------------------------------------------------------------------
extern(D) class ВыделениеГЯР : ВизОбъект
{
    public this(ЦелУкз вхобъ);
    //private this(ЦелУкз вхобъ, бул памСобств);
    public this();
    public static ВизОбъект Нов(ЦелУкз укз);
    ~this();
    public проц установи(Точка позОт, ЯчейкаГЯР отЯчейки, Точка позДо, ЯчейкаГЯР доЯчейки);
    public проц установи(ЯчейкаГЯР отЯчейки, ЯчейкаГЯР доЯчейки);
    public ЯчейкаГЯР ячейкаОт();
    public ЯчейкаГЯР ячейкаДо();
    public Точка позОт();
    public Точка позДо();
    public Точка отПривПоз();
    public проц отПривПоз(Точка значение);
    public Точка доПривПоз();
    public проц доПривПоз(Точка значение);
    public проц очистьПривПоз();
    public бул пуст();
}
//-----------------------------------------------------------------------------
extern(D) class ЛёгкаяПечатьГЯР : ВизОбъект
{
    public const цел НечётныеСтраницы	= 0;
    public const цел ЧётныеСтраницы	= 1;
    public const цел ВсеСтраницы	= 2;

    public this(ЦелУкз вхобъ);
    public this();
    public this(ткст имя);
    public this(ткст имя, Окно родитОкно);
    public бул предпросмотрФайла(ткст файлГЯР);
    public бул предпросмотрТекста(ткст текстГяр);
    public бул предпросмотрТекста(ткст текстГяр, ткст базПуть);
    public бул печатьФайла(ткст файлГЯР);
    public бул печатьТекста(ткст текстГяр);
    public бул печатьТекста(ткст текстГяр, ткст базПуть);
    public проц настройкаСтраницы();
    public проц устЗаголовок(ткст заголовок);
    public проц устЗаголовок(ткст заголовок, цел страница);
    public проц устПодвал(ткст подвал);
    public проц устПодвал(ткст подвал, цел страница);
    public проц устШрифты(ткст нормФас, ткст фиксФас);
    public проц устШрифты(ткст нормФас, ткст фиксФас, цел[] размы);
    public проц устСтандартнШрифты();
    public проц устСтандартнШрифты(цел размер);
    public проц устСтандартнШрифты(цел размер, ткст нормФас);
    public проц устСтандартнШрифты(цел размер, ткст нормФас, ткст фиксФас);
    public ДанныеПечати данныеПечати();
    public ДанныеДиалогаНастройкиСтраницы данныеНастройкиСтраницы();
}
//-----------------------------------------------------------------------------
extern(D) class ОкноГЯР : ОкноСПрокруткой
{
    public const цел БЕЗ_СКРОЛЛБАРА   = 0x0002;
    public const цел АВТОСКРОЛЛБАР    = 0x0004;
    public const цел БЕЗ_ВЫДЕЛЕНИЯ      = 0x0008;

    public this(ЦелУкз  вхобъ);
    public this();
    public this(Окно родитель, цел ид /*= ЛЮБОЙ*/, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = АВТОСКРОЛЛБАР, ткст имя = "htmlWindow");
    public this(Окно родитель, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = АВТОСКРОЛЛБАР, ткст имя = "htmlWindow");
    public override бул создай(Окно родитель, цел ид, inout Точка поз, inout Размер размер, цел стиль, ткст имя);
    public бул устСтраницу(ткст исток);
    public бул приставьКСтранице(ткст исток);
    public  бул загрузиСтраницу(ткст локация);
    public бул загрузиФайл(ткст имяф);
    public ткст открытаяСтраница();
    public ткст открытыйЯкорь();
    public ткст титулОткрытойСтраницы();
    public проц устОтносящРамку(Рамка рамка, ткст format);
    public Рамка относящРамка();
    public проц относящСтатусбар(цел значение);
    public проц устШрифты(ткст нормФас, ткст фиксФас, цел[] размы);
    public проц бордюры(цел значение);
    public  проц читайКустомизацию(Конфиг кфг, ткст путь);
    public  проц пишиКустомизацию(Конфиг кфг, ткст путь);
    public бул историяНазад();
    public бул историяВперёд();
    public бул историяМожноНазад();
    public бул историяМожноВперёд();
    public проц историяОчисти();
    public ЯчейкаКонтейнераГЯР внутрПредставление();
    public static проц добавьФильтр(ФильтрГЯР фильтр);
    public ПарсерГЯРОкна парсер();
    public проц добавьПроцессор(ПроцессорГЯР процессор);
    public static проц добавьГлобПроцессор(ПроцессорГЯР процессор);
    public override бул фокусируемоПоКлавиатуре();
    static extern(C)  проц staticDoOnSetTitle(ОкноГЯР объ, ЦелУкз титул);
    public  проц приУстановкеТитула(ткст титул);
    static extern(C)  проц staticDoOnCellMouseHover(ОкноГЯР объ, ЦелУкз ячейка, цел x, цел y);
    public  проц приМышьНадЯчейкой(ЯчейкаГЯР ячейка, цел x, цел y);
    static extern(C)  проц staticDoOnCellClicked(ОкноГЯР объ, ЦелУкз ячейка, цел x, цел y, ЦелУкз собМыши);
    public  проц приНажатииЯчейки(ЯчейкаГЯР ячейка, цел x, цел y, СобытиеМыши соб);
    static extern(C)  проц staticDoOnLinkClicked(ОкноГЯР объ, ЦелУкз ссылка);
    public  проц приНажатииСсылки(ИнфОСсылкеГЯР ссылка);
    static extern(C)  цел staticDoOnOpeningURL(ОкноГЯР объ, цел тип, ЦелУкз улр, ЦелУкз переадр);
    public ПСтатусОткрыванияГЯР приОткрытииУЛР(ПтипУЛРГЯР тип, ткст улр, ткст переадр);
    public проц выделиВсе();
    public проц выделиСтроку(Точка поз);
    public проц выделиСлово(Точка поз);
    public ткст текст();
    public ткст текстВыделения();
}