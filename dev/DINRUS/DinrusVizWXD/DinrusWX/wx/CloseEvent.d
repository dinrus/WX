module wx.CloseEvent;
public import wx.common;
public import wx.Event;

//! \cond EXTERN
extern (C) ЦелУкз wxCloseEvent_ctor(цел тип,цел идок);
extern (C) проц wxCloseEvent_SetLoggingOff(ЦелУкз сам, бул логофф);
extern (C) бул wxCloseEvent_GetLoggingOff(ЦелУкз сам);
extern (C) проц wxCloseEvent_Veto(ЦелУкз сам, бул вето);
extern (C) проц wxCloseEvent_SetCanVeto(ЦелУкз сам, бул можЗапр);
extern (C) бул wxCloseEvent_CanVeto(ЦелУкз сам);
extern (C) бул wxCloseEvent_GetVeto(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеЗакрытия : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(ТипСобытия тип = Тип.СОБ_НУЛЛ, цел идок = 0)
    {
        this(wxCloseEvent_ctor(тип,идок));
    }

    //-----------------------------------------------------------------------------

    export бул разлогин()
    {
        return wxCloseEvent_GetLoggingOff(this.м_вхобъ);
    }
    export проц разлогин(бул значение)
    {
        wxCloseEvent_SetLoggingOff(this.м_вхобъ, значение);
    }

    export проц запрет()
    {
        запрет(да);
    }

    export проц запрет(бул вето)
    {
        wxCloseEvent_Veto(this.м_вхобъ, вето);
    }

    export проц можноЗапрещать(бул значение)
    {
        wxCloseEvent_SetCanVeto(this.м_вхобъ, значение);
    }
    export бул можноЗапрещать()
    {
        return wxCloseEvent_CanVeto(this.м_вхобъ);
    }

    export бул дайЗапрет()
    {
        return wxCloseEvent_GetVeto(this.м_вхобъ);
    }

    export static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеЗакрытия(объ);
    }

    static this()
    {
        добавьТипСоб(Событие.Тип.СОБ_ЗАКРОЙ_ОКНО, &СобытиеЗакрытия.Нов);
        добавьТипСоб(Событие.Тип.СОБ_КОНЕЦ_СЕССИИ, &СобытиеЗакрытия.Нов);
        добавьТипСоб(Событие.Тип.СОБ_ЗАПРОС_КОНЕЦ_СЕССИИ, &СобытиеЗакрытия.Нов);
    }
}
