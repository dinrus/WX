module wx.Sizer;
public import wx.common;
public import wx.Window;

//! \cond EXTERN
extern (C) проц wxSizer_AddWindow(ЦелУкз сам, ЦелУкз окно, цел пропорция, цел флаг, цел бордюр, ЦелУкз данныеПользователя);
extern (C) проц wxSizer_AddSizer(ЦелУкз сам, ЦелУкз сайзер, цел пропорция, цел флаг, цел бордюр, ЦелУкз данныеПользователя);
extern (C) проц wxSizer_Add(ЦелУкз сам, цел ширь, цел высь, цел пропорция, цел флаг, цел бордюр, ЦелУкз данныеПользователя);

extern (C) проц wxSizer_Fit(ЦелУкз сам, ЦелУкз окно, inout Размер размер);
extern (C) проц wxSizer_FitInside(ЦелУкз сам, ЦелУкз окно);
extern (C) проц wxSizer_Layout(ЦелУкз сам);

extern (C) проц wxSizer_InsertWindow(ЦелУкз сам, цел перед, ЦелУкз окно, цел опция, бцел флаг, цел бордюр, ЦелУкз данныеПользователя);
extern (C) проц wxSizer_InsertSizer(ЦелУкз сам, цел перед, ЦелУкз сайзер, цел опция, бцел флаг, цел бордюр, ЦелУкз данныеПользователя);
extern (C) проц wxSizer_Insert(ЦелУкз сам, цел перед, цел ширь, цел высь, цел опция, бцел флаг, цел бордюр, ЦелУкз данныеПользователя);

extern (C) проц wxSizer_PrependWindow(ЦелУкз сам, ЦелУкз окно, цел опция, бцел флаг, цел бордюр, ЦелУкз данныеПользователя);
extern (C) проц wxSizer_PrependSizer(ЦелУкз сам, ЦелУкз сайзер, цел опция, бцел флаг, цел бордюр, ЦелУкз данныеПользователя);
extern (C) проц wxSizer_Prepend(ЦелУкз сам, цел ширь, цел высь, цел опция, бцел флаг, цел бордюр, ЦелУкз данныеПользователя);

//extern (C) бул wxSizer_RemoveWindow(ЦелУкз сам, ЦелУкз окно);
extern (C) бул wxSizer_RemoveSizer(ЦелУкз сам, ЦелУкз сайзер);
extern (C) бул wxSizer_Remove(ЦелУкз сам, цел поз);

extern (C) проц wxSizer_Clear(ЦелУкз сам, бул удалитьОкна);
extern (C) проц wxSizer_DeleteWindows(ЦелУкз сам);

extern (C) проц wxSizer_SetMinSize(ЦелУкз сам, inout Размер размер);

extern (C) бул wxSizer_SetItemMinSizeWindow(ЦелУкз сам, ЦелУкз окно, inout Размер размер);
extern (C) бул wxSizer_SetItemMinSizeSizer(ЦелУкз сам, ЦелУкз сайзер, inout Размер размер);
extern (C) бул wxSizer_SetItemMinSize(ЦелУкз сам, цел поз, inout Размер размер);

extern (C) проц wxSizer_GetSize(ЦелУкз сам, out Размер размер);
extern (C) проц wxSizer_GetPosition(ЦелУкз сам, out Точка тчк);
extern (C) проц wxSizer_GetMinSize(ЦелУкз сам, out Размер размер);

extern (C) проц wxSizer_RecalcSizes(ЦелУкз сам);
extern (C) проц wxSizer_CalcMin(ЦелУкз сам, out Размер размер);

extern (C) проц wxSizer_SetSizeHints(ЦелУкз сам, ЦелУкз окно);
extern (C) проц wxSizer_SetVirtualSizeHints(ЦелУкз сам, ЦелУкз окно);
extern (C) проц wxSizer_SetDimension(ЦелУкз сам, цел x, цел y, цел ширь, цел высь);

extern (C) проц wxSizer_ShowWindow(ЦелУкз сам, ЦелУкз окно, бул показ);
extern (C) проц wxSizer_HideWindow(ЦелУкз сам, ЦелУкз окно);
extern (C) проц wxSizer_ShowSizer(ЦелУкз сам, ЦелУкз сайзер, бул показ);
extern (C) проц wxSizer_HideSizer(ЦелУкз сам, ЦелУкз сайзер);

extern (C) бул wxSizer_IsShownWindow(ЦелУкз сам, ЦелУкз окно);
extern (C) бул wxSizer_IsShownSizer(ЦелУкз сам, ЦелУкз сайзер);

