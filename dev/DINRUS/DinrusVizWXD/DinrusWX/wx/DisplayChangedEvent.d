module wx.DisplayChangedEvent;

public import wx.common;
public import wx.Event;

//! \cond EXTERN
extern (C) ЦелУкз wxDisplayChangedEvent_ctor();
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеСменыДисплея : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        this(wxDisplayChangedEvent_ctor());
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеСменыДисплея(объ);
    }

    static this()
    {
        добавьТипСоб(Событие.Тип.СОБ_ДИСПЛЕЙ_ИЗМЕНЁН, &СобытиеСменыДисплея.Нов);
    }
}
