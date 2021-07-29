module wx.ChildFocusEvent;
public import wx.common;

public import wx.CommandEvent;
public import wx.Window;

//! \cond EXTERN
extern (C) ЦелУкз wxChildFocusEvent_ctor(ЦелУкз ок);
extern (C) ЦелУкз wxChildFocusEvent_GetWindow(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеФокусОтпрыска : СобытиеКоманды
{
    export this(ЦелУкз объ)
    {
        super(объ);
    }

    export this(Окно ок)
    {
        super(wxChildFocusEvent_ctor(ВизОбъект.безопУк(ок)));
    }

    //-----------------------------------------------------------------------------

    export Окно окно()
    {
        return cast(Окно)найдиОбъект(wxChildFocusEvent_GetWindow(this.м_вхобъ), &Окно.Нов);
    }

    export static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеФокусОтпрыска(объ);
    }

    static this()
    {
        добавьТипСоб(Событие.Тип.СОБ_ОТПРЫСК_ФОКУС, &СобытиеФокусОтпрыска.Нов);
    }
}
