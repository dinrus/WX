module wx.Clipboard;
public import wx.common;
public import wx.DataFormat;
public import wx.DataObject;

//! \cond EXTERN
extern (C) ЦелУкз wxClipboard_ctor();
extern (C) бул   wxClipboard_Open(ЦелУкз сам);
extern (C) проц   wxClipboard_Close(ЦелУкз сам);
extern (C) бул   wxClipboard_IsOpened(ЦелУкз сам);
extern (C) бул   wxClipboard_AddData(ЦелУкз сам, ЦелУкз данные);
extern (C) бул   wxClipboard_SetData(ЦелУкз сам, ЦелУкз данные);
extern (C) бул   wxClipboard_IsSupported(ЦелУкз сам, ЦелУкз формат);
extern (C) бул   wxClipboard_GetData(ЦелУкз сам, ЦелУкз данные);
extern (C) проц   wxClipboard_Clear(ЦелУкз сам);
extern (C) бул   wxClipboard_Flush(ЦелУкз сам);
extern (C) проц   wxClipboard_UsePrimarySelection(ЦелУкз сам, бул первичн);
extern (C) ЦелУкз wxClipboard_Get();
//! \endcond

//-----------------------------------------------------------------------------

export class БуферОбмена : ВизОбъект
{
    static БуферОбмена СамБуфер = пусто;

    // this crashed in GTK+, since it needs a valid context first
    // so it'т called by Приложение in the поИниц() обработчик now
    export static проц иниц()
    {
        if(!СамБуфер)
            СамБуфер = new БуферОбмена(wxClipboard_Get());
    }

    export this(ЦелУкз объ)
    {
        super(объ);
    }

    export  this()
    {
        super(wxClipboard_ctor());
    }

    //-----------------------------------------------------------------------------

    export бул открой()
    {
        return wxClipboard_Open(this.м_вхобъ);
    }

    export проц закрой()
    {
        wxClipboard_Close(this.м_вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул открыт()
    {
        return wxClipboard_IsOpened(this.м_вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул добавьДанные(ОбъектДанных данные)
    {
        return wxClipboard_AddData(this.м_вхобъ, ВизОбъект.безопУк(данные));
    }

    export бул устДанные(ОбъектДанных данные)
    {
        return wxClipboard_SetData(this.м_вхобъ, ВизОбъект.безопУк(данные));
    }

    export бул дайДанные(ОбъектДанных данные)
    {
        return wxClipboard_GetData(this.м_вхобъ, ВизОбъект.безопУк(данные));
    }

    //-----------------------------------------------------------------------------

    export бул поддерживается(ФорматДаты format)
    {
        return wxClipboard_IsSupported(this.м_вхобъ, ВизОбъект.безопУк(format));
    }

    //-----------------------------------------------------------------------------

    export проц очисть()
    {
        wxClipboard_Clear(this.м_вхобъ);
    }

    export бул слей()
    {
        return wxClipboard_Flush(this.м_вхобъ);
    }

    //-----------------------------------------------------------------------------

    export  проц используйПервичноеВыделение(бул первичн)
    {
        wxClipboard_UsePrimarySelection(this.м_вхобъ, первичн);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxClipboardLocker_ctor(ЦелУкз буфОб);
extern (C) проц   wxClipboardLocker_dtor(ЦелУкз сам);
extern (C) бул   wxClipboardLocker_IsOpen(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

/* re-implement using D */
export scope class БлокировщикБуфОб // not ВизОбъект
{
    export this(БуферОбмена буфОб = пусто)
    {
        if (буфОб is пусто)
        {
            if (БуферОбмена.СамБуфер is пусто)
                БуферОбмена.СамБуфер = new БуферОбмена(wxClipboard_Get());

            м_буфОб = БуферОбмена.СамБуфер;
        }
        else
        {
            м_буфОб = буфОб;
        }
        if (м_буфОб)
        {
            м_буфОб.открой();
        }
    }

    export ~this()
    {
        if (м_буфОб)
        {
            м_буфОб.закрой();
        }
    }

    private БуферОбмена м_буфОб;
    /*
    		private ЦелУкз вхобъ;

    		export this()
    			{ this(пусто);}

    		export this(БуферОбмена буфОб)
    			{ вхобъ = wxClipboardLocker_ctor(ВизОбъект.безопУк(буфОб)); }


    		export ~this()
    		{
    			wxClipBoardLocker_dtor(вхобъ);
    		}

    		//-----------------------------------------------------------------------------

    		export бул IsOpen() { return wxClipboardLocker_IsOpen(вхобъ); }
    */
}
