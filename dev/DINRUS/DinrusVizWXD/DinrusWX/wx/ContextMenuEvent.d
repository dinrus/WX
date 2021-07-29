module wx.ContextMenuEvent;
public import wx.common;

public import wx.CommandEvent;
public import wx.Window;

//! \cond EXTERN
extern (C) ЦелУкз wxContextMenuEvent_ctor(цел тип,цел идок, inout Точка поз);
extern (C) проц   wxContextMenuEvent_GetPosition(ЦелУкз сам, inout Точка поз);
extern (C) проц   wxContextMenuEvent_SetPosition(ЦелУкз сам, inout Точка поз);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеКонтекстногоМеню : СобытиеКоманды
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(ТипСобытия тип = Тип.СОБ_НУЛЛ, цел идок = 0, Точка тчк = Окно.ДЕФПОЗ)
    {
        this(wxContextMenuEvent_ctor(тип,идок,тчк));
    }

    //-----------------------------------------------------------------------------

    export Точка позиция()
    {
        Точка p;
        wxContextMenuEvent_GetPosition(this.м_вхобъ, p);
        return p;
    }

    export проц позиция(Точка значение)
    {
        wxContextMenuEvent_SetPosition(this.м_вхобъ, значение);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеКонтекстногоМеню(объ);
    }

    static this()
    {
        добавьТипСоб(Событие.Тип.СОБ_КОНТЕКСТ_МЕНЮ, &СобытиеКонтекстногоМеню.Нов);
    }
}
