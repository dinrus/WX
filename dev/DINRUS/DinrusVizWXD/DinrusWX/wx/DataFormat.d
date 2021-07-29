module wx.DataFormat;
public import wx.common;

public enum ПИдФорматаДаты
{
    INVALID =          0,
    TEXT =             1,
    BITMAP =           2,
    METAFILE =         3,
    SYLK =             4,
    DIF =              5,
    TIFF =             6,
    OEMTEXT =          7,
    DIB =              8,
    PALETTE =          9,
    PENDATA =          10,
    RIFF =             11,
    WAVE =             12,
    UNICODETEXT =      13,
    ENHMETAFILE =      14,
    FILENAME =         15,
    LOCALE =           16,
    PRIVATE =          20,
    HTML =             30,
    Макс
}

//! \cond EXTERN
extern (C) ЦелУкз wxDataFormat_ctor();
extern (C) проц   wxDataFormat_dtor(ЦелУкз сам);
extern (C) ЦелУкз wxDataFormat_ctorByType(цел тип);
extern (C) ЦелУкз wxDataFormat_ctorById(ткст ид);

extern (C) ЦелУкз wxDataFormat_GetId(ЦелУкз сам);
extern (C) проц   wxDataFormat_SetId(ЦелУкз сам, ткст ид);

extern (C) цел    wxDataFormat_GetType(ЦелУкз сам);
extern (C) проц   wxDataFormat_SetType(ЦелУкз сам, цел тип);
//! \endcond

//-----------------------------------------------------------------------------

export class ФорматДаты : ВизОбъект
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

    export  this()
    {
        this(wxDataFormat_ctor(), да);
    }

    export this(ПИдФорматаДаты тип)
    {
        this(wxDataFormat_ctorByType(cast(цел)тип), да);
    }

    export this(ткст ид)
    {
        this(wxDataFormat_ctorById(ид), да);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxDataFormat_dtor(this.м_вхобъ);
    }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
    //-----------------------------------------------------------------------------

    export ткст ид()
    {
        return cast(ткст) new ВизТкст(wxDataFormat_GetId(this.м_вхобъ), да);
    }
    export проц ид(ткст значение)
    {
        wxDataFormat_SetId(this.м_вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export ПИдФорматаДаты тип()
    {
        return cast(ПИдФорматаДаты)wxDataFormat_GetType(this.м_вхобъ);
    }
    export проц тип(ПИдФорматаДаты значение)
    {
        wxDataFormat_SetType(this.м_вхобъ, cast(цел)значение);
    }
}

