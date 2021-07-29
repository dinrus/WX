module wx.PaletteChangedEvent;
public import wx.common;

public import wx.Event;

public import wx.Window;

//! \cond EXTERN
extern (C) ЦелУкз wxPaletteChangedEvent_ctor(цел идок);
extern (C) проц wxPaletteChangedEvent_SetChangedWindow(ЦелУкз сам, ЦелУкз ок);
extern (C) ЦелУкз wxPaletteChangedEvent_GetChangedWindow(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------


export class СобытиеИзмененаПалитра : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(цел идок=0)
    {
        this(wxPaletteChangedEvent_ctor(идок));
    }

    //-----------------------------------------------------------------------------

    export Окно изменённоеОкно()
    {
        return cast(Окно)найдиОбъект(wxPaletteChangedEvent_GetChangedWindow(вхобъ), &Окно.Нов);
    }
    export проц изменённоеОкно(Окно значение)
    {
        wxPaletteChangedEvent_SetChangedWindow(вхобъ, ВизОбъект.безопУк(значение));
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеИзмененаПалитра(объ);
    }

    static this()
    {
        добавьТипСоб(super.Тип.СОБ_ПАЛИТРА_ИЗМЕНЕНА,			&СобытиеИзмененаПалитра.Нов);
    }
}
