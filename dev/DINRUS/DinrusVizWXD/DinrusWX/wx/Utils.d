module wx.Utils;
public import wx.common;
public import wx.Window;

//! \cond EXTERN
extern (C) ЦелУкз wxGlobal_GetHomeDir();
extern (C) ЦелУкз wxGlobal_GetCwd();
extern (C) проц wxSleep_func(цел чис);
extern (C) проц wxMilliSleep_func(бцел чис);
extern (C) проц wxMicroSleep_func(бцел чис);
extern (C) проц wxYield_func();
extern (C) проц wxBeginBusyCursor_func();
extern (C) проц wxEndBusyCursor_func();
extern (C) проц wxMutexGuiEnter_func();
extern (C) проц wxMutexGuiLeave_func();
//! \endcond


export static ткст визДайДомПапку()
{
    return cast(ткст) new ВизТкст(wxGlobal_GetHomeDir(), да);
}

export static ткст визДайТРП()
{
    return cast(ткст) new ВизТкст(wxGlobal_GetCwd(), да);
}

//---------------------------------------------------------------------

export static проц визСпи(цел чис)
{
    wxSleep_func(чис);
}

export static проц визМиллиСпи(цел чис)
{
    wxMilliSleep_func(чис);
}

export static проц визМикроСпи(цел чис)
{
    wxMicroSleep_func(чис);
}

//---------------------------------------------------------------------

export static проц визЖни()
{
    wxYield_func();
}

//---------------------------------------------------------------------

export static проц стартКурсорЗанят()
{
    wxBeginBusyCursor_func();
}

export static проц стопКурсорЗанят()
{
    wxEndBusyCursor_func();
}

//---------------------------------------------------------------------

export static проц войдиВГипМютекс()
{
    wxMutexGuiEnter_func();
}

export static проц покиньГипМютекс()
{
    wxMutexGuiLeave_func();
}


//---------------------------------------------------------------------

export class КурсорЗанят : ИВымещаемый
{
    private бул вымещен = нет;
    export this()
    {
        стартКурсорЗанят();
    }

   export ~this()
    {
        вымести();
    }

    export проц вымести()
    {
        if (!вымещен)
        {
            вымещен = да;
            стопКурсорЗанят();
        }
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxWindowDisabler_ctor(ЦелУкз winToSkip);
extern (C) проц wxWindowDisabler_dtor(ЦелУкз сам);
//! \endcond

export scope class ДезактиваторОкна : ВизОбъект
{
    //---------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    private this(ЦелУкз вхобъ, бул памСобств)
    {
        super(вхобъ);
        this.памСобств = памСобств;
    }

    export this()
    {
        this(cast(Окно)пусто);
    }

    export this(Окно winToSkip)
    {
        this(wxWindowDisabler_ctor(ВизОбъект.безопУк(winToSkip)), да);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxWindowDisabler_dtor(вхобъ);
    }
		//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxBusyInfo_ctor(ткст сообщение, ЦелУкз родитель);
extern (C) проц   wxBusyInfo_dtor(ЦелУкз сам);
//! \endcond

export scope class ИнфоЗанят : ВизОбъект
{
    //---------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(ткст сообщение)
    {
        this(сообщение, пусто);
    }

    export this(ткст сообщение, Окно родитель)
    {
        this(wxBusyInfo_ctor(сообщение, ВизОбъект.безопУк(родитель)), да);
    }

    private this(ЦелУкз вхобъ, бул памСобств)
    {
        super(вхобъ);
        this.памСобств = памСобств;
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxBusyInfo_dtor(вхобъ);
    }
		//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
}

//---------------------------------------------------------------------
