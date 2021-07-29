module wx.SizerItem;
public import wx.common;
public import wx.Window;

//! \cond EXTERN
extern (C) ЦелУкз wxSizerItem_ctorSpace(цел ширь, цел высь, цел пропорция, цел флаг, цел бордюр, ЦелУкз пользоватДан);
extern (C) ЦелУкз wxSizerItem_ctorWindow(ЦелУкз окно, цел пропорция, цел флаг, цел бордюр, ЦелУкз пользоватДан);
extern (C) ЦелУкз wxSizerItem_ctorSizer(ЦелУкз сайзер, цел пропорция, цел флаг, цел бордюр, ЦелУкз пользоватДан);
extern (C) ЦелУкз wxSizerItem_ctor();
extern (C) проц   wxSizerItem_DeleteWindows(ЦелУкз сам);
extern (C) проц   wxSizerItem_DetachSizer(ЦелУкз сам);
extern (C) проц   wxSizerItem_GetSize(ЦелУкз сам, inout Размер размер);
extern (C) проц   wxSizerItem_CalcMin(ЦелУкз сам, inout Размер мин);
extern (C) проц   wxSizerItem_SetDimension(ЦелУкз сам, inout Точка поз, inout Размер размер);
extern (C) проц   wxSizerItem_GetMinSize(ЦелУкз сам, inout Размер размер);
extern (C) проц   wxSizerItem_SetInitSize(ЦелУкз сам, цел x, цел y);
extern (C) проц   wxSizerItem_SetRatio(ЦелУкз сам, цел ширь, цел высь);
extern (C) проц   wxSizerItem_SetRatioFloat(ЦелУкз сам, плав ratio);
extern (C) плав  wxSizerItem_GetRatioFloat(ЦелУкз сам);
extern (C) бул   wxSizerItem_IsWindow(ЦелУкз сам);
extern (C) бул   wxSizerItem_IsSizer(ЦелУкз сам);
extern (C) бул   wxSizerItem_IsSpacer(ЦелУкз сам);
extern (C) проц   wxSizerItem_SetProportion(ЦелУкз сам, цел пропорция);
extern (C) цел    wxSizerItem_GetProportion(ЦелУкз сам);
extern (C) проц   wxSizerItem_SetFlag(ЦелУкз сам, цел флаг);
extern (C) цел    wxSizerItem_GetFlag(ЦелУкз сам);
extern (C) проц   wxSizerItem_SetBorder(ЦелУкз сам, цел бордюр);
extern (C) цел    wxSizerItem_GetBorder(ЦелУкз сам);
extern (C) ЦелУкз wxSizerItem_GetWindow(ЦелУкз сам);
extern (C) проц   wxSizerItem_SetWindow(ЦелУкз сам, ЦелУкз окно);
extern (C) ЦелУкз wxSizerItem_GetSizer(ЦелУкз сам);
extern (C) проц   wxSizerItem_SetSizer(ЦелУкз сам, ЦелУкз сайзер);
extern (C) проц   wxSizerItem_GetSpacer(ЦелУкз сам, inout Размер размер);
extern (C) проц   wxSizerItem_SetSpacer(ЦелУкз сам, inout Размер размер);
extern (C) проц   wxSizerItem_Show(ЦелУкз сам, бул показ);
extern (C) бул   wxSizerItem_IsShown(ЦелУкз сам);
extern (C) ЦелУкз wxSizerItem_GetUserData(ЦелУкз сам);
extern (C) проц   wxSizerItem_GetPosition(ЦелУкз сам, inout Точка поз);
//! \endcond

//-----------------------------------------------------------------------------

export class ЭлтПеремерщика : ВизОбъект
{
    export this(цел ширь, цел высь, цел пропорция, цел флаг, цел бордюр, ВизОбъект пользоватДан)
    {
        this(wxSizerItem_ctorSpace(ширь, высь, пропорция, флаг, бордюр, ВизОбъект.безопУк(пользоватДан)));
    }

    export this(Окно окно, цел пропорция, цел флаг, цел бордюр, ВизОбъект пользоватДан)
    {
        this(wxSizerItem_ctorWindow(ВизОбъект.безопУк(окно), пропорция, флаг, бордюр, ВизОбъект.безопУк(пользоватДан)));
    }

