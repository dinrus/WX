module wx.Panel;
public import wx.common;
public import wx.Window;
public import wx.Button;

//! \cond EXTERN
extern (C) ЦелУкз wxPanel_ctor();
extern (C) ЦелУкз wxPanel_ctor2(ЦелУкз родитель, цел ид, inout Точка поз, inout Размер размер, бцел стиль, ткст имя);
extern (C) бул wxPanel_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер размер, бцел стиль, ткст имя);
extern (C) проц wxPanel_InitDialog(ЦелУкз сам);
extern (C) ЦелУкз wxPanel_GetDefaultItem(ЦелУкз сам);
extern (C) проц wxPanel_SetDefaultItem(ЦелУкз сам, ЦелУкз btn);
//! \endcond

/// A панель is a окно on который controls are placed. It is usually
/// placed within a рамка. It contains minimal extra functionality over and
/// above its родитель class Окно; its main purpose is до be similar in
/// appearance and functionality до a dialog, кноп with the flexibility of
/// having any окно as a родитель.
export class Панель : Окно
{
    //---------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxPanel_ctor());
    }

    export this(Окно родитель, цел ид /*= ЛЮБОЙ*/, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = ТАБ_ТРАВЕРЗА|БЕЗ_БОРДЮРА, ткст имя = СтрИмениПанели)
    {
        super(wxPanel_ctor2(ВизОбъект.безопУк(родитель), ид, поз, размер, стиль, имя));
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    export this(Окно родитель, Точка поз=ДЕФПОЗ, Размер размер=ДЕФРАЗМ, цел стиль=ТАБ_ТРАВЕРЗА|БЕЗ_БОРДЮРА, ткст имя=СтрИмениПанели)
    {
        this(родитель, Окно.уникИд, поз, размер, стиль, имя);
    }

    //---------------------------------------------------------------------

    export бул создай(Окно родитель, цел ид, inout Точка поз, inout Размер размер, цел стиль, ткст имя)
    {
        return wxPanel_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, поз, размер, стиль, имя);
    }

    //---------------------------------------------------------------------

    export Кнопка дефЭлт()
    {
        ЦелУкз btn = wxPanel_GetDefaultItem(вхобъ);
        return (btn != ЦелУкз.init) ? new Кнопка(btn) : пусто;
    }
    export проц дефЭлт(Кнопка значение)
    {
        wxPanel_SetDefaultItem(вхобъ, значение.вхобъ);
    }

    //---------------------------------------------------------------------

    export override проц иницДиалог()
    {
        wxPanel_InitDialog(вхобъ);
    }

    //---------------------------------------------------------------------
}
