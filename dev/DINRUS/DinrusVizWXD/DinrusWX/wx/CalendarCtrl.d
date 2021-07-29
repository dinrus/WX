module wx.CalendarCtrl;
public import wx.common;
public import wx.DateTime;
public import wx.Colour;
public import wx.Font;
public import wx.Control;
public import wx.CommandEvent;

public enum ПРезТестаНажатияКалендаря
{
    Никогда,
    Заг,
    День,
    ИнкрементМесяц,
    ДекрементМесяц,
    ОхватывающаяНеделя
}

public enum ПБордюрКалендарнойДаты
{
    Отсутствует,
    Площадь,
    Круглый
}

//! \cond EXTERN
extern (C) ЦелУкз wxCalendarCtrl_ctor();
extern (C) бул   wxCalendarCtrl_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ЦелУкз дата, inout Точка поз, inout Размер размер, бцел стиль, ткст имя);
extern (C) бул   wxCalendarCtrl_SetDate(ЦелУкз сам, ЦелУкз дата);
extern (C) ЦелУкз wxCalendarCtrl_GetDate(ЦелУкз сам);
extern (C) бул   wxCalendarCtrl_SetLowerDateLimit(ЦелУкз сам, ЦелУкз дата);
extern (C) ЦелУкз wxCalendarCtrl_GetLowerDateLimit(ЦелУкз сам);
extern (C) бул   wxCalendarCtrl_SetUpperDateLimit(ЦелУкз сам, ЦелУкз дата);
extern (C) ЦелУкз wxCalendarCtrl_GetUpperDateLimit(ЦелУкз сам);
extern (C) бул   wxCalendarCtrl_SetDateRange(ЦелУкз сам, ЦелУкз ниждата, ЦелУкз высшдата);
extern (C) проц   wxCalendarCtrl_EnableYearChange(ЦелУкз сам, бул вкл);
extern (C) проц   wxCalendarCtrl_EnableMonthChange(ЦелУкз сам, бул вкл);
extern (C) проц   wxCalendarCtrl_EnableHolidayDisplay(ЦелУкз сам, бул display);
extern (C) проц   wxCalendarCtrl_SetHeaderColours(ЦелУкз сам, ЦелУкз цветПП, ЦелУкз цветЗП);
extern (C) ЦелУкз wxCalendarCtrl_GetHeaderColourFg(ЦелУкз сам);
extern (C) ЦелУкз wxCalendarCtrl_GetHeaderColourBg(ЦелУкз сам);
extern (C) проц   wxCalendarCtrl_SetHighlightColours(ЦелУкз сам, ЦелУкз цветПП, ЦелУкз цветЗП);
extern (C) ЦелУкз wxCalendarCtrl_GetHighlightColourFg(ЦелУкз сам);
extern (C) ЦелУкз wxCalendarCtrl_GetHighlightColourBg(ЦелУкз сам);
extern (C) проц   wxCalendarCtrl_SetHolidayColours(ЦелУкз сам, ЦелУкз цветПП, ЦелУкз цветЗП);
extern (C) ЦелУкз wxCalendarCtrl_GetHolidayColourFg(ЦелУкз сам);
extern (C) ЦелУкз wxCalendarCtrl_GetHolidayColourBg(ЦелУкз сам);
extern (C) ЦелУкз wxCalendarCtrl_GetAttr(ЦелУкз сам, цел день);
extern (C) проц   wxCalendarCtrl_SetAttr(ЦелУкз сам, цел день, ЦелУкз атр);
extern (C) проц   wxCalendarCtrl_SetHoliday(ЦелУкз сам, цел день);
extern (C) проц   wxCalendarCtrl_ResetAttr(ЦелУкз сам, цел день);
extern (C) цел    wxCalendarCtrl_HitTest(ЦелУкз сам, inout Точка поз, ЦелУкз дата, inout ПДеньНед wd);
//! \endcond

//-----------------------------------------------------------------------------

