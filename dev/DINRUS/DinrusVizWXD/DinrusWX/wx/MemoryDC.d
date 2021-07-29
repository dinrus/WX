module wx.MemoryDC;
public import wx.common;
public import wx.DC;

//! \cond EXTERN
extern (C) ЦелУкз wxMemoryDC_ctor();
extern (C) ЦелУкз wxMemoryDC_ctorByDC(ЦелУкз ку);
extern (C) проц   wxMemoryDC_SelectObject(ЦелУкз сам, ЦелУкз битмап);
//! \endcond

//---------------------------------------------------------------------

export class КУПамяти : КУОкна
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        this(wxMemoryDC_ctor());
    }

    export this(КонтекстУстройства ку)
    {
        this(wxMemoryDC_ctorByDC(ВизОбъект.безопУк(ку)));
    }

    //---------------------------------------------------------------------

    export проц выделиОбъект(Битмап битмап)
    {
        wxMemoryDC_SelectObject(вхобъ, ВизОбъект.безопУк(битмап));
    }

    //---------------------------------------------------------------------
}

//! \cond EXTERN
extern (C) ЦелУкз wxBufferedDC_ctor();
extern (C) ЦелУкз wxBufferedDC_ctorByBitmap(ЦелУкз ку, ЦелУкз буфер);
extern (C) ЦелУкз wxBufferedDC_ctorBySize(ЦелУкз ку, inout Размер зона);

extern (C) проц   wxBufferedDC_InitByBitmap(ЦелУкз сам, ЦелУкз ку, ЦелУкз битмап);
extern (C) проц   wxBufferedDC_InitBySize(ЦелУкз сам, ЦелУкз ку, inout Размер зона);
extern (C) проц   wxBufferedDC_UnMask(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

export class КУБуферированный : КУПамяти
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
        this(wxBufferedDC_ctor(), да);
    }

    export this(КонтекстУстройства ку, Битмап битмап)
    {
        this(wxBufferedDC_ctorByBitmap(ВизОбъект.безопУк(ку), ВизОбъект.безопУк(битмап)), да);
    }

    export this(КонтекстУстройства ку, Размер размер)
    {
        this(wxBufferedDC_ctorBySize(ВизОбъект.безопУк(ку), размер), да);
    }

    //---------------------------------------------------------------------

    export проц иницПоБитмапу(КонтекстУстройства ку, Битмап битмап)
    {
        wxBufferedDC_InitByBitmap(вхобъ, ВизОбъект.безопУк(ку), ВизОбъект.безопУк(битмап));
    }

    export проц иницПоРазмеру(КонтекстУстройства ку, Размер зона)
    {
        wxBufferedDC_InitBySize(вхобъ, ВизОбъект.безопУк(ку), зона);
    }

    //---------------------------------------------------------------------

    export проц снимиМаску()
    {
        wxBufferedDC_UnMask(вхобъ);
    }

    //---------------------------------------------------------------------
}

//! \cond EXTERN
extern (C) ЦелУкз wxBufferedPaintDC_ctor(ЦелУкз окно, ЦелУкз буфер);
//! \endcond

//---------------------------------------------------------------------

export class КУРисованияБуферированный : КУБуферированный
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

    export this(Окно окно, Битмап буфер)
    {
        this(wxBufferedPaintDC_ctor(ВизОбъект.безопУк(окно), ВизОбъект.безопУк(буфер)), да);
    }

    //---------------------------------------------------------------------
}

