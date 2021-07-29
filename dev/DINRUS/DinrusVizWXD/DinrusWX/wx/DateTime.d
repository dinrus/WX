module wx.DateTime;
public import wx.common;
//private import std.дата;

alias ВизДатаВремя ДатаВремя;
enum ПДеньНед
{
    Sun, Mon, Tue, Wed, Thu, Fri, Sat, Инв_ДеньНед
};

/* ВизДатаВремя imprementation is class { longlong } */

//! \cond EXTERN
extern (C) ЦелУкз wxDefaultDateTime_Get();
extern (C) ЦелУкз wxDateTime_ctor();
extern (C) ЦелУкз wxDateTime_Now();
extern (C) проц   wxDateTime_dtor(ЦелУкз сам);
extern (C) проц   wxDateTime_Set(ЦелУкз сам, бкрат день, цел месяц, цел год, бкрат час, бкрат минута, бкрат секунда, бкрат миллисекунда);
extern (C) бкрат wxDateTime_GetYear(ЦелУкз сам);
extern (C) цел    wxDateTime_GetMonth(ЦелУкз сам);
extern (C) бкрат wxDateTime_GetDay(ЦелУкз сам);
extern (C) бкрат wxDateTime_GetHour(ЦелУкз сам);
extern (C) бкрат wxDateTime_GetMinute(ЦелУкз сам);
extern (C) бкрат wxDateTime_GetSecond(ЦелУкз сам);
extern (C) бкрат wxDateTime_GetMillisecond(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

/// ВизДатаВремя class represents an absolute moment in time.
export class ВизДатаВремя : ВизОбъект
{
    static ВизДатаВремя ДефДатаВремя;
    static this()
    {
        ДефДатаВремя = new ВизДатаВремя(wxDefaultDateTime_Get());
    }

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    private this(ЦелУкз вхобъ, бул памСобств)
    {
        super(вхобъ);
        this.памСобств = памСобств;
    }

    export this()
    {
        this(wxDateTime_ctor(), да);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxDateTime_dtor(this.м_вхобъ);
    }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
    //-----------------------------------------------------------------------------

    export проц установи(бкрат день, цел месяц, цел год, бкрат час, бкрат минута, бкрат секунда, бкрат миллисекунда)
    {
        wxDateTime_Set(this.м_вхобъ, день, месяц, год, час, минута, секунда, миллисекунда);
    }

    //-----------------------------------------------------------------------------

    export бкрат год()
    {
        return wxDateTime_GetYear(this.м_вхобъ);
    }

    export цел месяц()
    {
        return wxDateTime_GetMonth(this.м_вхобъ);
    }

    export бкрат день()
    {
        return wxDateTime_GetDay(this.м_вхобъ);
    }

    export бкрат час()
    {
        return wxDateTime_GetHour(this.м_вхобъ);
    }

    export бкрат минута()
    {
        return wxDateTime_GetMinute(this.м_вхобъ);
    }

    export бкрат секунда()
    {
        return wxDateTime_GetSecond(this.м_вхобъ);
    }

    export бкрат миллисекунда()
    {
        return wxDateTime_GetMillisecond(this.м_вхобъ);
    }

    static ВизДатаВремя сейчас()
    {
        return new ВизДатаВремя(wxDateTime_Now());
    }
    //-----------------------------------------------------------------------------
    /+
    export static implicit operator ДатаВремя (ВизДатаВремя wdt)
    {
        ДатаВремя dt = new ДатаВремя(wdt.год, cast(цел)wdt.месяц+1, cast(цел)wdt.день,
                                   cast(цел)wdt.час, cast(цел)wdt.минута,
                                   cast(цел)wdt.секунда, cast(цел)wdt.миллисекунда);
        return dt;
    }

    export static implicit operator ВизДатаВремя (ДатаВремя dt)
    {
        ВизДатаВремя wdt = new ВизДатаВремя();
        wdt.установи((бкрат)dt.день, dt.месяц-1, dt.год, (бкрат)dt.час,
                (бкрат)dt.минута, (бкрат)dt.секунда,
                (бкрат)dt.миллисекунда);
        return wdt;
    }
    +/
    //-----------------------------------------------------------------------------
}
