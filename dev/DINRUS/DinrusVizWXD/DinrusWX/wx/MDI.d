module wx.MDI;
public import wx.common;
public import wx.Frame;

//! \cond EXTERN
extern (C)
{
    alias ЦелУкз function(РамкаРодителяМДИ объ) Virtual_OnCreateClient;
}

extern (C) ЦелУкз wxMDIParentFrame_ctor();
extern (C) проц wxMDIParentFrame_RegisterVirtual(ЦелУкз сам, РамкаРодителяМДИ объ, Virtual_OnCreateClient onCreateClient);
extern (C) ЦелУкз wxMDIParentFrame_OnCreateClient(ЦелУкз сам);
extern (C) бул   wxMDIParentFrame_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ткст титул, inout Точка поз, inout Размер размер, бцел стиль, ткст имя);

extern (C) ЦелУкз wxMDIParentFrame_GetActiveChild(ЦелУкз сам);
//extern (C) проц   wxMDIParentFrame_SetActiveChild(ЦелУкз сам, ЦелУкз pChildFrame);

extern (C) ЦелУкз wxMDIParentFrame_GetClientWindow(ЦелУкз сам);

extern (C) проц   wxMDIParentFrame_Cascade(ЦелУкз сам);
extern (C) проц   wxMDIParentFrame_Tile(ЦелУкз сам);

extern (C) проц   wxMDIParentFrame_ArrangeIcons(ЦелУкз сам);

extern (C) проц   wxMDIParentFrame_ActivateNext(ЦелУкз сам);
extern (C) проц   wxMDIParentFrame_ActivatePrevious(ЦелУкз сам);

extern (C) проц   wxMDIParentFrame_GetClientSize(ЦелУкз сам, out цел ширь, out цел высь);
//! \endcond

//-----------------------------------------------------------------------------

export class РамкаРодителяМДИ : Рамка
{
    enum { ДЕФ_СТИЛЬ_РАМКИ_МДИ = ДЕФ_СТИЛЬ_РАМКИ | ВПРОКРУТ | ГПРОКРУТ }

