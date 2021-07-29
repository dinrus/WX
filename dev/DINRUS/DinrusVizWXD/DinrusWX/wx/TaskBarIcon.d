module wx.TaskBarIcon;
public import wx.common;
public import wx.EvtHandler;
public import wx.Icon;
public import wx.Menu;

//! \cond EXTERN
extern (C) ТипСобытия wxTaskBarIcon_EVT_TASKBAR_MOVE();
extern (C) ТипСобытия wxTaskBarIcon_EVT_TASKBAR_LEFT_DOWN();
extern (C) ТипСобытия wxTaskBarIcon_EVT_TASKBAR_LEFT_UP();
extern (C) ТипСобытия wxTaskBarIcon_EVT_TASKBAR_RIGHT_DOWN();
extern (C) ТипСобытия wxTaskBarIcon_EVT_TASKBAR_RIGHT_UP();
extern (C) ТипСобытия wxTaskBarIcon_EVT_TASKBAR_LEFT_DCLICK();
extern (C) ТипСобытия wxTaskBarIcon_EVT_TASKBAR_RIGHT_DCLICK();
//! \endcond

extern (C)
{
    alias ЦелУкз function (ИконкаТаскБара) Virtual_создайВсплывающееМеню;
}

//! \cond EXTERN
extern (C) ЦелУкз wxTaskBarIcon_ctor();
extern (C) ЦелУкз wxTaskBarIcon_ctor2(цел типИконки);
extern (C) проц   wxTaskBarIcon_RegisterVirtual(ЦелУкз сам, ИконкаТаскБара объ,
        Virtual_создайВсплывающееМеню popmenu);
extern (C) ЦелУкз wxTaskBarIcon_dtor(ЦелУкз сам);

extern (C) ЦелУкз wxTaskBarIcon_BaseCreatePopupMenu(ЦелУкз сам);
extern (C) бул wxTaskBarIcon_IsIconInstalled(ЦелУкз сам);
extern (C) бул wxTaskBarIcon_IsOk(ЦелУкз сам);
extern (C) бул wxTaskBarIcon_PopupMenu(ЦелУкз сам, ЦелУкз меню);
extern (C) бул wxTaskBarIcon_RemoveIcon(ЦелУкз сам);
extern (C) бул wxTaskBarIcon_SetIcon(ЦелУкз сам, ЦелУкз пиктограмма, ткст тултип);
//! \endcond

//! \cond EXTERN
extern (C) ЦелУкз wxTaskBarIconEvent_ctor(цел типКоманды, ЦелУкз тбИконка);
extern (C) ЦелУкз wxTaskBarIconEvent_Clone(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

/// тип of taskbar элт до create
enum ПтипИконкиТаскБара
{
    Дефолт
}

export class ИконкаТаскБара : ОбработчикСоб
{
    public static ТипСобытия   СОБ_ТАСКБАР_ДВИЖЕНИЕ;
    public static ТипСобытия   СОБ_ТАСКБАР_ЛЕВАЯ_ВНИЗУ;
    public static ТипСобытия   СОБ_ТАСКБАР_ЛЕВАЯ_ВВЕРХУ;
    public static ТипСобытия   СОБ_ТАСКБАР_ПРАВАЯ_ВНИЗУ;
    public static ТипСобытия   СОБ_ТАСКБАР_ПРАВАЯ_ВВЕРХУ;
    public static ТипСобытия   СОБ_ТАСКБАР_ЛЕВАЯ_ДНАЖАТА;
    public static ТипСобытия   СОБ_ТАСКБАР_ПРАВАЯ_ДНАЖАТА;

    static this()
    {
          СОБ_ТАСКБАР_ДВИЖЕНИЕ = wxTaskBarIcon_EVT_TASKBAR_MOVE();
          СОБ_ТАСКБАР_ЛЕВАЯ_ВНИЗУ = wxTaskBarIcon_EVT_TASKBAR_LEFT_DOWN();
          СОБ_ТАСКБАР_ЛЕВАЯ_ВВЕРХУ = wxTaskBarIcon_EVT_TASKBAR_LEFT_UP();
          СОБ_ТАСКБАР_ПРАВАЯ_ВНИЗУ = wxTaskBarIcon_EVT_TASKBAR_RIGHT_DOWN();
          СОБ_ТАСКБАР_ПРАВАЯ_ВВЕРХУ = wxTaskBarIcon_EVT_TASKBAR_RIGHT_UP();
          СОБ_ТАСКБАР_ЛЕВАЯ_ДНАЖАТА = wxTaskBarIcon_EVT_TASKBAR_LEFT_DCLICK();
          СОБ_ТАСКБАР_ПРАВАЯ_ДНАЖАТА = wxTaskBarIcon_EVT_TASKBAR_RIGHT_DCLICK();

        Событие.добавьТипСоб(  СОБ_ТАСКБАР_ДВИЖЕНИЕ,         &СобытиеИконкиТаскБара.Нов);
        Событие.добавьТипСоб(  СОБ_ТАСКБАР_ЛЕВАЯ_ВНИЗУ,    &СобытиеИконкиТаскБара.Нов);
        Событие.добавьТипСоб(  СОБ_ТАСКБАР_ЛЕВАЯ_ВВЕРХУ,      &СобытиеИконкиТаскБара.Нов);
        Событие.добавьТипСоб(  СОБ_ТАСКБАР_ПРАВАЯ_ВНИЗУ,   &СобытиеИконкиТаскБара.Нов);
        Событие.добавьТипСоб(  СОБ_ТАСКБАР_ПРАВАЯ_ВВЕРХУ,     &СобытиеИконкиТаскБара.Нов);
        Событие.добавьТипСоб(  СОБ_ТАСКБАР_ЛЕВАЯ_ДНАЖАТА,  &СобытиеИконкиТаскБара.Нов);
        Событие.добавьТипСоб(  СОБ_ТАСКБАР_ПРАВАЯ_ДНАЖАТА, &СобытиеИконкиТаскБара.Нов);
    }

    export this()
    {
        this(wxTaskBarIcon_ctor(), да);
    }

    export this(ПтипИконкиТаскБара типИконки)
    {
        this(wxTaskBarIcon_ctor2(cast(цел)типИконки), да);
    }

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);

        wxTaskBarIcon_RegisterVirtual(вхобъ, this, &staticCreatePopupMenu);
    }

    private this(ЦелУкз вхобъ, бул памСобств)
    {
        super(вхобъ);
        this.памСобств = памСобств;

        wxTaskBarIcon_RegisterVirtual(вхобъ, this, &staticCreatePopupMenu);
    }
