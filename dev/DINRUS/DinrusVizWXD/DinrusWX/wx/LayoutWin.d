module wx.LayoutWin;
public import wx.common;
public import wx.SashWindow;
public import wx.Event;
public import wx.Frame;
public import wx.MDI;

public enum ПОриентацияВыкладки
{
    Горизонталь,
    Вертикаль
}

//-----------------------------------------------------------------------------

public enum ПРаскладкаВыкладки
{
    Никакая,
    Вверху,
    Слева,
    Справа,
    Внизу
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxSashLayoutWindow_ctor();
extern (C) бул wxSashLayoutWindow_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер размер, бцел стиль, ткст имя);
extern (C) ПРаскладкаВыкладки wxSashLayoutWindow_GetAlignment(ЦелУкз сам);
extern (C) ПОриентацияВыкладки wxSashLayoutWindow_GetOrientation(ЦелУкз сам);
extern (C) проц wxSashLayoutWindow_SetAlignment(ЦелУкз сам, ПРаскладкаВыкладки раскладка);
extern (C) проц wxSashLayoutWindow_SetOrientation(ЦелУкз сам, ПОриентацияВыкладки ориент);
extern (C) проц wxSashLayoutWindow_SetDefaultSize(ЦелУкз сам, inout Размер размер);
//! \endcond

//-----------------------------------------------------------------------------