    //-----------------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxMDIParentFrame_ctor());
        wxMDIParentFrame_RegisterVirtual(вхобъ, this, &staticDoOnCreateClient);
    }

    export this(Окно родитель, цел ид, ткст титул, Точка поз=ДЕФПОЗ, Размер размер=ДЕФРАЗМ, цел стиль=ДЕФ_СТИЛЬ_РАМКИ_МДИ, ткст имя=стрИмениРамки)
    {
        this();

        if (!создай(родитель, ид, титул, поз, размер, стиль, имя))
        {
            throw new ИсклНевернОперации("Не удалось создать РамкаРодителяМДИ");
        }
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    export this(Окно родитель, ткст титул, Точка поз=ДЕФПОЗ, Размер размер=ДЕФРАЗМ, цел стиль=ДЕФ_СТИЛЬ_РАМКИ_МДИ, ткст имя=стрИмениРамки)
    {
        this(родитель, Окно.уникИд, титул, поз, размер, стиль, имя);
    }

    //-----------------------------------------------------------------------------

    export override бул создай(Окно родитель, цел ид, ткст титул, inout Точка поз, inout Размер размер, цел стиль, ткст имя)
    {
        return wxMDIParentFrame_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, титул, поз, размер, cast(бцел)стиль, имя);
    }

    //-----------------------------------------------------------------------------

    static export extern(C)  ЦелУкз staticDoOnCreateClient(РамкаРодителяМДИ объ)
    {
        return ВизОбъект.безопУк(объ.поСозданиюКлиента());
    }

    export  ОкноКлиентаМДИ поСозданиюКлиента()
    {
        return cast(ОкноКлиентаМДИ)найдиОбъект(wxMDIParentFrame_OnCreateClient(вхобъ), &ОкноКлиентаМДИ.Нов);
    }

    //-----------------------------------------------------------------------------

    export РамкаОтпрыскаМДИ дайАктивныйОтпрыск()
    {
        return cast(РамкаОтпрыскаМДИ)найдиОбъект(wxMDIParentFrame_GetActiveChild(вхобъ), &РамкаОтпрыскаМДИ.Нов);
    }

    /*
    export проц УстActiveChild(РамкаОтпрыскаМДИ pChildFrame)
    {
    	wxMDIParentFrame_SetActiveChild(вхобъ, ВизОбъект.безопУк(pChildFrame));
    }
    */

    //-----------------------------------------------------------------------------

    export ОкноКлиентаМДИ дайОкноКлиента()
    {
        return cast(ОкноКлиентаМДИ)найдиОбъект(wxMDIParentFrame_GetClientWindow(вхобъ), &ОкноКлиентаМДИ.Нов);
    }

    //-----------------------------------------------------------------------------

    export  проц каскад()
    {
        wxMDIParentFrame_Cascade(вхобъ);
    }

    export  проц черепица()
    {
        wxMDIParentFrame_Tile(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export  проц аранжируйИконки()
    {
        wxMDIParentFrame_ArrangeIcons(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export  проц активируйСледщ()
    {
        wxMDIParentFrame_ActivateNext(вхобъ);
    }

    export  проц активируйПредш()
    {
        wxMDIParentFrame_ActivatePrevious(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export  проц дайРазмерКлиента(out цел ширь, out цел высь)
    {
        wxMDIParentFrame_GetClientSize(вхобъ, ширь, высь);
    }
}

//! \cond EXTERN
extern (C) ЦелУкз wxMDIChildFrame_ctor();
extern (C) бул   wxMDIChildFrame_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ткст титул, inout  Точка поз, inout Размер размер, бцел стиль, ткст имя);
extern (C) проц   wxMDIChildFrame_Activate(ЦелУкз сам);
extern (C) проц   wxMDIChildFrame_Restore(ЦелУкз сам);
extern (C) проц   wxMDIChildFrame_Maximize(ЦелУкз сам, бул maximize);
//! \endcond

//-----------------------------------------------------------------------------

export class РамкаОтпрыскаМДИ : Рамка
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxMDIChildFrame_ctor());
    }

    export this(РамкаРодителяМДИ родитель, цел ид, ткст титул, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль=ДЕФ_СТИЛЬ_РАМКИ, ткст имя=стрИмениРамки)
    {
        super(wxMDIChildFrame_ctor());
        if (!создай(родитель, ид, титул, поз, размер, стиль, имя))
        {
            throw new ИсклНевернОперации("Не удалось создать РамкаОтпрыскаМДИ");
        }

        собАктивируй( &приАктивировании );
    }

    static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new РамкаОтпрыскаМДИ(ptr);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    export this(РамкаРодителяМДИ родитель, ткст титул, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль=ДЕФ_СТИЛЬ_РАМКИ, ткст имя=стрИмениРамки)
    {
        this(родитель, Окно.уникИд, титул, поз, размер, стиль, имя);
    }

    //-----------------------------------------------------------------------------

    export бул создай(РамкаРодителяМДИ родитель, цел ид, ткст титул, inout Точка поз, inout Размер размер, цел стиль, ткст имя)
    {
        бул ret = wxMDIChildFrame_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, титул, поз, размер, стиль, имя);
        version(__WXMAC__)
        {
            // Bug in wxMac 2.5.2; it always returns FALSE
            return да;
        }
        else
        {
            return ret;
        } // version(__WXMAC__)
    }

    //-----------------------------------------------------------------------------

    export  проц активируй()
    {
        wxMDIChildFrame_Activate(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export  проц восстанови()
    {
        wxMDIChildFrame_Restore(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export  проц приАктивировании(Объект отправитель, Событие e)
    {
    }

    //-----------------------------------------------------------------------------

    export  проц максимируй()
    {
        wxMDIChildFrame_Maximize(вхобъ, да);
    }
}

//! \cond EXTERN
extern (C) ЦелУкз wxMDIClientWindow_ctor();
extern (C) бул   wxMDIClientWindow_CreateClient(ЦелУкз сам, ЦелУкз родитель, бцел стиль);
//! \endcond

//-----------------------------------------------------------------------------

export class ОкноКлиентаМДИ : Окно
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export  this()
    {
        super(wxMDIClientWindow_ctor());
    }

    export this(РамкаРодителяМДИ родитель, цел стиль=0)
    {
        super(wxMDIClientWindow_ctor());
        if (!создайКлиента(родитель, стиль))
        {
            throw new ИсклНевернОперации("Не удалось создать ОкноКлиентаМДИ");
        }
    }

    static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new ОкноКлиентаМДИ(ptr);
    }

    //-----------------------------------------------------------------------------

    export бул создайКлиента(РамкаРодителяМДИ родитель, цел стиль)
    {
        return wxMDIClientWindow_CreateClient(вхобъ, ВизОбъект.безопУк(родитель), стиль);
    }
}

