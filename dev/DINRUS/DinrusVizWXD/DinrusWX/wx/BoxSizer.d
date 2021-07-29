module wx.BoxSizer;
public import wx.common;
public import wx.Sizer;

//! \cond EXTERN
extern(C)
{
    alias проц function(ПеремерщикБокса объ) Virtual_voidvoid;
    alias проц function(ПеремерщикБокса объ,out Размер размер) Virtual_wxSizevoid;
}

extern (C) проц wxBoxSizer_RegisterVirtual(ЦелУкз сам, ПеремерщикБокса объ, Virtual_voidvoid recalcSizes, Virtual_wxSizevoid calcMin);
extern (C) проц wxBoxSizer_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);

extern (C) ЦелУкз wxBoxSizer_ctor(цел ориент);
extern (C) проц wxBoxSizer_RecalcSizes(ЦелУкз сам);
extern (C) проц wxBoxSizer_CalcMin(ЦелУкз сам,out Размер размер);
extern (C) цел wxBoxSizer_GetOrientation(ЦелУкз сам);
extern (C) проц wxBoxSizer_SetOrientation(ЦелУкз сам, цел ориент);
//! \endcond

//---------------------------------------------------------------------
static export extern(C) проц staticRecalcSizes(ПеремерщикБокса объ)
{
	return объ.пересчётРазмеров();
}
//////////////////////////////////
static export extern(C) проц staticCalcMin(ПеремерщикБокса объ,out Размер размер)
{
	размер = объ.вычислиМин();
}
/////////////////////////////////////

export class ПеремерщикБокса : Перемерщик
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(цел ориент)
    {
        this(wxBoxSizer_ctor(cast(цел)ориент));
        wxBoxSizer_RegisterVirtual(вхобъ, this, &staticRecalcSizes, &staticCalcMin);
        wxBoxSizer_RegisterDisposable(вхобъ, &VirtualDispose);
    }

    //---------------------------------------------------------------------

    export override проц пересчётРазмеров()
    {
        wxBoxSizer_RecalcSizes(вхобъ);
    }

    //---------------------------------------------------------------------
    export override Размер вычислиМин()
    {
        Размер размер;
        wxBoxSizer_CalcMin(вхобъ,размер);
        return размер;
    }

    //---------------------------------------------------------------------

    export цел ориентация()
    {
        return wxBoxSizer_GetOrientation(вхобъ);
    }
    export проц ориентация(цел значение)
    {
        wxBoxSizer_SetOrientation(вхобъ, значение);
    }
}
