module wx.Accelerator;
public import wx.common;
public import wx.MenuItem;

//! \cond EXTERN
extern (C) ЦелУкз wxAcceleratorEntry_ctor(цел флаги, цел кодКл, цел кмд, ЦелУкз элт);
extern (C) проц   wxAcceleratorEntry_dtor(ЦелУкз сам);
extern (C) проц   wxAcceleratorEntry_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
extern (C) проц   wxAcceleratorEntry_Set(ЦелУкз сам, цел флаги, цел кодКл, цел кмд, ЦелУкз элт);
extern (C) проц   wxAcceleratorEntry_SetMenuItem(ЦелУкз сам, ЦелУкз элт);
extern (C) цел    wxAcceleratorEntry_GetFlags(ЦелУкз сам);
extern (C) цел    wxAcceleratorEntry_GetKeyCode(ЦелУкз сам);
extern (C) цел    wxAcceleratorEntry_GetCommand(ЦелУкз сам);
extern (C) ЦелУкз wxAcceleratorEntry_GetMenuItem(ЦелУкз сам);

extern (C) ЦелУкз wxAcceleratorEntry_GetAccelFromString(ткст ярлык);
//! \endcond

//-----------------------------------------------------------------------------

export class ЗаписьАкселератора : ВизОбъект
{
    public const цел Норма = 0x0000;
    public const цел Альт = 0x0001;
    public const цел Ктрл = 0x0002;
    public const цел Шифт = 0x0004;

    //-----------------------------------------------------------------------------

    export this(ЦелУкз объ)
    {
        super(объ);
    }

    private this(ЦелУкз объ, бул памСобств)
    {
        super(объ);
        this.памСобств = памСобств;
    }

    export this()
    {
        this(0, 0, 0, пусто);
    }

    export this(цел флаги)
    {
        this(флаги, 0, 0, пусто);
    }

    export this(цел флаги, цел кодКл)
    {
        this(флаги, кодКл, 0, пусто);
    }

    export this(цел флаги, цел кодКл, цел кмд)
    {
        this(флаги, кодКл, кмд, пусто);
    }

    export this(цел флаги, цел кодКл, цел кмд, ЭлтМеню элт)
    {
        this(wxAcceleratorEntry_ctor(флаги, кодКл, кмд, ВизОбъект.безопУк(элт)), да);
        wxAcceleratorEntry_RegisterDisposable(this.м_вхобъ, &VirtualDispose);
    }

    //-----------------------------------------------------------------------------

    export проц установи(цел флаги, цел кодКл, цел кмд)
    {
        установи(флаги, кодКл, кмд);
    }

    export проц установи(цел флаги, цел кодКл, цел кмд, ЭлтМеню элт)
    {
        wxAcceleratorEntry_Set(this.м_вхобъ, флаги, кодКл, кмд, ВизОбъект.безопУк(элт));
    }

    //-----------------------------------------------------------------------------

    export ЭлтМеню элтМеню()
    {
        return cast(ЭлтМеню)найдиОбъект(wxAcceleratorEntry_GetMenuItem(this.м_вхобъ), &ЭлтМеню.Нов2);
    }
    //-----------------------------------------------------------------------------

    export цел флаги()
    {
        return wxAcceleratorEntry_GetFlags(this.м_вхобъ);
    }
    //-----------------------------------------------------------------------------

    export цел кодКл()
    {
        return wxAcceleratorEntry_GetKeyCode(this.м_вхобъ);
    }
    //-----------------------------------------------------------------------------

    export цел команда()
    {
        return wxAcceleratorEntry_GetCommand(this.м_вхобъ);
    }
    //---------------------------------------------------------------------
/*
    override protected проц dtor()
    {
        wxAcceleratorEntry_dtor(вхобъ);
    }
*/
    //---------------------------------------------------------------------
	export ~this(){ wxAcceleratorEntry_dtor(this.вхобъ);}
	//----------------------------

    export static ЗаписьАкселератора дайАксельИзТкст(ткст ярлык)
    {
        return cast(ЗаписьАкселератора)найдиОбъект(wxAcceleratorEntry_GetAccelFromString(ярлык), &ЗаписьАкселератора.Нов);
    }

    export static ВизОбъект Нов(ЦелУкз укз)
    {
        return new ЗаписьАкселератора(укз);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxAcceleratorTable_ctor();
extern (C) бул   wxAcceleratorTable_Ok(ЦелУкз сам);
//extern (C) проц   wxAcceleratorTable_Add(ЦелУкз сам, ЦелУкз entry);
//extern (C) проц   wxAcceleratorTable_Remove(ЦелУкз сам, ЦелУкз entry);
//extern (C) ЦелУкз wxAcceleratorTable_GetMenuItem(ЦелУкз сам, ЦелУкз соб);
//extern (C) цел    wxAcceleratorTable_GetCommand(ЦелУкз сам, ЦелУкз соб);
//extern (C) ЦелУкз wxAcceleratorTable_GetEntry(ЦелУкз сам, ЦелУкз соб);
//! \endcond

//-----------------------------------------------------------------------------

export class ТаблицаАкселераторов : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        this(wxAcceleratorTable_ctor());
    }

    //! \cond VERSION
    version(__WXMAC__) {} else
    {
        //! \endcond
        //-----------------------------------------------------------------------------

        /*export проц добавь(ЗаписьАкселератора entry)
        {
        	wxAcceleratorTable_Add(вхобъ, ВизОбъект.безопУк(entry));
        }*/

        //-----------------------------------------------------------------------------

        /*export проц удали(ЗаписьАкселератора entry)
        {
        	wxAcceleratorTable_Remove(вхобъ, ВизОбъект.безопУк(entry));
        }*/

        //-----------------------------------------------------------------------------

        /*export ЭлтМеню дайЭлтМеню(СобытиеКлавиатуры соб)
        {
        	return cast(ЭлтМеню)найдиОбъект(wxAcceleratorTable_GetMenuItem(вхобъ, ВизОбъект.безопУк(соб)),&ЭлтМеню.Нов);
        }*/

        //-----------------------------------------------------------------------------

        /*export ЗаписьАкселератора дайЗапись(СобытиеКлавиатуры соб)
        {
        	return cast(ЗаписьАкселератора)найдиОбъект(wxAcceleratorTable_GetEntry(вхобъ, ВизОбъект.безопУк(соб)),&ЗаписьАкселератора.Нов);
        }*/
        //! \cond VERSION
    } // version(__WXMAC__)
    //! \endcond

    //-----------------------------------------------------------------------------

    /*export цел дайКоманду(СобытиеКлавиатуры соб)
    {
    	return wxAcceleratorTable_GetCommand(вхобъ, ВизОбъект.безопУк(соб));
    }*/

    //-----------------------------------------------------------------------------

    export бул Ок()
    {
        return wxAcceleratorTable_Ok(this.м_вхобъ);
    }

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new ТаблицаАкселераторов(ptr);
    }
}

