module wx.NcPaintEvent;
public import wx.common;

public import wx.Event;

//! \cond EXTERN
extern (C) ЦелУкз wxNcPaintEvent_ctor(цел ид);
//! \endcond

//-----------------------------------------------------------------------------


export class СобытиеРисованияНК : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(цел ид=0)
    {
        this(wxNcPaintEvent_ctor(ид));
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеРисованияНК(объ);
    }

    static this()
    {
        добавьТипСоб(super.Тип.СОБ_НК_РИСОВАНИЕ,				&СобытиеРисованияНК.Нов);
    }
}
