module wx.SetCursorEvent;
public import wx.common;

public import wx.Event;

public import wx.Cursor;

//! \cond EXTERN
extern (C) ЦелУкз	wxSetCursorEvent_ctor(цел x,цел y);
extern (C) цел		wxSetCursorEvent_GetX(ЦелУкз сам);
extern (C) цел		wxSetCursorEvent_GetY(ЦелУкз сам);
extern (C) проц		wxSetCursorEvent_SetCursor(ЦелУкз сам, ЦелУкз курсор);
extern (C) ЦелУкз	wxSetCursorEvent_GetCursor(ЦелУкз сам);
extern (C) бул		wxSetCursorEvent_HasCursor(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеУстановкиКурсора : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(цел x=0,цел y=0)
    {
        this(wxSetCursorEvent_ctor(x,y));
    }

    //-----------------------------------------------------------------------------

    export цел Х()
    {
        return wxSetCursorEvent_GetX(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export цел У()
    {
        return wxSetCursorEvent_GetY(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export Курсор курсор()
    {
        return cast(Курсор)найдиОбъект(wxSetCursorEvent_GetCursor(вхобъ), &Курсор.Нов);
    }
    export проц курсор(Курсор значение)
    {
        wxSetCursorEvent_SetCursor(вхобъ, ВизОбъект.безопУк(значение));
    }

    //-----------------------------------------------------------------------------

    export бул естьКурсор()
    {
        return wxSetCursorEvent_HasCursor(вхобъ);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеУстановкиКурсора(объ);
    }

    static this()
    {
        добавьТипСоб(super.Тип.СОБ_УСТ_КУРСОР,				&СобытиеУстановкиКурсора.Нов);
    }
}
