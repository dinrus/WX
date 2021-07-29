module wx.Timer;
public import wx.common;
public import wx.EvtHandler;

//---------------------------------------------------------------------------
// Constants for Таймер.Play
//---------------------------------------------------------------------------

/// generate notifications periodically until the timer is stopped (default)
const бул ТАЙМЕР_ПРОДОЛЖИТЕЛЬНЫЙ = нет;

/// only send the notification once and then stop the timer
const бул ТАЙМЕР_ОДНОРАЗОВЫЙ = да;

//-----------------------------------------------------------------------------

extern (C)
{
    alias проц function (Таймер) Virtual_Notify;
}

//! \cond EXTERN
extern (C) ЦелУкз wxTimer_ctor();
extern (C) ЦелУкз wxTimer_ctor2(ЦелУкз владелец, цел ид);
extern (C) проц   wxTimer_RegisterVirtual(ЦелУкз сам, Таймер объ,
        Virtual_Notify notify);
extern (C) ЦелУкз wxTimer_dtor(ЦелУкз сам);

extern (C) цел wxTimer_GetInterval(ЦелУкз сам);
extern (C) бул wxTimer_IsOneShot(ЦелУкз сам);
extern (C) бул wxTimer_IsRunning(ЦелУкз сам);
extern (C) проц wxTimer_BaseNotify(ЦелУкз сам);
extern (C) проц wxTimer_SetOwner(ЦелУкз сам, ЦелУкз владелец, цел ид);
extern (C) бул wxTimer_Start(ЦелУкз сам, цел миллисек, бул oneShot);
extern (C) проц wxTimer_Stop(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class Таймер : ОбработчикСоб
{

    export this()
    {
        this(wxTimer_ctor(), да);
    }

    export this(ОбработчикСоб владелец, цел ид=-1)
    {
        this(wxTimer_ctor2(владелец.вхобъ, ид), да);
    }

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);

        wxTimer_RegisterVirtual(вхобъ, this, &staticNotify);
    }

    private this(ЦелУкз вхобъ, бул памСобств)
    {
        super(вхобъ);
        this.памСобств = памСобств;

        wxTimer_RegisterVirtual(вхобъ, this, &staticNotify);
    }

    override protected проц dtor()
    {
        wxTimer_dtor(вхобъ);
    }
		//----------------------------
		export ~this(){this.dtor();}
	//----------------------------

    //---------------------------------------------------------------------

    static export extern(C) проц staticNotify(Таймер объ)
    {
        объ.уведоми();
    }
    export  проц уведоми()
    {
        wxTimer_BaseNotify(вхобъ);
    }

    //---------------------------------------------------------------------

    export цел интервал()
    {
        return wxTimer_GetInterval(вхобъ);
    }

    export бул однократен()
    {
        return wxTimer_IsOneShot(вхобъ);
    }

    export бул пущен()
    {
        return wxTimer_IsRunning(вхобъ);
    }

    export проц устВладельца(ОбработчикСоб владелец, цел ид=-1)
    {
        wxTimer_SetOwner(вхобъ, владелец.вхобъ, ид);
    }

    export бул старт(цел миллисек=-1, бул oneShot=нет)
    {
        return wxTimer_Start(вхобъ, миллисек, oneShot);
    }

    export проц стоп()
    {
        wxTimer_Stop(вхобъ);
    }

}