/*
    override protected проц dtor()
    {
        wxTaskBarIcon_dtor(вхобъ);
    }
	*/
	//----------------------------
		export ~this(){wxTaskBarIcon_dtor(вхобъ);}
	//----------------------------
    //---------------------------------------------------------------------

    static export extern(C) ЦелУкз staticCreatePopupMenu(ИконкаТаскБара объ)
    {
        return ВизОбъект.безопУк(объ.создайВсплывающееМеню());
    }
    export  Меню создайВсплывающееМеню()
    {
        return cast(Меню)найдиОбъект(wxTaskBarIcon_BaseCreatePopupMenu(вхобъ));
    }

    //---------------------------------------------------------------------

    export бул иконкаУстановлена()
    {
        return wxTaskBarIcon_IsIconInstalled(вхобъ);
    }

    export бул Ок()
    {
        return wxTaskBarIcon_IsOk(вхобъ);
    }

    export бул всплывающееМеню(Меню меню)
    {
        return wxTaskBarIcon_PopupMenu(вхобъ, ВизОбъект.безопУк(меню));
    }

    export бул удалиИконку()
    {
        return wxTaskBarIcon_RemoveIcon(вхобъ);
    }

    export бул устИконку(Пиктограмма пиктограмма, ткст тултип = "")
    {
        return wxTaskBarIcon_SetIcon(вхобъ, ВизОбъект.безопУк(пиктограмма), тултип);
    }

    export проц Move_Add(ДатчикСобытий значение)
    {
        добавьДатчикСобытий(  СОБ_ТАСКБАР_ДВИЖЕНИЕ, значение, this);
    }
    export проц Move_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц LeftDown_Add(ДатчикСобытий значение)
    {
        добавьДатчикСобытий(  СОБ_ТАСКБАР_ЛЕВАЯ_ВНИЗУ, значение, this);
    }
    export проц LeftDown_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц LeftUp_Add(ДатчикСобытий значение)
    {
        добавьДатчикСобытий(  СОБ_ТАСКБАР_ЛЕВАЯ_ВВЕРХУ, значение, this);
    }
    export проц LeftUp_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц RightDown_Add(ДатчикСобытий значение)
    {
        добавьДатчикСобытий(  СОБ_ТАСКБАР_ПРАВАЯ_ВНИЗУ, значение, this);
    }
    export проц RightDown_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц RightUp_Add(ДатчикСобытий значение)
    {
        добавьДатчикСобытий(  СОБ_ТАСКБАР_ПРАВАЯ_ВВЕРХУ, значение, this);
    }
    export проц RightUp_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц LeftDClick_Add(ДатчикСобытий значение)
    {
        добавьДатчикСобытий(  СОБ_ТАСКБАР_ЛЕВАЯ_ДНАЖАТА, значение, this);
    }
    export проц LeftDClick_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц RightDClick_Add(ДатчикСобытий значение)
    {
        добавьДатчикСобытий(  СОБ_ТАСКБАР_ПРАВАЯ_ДНАЖАТА, значение, this);
    }
    export проц RightDClick_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }
}

export class СобытиеИконкиТаскБара : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(ТипСобытия тип, ИконкаТаскБара тбИконка)
    {
        super(wxTaskBarIconEvent_ctor(тип, ВизОбъект.безопУк(тбИконка)));
    }

    export Событие клонируй()
    {
        return new СобытиеИконкиТаскБара(wxTaskBarIconEvent_Clone(вхобъ));
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеИконкиТаскБара(объ);
    }
}
