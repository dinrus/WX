module wx.Sound;
public import wx.common;

//---------------------------------------------------------------------------
// Constants for Звук.Play
//---------------------------------------------------------------------------

const бцел СИНХ = 0U;
const бцел АСИНХ = 1U;
const бцел ЦИКЛ = 2U;

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxSound_ctor();
extern (C) ЦелУкз wxSound_ctor2(ткст имяф, бул ресурс_ли);
extern (C) ЦелУкз wxSound_ctor3(цел размер, ббайт* данные);
extern (C) ЦелУкз wxSound_dtor(ЦелУкз сам);

extern (C) бул wxSound_Play(ЦелУкз сам, бцел флаги);
extern (C) проц wxSound_Stop(ЦелУкз сам);
extern (C) бул wxSound_IsOk(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class Звук : ВизОбъект
{

    export this()
    {
        this(wxSound_ctor(), да);
    }

    export this(ткст имяф, бул ресурс_ли=нет)
    {
        this(wxSound_ctor2(имяф, ресурс_ли), да);
    }

    export this(ббайт[] данные)
    {
        this(wxSound_ctor3(данные.length, данные.ptr), да);
    }

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    private this(ЦелУкз вхобъ, бул памСобств)
    {
        super(вхобъ);
        this.памСобств = памСобств;
    }

    override protected проц dtor()
    {
        wxSound_dtor(вхобъ);
    }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
    //---------------------------------------------------------------------

    export бул играй(бцел флаги=АСИНХ)
    {
        return wxSound_Play(вхобъ, флаги);
    }

    export проц стоп()
    {
        wxSound_Stop(вхобъ);
    }

    export бул Ок()
    {
        return wxSound_IsOk(вхобъ);
    }

    //---------------------------------------------------------------------

    // Plays sound от имяф:
    export static бул играй(ткст имяф, бцел флаги=АСИНХ)
    {
        Звук snd = new Звук(имяф);
        return snd.Ок() ? snd.играй(флаги) : нет;
    }

}
