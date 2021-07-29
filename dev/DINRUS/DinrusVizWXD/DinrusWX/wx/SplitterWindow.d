module wx.SplitterWindow;
public import wx.common;
public import wx.Window;

public enum ПСплитРежим
{
    Горизонтально	= 1,
    Вертикально
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C)
{
    alias проц function(ОкноДелитель объ, цел x, цел y) Virtual_OnDoubleClickSash;
    alias проц function(ОкноДелитель объ, ЦелУкз removed) Virtual_OnUnsplit;
    alias бул function(ОкноДелитель объ, цел новПозСаша) Virtual_OnSashPositionChange;
}

extern (C) ЦелУкз wxSplitWnd_ctor(ЦелУкз родитель, цел ид, inout Точка поз, inout Размер размер, бцел стиль, ткст имя);
extern (C) проц   wxSplitWnd_RegisterVirtual(ЦелУкз сам, ОкноДелитель объ, Virtual_OnDoubleClickSash onDoubleClickSash, Virtual_OnUnsplit onUnsplit, Virtual_OnSashPositionChange onSashPositionChange);
extern (C) проц   wxSplitWnd_OnDoubleClickSash(ЦелУкз сам, цел x, цел y);
extern (C) проц   wxSplitWnd_OnUnsplit(ЦелУкз сам, ЦелУкз removed);
extern (C) бул   wxSplitWnd_OnSashPositionChange(ЦелУкз сам, цел новПозСаша);
extern (C) цел    wxSplitWnd_GetSplitMode(ЦелУкз сам);
extern (C) бул   wxSplitWnd_IsSplit(ЦелУкз сам);
extern (C) бул   wxSplitWnd_SplitHorizontally(ЦелУкз сам, ЦелУкз ок1, ЦелУкз ок2, цел sashPos);
extern (C) бул   wxSplitWnd_SplitVertically(ЦелУкз сам, ЦелУкз ок1, ЦелУкз ок2, цел sashPos);
extern (C) бул   wxSplitWnd_Unsplit(ЦелУкз сам, ЦелУкз toRemove);
extern (C) проц   wxSplitWnd_SetSashPosition(ЦелУкз сам, цел позиция, бул перерисовка);
extern (C) цел    wxSplitWnd_GetSashPosition(ЦелУкз сам);

