module wx.WizardPageSimple;
public import wx.WizardPage;
public import wx.Wizard;

//! \cond EXTERN
extern (C) ЦелУкз wxWizardPageSimple_ctor(ЦелУкз родитель, ЦелУкз prev, ЦелУкз next, ЦелУкз битмап, ткст resource);
extern (C) проц   wxWizardPageSimple_Chain(ЦелУкз first, ЦелУкз секунда);
//! \endcond

//---------------------------------------------------------------------


export class ПростаяСтраницаМастера : СтраницаМастера
{
    export this(Мастер родитель, СтраницаМастера prev = пусто, СтраницаМастера next = пусто, Битмап битмап = Битмап.НуллБитмап, ткст resource = пусто)
    {
        super(wxWizardPageSimple_ctor(ВизОбъект.безопУк(родитель),
                                      ВизОбъект.безопУк(prev),ВизОбъект.безопУк(next),
                                      ВизОбъект.безопУк(битмап),resource));
    }

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    //---------------------------------------------------------------------

    export static проц Chain(ПростаяСтраницаМастера first, ПростаяСтраницаМастера секунда)
    {
        wxWizardPageSimple_Chain(ВизОбъект.безопУк(first), ВизОбъект.безопУк(секунда));
    }

    //---------------------------------------------------------------------
}

