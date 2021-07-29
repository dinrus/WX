module wx.InitDialogEvent;
public import wx.common;
public import wx.Event;

//! \cond EXTERN
extern (C) ЦелУкз wxInitDialogEvent_ctor(цел ид);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеИницДиалог : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(цел ид = 0)
    {
        this(wxInitDialogEvent_ctor(ид));
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеИницДиалог(объ);
    }

    static this()
    {
        добавьТипСоб(super.Тип.СОБ_ИНИЦ_ДИАЛОГ,				&СобытиеИницДиалог.Нов);
    }
}
