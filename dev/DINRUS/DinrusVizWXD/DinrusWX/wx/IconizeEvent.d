module wx.IconizeEvent;
public import wx.common;

public import wx.Event;

//! \cond EXTERN
extern (C) ЦелУкз wxIconizeEvent_ctor(цел идок,бул иконирован);
extern (C) бул wxIconizeEvent_Iconized(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------


export class СобытиеИконирования : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(цел идок = 0, бул иконирован = да)
    {
        this(wxIconizeEvent_ctor(идок,иконирован));
    }

    //-----------------------------------------------------------------------------

    export бул иконирован()
    {
        return wxIconizeEvent_Iconized(вхобъ);
    }


    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеИконирования(объ);
    }

    static this()
    {
        добавьТипСоб(super.Тип.СОБ_ИКОНИРУЙ,	&СобытиеИконирования.Нов);
    }
}
