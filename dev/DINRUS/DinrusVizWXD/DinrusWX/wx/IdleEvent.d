module wx.IdleEvent;
public import wx.common;

public import wx.Event;
public import wx.Window;

public enum ПРежимБездействия
{
    ПроцессВсе,
    ПроцессУказанный
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxIdleEvent_ctor();
extern (C) проц   wxIdleEvent_RequestMore(ЦелУкз сам, бул нужноЕщё);
extern (C) бул   wxIdleEvent_MoreRequested(ЦелУкз сам);

extern (C) проц   wxIdleEvent_SetMode(ПРежимБездействия режим);
extern (C) ПРежимБездействия wxIdleEvent_GetMode();
extern (C) бул   wxIdleEvent_CanSend(ЦелУкз ок);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеБездействия : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        this(wxIdleEvent_ctor());
    }

    //-----------------------------------------------------------------------------

    export проц запросиЕщё()
    {
        запросиЕщё(да);
    }

    export проц запросиЕщё(бул нужноЕщё)
    {
        wxIdleEvent_RequestMore(вхобъ, нужноЕщё);
    }

    //-----------------------------------------------------------------------------

    export бул ещёЗапрошено()
    {
        return wxIdleEvent_MoreRequested(вхобъ);
    }

    //-----------------------------------------------------------------------------

    static ПРежимБездействия режим()
    {
        return wxIdleEvent_GetMode();
    }
    static проц режим(ПРежимБездействия значение)
    {
        wxIdleEvent_SetMode(значение);
    }

    //-----------------------------------------------------------------------------

    export static бул можноОтправить(Окно ок)
    {
        return wxIdleEvent_CanSend(ВизОбъект.безопУк(ок));
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеБездействия(объ);
    }

    static this()
    {
        добавьТипСоб(super.Тип.СОБ_БЕЗДЕЙСТВИЕ, &СобытиеБездействия.Нов);
    }
}
