module wx.TextCtrl;
public import wx.common;
public import wx.Control;
public import wx.CommandEvent;
public import wx.KeyEvent;

public enum ПраскладкаТекстАтра
{
    Дефолт,
    Левая,
    ПоЦентру,
    Центр = ПоЦентру,
    Правая,
    Выровненная
}

//---------------------------------------------------------------------

public enum ПРезТестаНажатияТекстКтрл
{
    Неизвестен = -2,
    Перед,
    НаТексте,
    Ниже,
    Позади
}

//---------------------------------------------------------------------

extern(D) class ТекстАтр : ВизОбъект
{
    public const цел ЦВЕТ_ТЕКСТА =		0x0001;
    public const цел ЦВЕТ_ФОНА =	0x0002;
    public const цел ФАС_ШРИФТА =		0x0004;
    public const цел РАЗМЕР_ШРИФТА = 		0x0008;
    public const цел ШРИФТ_ВЕС =		0x0010;
    public const цел ШРИФТ_КУРСИВ =		0x0020;
    public const цел ШРИФТ_ПОДЧЕРК =		0x0040;
    public const цел ШРИФТ = ФАС_ШРИФТА | РАЗМЕР_ШРИФТА |
                                           ШРИФТ_ВЕС | ШРИФТ_КУРСИВ |
                                           ШРИФТ_ПОДЧЕРК;
    public const цел РАСКЛАДКА =		0x0080;
    public const цел ЛЕВЫЙ_ОТСТУП =		0x0100;
    public const цел ПРАВЫЙ_ОТСТУП =		0x0200;
    public const цел ТАБЫ =			0x0400;


    //---------------------------------------------------------------------

    public this(ЦелУкз вхобъ);
    //private this(ЦелУкз вхобъ, бул памСобств);
    public this(Цвет цвТекст, Цвет цвФон=пусто, Шрифт шрифт=пусто, ПраскладкаТекстАтра раскладка = ПраскладкаТекстАтра.Дефолт);
    ~this();
    public проц цветТекста(Цвет значение);
    public Цвет цветТекста();
    public проц цветФона(Цвет значение);
    public Цвет цветФона();
    public проц шрифт(Шрифт значение);
    public Шрифт шрифт();
    public проц раскладка(ПраскладкаТекстАтра значение);
    public ПраскладкаТекстАтра раскладка();
    public проц табы(цел[] значение);
    public цел[] табы();
    public проц устЛевыйОтступ(цел indent);
    public проц устЛевыйОтступ(цел indent, цел subIndent);
    public цел левыйОтступ();
    public цел левыйСубОтступ();
    public проц правыйОтступ(цел значение);
    public цел правыйОтступ();
    public проц флаги(цел значение);
    public цел флаги();
    public бул естьЦветТекста();
    public бул естьЦветФона();
    public бул естьШрифт();
    public бул естьраскладка();
    public бул естьТабы();
    public бул естьЛевыйОтступ();
    public бул естьПравыйОтступ();
    public бул естьФлаг(цел флаг);
    public бул дефолт_ли();
}

//---------------------------------------------------------------------


