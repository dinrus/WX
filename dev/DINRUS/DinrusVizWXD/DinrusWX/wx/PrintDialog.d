module wx.PrintDialog;
public import wx.common;
public import wx.Dialog;
public import wx.PrintData;

//! \cond EXTERN
extern (C) ЦелУкз wxPageSetupDialog_ctor(ЦелУкз родитель, ЦелУкз данные);
extern (C) ЦелУкз wxPageSetupDialog_GetPageSetupData(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class ДиалогНастройкиСтраницы : Диалог
{
    private this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(Окно родитель)
    {
        this(родитель, пусто);
    }
    export this(Окно родитель, ДанныеДиалогаНастройкиСтраницы данные)
    {
        this(wxPageSetupDialog_ctor(ВизОбъект.безопУк(родитель), ВизОбъект.безопУк(данные)));
    }

    //-----------------------------------------------------------------------------

    export ДанныеДиалогаНастройкиСтраницы данныеНастройкиСтраницы()
    {
        return cast(ДанныеДиалогаНастройкиСтраницы)найдиОбъект(wxPageSetupDialog_GetPageSetupData(вхобъ), &ДанныеДиалогаНастройкиСтраницы.Нов);
    }
}

//! \cond EXTERN
extern (C) ЦелУкз wxPrintDialog_ctor(ЦелУкз родитель, ЦелУкз данные);
extern (C) ЦелУкз wxPrintDialog_ctorPrintData(ЦелУкз родитель, ЦелУкз данные);
extern (C) ЦелУкз wxPrintDialog_GetPrintData(ЦелУкз сам);
extern (C) ЦелУкз wxPrintDialog_GetPrintDialogData(ЦелУкз сам);
extern (C) ЦелУкз wxPrintDialog_GetPrintDC(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------
export class ДиалогПечати : Диалог
{
    private this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(Окно родитель)
    {
        this(родитель, cast(ДанныеДиалогаПечати)пусто);
    }
    export this(Окно родитель, ДанныеДиалогаПечати данные)
    {
        this(wxPrintDialog_ctor(ВизОбъект.безопУк(родитель), ВизОбъект.безопУк(данные)));
    }

    export this(Окно родитель, ДанныеПечати данные)
    {
        this(wxPrintDialog_ctorPrintData(ВизОбъект.безопУк(родитель), ВизОбъект.безопУк(данные)));
    }

    //-----------------------------------------------------------------------------

    export ДанныеПечати данныеПечати()
    {
        return cast(ДанныеПечати)найдиОбъект(wxPrintDialog_GetPrintData(вхобъ), &ДанныеПечати.Нов);
    }

    //-----------------------------------------------------------------------------

    export ДанныеДиалогаПечати данныеДиалогаПечати()
    {
        return cast(ДанныеДиалогаПечати)найдиОбъект(wxPrintDialog_GetPrintDialogData(вхобъ), &ДанныеДиалогаПечати.Нов);
    }

    //-----------------------------------------------------------------------------

    export КонтекстУстройства куПечати()
    {
        return cast(КонтекстУстройства)найдиОбъект(wxPrintDialog_GetPrintDC(вхобъ), &КонтекстУстройства.Нов);
    }
}

//! \cond VERSION
version(none) /*(__WXGTK__)*/
{

    //! \cond EXTERN
    extern (C) ЦелУкз wxPrintSetupDialog_ctor(ЦелУкз родитель, ЦелУкз данные);
    extern (C) ЦелУкз wxPrintSetupDialog_ctorPrintData(ЦелУкз родитель, ЦелУкз данные);
    extern (C) проц wxPrintSetupDialog_Init(ЦелУкз сам, ЦелУкз данные);
    extern (C) ЦелУкз wxPrintSetupDialog_GetPrintData(ЦелУкз сам);
    //! \endcond

    //-----------------------------------------------------------------------------

    export class ДиалогНастройкиПечати : Диалог
    {
        private this(ЦелУкз вхобъ)
        {
            super(вхобъ);
        }

        export this(Окно родитель)
        {
            this(родитель, cast(ДанныеДиалогаПечати)пусто);
        }
        export this(Окно родитель, ДанныеДиалогаПечати данные)
        {
            this(wxPrintSetupDialog_ctor(ВизОбъект.безопУк(родитель), ВизОбъект.безопУк(данные)));
        }

        export this(Окно родитель, ДанныеПечати данные)
        {
            this(wxPrintSetupDialog_ctorPrintData(ВизОбъект.безопУк(родитель), ВизОбъект.безопУк(данные)));
        }

        //-----------------------------------------------------------------------------

        export проц иниц(ДанныеПечати данные)
        {
            wxPrintSetupDialog_Init(вхобъ, ВизОбъект.безопУк(данные));
        }

        //-----------------------------------------------------------------------------

        export ДанныеПечати данныеПечати()
        {
            return cast(ДанныеПечати)найдиОбъект(wxwxPrintSetupDialog_GetPrintData(вхобъ), &ДанныеПечати.Нов);
        }
    }

} // __WXGTK__
//! \endcond
