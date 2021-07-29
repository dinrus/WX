module wx.NotifyEvent;
public import wx.common;
public import wx.CommandEvent;


//! \cond EXTERN
extern (C) ЦелУкз wxNotifyEvent_ctor(ТипСобытия типКоманды,цел идок);
extern (C) проц   wxNotifyEvent_Veto(ЦелУкз сам);
extern (C) проц   wxNotifyEvent_Allow(ЦелУкз сам);
extern (C) бул   wxNotifyEvent_IsAllowed(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеУведоми : СобытиеКоманды
{

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(ТипСобытия типКоманды = Событие.Тип.СОБ_НУЛЛ, цел идок = 0)
    {
        this(wxNotifyEvent_ctor(типКоманды,идок));
    }

    export проц запрет()
    {
        wxNotifyEvent_Veto(вхобъ);
    }
	
    export проц позволить()
    {
        wxNotifyEvent_Veto(вхобъ);
    }
	
    export проц позволено()
    {
        return wxNotifyEvent_IsAllowed(вхобъ);
    }
}