export class ОкноСашВыкладки : СашОкно
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxSashLayoutWindow_ctor());
    }

    export this(Окно родитель, цел ид /*= ЛЮБОЙ*/, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль=С3Д|КЛИП_ОТПРЫСКИ, ткст имя = "layoutWindow")
    {
        super(wxSashLayoutWindow_ctor());
        if (!создай(родитель, ид, поз, размер, стиль, имя))
        {
            throw new ИсклНевернОперации("Не удалось создать ОкноСашВыкладки");
        }
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    export this(Окно родитель, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль=С3Д|КЛИП_ОТПРЫСКИ, ткст имя = "layoutWindow")
    {
        this(родитель, Окно.уникИд, поз, размер, стиль, имя);
    }

    //-----------------------------------------------------------------------------

    export override бул создай(Окно родитель, цел ид, inout Точка поз, inout Размер размер, цел стиль, ткст имя)
    {
        return wxSashLayoutWindow_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, поз, размер, cast(бцел)стиль, имя);
    }

    //-----------------------------------------------------------------------------

    export ПРаскладкаВыкладки дайРаскладку()
    {
        return wxSashLayoutWindow_GetAlignment(вхобъ);
    }
    export проц раскладка(ПРаскладкаВыкладки значение)
    {
        wxSashLayoutWindow_SetAlignment(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export ПОриентацияВыкладки ориентация()
    {
        return wxSashLayoutWindow_GetOrientation(вхобъ);
    }
    export проц ориентация(ПОриентацияВыкладки значение)
    {
        wxSashLayoutWindow_SetOrientation(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export проц дефРазмер(Размер значение)
    {
        wxSashLayoutWindow_SetDefaultSize(вхобъ, значение);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxLayoutAlgorithm_ctor();
extern (C) бул wxLayoutAlgorithm_LayoutMDIFrame(ЦелУкз сам, ЦелУкз рамка, inout Прямоугольник прям);
extern (C) бул wxLayoutAlgorithm_LayoutFrame(ЦелУкз сам, ЦелУкз рамка, ЦелУкз главОкно);
extern (C) бул wxLayoutAlgorithm_LayoutWindow(ЦелУкз сам, ЦелУкз рамка, ЦелУкз главОкно);
//! \endcond

//-----------------------------------------------------------------------------

export class АлгоритмВыкладки : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxLayoutAlgorithm_ctor());
    }

    //-----------------------------------------------------------------------------

    export бул выкладкаМДИРамки(РамкаРодителяМДИ рамка)
    {
        // FIXME
        Прямоугольник dummy;
        return выкладкаМДИРамки(рамка, dummy);
    }

    export бул выкладкаМДИРамки(РамкаРодителяМДИ рамка, Прямоугольник прям)
    {
        return wxLayoutAlgorithm_LayoutMDIFrame(вхобъ, ВизОбъект.безопУк(рамка), прям);
    }

    //-----------------------------------------------------------------------------

    export бул выкладкаРамки(Рамка рамка)
    {
        return выкладкаРамки(рамка, пусто);
    }

    export бул выкладкаРамки(Рамка рамка, Окно главОкно)
    {
        return wxLayoutAlgorithm_LayoutFrame(вхобъ, ВизОбъект.безопУк(рамка), ВизОбъект.безопУк(главОкно));
    }

    //-----------------------------------------------------------------------------

    export бул выкладкаОкна(Окно рамка)
    {
        return выкладкаОкна(рамка, пусто);
    }

    export бул выкладкаОкна(Окно рамка, Окно главОкно)
    {
        return wxLayoutAlgorithm_LayoutWindow(вхобъ, ВизОбъект.безопУк(рамка), ВизОбъект.безопУк(главОкно));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxQueryLayoutInfoEvent_ctor(цел ид);
extern (C) проц wxQueryLayoutInfoEvent_SetRequestedLength(ЦелУкз сам, цел length);
extern (C) цел wxQueryLayoutInfoEvent_GetRequestedLength(ЦелУкз сам);
extern (C) проц wxQueryLayoutInfoEvent_SetFlags(ЦелУкз сам, цел флаги);
extern (C) цел wxQueryLayoutInfoEvent_GetFlags(ЦелУкз сам);
extern (C) проц wxQueryLayoutInfoEvent_SetSize(ЦелУкз сам, inout Размер размер);
extern (C) проц wxQueryLayoutInfoEvent_GetSize(ЦелУкз сам, out Размер размер);
extern (C) проц wxQueryLayoutInfoEvent_SetOrientation(ЦелУкз сам, ПОриентацияВыкладки ориент);
extern (C) ПОриентацияВыкладки wxQueryLayoutInfoEvent_GetOrientation(ЦелУкз сам);
extern (C) проц wxQueryLayoutInfoEvent_SetAlignment(ЦелУкз сам, ПРаскладкаВыкладки раскладка);
extern (C) ПРаскладкаВыкладки wxQueryLayoutInfoEvent_GetAlignment(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------


export class СобытиеЗапросаИнфОВыкладке : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        this(0);
    }

    export this(цел ид)
    {
        super(wxQueryLayoutInfoEvent_ctor(ид));
    }

    //-----------------------------------------------------------------------------

    export цел требуемаяДлина()
    {
        return wxQueryLayoutInfoEvent_GetRequestedLength(вхобъ);
    }
    export проц требуемаяДлина(цел значение)
    {
        wxQueryLayoutInfoEvent_SetRequestedLength(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export цел флаги()
    {
        return wxQueryLayoutInfoEvent_GetFlags(вхобъ);
    }
    export проц флаги(цел значение)
    {
        wxQueryLayoutInfoEvent_SetFlags(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export Размер размер()
    {
        Размер размер;
        wxQueryLayoutInfoEvent_GetSize(вхобъ, размер);
        return размер;
    }
    export проц размер(Размер значение)
    {
        wxQueryLayoutInfoEvent_SetSize(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export ПОриентацияВыкладки ориентация()
    {
        return wxQueryLayoutInfoEvent_GetOrientation(вхобъ);
    }
    export проц ориентация(ПОриентацияВыкладки значение)
    {
        wxQueryLayoutInfoEvent_SetOrientation(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export ПРаскладкаВыкладки раскладка()
    {
        return wxQueryLayoutInfoEvent_GetAlignment(вхобъ);
    }
    export проц раскладка(ПРаскладкаВыкладки значение)
    {
        wxQueryLayoutInfoEvent_SetAlignment(вхобъ, значение);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеЗапросаИнфОВыкладке(объ);
    }

    static this()
    {
        super.Тип.СОБ_ЗАПРОС_ИНФО_ВЫКЛАДКИ = wxEvent_EVT_QUERY_LAYOUT_INFO();

        добавьТипСоб (super.Тип.СОБ_ЗАПРОС_ИНФО_ВЫКЛАДКИ,  &СобытиеЗапросаИнфОВыкладке.Нов);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxCalculateLayoutEvent_ctor(цел ид);
extern (C) проц wxCalculateLayoutEvent_SetFlags(ЦелУкз сам, цел флаги);
extern (C) цел wxCalculateLayoutEvent_GetFlags(ЦелУкз сам);
extern (C) проц wxCalculateLayoutEvent_SetRect(ЦелУкз сам, inout Прямоугольник прям);
extern (C) проц wxCalculateLayoutEvent_GetRect(ЦелУкз сам, out Прямоугольник прям);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеРассчётаВыкладки : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        this(0);
    }

    export this(цел ид)
    {
        super(wxCalculateLayoutEvent_ctor(ид));
    }

    //-----------------------------------------------------------------------------

    export цел флаги()
    {
        return wxCalculateLayoutEvent_GetFlags(вхобъ);
    }
    export проц флаги(цел значение)
    {
        wxCalculateLayoutEvent_SetFlags(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export Прямоугольник прям()
    {
        Прямоугольник прям;
        wxCalculateLayoutEvent_GetRect(вхобъ, прям);
        return прям;
    }

    export проц прям(Прямоугольник значение)
    {
        wxCalculateLayoutEvent_SetRect(вхобъ, значение);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеРассчётаВыкладки(объ);
    }

    static this()
    {
        super.Тип.СОБ_РАССЧЁТ_ВЫКЛАДКИ = wxEvent_EVT_CALCULATE_LAYOUT();

        добавьТипСоб (super.Тип.СОБ_РАССЧЁТ_ВЫКЛАДКИ,   &СобытиеРассчётаВыкладки.Нов);
    }
}
