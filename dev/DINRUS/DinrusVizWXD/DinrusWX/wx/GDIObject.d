module wx.GDIObject;
public import wx.common;

//! \cond EXTERN
static export extern (C) проц wxGDIObj_dtor(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------


export class ОбъектИГУ : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    /*export override проц вымести()
    {
    	вхобъ = ЦелУкз.init;
    	вымести(нет);
    }*/

    //---------------------------------------------------------------------
}
