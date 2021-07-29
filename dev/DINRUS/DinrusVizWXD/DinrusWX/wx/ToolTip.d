module wx.ToolTip;
public import wx.common;
public import wx.Window;

//! \cond EXTERN
extern (C) проц   wxToolTip_Enable(бул флаг);
extern (C) проц   wxToolTip_SetDelay(бцел msecs);
extern (C) ЦелУкз wxToolTip_ctor(ткст подсказка);
extern (C) проц   wxToolTip_SetTip(ЦелУкз сам, ткст подсказка);
extern (C) ЦелУкз wxToolTip_GetTip(ЦелУкз сам);
extern (C) ЦелУкз wxToolTip_GetWindow(ЦелУкз сам);
extern (C) проц   wxToolTip_SetWindow(ЦелУкз сам,ЦелУкз ок);
//! \endcond

//---------------------------------------------------------------------

export class ПодсказкаИнструмента : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(ткст подсказка)
    {
        super(wxToolTip_ctor(подсказка));
    }

    //---------------------------------------------------------------------

    static проц активен(бул значение)
    {
        wxToolTip_Enable(значение);
    }

    //---------------------------------------------------------------------

    static проц заминка(цел значение)
    {
        wxToolTip_SetDelay(cast(бцел)значение);
    }

    //---------------------------------------------------------------------

    export ткст подсказка()
    {
        return cast(ткст) new ВизТкст(wxToolTip_GetTip(вхобъ), да);
    }
    export проц подсказка(ткст значение)
    {
        wxToolTip_SetTip(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export Окно окно()
    {
        return cast(Окно)найдиОбъект(wxToolTip_GetWindow(вхобъ));
    }
    export проц окно(Окно ок)
    {
        return wxToolTip_SetWindow(вхобъ,ВизОбъект.безопУк(ок));
    }

    //---------------------------------------------------------------------
}