export class КалендарьКтрл : Контрол
{
    enum
    {
        // показ Sunday as the first день of the week (default)
        ВОСКРЕСЕНЬЕ_ПЕРВЫМ               = 0x0000,

        // показ Monday as the first день of the week
        ПОНЕДЕЛЬНИК_ПЕРВЫМ               = 0x0001,

        // highlight holidays
        ПОКАЗЫВАТЬ_ПРАЗДНИКИ              = 0x0002,

        // disable the год change контрол, показ only the месяц change one
        БЕЗ_ИЗМЕНЕНИЯ_ГОДА             = 0x0004,

        // don't разрешить changing neither месяц nor год (implies
        // wxCAL_NO_YEAR_CHANGE)
        БЕЗ_ИЗМЕНЕНИЯ_МЕСЯЦА            = 0x000c,

        // use MS-стиль месяц-selection instead of combo-spin combination
        ВЫБОР_МЕСЯЦА_ПОСЛЕДОВАТЕЛЬНО = 0x0010,

        // показ the neighbouring weeks in the предш and next месяц
        ПОКАЗ_ВКЛЮЧАЮЩЕЙ_НЕДЕЛИ     = 0x0020
    }

    public const ткст СтрИмяКалендаря  = "КалендарьКтрл";
    //-----------------------------------------------------------------------------

    export this(ЦелУкз объ)
    {
        super(объ);
    }

    export this()
    {
        this(wxCalendarCtrl_ctor());
    }

    export this(Окно родитель, цел ид, ВизДатаВремя дата = пусто /*ДефДатаВремя*/, Точка поз = ДЕФПОЗ, Размер размер =ДЕФРАЗМ, цел стиль = ПОКАЗЫВАТЬ_ПРАЗДНИКИ | НУЖНЫ_СИМВ, ткст имя = СтрИмяКалендаря)
    {
        this(wxCalendarCtrl_ctor());
        if (!создай(родитель, ид, дата, поз, размер, стиль, имя))
        {
            throw new ИсклНевернОперации("Не удалось создать КалендарьКтрл");
        }
    }

    //-----------------------------------------------------------------------------
    // ctors with сам created ид

    export this(Окно родитель, ДатаВремя дата = пусто, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = ПОКАЗЫВАТЬ_ПРАЗДНИКИ | НУЖНЫ_СИМВ, ткст имя = СтрИмяКалендаря)
    {
        this(родитель, Окно.уникИд, дата, поз, размер, стиль, имя);
    }

    //-----------------------------------------------------------------------------

    export бул создай(Окно родитель, цел ид, ВизДатаВремя дата, inout Точка поз, inout Размер размер, цел стиль, ткст имя)
    {
        return wxCalendarCtrl_Create(this.м_вхобъ, ВизОбъект.безопУк(родитель), ид, ВизОбъект.безопУк(дата), поз, размер, cast(бцел)стиль, имя);
    }

    //-----------------------------------------------------------------------------

    export проц дата(ДатаВремя значение)
    {
        wxCalendarCtrl_SetDate(this.м_вхобъ, ВизОбъект.безопУк(cast(ВизДатаВремя)значение));
    }
    export ДатаВремя дата()
    {
        return new ВизДатаВремя(wxCalendarCtrl_GetDate(this.м_вхобъ));
    }

    //-----------------------------------------------------------------------------

    export проц нижнийПределДаты(ДатаВремя значение)
    {
        wxCalendarCtrl_SetLowerDateLimit(this.м_вхобъ, ВизОбъект.безопУк(cast(ВизДатаВремя)значение));
    }
    export ДатаВремя нижнийПределДаты()
    {
        return new ВизДатаВремя(wxCalendarCtrl_GetLowerDateLimit(this.м_вхобъ));
    }

    export проц верхнийПределДаты(ДатаВремя значение)
    {
        wxCalendarCtrl_SetUpperDateLimit(this.м_вхобъ, ВизОбъект.безопУк(cast(ВизДатаВремя)значение));
    }
    export ДатаВремя верхнийПределДаты()
    {
        return new ВизДатаВремя(wxCalendarCtrl_GetUpperDateLimit(вхобъ));
    }

