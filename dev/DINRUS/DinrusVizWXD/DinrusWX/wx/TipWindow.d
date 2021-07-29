module wx.TipWindow;
public import wx.common;
public import wx.Window;

//! \cond EXTERN
extern (C) ЦелУкз wxTipWindow_ctor(ЦелУкз родитель, ткст текст, цел максДлина, Прямоугольник* прямОгран);
//extern (C) ЦелУкз wxTipWindow_ctorNoRect(ЦелУкз родитель, ткст текст, цел максДлина);
//extern (C) проц   wxTipWindow_SetTipWindowPtr(ЦелУкз сам, ЦелУкз ОкноПодсказки* windowPtr);
extern (C) проц   wxTipWindow_SetBoundingRect(ЦелУкз сам, inout Прямоугольник прямОгран);
extern (C) проц   wxTipWindow_Close(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class ОкноПодсказки : Окно
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(Окно родитель, ткст текст, цел максДлина = 100)
    {
        this(wxTipWindow_ctor(ВизОбъект.безопУк(родитель), текст, максДлина,пусто));
    }

    export this(Окно родитель, ткст текст, цел максДлина, Прямоугольник прямОгран)
    {
        this(wxTipWindow_ctor(ВизОбъект.безопУк(родитель), текст, максДлина, &прямОгран));
    }

    //-----------------------------------------------------------------------------

    /*export проц УстTipWindowPtr( ОкноПодсказки* windowPtr)
    {
        wxTipWindow_SetTipWindowPtr(вхобъ, ВизОбъект.безопУк(ОкноПодсказки* windowPtr));
    }*/

    //-----------------------------------------------------------------------------

    export проц огранПрям(Прямоугольник значение)
    {
        wxTipWindow_SetBoundingRect(вхобъ, значение);
    }
}
