module wx.Colour;
public import wx.common;
version(Dinrus) private import stdrus;


//! \cond EXTERN
extern (C) ЦелУкз wxColour_ctor();
extern (C) ЦелУкз wxColour_ctorByName(ткст имя);
extern (C) ЦелУкз wxColour_ctorByParts(ббайт красный, ббайт зелёный, ббайт синий);
extern (C) проц   wxColour_dtor(ЦелУкз сам);
//extern (C) проц   wxColour_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);

extern (C) ббайт   wxColour_Red(ЦелУкз сам);
extern (C) ббайт   wxColour_Blue(ЦелУкз сам);
extern (C) ббайт   wxColour_Green(ЦелУкз сам);

extern (C) бул   wxColour_Ok(ЦелУкз сам);
extern (C) проц   wxColour_Set(ЦелУкз сам, ббайт красный, ббайт зелёный, ббайт синий);

extern (C) ЦелУкз wxColour_CreateByName(ткст имя);
//! \endcond

//---------------------------------------------------------------------

export class Цвет : ВизОбъект
{
    public static Цвет ЧЁРНЫЙ;
    public static Цвет БЕЛЫЙ;
    public static Цвет КРАСНЫЙ;
    public static Цвет СИНИЙ;
    public static Цвет ЗЕЛЁНЫЙ;
    public static Цвет ЦЫАН;
    public static Цвет СВЕТЛО_СЕРЫЙ;
    public static Цвет НуллЦвет;

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
        this(wxColour_ctor(), да);
        //wxColour_RegisterDisposable(вхобъ, &VirtualDispose);
    }

    export this(ткст имя)
    {
        this(wxColour_ctorByName(имя), да); // toupper
        //wxColour_RegisterDisposable(вхобъ, &VirtualDispose);
    }

    export this(ббайт красный, ббайт зелёный, ббайт синий)
    {
        this(wxColour_ctorByParts(красный, зелёный, синий), да);
        //wxColour_RegisterDisposable(вхобъ, &VirtualDispose);
    }

    //---------------------------------------------------------------------

    export override проц вымести()
    {
        if ((this != Цвет.ЧЁРНЫЙ) && (this != Цвет.БЕЛЫЙ) &&
                (this != Цвет.КРАСНЫЙ) && (this != Цвет.СИНИЙ) &&
                (this != Цвет.ЗЕЛЁНЫЙ) && (this != Цвет.ЦЫАН) &&
                (this != Цвет.СВЕТЛО_СЕРЫЙ))
        {
            super.вымести(/*да*/);
        }
    }

    //---------------------------------------------------------------------

    export ббайт красный()
    {
        return wxColour_Red(вхобъ);
    }

    export ббайт зелёный()
    {
        return wxColour_Green(вхобъ);
    }

    export ббайт синий()
    {
        return wxColour_Blue(вхобъ);
    }

    //---------------------------------------------------------------------

    export бул Ок()
    {
        return wxColour_Ok(вхобъ);
    }

    export проц установи(ббайт красный, ббайт зелёный, ббайт синий)
    {
        wxColour_Set(вхобъ, красный, зелёный, синий);
    }

    //---------------------------------------------------------------------

    version(__WXGTK__)
    {
        export static Цвет создайПоИмени(ткст имя)
        {
            return new Цвет(wxColour_CreateByName(имя), да);
        }
    } // version(__WXGTK__)

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new Цвет(ptr);
    }
}
