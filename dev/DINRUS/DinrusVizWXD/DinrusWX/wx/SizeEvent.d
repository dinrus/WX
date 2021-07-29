module wx.SizeEvent;
public import wx.common;
public import wx.Event;

//! \cond EXTERN
extern (C) ЦелУкз wxSizeEvent_ctor();
extern (C) ЦелУкз wxSizeEvent_ctorSize(inout Размер рм,цел идок);
extern (C) ЦелУкз wxSizeEvent_ctorRect(inout Прям рм,цел идок);
extern (C) проц wxSizeEvent_GetSize(ЦелУкз сам, out Размер размер);
extern (C) проц wxSizeEvent_GetRect(ЦелУкз сам, out Прям прям);
extern (C) проц wxSizeEvent_SetRect(ЦелУкз сам, inout Прям прям);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеРазмера : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        this(wxSizeEvent_ctor());
    }

    export this(wx.common.Размер рм,цел идок = 0)
    {
        this(wxSizeEvent_ctorSize(рм,идок));
    }

    export this(Прямоугольник прям,цел идок = 0)
    {
        this(wxSizeEvent_ctorRect(прям,идок));
    }


    //-----------------------------------------------------------------------------

    export Размер размер()
    {
        Размер размер;
        wxSizeEvent_GetSize(вхобъ, размер);
        return размер;
    }

    export Прямоугольник прям()
    {
        Прямоугольник прям;
        wxSizeEvent_GetRect(вхобъ, прям);
        return прям;
    }

    export проц прям(Прямоугольник прям)
    {
        wxSizeEvent_SetRect(вхобъ, прям);
    }


    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеРазмера(объ);
    }

    static this()
    {
        добавьТипСоб(super.Тип.СОБ_РАЗМЕР,  &СобытиеРазмера.Нов);
    }
}
