module wx.MaximizeEvent;

public import wx.common;
public import wx.Event;

//! \cond EXTERN
extern (C) ЦелУкз wxMaximizeEvent_ctor(цел ид);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеМаксимируй : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(цел ид = 0)
    {
        this(wxMaximizeEvent_ctor(ид));
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеМаксимируй(объ);
    }

    static this()
    {
        добавьТипСоб(super.Тип.СОБ_МАКСИМИРУЙ, &СобытиеМаксимируй.Нов);
    }
}
