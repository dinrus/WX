module wx.PaintEvent;
public import wx.common;

public import wx.Event;

//! \cond EXTERN
extern (C) ЦелУкз wxPaintEvent_ctor(цел ид);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеРисования : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(цел ид = 0)
    {
        this(wxPaintEvent_ctor(ид));
    }
}