    export this(Перемерщик сайзер, цел пропорция, цел флаг, цел бордюр, ВизОбъект пользоватДан)
    {
        this(wxSizerItem_ctorSizer(ВизОбъект.безопУк(сайзер), пропорция, флаг, бордюр, ВизОбъект.безопУк(пользоватДан)));
    }

    export this()
    {
        this(wxSizerItem_ctor());
    }

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц удалиОкна()
    {
        wxSizerItem_DeleteWindows(вхобъ);
    }

    export проц отторочьПеремерщик()
    {
        wxSizerItem_DetachSizer(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export Размер размер()
    {
        Размер размер;
        wxSizerItem_GetSize(вхобъ, размер);
        return размер;
    }

    //-----------------------------------------------------------------------------

    export Размер вычислиМин()
    {
        Размер мин;
        wxSizerItem_CalcMin(вхобъ, мин);
        return мин;
    }

    //-----------------------------------------------------------------------------

    export проц устИзмерение(Точка поз, Размер размер)
    {
        wxSizerItem_SetDimension(вхобъ, поз, размер);
    }

    //-----------------------------------------------------------------------------

    export Размер минРазм()
    {
        Размер размер;
        wxSizerItem_GetMinSize(вхобъ, размер);
        return размер;
    }

    //-----------------------------------------------------------------------------

    export проц устИсхРазм(цел x, цел y)
    {
        wxSizerItem_SetInitSize(вхобъ, x, y);
    }

    //-----------------------------------------------------------------------------

    export проц устСоотношение(Размер размер)
    {
        устСоотношение(размер.ширь, размер.высь);
    }

    export проц устСоотношение(цел ширь, цел высь)
    {
        wxSizerItem_SetRatio(вхобъ, ширь, высь);
    }

    export проц соотношение(плав значение)
    {
        wxSizerItem_SetRatioFloat(вхобъ, значение);
    }
    export плав соотношение()
    {
        return wxSizerItem_GetRatioFloat(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул окно_ли()
    {
        return wxSizerItem_IsWindow(вхобъ);
    }

    export бул сайзер_ли()
    {
        return wxSizerItem_IsSizer(вхобъ);
    }

    export бул спейсер_ли()
    {
        return wxSizerItem_IsSpacer(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц пропорция(цел значение)
    {
        wxSizerItem_SetProportion(вхобъ, значение);
    }
    export цел пропорция()
    {
        return wxSizerItem_GetProportion(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц флаг(цел значение)
    {
        wxSizerItem_SetFlag(вхобъ, значение);
    }
    export цел флаг()
    {
        return wxSizerItem_GetFlag(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц бордюр(цел значение)
    {
        wxSizerItem_SetBorder(вхобъ, значение);
    }
    export цел бордюр()
    {
        return wxSizerItem_GetBorder(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export Окно окно()
    {
        return cast(Окно)найдиОбъект(wxSizerItem_GetWindow(вхобъ));
    }
    export проц окно(Окно значение)
    {
        wxSizerItem_SetWindow(вхобъ, ВизОбъект.безопУк(значение));
    }

    //-----------------------------------------------------------------------------

    export Перемерщик сайзер()
    {
        return cast(Перемерщик)найдиОбъект(wxSizerItem_GetSizer(вхобъ));
    }
    export проц сайзер(Перемерщик значение)
    {
        wxSizerItem_SetSizer(вхобъ, ВизОбъект.безопУк(значение));
    }

    //-----------------------------------------------------------------------------

    export Размер спейсер()
    {
        Размер spacer;
        wxSizerItem_GetSpacer(вхобъ, spacer);
        return spacer;
    }
    export проц спейсер(Размер значение)
    {
        wxSizerItem_SetSpacer(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export проц показ(бул показ)
    {
        wxSizerItem_Show(вхобъ, показ);
    }

    export бул виден()
    {
        return wxSizerItem_IsShown(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export ВизОбъект данныеПользователя()
    {
        return найдиОбъект(wxSizerItem_GetUserData(вхобъ));
    }

    //-----------------------------------------------------------------------------

    export Точка позиция()
    {
        Точка поз;
        wxSizerItem_GetPosition(вхобъ, поз);
        return поз;
    }
}

