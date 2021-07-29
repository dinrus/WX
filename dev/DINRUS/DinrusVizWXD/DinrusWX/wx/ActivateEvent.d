module wx.ActivateEvent;
public import wx.common;
public import wx.Event;

//! \cond EXTERN
extern (C) ЦелУкз wxActivateEvent_ctor(цел тип, бул активен,цел ид);
extern (C) бул wxActivateEvent_GetActive(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеАктивации : Событие
{
    export this(ЦелУкз объ)
    {
        super(объ);
    }

    export this(ТипСобытия тип = Событие.Тип.СОБ_НУЛЛ, бул активен = да, цел ид = 0)
    {
        this(wxActivateEvent_ctor(тип, да, ид));
    }

    //-----------------------------------------------------------------------------

    export бул активен()
    {
        return wxActivateEvent_GetActive(this.м_вхобъ);
    }


    export static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеАктивации(объ);
    }

    static this()
    {
        добавьТипСоб(super.Тип.СОБ_АКТИВИРУЙ, &СобытиеАктивации.Нов);
    }
}
