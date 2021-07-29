module wx.Validator;
public import wx.common;
public import wx.EvtHandler;

//! \cond EXTERN
extern (C) ЦелУкз wxValidator_ctor();
extern (C) ЦелУкз wxDefaultValidator_Get();
//! \endcond

 export Оценщик дефОценщик(){return new Оценщик(wxDefaultValidator_Get()); }
//---------------------------------------------------------------------

export class Оценщик : ОбработчикСоб
{
    static Оценщик ДефОценщик;

    static this()
    {
        ДефОценщик = дефОценщик();
    }   

    export this()
    {
        super(wxValidator_ctor());
    }

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    //---------------------------------------------------------------------
}
