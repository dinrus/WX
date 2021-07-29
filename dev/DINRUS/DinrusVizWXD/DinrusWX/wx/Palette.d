module wx.Palette;
public import wx.common;
public import wx.GDIObject;

//! \cond EXTERN
extern (C) ЦелУкз wxPalette_ctor();
extern (C) проц wxPalette_dtor(ЦелУкз сам);
extern (C) бул wxPalette_Ok(ЦелУкз сам);
extern (C) бул wxPalette_Create(ЦелУкз сам, цел ч, inout ббайт красный, inout ббайт зелёный, inout ббайт синий);
extern (C) цел wxPalette_GetPixel(ЦелУкз сам, ббайт красный, ббайт зелёный, ббайт синий);
extern (C) бул wxPalette_GetRGB(ЦелУкз сам, цел пиксель, out ббайт красный, out ббайт зелёный, out ббайт синий);
//! \endcond

export class Палитра : ОбъектИГУ
{
    public static Палитра НуллПалитра;
    //---------------------------------------------------------------------

    export this()
    {
        this(wxPalette_ctor());
    }

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(цел ч, inout ббайт к, inout ббайт з, inout ббайт с)
    {
        this(wxPalette_ctor());
        if (!wxPalette_Create(вхобъ, ч, к, з, с))
        {
            throw new ИсклНевернОперации("Не удалось создать Палитру");
        }
    }

    export бул создай(цел ч, inout ббайт к, inout ббайт з, inout ббайт с)
    {
        return wxPalette_Create(вхобъ, ч, к, з, с);
    }

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new Палитра(ptr);
    }
    //---------------------------------------------------------------------

    export бул Ок()
    {
        return wxPalette_Ok(вхобъ);
    }

    //---------------------------------------------------------------------

    export цел дайПиксель(ббайт красный, ббайт зелёный, ббайт синий)
    {
        return wxPalette_GetPixel(вхобъ, красный, зелёный, синий);
    }

    export бул дайКЗС(цел пиксель, out ббайт красный, out ббайт зелёный, out ббайт синий)
    {
        return wxPalette_GetRGB(вхобъ, пиксель, красный, зелёный, синий);
    }

    //---------------------------------------------------------------------
}

