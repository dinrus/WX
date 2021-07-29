module wx.SashWindow;
public import wx.common;
public import wx.Window;
public import wx.CommandEvent;

public enum ППозицияКраяСаша
{
    Верх = 0,
    Право,
    Низ,
    Лево,
    Нет = 100
}

//-----------------------------------------------------------------------------

public enum ПСтатусТягаСаша
{
    Ок,
    ВнеДиапазона
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxSashEdge_ctor();
extern (C) проц wxSashEdge_dtor(ЦелУкз сам);
extern (C) бул wxSashEdge_m_show(ЦелУкз сам);
extern (C) бул wxSashEdge_m_border(ЦелУкз сам);
extern (C) цел wxSashEdge_m_margin(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class КрайСаша : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    private this(ЦелУкз вхобъ, бул памСобств)
    {
        super(вхобъ);
        this.памСобств = памСобств;
    }

    export this()
    {
        this(wxSashEdge_ctor(), да);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxSashEdge_dtor(вхобъ);
    }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
    //-----------------------------------------------------------------------------

    export бул m_show()
    {
        return wxSashEdge_m_show(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул m_border()
    {
        return wxSashEdge_m_border(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export цел m_margin()
    {
        return wxSashEdge_m_margin(вхобъ);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxSashWindow_ctor();
extern (C) бул wxSashWindow_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер размер, бцел стиль, ткст имя);
extern (C) проц wxSashWindow_SetSashVisible(ЦелУкз сам, ППозицияКраяСаша край, бул sash);
extern (C) бул wxSashWindow_GetSashVisible(ЦелУкз сам, ППозицияКраяСаша край);
extern (C) проц wxSashWindow_SetSashBorder(ЦелУкз сам, ППозицияКраяСаша край, бул бордюр);
extern (C) бул wxSashWindow_HasBorder(ЦелУкз сам, ППозицияКраяСаша край);
extern (C) цел wxSashWindow_GetEdgeMargin(ЦелУкз сам, ППозицияКраяСаша край);
extern (C) проц wxSashWindow_SetDefaultBorderSize(ЦелУкз сам, цел ширь);
extern (C) цел wxSashWindow_GetDefaultBorderSize(ЦелУкз сам);
extern (C) проц wxSashWindow_SetExtraBorderSize(ЦелУкз сам, цел ширь);
extern (C) цел wxSashWindow_GetExtraBorderSize(ЦелУкз сам);
extern (C) проц wxSashWindow_SetMinimumSizeX(ЦелУкз сам, цел мин);
extern (C) проц wxSashWindow_SetMinimumSizeY(ЦелУкз сам, цел мин);
extern (C) цел wxSashWindow_GetMinimumSizeX(ЦелУкз сам);
extern (C) цел wxSashWindow_GetMinimumSizeY(ЦелУкз сам);
extern (C) проц wxSashWindow_SetMaximumSizeX(ЦелУкз сам, цел макс);
extern (C) проц wxSashWindow_SetMaximumSizeY(ЦелУкз сам, цел макс);
extern (C) цел wxSashWindow_GetMaximumSizeX(ЦелУкз сам);
extern (C) цел wxSashWindow_GetMaximumSizeY(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class СашОкно : Окно
{
    enum
    {
        БЕЗ_БОРДЮРА	= 0x0000,
        БОРДЮР	= 0x0020,
        САШ3Д	= 0x0040,
        БОРДЮР3Д	= 0x0080,
        С3Д	= САШ3Д | БОРДЮР3Д,
    }
    enum
    {
        ТЯГ_НЕТ	= 0,
        ТЯГ_ТЯНЕТ	= 1,
        ТЯГ_ВЛЕВО_ВНИЗ	= 2,
    }

    //-----------------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxSashWindow_ctor());
    }

    export this(Окно родитель, цел ид /*= ЛЮБОЙ*/, Точка поз=ДЕФПОЗ, Размер размер=ДЕФРАЗМ, цел стиль=С3Д|КЛИП_ОТПРЫСКИ, ткст имя="sashWindow")
    {
        super(wxSashWindow_ctor());
        if (!создай(родитель, ид, поз, размер, стиль, имя))
        {
            throw new ИсклНевернОперации("Не удалось создать СашОкно");
        }
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    export this(Окно родитель, Точка поз=ДЕФПОЗ, Размер размер=ДЕФРАЗМ, цел стиль=С3Д|КЛИП_ОТПРЫСКИ, ткст имя="sashWindow")
    {
        this(родитель, Окно.уникИд, поз, размер, стиль, имя);
    }

    //-----------------------------------------------------------------------------

    export бул создай(Окно родитель, цел ид, inout Точка поз, inout Размер размер, цел стиль, ткст имя)
    {
        return wxSashWindow_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, поз, размер, стиль, имя);
    }

    //-----------------------------------------------------------------------------

    export проц устСашВидимым(ППозицияКраяСаша край, бул sash)
    {
        wxSashWindow_SetSashVisible(вхобъ, край, sash);
    }

    //-----------------------------------------------------------------------------

    export бул дайСашВидимый(ППозицияКраяСаша край)
    {
        return wxSashWindow_GetSashVisible(вхобъ, край);
    }

    //-----------------------------------------------------------------------------

    export проц устБордюрСаша(ППозицияКраяСаша край, бул бордюр)
    {
        wxSashWindow_SetSashBorder(вхобъ, край, бордюр);
    }

    //-----------------------------------------------------------------------------

    export цел дайМаржинКрая(ППозицияКраяСаша край)
    {
        return wxSashWindow_GetEdgeMargin(вхобъ, край);
    }

    //-----------------------------------------------------------------------------

    export цел дефРазмБордюра()
    {
        return wxSashWindow_GetDefaultBorderSize(вхобъ);
    }
    export проц дефРазмБордюра(цел значение)
    {
        wxSashWindow_SetDefaultBorderSize(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export цел внешнРазмБордюра()
    {
        return wxSashWindow_GetExtraBorderSize(вхобъ);
    }
    export проц внешнРазмБордюра(цел значение)
    {
        wxSashWindow_SetExtraBorderSize(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export цел минРазмХ()
    {
        return wxSashWindow_GetMinimumSizeX(вхобъ);
    }
    export проц минРазмХ(цел значение)
    {
        wxSashWindow_SetMinimumSizeX(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export цел минРазмУ()
    {
        return wxSashWindow_GetMinimumSizeY(вхобъ);
    }
    export проц минРазмУ(цел значение)
    {
        wxSashWindow_SetMinimumSizeY(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export цел максРазмХ()
    {
        return wxSashWindow_GetMaximumSizeX(вхобъ);
    }
    export проц максРазмХ(цел значение)
    {
        wxSashWindow_SetMaximumSizeX(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export цел максРазмУ()
    {
        return wxSashWindow_GetMaximumSizeY(вхобъ);
    }
    export проц максРазмУ(цел значение)
    {
        wxSashWindow_SetMaximumSizeY(вхобъ, значение);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxSashEvent_ctor(цел ид, ППозицияКраяСаша край);
extern (C) проц wxSashEvent_SetEdge(ЦелУкз сам, ППозицияКраяСаша край);
extern (C) ППозицияКраяСаша wxSashEvent_GetEdge(ЦелУкз сам);
extern (C) проц wxSashEvent_SetDragRect(ЦелУкз сам, inout Прямоугольник прям);
extern (C) проц wxSashEvent_GetDragRect(ЦелУкз сам, out Прямоугольник прям);
extern (C) проц wxSashEvent_SetDragStatus(ЦелУкз сам, ПСтатусТягаСаша status);
extern (C) ПСтатусТягаСаша wxSashEvent_GetDragStatus(ЦелУкз сам);
//! \endcond

export class СобытиеСаш : СобытиеКоманды
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        this(0, ППозицияКраяСаша.Нет);
    }

    export this(цел ид)
    {
        this(ид, ППозицияКраяСаша.Нет);
    }

    export this(цел ид, ППозицияКраяСаша край)
    {
        super(wxSashEvent_ctor(ид, край));
    }

    //-----------------------------------------------------------------------------

    export ППозицияКраяСаша край()
    {
        return wxSashEvent_GetEdge(вхобъ);
    }
    export проц край(ППозицияКраяСаша значение)
    {
        wxSashEvent_SetEdge(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export Прямоугольник прямТяга()
    {
        Прямоугольник прям;
        wxSashEvent_GetDragRect(вхобъ, прям);
        return прям;
    }
    export проц прямТяга(Прямоугольник значение)
    {
        wxSashEvent_SetDragRect(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export ПСтатусТягаСаша статусТяга()
    {
        return wxSashEvent_GetDragStatus(вхобъ);
    }
    export проц статусТяга(ПСтатусТягаСаша значение)
    {
        wxSashEvent_SetDragStatus(вхобъ, значение);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеСаш(объ);
    }

    static this()
    {
        super.Тип.СОБ_САШ_ПЕРЕТЯНУТ = wxEvent_EVT_SASH_DRAGGED();

        добавьТипСоб(super.Тип.СОБ_САШ_ПЕРЕТЯНУТ,  &СобытиеСаш.Нов);
    }
}
