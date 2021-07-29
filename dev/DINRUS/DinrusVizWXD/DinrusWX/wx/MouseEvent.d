module wx.MouseEvent;
public import wx.common;
public import wx.Event;

public import wx.DC;

//! \cond EXTERN
extern (C) ЦелУкз wxMouseEvent_ctor(цел типМыши);
extern (C) бул   wxMouseEvent_IsButton(ЦелУкз сам);
extern (C) бул   wxMouseEvent_ButtonDown(ЦелУкз сам);
extern (C) бул   wxMouseEvent_ButtonDown2(ЦелУкз сам, цел button);
extern (C) бул   wxMouseEvent_ButtonDClick(ЦелУкз сам, цел кноп);
extern (C) бул   wxMouseEvent_ButtonUp(ЦелУкз сам, цел кноп);
extern (C) бул   wxMouseEvent_Button(ЦелУкз сам, цел кноп);
extern (C) бул   wxMouseEvent_ButtonIsDown(ЦелУкз сам, цел кноп);
extern (C) цел    wxMouseEvent_GetButton(ЦелУкз сам);
extern (C) бул   wxMouseEvent_ControlDown(ЦелУкз сам);
extern (C) бул   wxMouseEvent_MetaDown(ЦелУкз сам);
extern (C) бул   wxMouseEvent_AltDown(ЦелУкз сам);
extern (C) бул   wxMouseEvent_ShiftDown(ЦелУкз сам);
extern (C) бул   wxMouseEvent_LeftDown(ЦелУкз сам);
extern (C) бул   wxMouseEvent_MiddleDown(ЦелУкз сам);
extern (C) бул   wxMouseEvent_RightDown(ЦелУкз сам);
extern (C) бул   wxMouseEvent_LeftUp(ЦелУкз сам);
extern (C) бул   wxMouseEvent_MiddleUp(ЦелУкз сам);
extern (C) бул   wxMouseEvent_RightUp(ЦелУкз сам);
extern (C) бул   wxMouseEvent_LeftDClick(ЦелУкз сам);
extern (C) бул   wxMouseEvent_MiddleDClick(ЦелУкз сам);
extern (C) бул   wxMouseEvent_RightDClick(ЦелУкз сам);
extern (C) бул   wxMouseEvent_LeftIsDown(ЦелУкз сам);
extern (C) бул   wxMouseEvent_MiddleIsDown(ЦелУкз сам);
extern (C) бул   wxMouseEvent_RightIsDown(ЦелУкз сам);
extern (C) бул   wxMouseEvent_Dragging(ЦелУкз сам);
extern (C) бул   wxMouseEvent_Moving(ЦелУкз сам);
extern (C) бул   wxMouseEvent_Entering(ЦелУкз сам);
extern (C) бул   wxMouseEvent_Leaving(ЦелУкз сам);
extern (C) проц   wxMouseEvent_GetPosition(ЦелУкз сам, inout Точка поз);
extern (C) проц   wxMouseEvent_LogicalPosition(ЦелУкз сам, ЦелУкз ку, inout Точка поз);
extern (C) цел    wxMouseEvent_GetWheelRotation(ЦелУкз сам);
extern (C) цел    wxMouseEvent_GetWheelDelta(ЦелУкз сам);
extern (C) цел    wxMouseEvent_GetLinesPerAction(ЦелУкз сам);
extern (C) бул   wxMouseEvent_IsPageScroll(ЦелУкз сам);
//! \endcond

//----------------------------------------------------------------------------

