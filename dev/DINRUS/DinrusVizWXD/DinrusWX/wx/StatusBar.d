module wx.StatusBar;
public import wx.common;
public import wx.Window;


public const цел wxST_SIZEGRIP         = 0x0010;
public const цел БЕЗ_АВТОПЕРЕМЕРА    = 0x0001;

public const цел wxSB_NORMAL	= 0x000;
public const цел wxSB_FLAT	= 0x001;
public const цел wxSB_RAISED	= 0x002;

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxStatusBar_ctor();
extern (C) бул   wxStatusBar_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, бцел стиль, ткст имя);

extern (C) проц   wxStatusBar_SetFieldsCount(ЦелУкз сам, цел число, цел* ширины);
extern (C) бул   wxStatusBar_GetFieldRect(ЦелУкз сам, цел i, inout Прямоугольник прям);
extern (C) цел    wxStatusBar_GetBorderY(ЦелУкз сам);
extern (C) ЦелУкз wxStatusBar_GetStatusText(ЦелУкз сам, цел число);
extern (C) цел    wxStatusBar_GetBorderX(ЦелУкз сам);
extern (C) проц   wxStatusBar_SetStatusText(ЦелУкз сам, ткст текст, цел число);
extern (C) проц   wxStatusBar_SetStatusWidths(ЦелУкз сам, цел ч, цел* ширины);

extern (C) цел    wxStatusBar_GetFieldsCount(ЦелУкз сам);
extern (C) проц   wxStatusBar_PopStatusText(ЦелУкз сам, цел поле);
extern (C) проц   wxStatusBar_PushStatusText(ЦелУкз сам, ткст хткст, цел поле);
extern (C) проц   wxStatusBar_SetMinHeight(ЦелУкз сам, цел высь);
extern (C) проц   wxStatusBar_SetStatusStyles(ЦелУкз сам, цел ч, цел* styles);
//! \endcond

//-----------------------------------------------------------------------------

export class СтрокаСостояния : Окно
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxStatusBar_ctor());
    }

    export this(Окно родитель, цел ид /*= ЛЮБОЙ*/, цел стиль = wxST_SIZEGRIP, ткст имя="")
    {
        this();
        if (!создай(родитель, ид, стиль, имя))
        {
            throw new ИсклНевернОперации("Не удалось создать СтрокаСостояния");
        }
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    export this(Окно родитель, цел стиль = wxST_SIZEGRIP, ткст имя="")
    {
        this(родитель, Окно.уникИд, стиль, имя);
    }

    //-----------------------------------------------------------------------------

    export бул создай(Окно родитель, цел ид, цел стиль, ткст имя)
    {
        return wxStatusBar_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, cast(бцел)стиль, имя);
    }

    //-----------------------------------------------------------------------------

    export проц устСчётПолей(цел число, цел[] ширины)
    {
        wxStatusBar_SetFieldsCount(вхобъ, число, ширины.ptr);
    }

    export цел счётПолей()
    {
        return wxStatusBar_GetFieldsCount(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export цел бордюрУ()
    {
        return wxStatusBar_GetBorderY(вхобъ);
    }

    export цел бордюрХ()
    {
        return wxStatusBar_GetBorderX(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул дайПрямПоля(цел i, inout Прямоугольник прям)
    {
        return wxStatusBar_GetFieldRect(вхобъ, i, прям);
    }

    //-----------------------------------------------------------------------------

    export проц текстСтатуса(ткст значение)
    {
        устТекстСтатуса(значение);
    }
    export ткст текстСтатуса()
    {
        return дайТекстСтатуса(0);
    }

    export проц устТекстСтатуса(ткст текст)
    {
        устТекстСтатуса(текст, 0);
    }

    export проц устТекстСтатуса(ткст текст, цел число)
    {
        wxStatusBar_SetStatusText(вхобъ, текст, число);
    }

    export ткст дайТекстСтатуса(цел число)
    {
        return cast(ткст) new ВизТкст(wxStatusBar_GetStatusText(вхобъ, число), да);
    }

    //-----------------------------------------------------------------------------

    export проц шириныСтатуса(цел[] значение)
    {
        устШириныСтатуса(значение.length, значение.ptr);
    }

    export проц устШириныСтатуса(цел ч, цел* ширины)
    {
        wxStatusBar_SetStatusWidths(вхобъ, ч, ширины);
    }

    //-----------------------------------------------------------------------------

    export проц выньТекстСтатуса()
    {
        выньТекстСтатуса(0);
    }

    export проц выньТекстСтатуса(цел поле)
    {
        wxStatusBar_PopStatusText(вхобъ, поле);
    }

    //-----------------------------------------------------------------------------

    export проц суньТекстСтатуса(ткст хткст)
    {
        суньТекстСтатуса(хткст, 0);
    }

    export проц суньТекстСтатуса(ткст хткст, цел поле)
    {
        wxStatusBar_PushStatusText(вхобъ, хткст, поле);
    }

    //-----------------------------------------------------------------------------

    export проц минВысь(цел значение)
    {
        wxStatusBar_SetMinHeight(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export проц стилиСтатуса(цел[] значение)
    {
        wxStatusBar_SetStatusStyles(вхобъ, значение.length, значение.ptr);
    }

}

