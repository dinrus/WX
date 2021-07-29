module wx.FocusEvent;
public import wx.common;

public import wx.Window;
public import wx.Event;

//! \cond EXTERN
extern (C) ЦелУкз wxFocusEvent_ctor(цел тип,цел идок);
extern (C) ЦелУкз wxFocusEvent_GetWindow(ЦелУкз сам);
extern (C) проц   wxFocusEvent_SetWindow(ЦелУкз сам, ЦелУкз ок);
//! \endcond

//-----------------------------------------------------------------------------


export class СобытиеФокуса : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(ТипСобытия тип = Тип.СОБ_НУЛЛ, цел идок = 0)
    {
        this(wxFocusEvent_ctor(тип,идок));
    }

    //-----------------------------------------------------------------------------

    export Окно окно()
    {
        return cast(Окно)найдиОбъект(wxFocusEvent_GetWindow(вхобъ), &Окно.Нов);
    }
    export проц окно(Окно значение)
    {
        wxFocusEvent_SetWindow(вхобъ, ВизОбъект.безопУк(значение));
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеФокуса(объ);
    }

    static this()
    {
        добавьТипСоб(super.Тип.СОБ_УСТ_ФОКУС,				&СобытиеФокуса.Нов);
        добавьТипСоб(super.Тип.СОБ_РАСФОКУС,				&СобытиеФокуса.Нов);
    }
}