extern(D) class ТекстКтрл : Контрол
{
    public const цел БЕЗ_ВСКРОЛЛА       = 0x0002;
    public const цел АВТОСКРОЛЛ      = 0x0008;

    public const цел ТОЛЬКО_ЧТЕНИЕ         = 0x0010;
    public const цел МНОГОСТРОК        = 0x0020;
    public const цел ПРОЦЕСС_ТАБ      = 0x0040;

    public const цел ЛЕВЫЙ             = 0x0000;
    public const цел В_ЦЕНТРЕ           = ПРаскладка.Центр;
    public const цел ПРАВЫЙ            = ПРаскладка.Справа;

    public const цел РИЧ             = 0x0080;
    public const цел ПРОЦЕСС_ВВОД    = 0x0400;
    public const цел ПАРОЛЬ         = 0x0800;

    public const цел АВТОУЛР         = 0x1000;
    public const цел НЕСКРВЫД        = 0x2000;
    public const цел БЕЗ_ПОДГОНКИ         = Окно.ГПРОКРУТ;
    public const цел ПОДГОНКА_СТРОК         = 0x4000;
    public const цел ПОДГОНКА_СЛОВ         = 0x0000;
    public const цел РИЧ2            = 0x8000;


    public const ткст СтрИмениТекстКтрл = "text";

    public this(ЦелУкз вхобъ);
    public this(Окно родитель, цел ид, ткст значение="", Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = 0, Оценщик оценщик = пусто, ткст имя = СтрИмениТекстКтрл);
    public static ВизОбъект Нов(ЦелУкз вхобъ);
    public this(Окно родитель, ткст значение="", Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = 0, Оценщик оценщик = пусто, ткст имя = СтрИмениТекстКтрл);
    public проц очисть();
    public override проц цветФона(Цвет значение);
    public override проц цветПП(Цвет значение);
    public ткст значение();
    public проц значение(ткст значение);
    public ткст дайДиапазон(цел от, цел до);
    public цел длинаСтроки(цел номстр);
    public ткст дайТекстСтроки(цел номстр);
    public цел дайЧлоСтрок();
    public бул модифицирован();
    public бул редактируемый();
    public бул однострочный();
    public бул многострочный();
    public проц дайВыделение(out цел от, out цел до);
    public проц замени(цел от, цел до, ткст значение);
    public проц удали(цел от, цел до);
    public бул загрузиФайл(ткст файл);
    public бул сохраниФайл(ткст файл);
    public проц отмениРедактирования();
    public проц пометьГрязным();
    public проц максДлина(цел значение);
    public проц пишиТекст(ткст текст);
    public проц приставьТекст(ткст текст);
    public бул эмулируйНажатиеКлавиши(СобытиеКлавиатуры соб);
    public бул устСтиль(цел старт, цел конец, ТекстАтр стиль);
    public бул дайСтиль(цел позиция, inout ТекстАтр стиль);
    public бул устДефСтиль(ТекстАтр стиль);
    public ТекстАтр дайДефСтиль();
    public цел хуВПозицию(цел x, цел y);
    public бул позициюВХУ(цел поз, out цел x, out цел y);
    public проц покажиПозицию(цел поз);
    public ПРезТестаНажатияТекстКтрл тестНажатия(Точка тчк, out цел поз);
    public ПРезТестаНажатияТекстКтрл тестНажатия(Точка тчк, out цел кол, out цел ряд);
    public проц копируй();
    public проц вырежи();
    public проц вставь();
    public бул можноКопировать();
    public бул можноВырезать();
    public бул можноВставлять();
    public проц отмениСделанное();
    public проц верниСделанное();
    public бул можноОтменитьСделанное();
    public бул можноВернутьСделанное();
    public проц точкаВставки(цел значение);
    public цел точкаВставки();
    public проц устКонецТочкиВставки();
    public цел дайПоследнПоз();
    public проц устВыделение(цел от, цел до);
    public проц выделиВсе();
    public проц устРедактируемый(бул редактируемый);
    public бул включи(бул вкл);
    public  проц приЗабросеФайлов(Событие соб);
    public override проц заморозь();
    public override проц оттай();
    public override бул прокрутиСтроки(цел строки);
    public override бул прокрутиСтраницы(цел страницы);
    public override проц UpdateUI_Add(ДатчикСобытий значение);
    public override проц UpdateUI_Remove(ДатчикСобытий значение);
    public проц Enter_Add(ДатчикСобытий значение);
    public проц Enter_Remove(ДатчикСобытий значение);
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern(C) бцел   wxTextUrlEvent_GetURLStart(ЦелУкз сам);
static extern(C) бцел   wxTextUrlEvent_GetURLEnd(ЦелУкз сам);
//! \endcond

extern(D) class СобытиеУЛРТекста : СобытиеКоманды
{
    // TODO: замени Событие with EventMouse
    public this(цел ид, Событие собМышь, цел старт, цел конец);
}
