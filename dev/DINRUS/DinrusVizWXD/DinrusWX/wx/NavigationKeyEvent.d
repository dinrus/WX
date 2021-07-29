module wx.NavigationKeyEvent;
public import wx.common;

public import wx.Event;
public import wx.Window;

//! \cond EXTERN
extern (C) ЦелУкз wxNavigationKeyEvent_ctor();
extern (C) бул wxNavigationKeyEvent_GetDirection(ЦелУкз сам);
extern (C) проц wxNavigationKeyEvent_SetDirection(ЦелУкз сам, бул bForward);
extern (C) бул wxNavigationKeyEvent_IsWindowChange(ЦелУкз сам);
extern (C) проц wxNavigationKeyEvent_SetWindowChange(ЦелУкз сам, бул bIs);
extern (C) ЦелУкз wxNavigationKeyEvent_GetCurrentFocus(ЦелУкз сам);
extern (C) проц wxNavigationKeyEvent_SetCurrentFocus(ЦелУкз сам, ЦелУкз ок);
extern (C) проц wxNavigationKeyEvent_SetFlags(ЦелУкз сам, бцел флаги);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеКлавишиНавигации : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        this(wxNavigationKeyEvent_ctor());
    }

    //-----------------------------------------------------------------------------

    export бул направление()
    {
        return wxNavigationKeyEvent_GetDirection(вхобъ);
    }
    export проц направление(бул значение)
    {
        wxNavigationKeyEvent_SetDirection(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export бул изменениеОкна()
    {
        return wxNavigationKeyEvent_IsWindowChange(вхобъ);
    }
    export проц изменениеОкна(бул значение)
    {
        wxNavigationKeyEvent_SetWindowChange(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export Окно текущФокус()
    {
        return cast(Окно)найдиОбъект(wxNavigationKeyEvent_GetCurrentFocus(вхобъ), &Окно.Нов);
    }
    export проц текущФокус(Окно значение)
    {
        wxNavigationKeyEvent_SetCurrentFocus(вхобъ, ВизОбъект.безопУк(значение));
    }

    //-----------------------------------------------------------------------------

    export проц флаги(цел значение)
    {
        wxNavigationKeyEvent_SetFlags(вхобъ, cast(бцел)значение);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеКлавишиНавигации(объ);
    }

    static this()
    {
        добавьТипСоб(super.Тип.СОБ_НАВИГАЦИЯ_КЛАВИША, &СобытиеКлавишиНавигации.Нов);
    }
}
