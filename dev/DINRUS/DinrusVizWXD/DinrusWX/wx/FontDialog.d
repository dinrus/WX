module wx.FontDialog;
public import wx.common;
public import wx.Dialog;
public import wx.Font;
public import wx.GdiCommon; //for nullobject

//! \cond EXTERN
extern (C) ЦелУкз wxFontData_ctor();
extern (C) проц   wxFontData_dtor(ЦелУкз сам);

extern (C) проц   wxFontData_SetAllowSymbols(ЦелУкз сам, бул флаг);
extern (C) бул   wxFontData_GetAllowSymbols(ЦелУкз сам);

extern (C) проц   wxFontData_SetColour(ЦелУкз сам, ЦелУкз цвет);
extern (C) ЦелУкз wxFontData_GetColour(ЦелУкз сам);

extern (C) проц   wxFontData_SetShowHelp(ЦелУкз сам, бул флаг);
extern (C) бул   wxFontData_GetShowHelp(ЦелУкз сам);

extern (C) проц   wxFontData_EnableEffects(ЦелУкз сам, бул флаг);
extern (C) бул   wxFontData_GetEnableEffects(ЦелУкз сам);

extern (C) проц   wxFontData_SetInitialFont(ЦелУкз сам, ЦелУкз шрифт);
extern (C) ЦелУкз wxFontData_GetInitialFont(ЦелУкз сам);

extern (C) проц   wxFontData_SetChosenFont(ЦелУкз сам, ЦелУкз шрифт);
extern (C) ЦелУкз wxFontData_GetChosenFont(ЦелУкз сам);

extern (C) проц   wxFontData_SetRange(ЦелУкз сам, цел minRange, цел maxRange);
//! \endcond

//---------------------------------------------------------------------

export class ДанныеШрифта : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxFontData_ctor());
    }

    //---------------------------------------------------------------------

    export бул символыРазрешены()
    {
        return wxFontData_GetAllowSymbols(вхобъ);
    }
    export проц символыРазрешены(бул значение)
    {
        wxFontData_SetAllowSymbols(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export бул эффектыВключены()
    {
        return wxFontData_GetEnableEffects(вхобъ);
    }
    export проц эффектыВключены(бул значение)
    {
        wxFontData_EnableEffects(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export бул показатьСправку()
    {
        return wxFontData_GetShowHelp(вхобъ);
    }
    export проц показатьСправку(бул значение)
    {
        wxFontData_SetShowHelp(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export Цвет цвет()
    {
        return new Цвет(wxFontData_GetColour(вхобъ), да);
    }
    export проц цвет(Цвет значение)
    {
        wxFontData_SetColour(вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    export Шрифт начальныйШрифт()
    {
        return new Шрифт(wxFontData_GetInitialFont(вхобъ));
    }
    export проц начальныйШрифт(Шрифт значение)
    {
        wxFontData_SetInitialFont(вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    export Шрифт выбранныйШрифт()
    {
        return new Шрифт(wxFontData_GetChosenFont(вхобъ));
    }
    export проц выбранныйШрифт(Шрифт значение)
    {
        wxFontData_SetChosenFont(вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    export проц устДиапазон(цел мин, цел макс)
    {
        wxFontData_SetRange(вхобъ, мин, макс);
    }

    //---------------------------------------------------------------------
    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new ДанныеШрифта(ptr);
    }
}

//! \cond EXTERN
extern (C) ЦелУкз wxFontDialog_ctor();
extern (C) бул   wxFontDialog_Create(ЦелУкз сам, ЦелУкз родитель, ЦелУкз данные);
extern (C) проц   wxFontDialog_dtor(ЦелУкз сам);

extern (C) цел    wxFontDialog_ShowModal(ЦелУкз сам);
extern (C) ЦелУкз wxFontDialog_GetFontData(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------


export class ДиалогШрифта : Диалог
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxFontDialog_ctor());
    }

    export this(Окно родитель)
    {
        this(родитель, пусто);
    }

    export this(Окно родитель, ДанныеШрифта данные)
    {
        this();
        if (!создай(родитель, данные))
        {
            throw new ИсклНевернОперации("Не удалось создать ДиалогШрифта");
        }
    }

    export бул создай(Окно родитель, ДанныеШрифта данные)
    {
        return wxFontDialog_Create(вхобъ, ВизОбъект.безопУк(родитель), ВизОбъект.безопУк(данные));
    }

    //---------------------------------------------------------------------

    export ДанныеШрифта данныеШрифта()
    {
        return cast(ДанныеШрифта)найдиОбъект(wxFontDialog_GetFontData(вхобъ), &ДанныеШрифта.Нов);
    }

    //---------------------------------------------------------------------

    export override цел покажиМодально()
    {
        return wxFontDialog_ShowModal(вхобъ);
    }

    //---------------------------------------------------------------------
}

//! \cond EXTERN
extern (C) ЦелУкз wxGetFontFromUser_func(ЦелУкз родитель, ЦелУкз иницШрифт);
//! \endcond

export Шрифт дайШрифтОтПользователя(Окно родитель,Шрифт иницШрифт=пусто)
{
    return new Шрифт(wxGetFontFromUser_func(ВизОбъект.безопУк(родитель),ВизОбъект.безопУк(иницШрифт)));
}
