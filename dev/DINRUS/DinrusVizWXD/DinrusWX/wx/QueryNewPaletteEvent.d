module wx.QueryNewPaletteEvent;
public import wx.common;

public import wx.Event;

//! \cond EXTERN
extern (C) ЦелУкз wxQueryNewPaletteEvent_ctor(цел идок);
extern (C) бул wxQueryNewPaletteEvent_GetPaletteRealized(ЦелУкз сам);
extern (C) проц wxQueryNewPaletteEvent_SetPaletteRealized(ЦелУкз сам, бул realized);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеЗапросаНовойПалитры : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(цел идок=0)
    {
        this(wxQueryNewPaletteEvent_ctor(идок));
    }

    //-----------------------------------------------------------------------------

    export бул реализовано()
    {
        return wxQueryNewPaletteEvent_GetPaletteRealized(вхобъ);
    }
    export проц реализовано(бул значение)
    {
        wxQueryNewPaletteEvent_SetPaletteRealized(вхобъ, значение);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеЗапросаНовойПалитры(объ);
    }

    static this()
    {
        добавьТипСоб(super.Тип.СОБ_ЗАПРОС_НОВОЙ_ПАЛИТРЫ, &СобытиеЗапросаНовойПалитры.Нов);
    }
}
