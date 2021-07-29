module wx.HelpEvent;
public import wx.common;
public import wx.CommandEvent;
public import wx.Window;

//! \cond EXTERN
extern (C) ЦелУкз wxHelpEvent_ctor(цел тип,цел идок, inout Точка поз);
extern (C) проц   wxHelpEvent_GetPosition(ЦелУкз сам, inout Точка поз);
extern (C) проц   wxHelpEvent_SetPosition(ЦелУкз сам, inout Точка поз);
extern (C) ЦелУкз wxHelpEvent_GetLink(ЦелУкз сам);
extern (C) проц   wxHelpEvent_SetLink(ЦелУкз сам, ткст ссылка);
extern (C) ЦелУкз wxHelpEvent_GetTarget(ЦелУкз сам);
extern (C) проц   wxHelpEvent_SetTarget(ЦелУкз сам, ткст цель);
//! \endcond

//-----------------------------------------------------------------------------


export class СобытиеСправки : СобытиеКоманды
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(ТипСобытия тип = Тип.СОБ_НУЛЛ, цел идок = 0, Точка поз = Окно.ДЕФПОЗ)
    {
        this(wxHelpEvent_ctor(тип,идок,поз));
    }

    //-----------------------------------------------------------------------------

    export Точка позиция()
    {
        Точка p;
        wxHelpEvent_GetPosition(вхобъ, p);
        return p;
    }

    export проц позиция(Точка значение)
    {
        wxHelpEvent_SetPosition(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export ткст ссылка()
    {
        return cast(ткст) new ВизТкст(wxHelpEvent_GetLink(вхобъ), да);
    }
    export проц ссылка(ткст значение)
    {
        wxHelpEvent_SetLink(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export ткст цель()
    {
        return cast(ткст) new ВизТкст(wxHelpEvent_GetTarget(вхобъ), да);
    }
    export проц цель(ткст значение)
    {
        wxHelpEvent_SetTarget(вхобъ, значение);
    }


    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеСправки(объ);
    }

    static this()
    {
        добавьТипСоб(super.Тип.СОБ_СПРАВКА,				&СобытиеСправки.Нов);
        добавьТипСоб(super.Тип.СОБ_ПОДРОБНАЯ_СПРАВКА,			&СобытиеСправки.Нов);
    }
}
