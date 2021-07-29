module wx.DataObject;
public import wx.common;
public import wx.ArrayString;

export abstract class ОбъектДанных : ВизОбъект
{
    public enum ПНаправлениеДанных
    {
        Получить = 0x01,
        Установить = 0x02,
        Оба = 0x03
    }

    //---------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    private this(ЦелУкз вхобъ, бул памСобств)
    {
        super(вхобъ);
        this.памСобств = памСобств;
    }

    //---------------------------------------------------------------------

   // override protected проц dtor() {}
		//----------------------------
		export ~this(){}
	//----------------------------
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxDataObjectSimple_ctor(ЦелУкз format);
extern (C) проц wxDataObjectSimple_dtor(ЦелУкз сам);
extern (C) проц wxDataObjectSimple_SetFormat(ЦелУкз сам, ЦелУкз format);
extern (C) бцел wxDataObjectSimple_GetDataSize(ЦелУкз сам);
extern (C) бул wxDataObjectSimple_GetDataHere(ЦелУкз сам, ЦелУкз buf);
extern (C) бул wxDataObjectSimple_SetData(ЦелУкз сам, бцел len, ЦелУкз buf);
//! \endcond

//---------------------------------------------------------------------

export class ПростойОбъектДанных : ОбъектДанных
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    private this(ЦелУкз вхобъ, бул памСобств)
    {
        super(вхобъ);
        this.памСобств = памСобств;
    }

    //---------------------------------------------------------------------
/*
    override protected проц dtor()
    {
        wxDataObjectSimple_dtor(this.м_вхобъ);
    }
    */
		//----------------------------
		export ~this(){wxDataObjectSimple_dtor(this.м_вхобъ);}
	//----------------------------
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxTextDataObject_ctor(ткст текст);
extern (C) проц wxTextDataObject_dtor(ЦелУкз сам);
extern (C) проц wxTextDataObject_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
extern (C) цел wxTextDataObject_GetTextLength(ЦелУкз сам);
extern (C) ЦелУкз wxTextDataObject_GetText(ЦелУкз сам);
extern (C) проц wxTextDataObject_SetText(ЦелУкз сам, ткст текст);
//! \endcond

//---------------------------------------------------------------------

export class ОбъектТекстДанных : ПростойОбъектДанных
{
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
        this("");
    }

    export this(ткст текст)
    {
        this(wxTextDataObject_ctor(текст), да);
        wxTextDataObject_RegisterDisposable(this.м_вхобъ, &VirtualDispose);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxTextDataObject_dtor(this.м_вхобъ);
    }
		//----------------------------
		export ~this(){this.dtor();}
	//----------------------------

    //---------------------------------------------------------------------

    export цел длинаТкста()
    {
        return wxTextDataObject_GetTextLength(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

    export ткст текст()
    {
        return cast(ткст) new ВизТкст(wxTextDataObject_GetText(this.м_вхобъ), да);
    }
    export проц текст(ткст значение)
    {
        wxTextDataObject_SetText(this.м_вхобъ, значение);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxFileDataObject_ctor();
extern (C) проц wxFileDataObject_dtor(ЦелУкз сам);
extern (C) проц wxFileDataObject_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
extern (C) проц wxFileDataObject_AddFile(ЦелУкз сам, ткст имяф);
extern (C) ЦелУкз wxFileDataObject_GetFilenames(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

export class ОбъектФайлДанных : ПростойОбъектДанных
{
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
        this(wxFileDataObject_ctor(), да);
        wxFileDataObject_RegisterDisposable(this.м_вхобъ, &VirtualDispose);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxFileDataObject_dtor(this.м_вхобъ);
    }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------

    //---------------------------------------------------------------------

    export проц добавьФайл(ткст имяф)
    {
        wxFileDataObject_AddFile(this.м_вхобъ, имяф);
    }

    export ткст[] именаФайлов()
    {
        ТкстМассива a=new ТкстМассива(wxFileDataObject_GetFilenames(this.м_вхобъ), да);
        ткст[] res;
        res.length = a.счёт;
        for(бцел i=0; i<a.счёт; ++i)
            res[i]=a.элт(i);

        return res;
    }

}