extern (C) цел    wxSplitWnd_GetMinimumPaneSize(ЦелУкз сам);
extern (C) ЦелУкз wxSplitWnd_GetWindow1(ЦелУкз сам);
extern (C) ЦелУкз wxSplitWnd_GetWindow2(ЦелУкз сам);
extern (C) проц   wxSplitWnd_Initialize(ЦелУкз сам, ЦелУкз окно);
extern (C) бул   wxSplitWnd_ReplaceWindow(ЦелУкз сам, ЦелУкз старОк, ЦелУкз новОк);
extern (C) проц   wxSplitWnd_SetMinimumPaneSize(ЦелУкз сам, цел paneSize);
extern (C) проц   wxSplitWnd_SetSplitMode(ЦелУкз сам, цел режим);
extern (C) проц   wxSplitWnd_UpdateSize(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

export class ОкноДелитель : Окно
{
    enum
    {
        БОРДЮР3Д		= 0x00000200,
        ЛАЙВОБНОВ	= 0x00000080,
        САШ3Д		= 0x00000100,
        ОД3Д			= (БОРДЮР3Д | САШ3Д),
    }

    //---------------------------------------------------------------------

    export this(Окно родитель, цел ид /*= ЛЮБОЙ*/, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = ОД3Д, ткст имя="splitter")
    {
        super(wxSplitWnd_ctor(ВизОбъект.безопУк(родитель), ид, поз, размер, cast(бцел)стиль, имя));

        wxSplitWnd_RegisterVirtual(вхобъ, this, &staticOnDoubleClickSash, &staticDoOnUnsplit, &staticOnSashPositionChange);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    export this(Окно родитель, Точка поз=ДЕФПОЗ, Размер размер=ДЕФРАЗМ, цел стиль=ОД3Д, ткст имя="splitter")
    {
        this(родитель, Окно.уникИд, поз, размер, стиль, имя);
    }

    //---------------------------------------------------------------------

    static export extern(C) проц staticOnDoubleClickSash(ОкноДелитель объ, цел x, цел y)
    {
        объ.приДНажимеСаша(x, y);
    }
    export  проц приДНажимеСаша(цел x, цел y)
    {
        wxSplitWnd_OnDoubleClickSash(вхобъ, x, y);
    }

    //---------------------------------------------------------------------

    static export extern(C) проц staticDoOnUnsplit(ОкноДелитель объ, ЦелУкз removed)
    {
        объ.приОтменеСплита(cast(Окно)найдиОбъект(removed));
    }

    export  проц приОтменеСплита(Окно removed)
    {
        wxSplitWnd_OnUnsplit(вхобъ, ВизОбъект.безопУк(removed));
    }

    //---------------------------------------------------------------------

    static export extern(C) бул staticOnSashPositionChange(ОкноДелитель объ, цел новПозСаша)
    {
        return объ.приИзмененииПозицииСаша(новПозСаша);
    }
    export  бул приИзмененииПозицииСаша(цел новПозСаша)
    {
        return wxSplitWnd_OnSashPositionChange(вхобъ, новПозСаша);
    }

    //---------------------------------------------------------------------

    export бул разделено()
    {
        return wxSplitWnd_IsSplit(вхобъ);
    }

    //---------------------------------------------------------------------

    export бул разделиГоризонтально(Окно ок1, Окно ок2, цел sashPos=0)
    {
        return wxSplitWnd_SplitHorizontally(вхобъ, ВизОбъект.безопУк(ок1), ВизОбъект.безопУк(ок2), sashPos);
    }

    //---------------------------------------------------------------------

    export ПСплитРежим сплитРежим()
    {
        return cast(ПСплитРежим)wxSplitWnd_GetSplitMode(вхобъ);
    }
    export проц сплитРежим(ПСплитРежим значение)
    {
        wxSplitWnd_SetSplitMode(вхобъ, cast(цел)значение);
    }

    //---------------------------------------------------------------------

    export бул разделиВертикально(Окно ок1, Окно ок2, цел sashPos = 0)
    {
        return wxSplitWnd_SplitVertically(вхобъ, ВизОбъект.безопУк(ок1), ВизОбъект.безопУк(ок2), sashPos);
    }

    //---------------------------------------------------------------------

    export бул отмениСплит(Окно удалить= пусто)
    {
        return wxSplitWnd_Unsplit(вхобъ, ВизОбъект.безопУк(удалить));
    }

    //---------------------------------------------------------------------

    export проц позицияСаша(цел значение)
    {
        устПозициюСаша(значение, да);
    }
    export цел позицияСаша()
    {
        return wxSplitWnd_GetSashPosition(вхобъ);
    }

    export проц устПозициюСаша(цел позиция, бул перерисовка=да)
    {
        wxSplitWnd_SetSashPosition(вхобъ, позиция, перерисовка);
    }

    //---------------------------------------------------------------------

    export цел минРазмПано()
    {
        return wxSplitWnd_GetMinimumPaneSize(вхобъ);
    }
    export проц минРазмПано(цел значение)
    {
        wxSplitWnd_SetMinimumPaneSize(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export static ВизОбъект мНов(ЦелУкз ptr)
    {
        return new Окно(ptr);
    }
    export Окно окно1()
    {
        return cast(Окно)найдиОбъект(wxSplitWnd_GetWindow1(вхобъ), &мНов);
    }

    //---------------------------------------------------------------------

    export Окно окно2()
    {
        return cast(Окно)найдиОбъект(wxSplitWnd_GetWindow2(вхобъ), &мНов);
    }

    //---------------------------------------------------------------------

    export проц иниц(Окно окно)
    {
        wxSplitWnd_Initialize(вхобъ, ВизОбъект.безопУк(окно));
    }

    //---------------------------------------------------------------------

    export бул замениОкно(Окно старОк, Окно новОк)
    {
        return wxSplitWnd_ReplaceWindow(вхобъ, ВизОбъект.безопУк(старОк), ВизОбъект.безопУк(новОк));
    }

    //---------------------------------------------------------------------

    export проц обновиРазм()
    {
        wxSplitWnd_UpdateSize(вхобъ);
    }
}
