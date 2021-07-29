/// The wxArrayInt wrapper class
module wx.ArrayInt;
public import wx.common;

//! \cond EXTERN
extern (C) ЦелУкз wxArrayInt_ctor();
extern (C) проц   wxArrayInt_dtor(ЦелУкз сам);
extern (C) проц   wxArrayInt_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
extern (C) проц   wxArrayInt_Add(ЦелУкз сам, цел доб);
extern (C) цел    wxArrayInt_Item(ЦелУкз сам, цел чис);
extern (C) цел    wxArrayInt_GetCount(ЦелУкз сам);
//! \endcond

export class ЦелМассив : ВизОбъект
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
        this(wxArrayInt_ctor(), да);
        wxArrayInt_RegisterDisposable(this.м_вхобъ, &VirtualDispose);
    }

    //---------------------------------------------------------------------

    export цел[] вМассив()
    {
        цел счёт = this.счёт;
        цел[] tmpi = new цел[счёт];
        for (цел i = 0; i < счёт; i++)
            tmpi[i] = this.элт(i);
        return tmpi;
    }

    export проц добавь(цел доб)
    {
        wxArrayInt_Add(this.м_вхобъ, доб);
    }

    export цел элт(цел чис)
    {
        return wxArrayInt_Item(this.м_вхобъ, чис);
    }

    export цел счёт()
    {
        return wxArrayInt_GetCount(this.м_вхобъ);
    }

    //---------------------------------------------------------------------
/*
    override protected проц dtor()
    {
        wxArrayInt_dtor(вхобъ);
    }
    */
	//----------------------------
		export ~this(){wxArrayInt_dtor(this.м_вхобъ);}
	//----------------------------
}