export class СобытиеМыши : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(ТипСобытия типМыши)
    {
        super(wxMouseEvent_ctor(типМыши));
    }

    //----------------------------------------------------------------------------

    export бул кнопка_ли()
    {
        return wxMouseEvent_IsButton(вхобъ);
    }

    //----------------------------------------------------------------------------

    export бул кнопкаВнизу()
    {
        //get { return wxMouseEvent_ButtonDown(вхобъ); }
        return кнопкаВнизу(ПКнопкаМыши.Любая);
    }

    export бул кнопкаВнизу(ПКнопкаМыши кноп)
    {
        return wxMouseEvent_ButtonDown2(вхобъ, cast(цел)кноп);
    }

    //----------------------------------------------------------------------------

    export бул кнопкаДНажата()
    {
        return кнопкаДНажата(ПКнопкаМыши.Любая);
    }

    export бул кнопкаДНажата(ПКнопкаМыши кноп)
    {
        return wxMouseEvent_ButtonDClick(вхобъ, cast(цел)кноп);
    }

    //----------------------------------------------------------------------------

    export бул кнокпаВверху()
    {
        return кнокпаВверху(ПКнопкаМыши.Любая);
    }

    export бул кнокпаВверху(ПКнопкаМыши кноп)
    {
        return wxMouseEvent_ButtonUp(вхобъ, cast(цел)кноп);
    }

    //----------------------------------------------------------------------------

    export бул кнопка(цел кноп)
    {
        return wxMouseEvent_Button(вхобъ, кноп);
    }

    export бул кнопкаВнизу_ли(цел кноп)
    {
        return wxMouseEvent_ButtonIsDown(вхобъ, кноп);
    }

    export цел кнопка()
    {
        return wxMouseEvent_GetButton(вхобъ);
    }

    //----------------------------------------------------------------------------

    export бул контролВнизу()
    {
        return wxMouseEvent_ControlDown(вхобъ);
    }

    export бул метаВнизу()
    {
        return wxMouseEvent_MetaDown(вхобъ);
    }

    export бул альтВнизу()
    {
        return wxMouseEvent_AltDown(вхобъ);
    }

    export бул шифтВнизу()
    {
        return wxMouseEvent_ShiftDown(вхобъ);
    }

    //----------------------------------------------------------------------------

    export бул леваяВнизу()
    {
        return wxMouseEvent_LeftDown(вхобъ);
    }

    export бул средняяВнизу()
    {
        return wxMouseEvent_MiddleDown(вхобъ);
    }

    export бул праваяВнизу()
    {
        return wxMouseEvent_RightDown(вхобъ);
    }

    //----------------------------------------------------------------------------

    export бул леваяВверху()
    {
        return wxMouseEvent_LeftUp(вхобъ);
    }

    export бул средняяВверху()
    {
        return wxMouseEvent_MiddleUp(вхобъ);
    }

    export бул праваяВверху()
    {
        return wxMouseEvent_RightUp(вхобъ);
    }

    //----------------------------------------------------------------------------

    export бул леваяДНажата()
    {
        return wxMouseEvent_LeftDClick(вхобъ);
    }

    export бул средняяДНажата()
    {
        return wxMouseEvent_MiddleDClick(вхобъ);
    }

    export бул праваяДНажата()
    {
        return wxMouseEvent_RightDClick(вхобъ);
    }

    //----------------------------------------------------------------------------

    export бул леваяВнизу_ли()
    {
        return wxMouseEvent_LeftIsDown(вхобъ);
    }

    export бул средняяВнизу_ли()
    {
        return wxMouseEvent_MiddleIsDown(вхобъ);
    }

    export бул праваяВнизу_ли()
    {
        return wxMouseEvent_RightIsDown(вхобъ);
    }

    //----------------------------------------------------------------------------

    export бул перетягивание()
    {
        return wxMouseEvent_Dragging(вхобъ);
    }

    export бул движение()
    {
        return wxMouseEvent_Moving(вхобъ);
    }

    export бул вхождение()
    {
        return wxMouseEvent_Entering(вхобъ);
    }

    export бул покидание()
    {
        return wxMouseEvent_Leaving(вхобъ);
    }

    //----------------------------------------------------------------------------

    export Точка позиция()
    {
        Точка поз;
        wxMouseEvent_GetPosition(вхобъ, поз);
        return поз;
    }

    export Точка логичПоз(КонтекстУстройства ку)
    {
        Точка поз;
        wxMouseEvent_LogicalPosition(вхобъ, ВизОбъект.безопУк(ку), поз);
        return поз;
    }

    //----------------------------------------------------------------------------

    export цел вращениеКолеса()
    {
        return wxMouseEvent_GetWheelRotation(вхобъ);
    }

    export цел дельтаКолеса()
    {
        return wxMouseEvent_GetWheelDelta(вхобъ);
    }

    export цел строкНаДействие()
    {
        return wxMouseEvent_GetLinesPerAction(вхобъ);
    }

    export бул промоткаСтраницы_ли()
    {
        return wxMouseEvent_IsPageScroll(вхобъ);
    }

    //----------------------------------------------------------------------------
    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеМыши(объ);
    }

    static this()
    {
        добавьТипСоб(super.Тип.СОБ_ЛЕВАЯ_ВВЕРХУ,     &СобытиеМыши.Нов);
        добавьТипСоб(super.Тип.СОБ_ПРАВАЯ_ВВЕРХУ,    &СобытиеМыши.Нов);
        добавьТипСоб(super.Тип.СОБ_СРЕДНЯЯ_ВВЕРХУ,   &СобытиеМыши.Нов);
        добавьТипСоб(super.Тип.СОБ_ВХОД_ОКНО,        &СобытиеМыши.Нов);
        добавьТипСоб(super.Тип.СОБ_ВЫХОД_ОКНО,       &СобытиеМыши.Нов);
        добавьТипСоб(super.Тип.СОБ_ЛЕВАЯ_ВНИЗУ,      &СобытиеМыши.Нов);
        добавьТипСоб(super.Тип.СОБ_СРЕДНЯЯ_ВНИЗУ,    &СобытиеМыши.Нов);
        добавьТипСоб(super.Тип.СОБ_ПРАВАЯ_ВНИЗУ,     &СобытиеМыши.Нов);
        добавьТипСоб(super.Тип.СОБ_ЛЕВАЯ_ДНАЖАТА,    &СобытиеМыши.Нов);
        добавьТипСоб(super.Тип.СОБ_ПРАВАЯ_ДНАЖАТА,   &СобытиеМыши.Нов);
        добавьТипСоб(super.Тип.СОБ_СРЕДНЯЯ_ДНАЖАТА,  &СобытиеМыши.Нов);
        добавьТипСоб(super.Тип.СОБ_КОЛЕСО_МЫШИ,      &СобытиеМыши.Нов);
        добавьТипСоб(super.Тип.СОБ_ДВИЖЕНИЕ,         &СобытиеМыши.Нов);
    }
}