extern (C) бул wxSizer_DetachWindow(ЦелУкз сам, ЦелУкз окно);
extern (C) бул wxSizer_DetachSizer(ЦелУкз сам, ЦелУкз сайзер);
extern (C) бул wxSizer_Detach(ЦелУкз сам, цел индекс);
//! \endcond

//---------------------------------------------------------------------

export abstract class Перемерщик : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    //---------------------------------------------------------------------

    export проц добавь(Окно окно, цел пропорция=0, цел флаг=0, цел бордюр=0, ВизОбъект данныеПользователя=пусто)
    {
        wxSizer_AddWindow(вхобъ, ВизОбъект.безопУк(окно), пропорция, флаг,
                          бордюр, ВизОбъект.безопУк(данныеПользователя));
    }

    export проц добавь(Перемерщик сайзер, цел пропорция=0, цел флаг=0, цел бордюр=0, ВизОбъект данныеПользователя=пусто)
    {
        wxSizer_AddSizer(вхобъ, ВизОбъект.безопУк(сайзер), пропорция, cast(цел)флаг,
                         бордюр, ВизОбъект.безопУк(данныеПользователя));
    }

    export проц добавь(цел ширь, цел высь, цел пропорция=0, цел флаг=0, цел бордюр=0, ВизОбъект данныеПользователя=пусто)
    {
        wxSizer_Add(вхобъ, ширь, высь, пропорция, cast(цел)флаг, бордюр,
                    ВизОбъект.безопУк(данныеПользователя));
    }

    //---------------------------------------------------------------------

    export проц добавьСпейсер(цел размер)
    {
        добавь(размер, размер, 0);
    }

    export проц добавьСпейсерРастяга(цел пропорция = 1)
    {
        добавь(0, 0, пропорция);
    }

    //---------------------------------------------------------------------

    export wx.common.Размер встрой(Окно окно)
    {
        Размер размер;
        wxSizer_Fit(вхобъ, ВизОбъект.безопУк(окно), размер);
        return размер;
    }

    export проц встройВнутрь(Окно окно)
    {
        wxSizer_FitInside(вхобъ, ВизОбъект.безопУк(окно));
    }

    export проц раскладка()
    {
        wxSizer_Layout(вхобъ);
    }

    //---------------------------------------------------------------------

    export проц вставь(бцел индекс, Окно окно, цел пропорция=0, цел флаг=0,
                       цел бордюр=0, ВизОбъект данныеПользователя=пусто)
    {
        wxSizer_InsertWindow(вхобъ, индекс, ВизОбъект.безопУк(окно),
                             пропорция, флаг, бордюр,
                             ВизОбъект.безопУк(данныеПользователя));
    }

    export проц вставь(бцел индекс, Перемерщик сайзер, цел пропорция=0, цел флаг=0,
                       цел бордюр=0, ВизОбъект данныеПользователя=пусто)
    {
        wxSizer_InsertSizer(вхобъ, индекс, ВизОбъект.безопУк(сайзер),
                            пропорция, флаг, бордюр,
                            ВизОбъект.безопУк(данныеПользователя));
    }

    export проц вставь(бцел индекс, цел ширь, цел высь, цел пропорция=0,
                       цел флаг=0, цел бордюр=0, ВизОбъект данныеПользователя=пусто)
    {
        wxSizer_Insert(вхобъ, индекс, ширь, высь, пропорция, флаг,
                       бордюр, ВизОбъект.безопУк(данныеПользователя));
    }

    //---------------------------------------------------------------------

    export проц приставь(Окно окно, цел пропорция=0, цел флаг=0, цел бордюр=0,
                        ВизОбъект данныеПользователя=пусто)
    {
        wxSizer_PrependWindow(вхобъ, ВизОбъект.безопУк(окно), пропорция,
                              флаг, бордюр, ВизОбъект.безопУк(данныеПользователя));
    }

    export проц приставь(Перемерщик сайзер, цел пропорция=0, цел флаг=0, цел бордюр=0,
                        ВизОбъект данныеПользователя=пусто)
    {
        wxSizer_PrependSizer(вхобъ, ВизОбъект.безопУк(сайзер), пропорция,
                             флаг, бордюр, ВизОбъект.безопУк(данныеПользователя));
    }

    export проц приставь(цел ширь, цел высь, цел пропорция=0, цел флаг=0,
                        цел бордюр=0, ВизОбъект данныеПользователя=пусто)
    {
        wxSizer_Prepend(вхобъ, ширь, высь, пропорция,
                        флаг, бордюр, ВизОбъект.безопУк(данныеПользователя));
    }

    //---------------------------------------------------------------------

    export проц приставьСпейсер(цел размер)
    {
        добавь(размер, размер, 0);
    }

    export проц приставьСпейсерРастяга(цел пропорция = 1)
    {
        добавь(0, 0, пропорция);
    }

    //---------------------------------------------------------------------
    /+
    export бул удали(Окно окно)
    {
        return wxSizer_RemoveWindow(вхобъ, ВизОбъект.безопУк(окно));
    }
    +/
    export бул удали(Перемерщик сайзер)
    {
        return wxSizer_RemoveSizer(вхобъ, ВизОбъект.безопУк(сайзер));
    }

    export бул удали(цел поз)
    {
        return wxSizer_Remove(вхобъ, поз);
    }

    //---------------------------------------------------------------------

    export проц устМинРазм(Размер размер)
    {
        wxSizer_SetMinSize(вхобъ, размер);
    }

    //---------------------------------------------------------------------

    export бул устМинРазмЭлта(Окно окно, Размер размер)
    {
        return wxSizer_SetItemMinSizeWindow(вхобъ, ВизОбъект.безопУк(окно),размер);
    }

    export бул устМинРазмЭлта(Перемерщик сайзер, Размер размер)
    {
        return wxSizer_SetItemMinSizeSizer(вхобъ, ВизОбъект.безопУк(сайзер),размер);
    }

    export бул устМинРазмЭлта(цел поз, Размер размер)
    {
        return wxSizer_SetItemMinSize(вхобъ, поз, размер);
    }

    //---------------------------------------------------------------------

    export Размер размер()
    {
        Размер размер;
        wxSizer_GetSize(вхобъ, размер);
        return размер;
    }

    export Точка позиция()
    {
        Точка тчк;
        wxSizer_GetPosition(вхобъ, тчк);
        return тчк;
    }

    export Размер минРазм()
    {
        Размер размер;
        wxSizer_GetMinSize(вхобъ, размер);
        return размер;
    }

    //---------------------------------------------------------------------

    export  проц пересчётРазмеров()
    {
        wxSizer_RecalcSizes(вхобъ);
    }

    //---------------------------------------------------------------------

    export  Размер вычислиМин()
    {
        Размер размер;
        wxSizer_CalcMin(вхобъ, размер);
        return размер;
    }

    //---------------------------------------------------------------------

    export проц устРазмПодсказ(Окно окно)
    {
        wxSizer_SetSizeHints(вхобъ, ВизОбъект.безопУк(окно));
    }

    export проц устВиртуалРазмПодсказ(Окно окно)
    {
        wxSizer_SetVirtualSizeHints(вхобъ, ВизОбъект.безопУк(окно));
    }

    export проц устИзмерение(цел x, цел y, цел ширь, цел высь)
    {
        wxSizer_SetDimension(вхобъ, x, y, ширь, высь);
    }

    //---------------------------------------------------------------------

    export проц показ(Окно окно, бул показ)
    {
        wxSizer_ShowWindow(вхобъ, ВизОбъект.безопУк(окно), показ);
    }

    export проц показ(Перемерщик сайзер, бул показ)
    {
        wxSizer_ShowSizer(вхобъ, ВизОбъект.безопУк(сайзер), показ);
    }

    // Нов до wx.NET
    export проц показ(бул пкз)
    {
        показ(this, пкз);
    }


    //---------------------------------------------------------------------

    export проц очисть(бул удалитьОкна)
    {
        wxSizer_Clear(вхобъ, удалитьОкна);
    }

    export проц удалиОкно()
    {
        wxSizer_DeleteWindows(вхобъ);
    }

    //---------------------------------------------------------------------

    export проц спрячь(Окно окно)
    {
        wxSizer_HideWindow(вхобъ, ВизОбъект.безопУк(окно));
    }

    export проц спрячь(Перемерщик сайзер)
    {
        wxSizer_HideSizer(вхобъ, ВизОбъект.безопУк(сайзер));
    }

    //---------------------------------------------------------------------

    export бул виден(Окно окно)
    {
        return wxSizer_IsShownWindow(вхобъ, ВизОбъект.безопУк(окно));
    }

    export бул виден(Перемерщик сайзер)
    {
        return wxSizer_IsShownSizer(вхобъ, ВизОбъект.безопУк(сайзер));
    }

    //---------------------------------------------------------------------

    export бул отторочь(Окно окно)
    {
        return wxSizer_DetachWindow(вхобъ, ВизОбъект.безопУк(окно));
    }

    export бул отторочь(Перемерщик сайзер)
    {
        return wxSizer_DetachSizer(вхобъ, ВизОбъект.безопУк(сайзер));
    }

    export бул отторочь(цел индекс)
    {
        return wxSizer_Detach(вхобъ, индекс);
    }

    //---------------------------------------------------------------------
}