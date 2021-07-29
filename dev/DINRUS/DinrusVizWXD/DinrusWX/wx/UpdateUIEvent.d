module wx.UpdateUIEvent;
public import wx.common;
public import wx.CommandEvent;
public import wx.Window;

//! \cond EXTERN
extern (C) ЦелУкз wxUpdateUIEvent_ctor(цел идКоманды);
extern (C) проц   wxUpdUIEvt_Enable(ЦелУкз сам, бул вкл);
extern (C) проц   wxUpdUIEvt_Check(ЦелУкз сам, бул чекать);
extern (C) бул   wxUpdateUIEvent_CanUpdate(ЦелУкз окно);
extern (C) бул   wxUpdateUIEvent_GetChecked(ЦелУкз сам);
extern (C) бул   wxUpdateUIEvent_GetEnabled(ЦелУкз сам);
extern (C) бул   wxUpdateUIEvent_GetSetChecked(ЦелУкз сам);
extern (C) бул   wxUpdateUIEvent_GetSetEnabled(ЦелУкз сам);
extern (C) бул   wxUpdateUIEvent_GetSetText(ЦелУкз сам);
extern (C) ЦелУкз wxUpdateUIEvent_GetText(ЦелУкз сам);
extern (C) цел    wxUpdateUIEvent_GetMode();
extern (C) бцел   wxUpdateUIEvent_GetUpdateInterval();
extern (C) проц   wxUpdateUIEvent_ResetUpdateTime();
extern (C) проц   wxUpdateUIEvent_SetMode(цел режим);
extern (C) проц   wxUpdateUIEvent_SetText(ЦелУкз сам, ткст текст);
extern (C) проц   wxUpdateUIEvent_SetUpdateInterval(бцел updateInterval);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеОбновлениеГИ : СобытиеКоманды
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(цел идКоманды = 0)
    {
        this(wxUpdateUIEvent_ctor(идКоманды));
    }

    //-----------------------------------------------------------------------------

    export проц активен(бул значение)
    {
        wxUpdUIEvt_Enable(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export проц отметь(бул значение)
    {
        wxUpdUIEvt_Check(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export static бул можноОбновить(Окно окно)
    {
        return wxUpdateUIEvent_CanUpdate(ВизОбъект.безопУк(окно));
    }

    //-----------------------------------------------------------------------------

    export бул отмечен()
    {
        return wxUpdateUIEvent_GetChecked(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул дайАктивирован()
    {
        return wxUpdateUIEvent_GetEnabled(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул устОтмечен()
    {
        return wxUpdateUIEvent_GetSetChecked(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул устАктивирован()
    {
        return wxUpdateUIEvent_GetSetEnabled(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул устТекст()
    {
        return wxUpdateUIEvent_GetSetText(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export ткст текст()
    {
        return cast(ткст) new ВизТкст(wxUpdateUIEvent_GetText(вхобъ), да);
    }
    export проц текст(ткст значение)
    {
        wxUpdateUIEvent_SetText(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    static ПРежимОбновленияГИ режим()
    {
        return cast(ПРежимОбновленияГИ)wxUpdateUIEvent_GetMode();
    }
    static проц режим(ПРежимОбновленияГИ значение)
    {
        wxUpdateUIEvent_SetMode(cast(цел)значение);
    }

    //-----------------------------------------------------------------------------

    static цел интервалОбновления()
    {
        return cast(цел)wxUpdateUIEvent_GetUpdateInterval();
    }
    static проц интервалОбновления(цел значение)
    {
        wxUpdateUIEvent_SetUpdateInterval(cast(бцел)значение);
    }

    //-----------------------------------------------------------------------------

    export static проц сбросьВремяОбновления()
    {
        wxUpdateUIEvent_ResetUpdateTime();
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеОбновлениеГИ(объ);
    }

    static this()
    {
        добавьТипСоб(Событие.Тип.СОБ_ОБНОВИ_ИП, &СобытиеОбновлениеГИ.Нов);
    }
}
