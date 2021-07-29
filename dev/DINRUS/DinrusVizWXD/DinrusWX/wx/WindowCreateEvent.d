module wx.WindowCreateEvent;
public import wx.common;

public import wx.CommandEvent;

public import wx.Window;

//! \cond EXTERN
extern (C) ЦелУкз wxWindowCreateEvent_ctor(ЦелУкз тип);
extern (C) ЦелУкз wxWindowCreateEvent_GetWindow(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеСоздатьОкно : СобытиеКоманды
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(Окно ок = пусто)
    {
        this(wxWindowCreateEvent_ctor(ВизОбъект.безопУк(ок)));
    }

    //-----------------------------------------------------------------------------

    export Окно активен()
    {
        return cast(Окно)найдиОбъект(wxWindowCreateEvent_GetWindow(вхобъ), &Окно.Нов);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеСоздатьОкно(объ);
    }

    static this()
    {
        добавьТипСоб(Событие.Тип.СОБ_СОЗДАЙ,	&СобытиеСоздатьОкно.Нов);
    }
}
