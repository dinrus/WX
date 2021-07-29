module wx.Caret;
public import wx.common;
public import wx.Window;

//! \cond EXTERN
extern (C) ЦелУкз wxCaret_ctor();
extern (C) проц wxCaret_dtor(ЦелУкз сам);
extern (C) бул wxCaret_Create(ЦелУкз сам, ЦелУкз окно, цел ширь, цел высь);
extern (C) бул wxCaret_IsOk(ЦелУкз сам);
extern (C) бул wxCaret_IsVisible(ЦелУкз сам);
extern (C) проц wxCaret_GetPosition(ЦелУкз сам, out цел x, out цел y);
extern (C) проц wxCaret_GetSize(ЦелУкз сам, out цел ширь, out цел высь);
extern (C) ЦелУкз wxCaret_GetWindow(ЦелУкз сам);
extern (C) проц wxCaret_SetSize(ЦелУкз сам, цел ширь, цел высь);
extern (C) проц wxCaret_Move(ЦелУкз сам, цел x, цел y);
extern (C) проц wxCaret_Show(ЦелУкз сам, бул показ);
extern (C) проц wxCaret_Hide(ЦелУкз сам);
extern (C) цел wxCaret_GetBlinkTime();
extern (C) проц wxCaret_SetBlinkTime(цел миллисек);
//! \endcond

//---------------------------------------------------------------------

export class Каретка : ВизОбъект
{
    export this()
    {
        this(wxCaret_ctor(), да);
    }

    export this(ЦелУкз объ)
    {
        super(объ);
    }

    export this(ЦелУкз объ, бул памСобств)
    {
        super(объ);
        this.памСобств = памСобств;
    }

    export this(Окно ок, Размер рм)
    {
        this(ок, рм.ширь, рм.высь);
    }

    export this(Окно окно, цел ширь, цел высь)
    {
        this(wxCaret_ctor(), да);
        if (!wxCaret_Create(вхобъ, ВизОбъект.безопУк(окно), ширь, высь))
        {
            throw new ИсклНевернОперации("Не удалось создать Каретку");
        }
    }

    //---------------------------------------------------------------------
/*
    override protected проц dtor()
    {
        wxCaret_dtor(вхобъ);
    }
    */
	//----------------------------
		export ~this(){wxCaret_dtor(this.м_вхобъ);}
	//----------------------------
    //---------------------------------------------------------------------

    export бул создай(Окно окно, цел ширь, цел высь)
    {
        return wxCaret_Create(this.м_вхобъ, ВизОбъект.безопУк(окно), ширь, высь);
    }

    //---------------------------------------------------------------------

    export бул Ок()
    {
        return wxCaret_IsOk(this.м_вхобъ);
    }

    export бул виден()
    {
        return wxCaret_IsVisible(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

    export Точка позиция()
    {
        Точка точка;
        wxCaret_GetPosition(this.м_вхобъ, точка.Х, точка.У);
        return точка;
    }
    export проц позиция(Точка значение)
    {
        wxCaret_Move(this.м_вхобъ, значение.Х, значение.У);
    }

    //---------------------------------------------------------------------

    export Размер размер()
    {
        Размер рм;
        wxCaret_GetSize(this.м_вхобъ, рм.ширь, рм.высь);
        return рм;
    }
    export проц размер(Размер значение)
    {
        wxCaret_SetSize(this.м_вхобъ, значение.ширь, значение.высь);
    }

    //---------------------------------------------------------------------

    export Окно окно()
    {
        return cast(Окно)найдиОбъект(wxCaret_GetWindow(this.м_вхобъ));
    }

    //---------------------------------------------------------------------

    export проц показ(бул показать)
    {
        wxCaret_Show(this.м_вхобъ, показать);
    }

    export проц спрячь()
    {
        wxCaret_Hide(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

    static цел времяМигания()
    {
        return wxCaret_GetBlinkTime();
    }

    static проц времяМигания(цел значение)
    {
        wxCaret_SetBlinkTime(значение);
    }

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new Каретка(ptr);
    }
    //---------------------------------------------------------------------
}

//! \cond EXTERN
extern (C) ЦелУкз wxCaretSuspend_ctor(ЦелУкз ок);
extern (C) проц wxCaretSuspend_dtor(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

export class СуспендКаретки : ВизОбъект
{
    export this(Окно ок)
    {
        this(wxCaretSuspend_ctor(ВизОбъект.безопУк(ок)), да);
    }

    export this(ЦелУкз объ)
    {
        super(объ);
    }

    export this(ЦелУкз вхобъ, бул памСобств)
    {
        super(вхобъ);
        this.памСобств = памСобств;
    }
	//----------------------------
		export ~this(){wxCaretSuspend_dtor(this.м_вхобъ);}
	//----------------------------
    //---------------------------------------------------------------------
/*
    override protected проц dtor()
    {
        wxCaretSuspend_dtor(вхобъ);
    }
    */
}