    //-----------------------------------------------------------------------------

    export бул устДиапазонДат(ДатаВремя ниждата, ДатаВремя высшдата)
    {
        return wxCalendarCtrl_SetDateRange(this.м_вхобъ, ВизОбъект.безопУк(cast(ВизДатаВремя)ниждата), ВизОбъект.безопУк(cast(ВизДатаВремя)высшдата));
    }

    //-----------------------------------------------------------------------------

    export проц вклСменуГода(бул значение)
    {
        wxCalendarCtrl_EnableYearChange(this.м_вхобъ, значение);
    }

    export проц вклСменуМесяца(бул значение)
    {
        wxCalendarCtrl_EnableMonthChange(this.м_вхобъ, значение);
    }

    export проц вклПоказПраздников(бул значение)
    {
        wxCalendarCtrl_EnableHolidayDisplay(this.м_вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export проц устЦветаЗаголовка(Цвет цветПП, Цвет цветЗП)
    {
        wxCalendarCtrl_SetHeaderColours(this.м_вхобъ, ВизОбъект.безопУк(цветПП), ВизОбъект.безопУк(цветЗП));
    }

    export Цвет цветЗаголовкаПП()
    {
        return new Цвет(wxCalendarCtrl_GetHeaderColourFg(this.м_вхобъ), да);
    }

    export Цвет цветЗаголовкаЗП()
    {
        return new Цвет(wxCalendarCtrl_GetHeaderColourBg(this.м_вхобъ), да);
    }

    //-----------------------------------------------------------------------------

    export проц устЦветаПодсветки(Цвет цветПП, Цвет цветЗП)
    {
        wxCalendarCtrl_SetHighlightColours(this.м_вхобъ, ВизОбъект.безопУк(цветПП), ВизОбъект.безопУк(цветЗП));
    }

    export Цвет цветПодсветкиПП()
    {
        return new Цвет(wxCalendarCtrl_GetHighlightColourFg(this.м_вхобъ));
    }

    export Цвет цветПодсветкиЗП()
    {
        return new Цвет(wxCalendarCtrl_GetHighlightColourBg(this.м_вхобъ));
    }

    //-----------------------------------------------------------------------------

    export проц устЦветаПраздников(Цвет цветПП, Цвет цветЗП)
    {
        wxCalendarCtrl_SetHolidayColours(this.м_вхобъ, ВизОбъект.безопУк(цветПП), ВизОбъект.безопУк(цветЗП));
    }

    export Цвет цветПраздниковПП()
    {
        return new Цвет(wxCalendarCtrl_GetHolidayColourFg(this.м_вхобъ));
    }

    export Цвет ЦветПраздниковЗП()
    {
        return new Цвет(wxCalendarCtrl_GetHolidayColourBg(this.м_вхобъ));
    }

    //-----------------------------------------------------------------------------

    export АтрДатыКалендаря дайАтр(цел день)
    {
        return cast(АтрДатыКалендаря)найдиОбъект(wxCalendarCtrl_GetAttr(this.м_вхобъ, день), &АтрДатыКалендаря.Нов);
    }

    export проц устАтр(цел день, АтрДатыКалендаря атр)
    {
        wxCalendarCtrl_SetAttr(this.м_вхобъ, день, ВизОбъект.безопУк(атр));
    }

    //-----------------------------------------------------------------------------

    export проц устПраздник(цел день)
    {
        wxCalendarCtrl_SetHoliday(this.м_вхобъ, день);
    }

    //-----------------------------------------------------------------------------

    export проц сбросьАтр(цел день)
    {
        wxCalendarCtrl_ResetAttr(this.м_вхобъ, день);
    }

    //-----------------------------------------------------------------------------

    export ПРезТестаНажатияКалендаря тестНажатия(Точка поз, inout ДатаВремя дата, inout ПДеньНед wd)
    {
        ВизДатаВремя dt = дата;
        ПРезТестаНажатияКалендаря res = cast(ПРезТестаНажатияКалендаря)wxCalendarCtrl_HitTest(вхобъ, поз, ВизОбъект.безопУк(dt), wd);
        дата = dt;

        return res;
    }

    //-----------------------------------------------------------------------------

    export проц добавьИзменениеВыбора(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КАЛЕНДАРЬ_ВЫД_ИЗМЕНЕНО, ид, значение, this);
    }
    export проц удалиИзменениеВыбора(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц добавьИзменениеДня(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КАЛЕНДАРЬ_ДЕНЬ_ИЗМЕНЁН, ид, значение, this);
    }
    export проц удалиИзменениеДня(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц добавьИзменениеМесяца(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КАЛЕНДАРЬ_МЕСЯЦ_ИЗМЕНЁН, ид, значение, this);
    }
    export проц удалиИзменениеМесяца(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц добавьИзменениеГода(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КАЛЕНДАРЬ_ГОД_ИЗМЕНЁН, ид, значение, this);
    }
    export проц удалиИзменениеГода(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц добавьДНажатие(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КАЛЕНДАРЬ_ДВАЖДЫ_НАЖАТ, ид, значение, this);
    }
    export проц удалиДНажатие(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц добавьНажатиеДняНедели(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КАЛЕНДАРЬ_ДЕНЬНЕДЕЛИ_НАЖАТ, ид, значение, this);
    }
    export проц удалиНажатиеДняНедели(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }
}

//! \cond EXTERN
extern (C) ЦелУкз wxCalendarDateAttr_ctor();
extern (C) ЦелУкз wxCalendarDateAttr_ctor2(ЦелУкз цвТекст, ЦелУкз цвФон, ЦелУкз цвБордюр, ЦелУкз шрифт, ПБордюрКалендарнойДаты бордюр);
extern (C) ЦелУкз wxCalendarDateAttr_ctor3(ПБордюрКалендарнойДаты бордюр, ЦелУкз цвБордюр);
extern (C) проц   wxCalendarDateAttr_dtor(ЦелУкз сам);
extern (C) проц   wxCalendarDateAttr_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
extern (C) проц   wxCalendarDateAttr_SetTextColour(ЦелУкз сам, ЦелУкз цвТекст);
extern (C) проц   wxCalendarDateAttr_SetBackgroundColour(ЦелУкз сам, ЦелУкз цвФон);
extern (C) проц   wxCalendarDateAttr_SetBorderColour(ЦелУкз сам, ЦелУкз кол);
extern (C) проц   wxCalendarDateAttr_SetFont(ЦелУкз сам, ЦелУкз шрифт);
extern (C) проц   wxCalendarDateAttr_SetBorder(ЦелУкз сам, цел бордюр);
extern (C) проц   wxCalendarDateAttr_SetHoliday(ЦелУкз сам, бул holiday);
extern (C) бул   wxCalendarDateAttr_HasTextColour(ЦелУкз сам);
extern (C) бул   wxCalendarDateAttr_HasBackgroundColour(ЦелУкз сам);
extern (C) бул   wxCalendarDateAttr_HasBorderColour(ЦелУкз сам);
extern (C) бул   wxCalendarDateAttr_HasFont(ЦелУкз сам);
extern (C) бул   wxCalendarDateAttr_HasBorder(ЦелУкз сам);
extern (C) бул   wxCalendarDateAttr_IsHoliday(ЦелУкз сам);
extern (C) ЦелУкз wxCalendarDateAttr_GetTextColour(ЦелУкз сам);
extern (C) ЦелУкз wxCalendarDateAttr_GetBackgroundColour(ЦелУкз сам);
extern (C) ЦелУкз wxCalendarDateAttr_GetBorderColour(ЦелУкз сам);
extern (C) ЦелУкз wxCalendarDateAttr_GetFont(ЦелУкз сам);
extern (C) цел    wxCalendarDateAttr_GetBorder(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class АтрДатыКалендаря : ВизОбъект
{
    export this(ЦелУкз объ)
    {
        super(объ);
    }

    export this(ЦелУкз объ, бул памСобств)
    {
        super(объ);
        this.памСобств = памСобств;
    }

    export this()
    {
        this(wxCalendarDateAttr_ctor(), да);
        wxCalendarDateAttr_RegisterDisposable(this.м_вхобъ, &VirtualDispose);
    }

    export this(Цвет цвТекст, Цвет цвФон = Цвет.НуллЦвет, Цвет цвБордюр = Цвет.НуллЦвет, Шрифт шрифт = Шрифт.НуллШрифт, ПБордюрКалендарнойДаты бордюр = ПБордюрКалендарнойДаты.Отсутствует)
    {
        this(wxCalendarDateAttr_ctor2(ВизОбъект.безопУк(цвТекст), ВизОбъект.безопУк(цвФон), ВизОбъект.безопУк(цвБордюр), ВизОбъект.безопУк(шрифт), бордюр),да);
        wxCalendarDateAttr_RegisterDisposable(this.м_вхобъ, &VirtualDispose);
    }

    export  this(ПБордюрКалендарнойДаты бордюр, Цвет цвБордюр)
    {
        this(wxCalendarDateAttr_ctor3(бордюр, ВизОбъект.безопУк(цвБордюр)),да);
        wxCalendarDateAttr_RegisterDisposable(this.м_вхобъ, &VirtualDispose);
    }

    //---------------------------------------------------------------------
/*
    override protected проц dtor()
    {
        wxCalendarDateAttr_dtor(вхобъ);
    }
	*/
	//----------------------------
		export ~this(){wxCalendarDateAttr_dtor(this.м_вхобъ);}
	//----------------------------

    //-----------------------------------------------------------------------------

    export проц цветТекста(Цвет значение)
    {
        wxCalendarDateAttr_SetTextColour(this.м_вхобъ, ВизОбъект.безопУк(значение));
    }
    export Цвет цветТекста()
    {
        return new Цвет(wxCalendarDateAttr_GetTextColour(this.м_вхобъ));
    }

    //-----------------------------------------------------------------------------

    export проц цветФона(Цвет значение)
    {
        wxCalendarDateAttr_SetBackgroundColour(this.м_вхобъ, ВизОбъект.безопУк(значение));
    }
    export Цвет цветФона()
    {
        return new Цвет(wxCalendarDateAttr_GetBackgroundColour(вхобъ));
    }

    //-----------------------------------------------------------------------------

    export проц цветБордюра(Цвет значение)
    {
        wxCalendarDateAttr_SetBorderColour(this.м_вхобъ, ВизОбъект.безопУк(значение));
    }
    export Цвет цветБордюра()
    {
        return new Цвет(wxCalendarDateAttr_GetBorderColour(вхобъ));
    }

    //-----------------------------------------------------------------------------

    export проц шрифт(Шрифт значение)
    {
        wxCalendarDateAttr_SetFont(this.м_вхобъ, ВизОбъект.безопУк(значение));
    }
    export Шрифт шрифт()
    {
        return new Шрифт(wxCalendarDateAttr_GetFont(this.м_вхобъ));
    }

    //-----------------------------------------------------------------------------

    export проц бордюр(ПБордюрКалендарнойДаты значение)
    {
        wxCalendarDateAttr_SetBorder(this.м_вхобъ, cast(цел)значение);
    }
    export ПБордюрКалендарнойДаты бордюр()
    {
        return cast(ПБордюрКалендарнойДаты)wxCalendarDateAttr_GetBorder(this.м_вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц праздник(бул значение)
    {
        wxCalendarDateAttr_SetHoliday(this.м_вхобъ, значение);
    }
    export бул Праздник()
    {
        return wxCalendarDateAttr_IsHoliday(this.м_вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул естьЦветТекста()
    {
        return wxCalendarDateAttr_HasTextColour(this.м_вхобъ);
    }

    export бул естьЦветФона()
    {
        return wxCalendarDateAttr_HasBackgroundColour(this.м_вхобъ);
    }

    export бул естьЦветБордюра()
    {
        return wxCalendarDateAttr_HasBorderColour(this.м_вхобъ);
    }

    export бул естьШрифт()
    {
        return wxCalendarDateAttr_HasFont(this.м_вхобъ);
    }

    export бул естьБордюр()
    {
        return wxCalendarDateAttr_HasBorder(this.м_вхобъ);
    }


    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new АтрДатыКалендаря(ptr);
    }
    //-----------------------------------------------------------------------------
}

//! \cond EXTERN
extern (C) ЦелУкз wxCalendarEvent_ctor();
extern (C) ЦелУкз wxCalendarEvent_ctor2(ЦелУкз cal, цел тип);
extern (C) ЦелУкз wxCalendarEvent_GetDate(ЦелУкз сам);
extern (C) цел    wxCalendarEvent_GetWeekDay(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеКалендаря : СобытиеКоманды
{
    export this(ЦелУкз объ)
    {
        super(объ);
    }

    export this()
    {
        super(wxCalendarEvent_ctor());
    }

    //-----------------------------------------------------------------------------

    export this(КалендарьКтрл cal, ТипСобытия тип)
    {
        super(wxCalendarEvent_ctor2(ВизОбъект.безопУк(cal), тип));
    }

    //-----------------------------------------------------------------------------

    export ДатаВремя дата()
    {
        return new ВизДатаВремя(wxCalendarEvent_GetDate(this.м_вхобъ));
    }

    export ПДеньНед деньНедели()
    {
        return cast(ПДеньНед)wxCalendarEvent_GetWeekDay(this.м_вхобъ);
    }

    export static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеКалендаря(объ);
    }

    static this()
    {
        this.Тип.СОБ_КАЛЕНДАРЬ_ВЫД_ИЗМЕНЕНО = wxEvent_EVT_CALENDAR_SEL_CHANGED();
        this.Тип.СОБ_КАЛЕНДАРЬ_ДЕНЬ_ИЗМЕНЁН = wxEvent_EVT_CALENDAR_DAY_CHANGED();
        this.Тип.СОБ_КАЛЕНДАРЬ_МЕСЯЦ_ИЗМЕНЁН = wxEvent_EVT_CALENDAR_MONTH_CHANGED();
        this.Тип.СОБ_КАЛЕНДАРЬ_ГОД_ИЗМЕНЁН = wxEvent_EVT_CALENDAR_YEAR_CHANGED();
        this.Тип.СОБ_КАЛЕНДАРЬ_ДВАЖДЫ_НАЖАТ = wxEvent_EVT_CALENDAR_DOUBLECLICKED();
        this.Тип.СОБ_КАЛЕНДАРЬ_ДЕНЬНЕДЕЛИ_НАЖАТ = wxEvent_EVT_CALENDAR_WEEKDAY_CLICKED();

        добавьТипСоб(this.Тип.СОБ_КАЛЕНДАРЬ_ВЫД_ИЗМЕНЕНО,            &СобытиеКалендаря.Нов);
        добавьТипСоб(this.Тип.СОБ_КАЛЕНДАРЬ_ДЕНЬ_ИЗМЕНЁН,            &СобытиеКалендаря.Нов);
        добавьТипСоб(this.Тип.СОБ_КАЛЕНДАРЬ_МЕСЯЦ_ИЗМЕНЁН,          &СобытиеКалендаря.Нов);
        добавьТипСоб(this.Тип.СОБ_КАЛЕНДАРЬ_ГОД_ИЗМЕНЁН,           &СобытиеКалендаря.Нов);
        добавьТипСоб(this.Тип.СОБ_КАЛЕНДАРЬ_ДВАЖДЫ_НАЖАТ,          &СобытиеКалендаря.Нов);
        добавьТипСоб(this.Тип.СОБ_КАЛЕНДАРЬ_ДЕНЬНЕДЕЛИ_НАЖАТ,        &СобытиеКалендаря.Нов);
    }
}

