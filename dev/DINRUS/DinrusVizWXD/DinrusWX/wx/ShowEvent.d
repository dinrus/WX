module wx.ShowEvent;
public import wx.common;

public import wx.Event;

//! \cond EXTERN
extern (C) ЦелУкз wxShowEvent_ctor(цел идок, бул показ);
extern (C) бул wxShowEvent_GetShow(ЦелУкз сам);
extern (C) проц wxShowEvent_SetShow(ЦелУкз сам, бул показ);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеПоказа : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(цел идок = 0, бул показ = нет)
    {
        this(wxShowEvent_ctor(идок,показ));
    }

    //-----------------------------------------------------------------------------

    export бул показ()
    {
        return wxShowEvent_GetShow(вхобъ);
    }
    export проц показ(бул значение)
    {
        wxShowEvent_SetShow(вхобъ, значение);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеПоказа(объ);
    }

    static this()
    {
        добавьТипСоб(super.Тип.СОБ_ПОКАЖИ, &СобытиеПоказа.Нов);
    }
}
