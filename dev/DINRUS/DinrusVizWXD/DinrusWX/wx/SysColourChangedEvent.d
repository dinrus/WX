module wx.SysColourChangedEvent;
public import wx.common;

public import wx.Event;

//! \cond EXTERN
extern (C) ЦелУкз wxSysColourChangedEvent_ctor();
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеСменыСистемногоЦвета : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        this(wxSysColourChangedEvent_ctor());
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеСменыСистемногоЦвета(объ);
    }

    static this()
    {
        добавьТипСоб(super.Тип.СОБ_СИС_ЦВЕТ_ИЗМЕНЁН, &СобытиеСменыСистемногоЦвета.Нов);
    }
}
