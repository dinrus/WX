module wx.EraseEvent;
public import wx.common;

public import wx.Event;
public import wx.DC;

//! \cond EXTERN
extern (C) ЦелУкз wxEraseEvent_ctor(цел ид, ЦелУкз ку);
extern (C) ЦелУкз wxEraseEvent_GetDC(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------


export class СобытиеСтирания : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(цел ид=0, КонтекстУстройства ку = пусто)
    {
        this(wxEraseEvent_ctor(ид,ВизОбъект.безопУк(ку)));
    }

    //-----------------------------------------------------------------------------

    export КонтекстУстройства дайКУ()
    {
        return cast(КонтекстУстройства)найдиОбъект(wxEraseEvent_GetDC(вхобъ), &КонтекстУстройства.Нов);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеСтирания(объ);
    }

    static this()
    {
        добавьТипСоб(super.Тип.СОБ_СОТРИ_ФОН, &СобытиеСтирания.Нов);
    }
}
