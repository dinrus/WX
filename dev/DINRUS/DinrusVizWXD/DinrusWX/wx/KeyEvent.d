module wx.KeyEvent;
public import wx.common;
public import wx.Event;

//! \cond EXTERN
extern (C) ЦелУкз wxKeyEvent_ctor(цел тип);

extern (C) бул   wxKeyEvent_ControlDown(ЦелУкз сам);
extern (C) бул   wxKeyEvent_ShiftDown(ЦелУкз сам);
extern (C) бул   wxKeyEvent_AltDown(ЦелУкз сам);
extern (C) бул   wxKeyEvent_MetaDown(ЦелУкз сам);

extern (C) бцел   wxKeyEvent_GetRawKeyCode(ЦелУкз сам);
extern (C) цел    wxKeyEvent_GetKeyCode(ЦелУкз сам);

extern (C) бцел   wxKeyEvent_GetRawKeyFlags(ЦелУкз сам);
extern (C) бул   wxKeyEvent_HasModifiers(ЦелУкз сам);

extern (C) проц   wxKeyEvent_GetPosition(ЦелУкз сам, inout Точка тчк);
extern (C) цел    wxKeyEvent_GetX(ЦелУкз сам);
extern (C) цел    wxKeyEvent_GetY(ЦелУкз сам);

extern (C) бул   wxKeyEvent_CmdDown(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеКлавиатуры : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(ТипСобытия тип = Тип.СОБ_НУЛЛ)
    {
        this(wxKeyEvent_ctor(тип));
    }

    //-----------------------------------------------------------------------------

    export бул ктрлВнизу()
    {
        return wxKeyEvent_ControlDown(вхобъ);
    }

    export бул метаВнизу()
    {
        return wxKeyEvent_MetaDown(вхобъ);
    }

    export бул шифтВнизу()
    {
        return wxKeyEvent_ShiftDown(вхобъ);
    }

    export бул альтВнизу()
    {
        return wxKeyEvent_AltDown(вхобъ);
    }

    //-----------------------------------------------------------------------------

    /*export ПКодКл ПКодКл
    {
        get { return (ПКодКл)wxKeyEvent_GetKeyCode(вхобъ); }
    }*/

    export цел кодКл()
    {
        return wxKeyEvent_GetKeyCode(вхобъ);
    }

    export цел сыройКодКл()
    {
        return wxKeyEvent_GetRawKeyCode(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export цел флагиСыройКл()
    {
        return wxKeyEvent_GetRawKeyFlags(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул естьМодификаторы()
    {
        return wxKeyEvent_HasModifiers(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export Точка позиция()
    {
        Точка тчк;
        wxKeyEvent_GetPosition(вхобъ, тчк);
        return тчк;
    }

    //-----------------------------------------------------------------------------

    export цел Х()
    {
        return wxKeyEvent_GetX(вхобъ);
    }

    export цел У()
    {
        return wxKeyEvent_GetY(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул кмдВнизу()
    {
        return wxKeyEvent_CmdDown(вхобъ);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеКлавиатуры(объ);
    }

    static this()
    {
        добавьТипСоб(super.Тип.СОБ_КЛАВИША_ВНИЗУ, &СобытиеКлавиатуры.Нов);
        добавьТипСоб(super.Тип.СОБ_КЛАВИША_ВВЕРХУ, &СобытиеКлавиатуры.Нов);
        добавьТипСоб(super.Тип.СОБ_СИМВ,     &СобытиеКлавиатуры.Нов);
        добавьТипСоб(super.Тип.СОБ_СИМВ_ХУК, &СобытиеКлавиатуры.Нов);
    }
}
