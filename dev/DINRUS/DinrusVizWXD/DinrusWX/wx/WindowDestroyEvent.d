module wx.WindowDestroyEvent;
public import wx.common;

public import wx.CommandEvent;

public import wx.Window;

//! \cond EXTERN
extern (C) ЦелУкз wxWindowDestroyEvent_ctor(ЦелУкз тип);
extern (C) ЦелУкз wxWindowDestroyEvent_GetWindow(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеРазрушьОкно : СобытиеКоманды
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(Окно ок = пусто)
    {
        this(wxWindowDestroyEvent_ctor(ВизОбъект.безопУк(ок)));
    }

    //-----------------------------------------------------------------------------

    export Окно активен()
    {
        return cast(Окно)найдиОбъект(wxWindowDestroyEvent_GetWindow(вхобъ), &Окно.Нов);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеРазрушьОкно(объ);
    }

    static this()
    {
        добавьТипСоб(Событие.Тип.СОБ_РАЗРУШЬ, &СобытиеРазрушьОкно.Нов);
    }
}
