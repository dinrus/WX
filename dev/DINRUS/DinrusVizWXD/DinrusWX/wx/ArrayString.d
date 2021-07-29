/// The wxArrayString wrapper class
module wx.ArrayString;
public import wx.common;

//! \cond EXTERN
extern (C) ЦелУкз wxArrayString_ctor();
extern (C) проц   wxArrayString_dtor(ЦелУкз сам);
extern (C) проц   wxArrayString_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
extern (C) проц   wxArrayString_Add(ЦелУкз сам, ткст доб);
extern (C) ЦелУкз wxArrayString_Item(ЦелУкз сам, цел чис);
extern (C) цел    wxArrayString_GetCount(ЦелУкз сам);
//! \endcond

export class ТкстМассива : ВизОбъект
{
    //---------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(ЦелУкз вхобъ, бул памСобств)
    {
        super(вхобъ);
        this.памСобств = памСобств;
    }

    export this()
    {
        this(wxArrayString_ctor(), да);
        wxArrayString_RegisterDisposable(this.м_вхобъ, &VirtualDispose);
    }

    //---------------------------------------------------------------------

    export ткст[] вМассив()
    {
        цел счёт = this.счёт;
        ткст[] tmps = new ткст[счёт];
        for (цел i = 0; i < счёт; i++)
            tmps[i] = this.элт(i);
        return tmps;
    }

    export ткст элт(цел чис)
    {
        return cast(ткст) new ВизТкст(wxArrayString_Item(this.м_вхобъ, чис), да);
    }

    export проц добавь(ткст доб)
    {
        wxArrayString_Add(this.м_вхобъ, доб);
    }

    export цел счёт()
    {
        return wxArrayString_GetCount(this.м_вхобъ);
    }

    //---------------------------------------------------------------------
/*
    override protected проц dtor()
    {
        wxArrayString_dtor(вхобъ);
    }
    */
	//----------------------------
		export ~this(){wxArrayString_dtor(this.м_вхобъ);}
	//----------------------------
}

