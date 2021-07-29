module wx.MouseCaptureChangedEvent;

public import wx.common;
public import wx.Event;
public import wx.Window;

//! \cond EXTERN
extern (C) ЦелУкз wxMouseCaptureChangedEvent_ctor(цел идок,ЦелУкз полученЗахват);
extern (C) ЦелУкз wxMouseCaptureChangedEvent_GetCapturedWindow(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеИзмененияЗахватаМышью : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(цел идок = 0, Окно полученЗахват = пусто)
    {
        this(wxMouseCaptureChangedEvent_ctor(идок,ВизОбъект.безопУк(полученЗахват)));
    }

    //-----------------------------------------------------------------------------

    export Окно захваченноеОкно()
    {
        return cast(Окно)найдиОбъект(wxMouseCaptureChangedEvent_GetCapturedWindow(вхобъ), &Окно.Нов);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеИзмененияЗахватаМышью(объ);
    }

    static this()
    {
        добавьТипСоб(super.Тип.СОБ_ЗАХВАТ_МЫШИ_ИЗМЕНЁН, &СобытиеИзмененияЗахватаМышью.Нов);
    }
}
