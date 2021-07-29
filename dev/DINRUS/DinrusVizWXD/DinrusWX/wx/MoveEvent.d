module wx.MoveEvent;
public import wx.common;
public import wx.Event;

//! \cond EXTERN
extern (C) ЦелУкз wxMoveEvent_ctor();
extern (C) ЦелУкз wxMoveEvent_GetPosition(ЦелУкз сам, out Точка Точка);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеДвижения : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        this(wxMoveEvent_ctor());
    }

    //-----------------------------------------------------------------------------

    export Точка позиция()
    {
        Точка Точка;
        wxMoveEvent_GetPosition(вхобъ, Точка);
        return Точка;
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеДвижения(объ);
    }

    static this()
    {
        добавьТипСоб(super.Тип.СОБ_ДВИГАЙ,  &СобытиеДвижения.Нов);
    }
}
