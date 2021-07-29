module wx.ClientData;
public import wx.common;

//! \cond EXTERN
extern (C) ЦелУкз wxClientData_ctor();
extern (C) проц wxClientData_dtor(ЦелУкз сам);
extern (C) проц wxClientData_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
//! \endcond

//---------------------------------------------------------------------

export class ДанныеКлиента : ВизОбъект
{
    export this(ЦелУкз объ)
    {
        super(объ);
    }

    export this(ЦелУкз объ, бул памСобств)
    {
        super(объ);
        this.памСобств = памСобств;
    }

    export this()
    {
        this(wxClientData_ctor(), да);
        wxClientData_RegisterDisposable(this.м_вхобъ, &VirtualDispose);
    }

    //---------------------------------------------------------------------
/*
    override protected проц dtor()
    {
        wxClientData_dtor(вхобъ);
    }
    */
	//----------------------------
	export ~this(){wxClientData_dtor(this.м_вхобъ);}

	//----------------------------
    static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new ДанныеКлиента(ptr);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxStringClientData_ctor(ткст данные);
extern (C) проц   wxStringClientData_dtor(ЦелУкз сам);
extern (C) проц   wxStringClientData_SetData(ЦелУкз сам, ткст данные);
extern (C) ЦелУкз wxStringClientData_GetData(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

export class ТкстДанныеКлиента : ДанныеКлиента
{
    export this()
    {
        this(wxStringClientData_ctor(""), да);
    }

    export this(ткст данные)
    {
        this(wxStringClientData_ctor(данные), да);
    }

    export this(ЦелУкз объ)
    {
        super(объ);
    }

    export this(ЦелУкз объ, бул памСобств)
    {
        super(объ);
        this.памСобств = памСобств;
    }

    //---------------------------------------------------------------------
/*
    override protected проц dtor()
    {
        wxStringClientData_dtor(вхобъ);
    }
    */
	//----------------------------
		export ~this(){wxStringClientData_dtor(this.м_вхобъ);}
	//----------------------------
    //---------------------------------------------------------------------

    export ткст данные()
    {
        return cast(ткст) new ВизТкст(wxStringClientData_GetData(this.м_вхобъ), да);
    }
    export проц данные(ткст значение)
    {
        wxStringClientData_SetData(this.м_вхобъ, значение);
    }
}

