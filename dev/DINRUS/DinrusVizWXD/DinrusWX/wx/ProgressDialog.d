module wx.ProgressDialog;
public import wx.common;
public import wx.Dialog;

//! \cond EXTERN
extern (C) ЦелУкз wxProgressDialog_ctor(ткст титул, ткст сообщение, цел maximum, ЦелУкз родитель, бцел стиль);
extern (C) проц wxProgressDialog_dtor(ЦелУкз сам);
extern (C) бул wxProgressDialog_Update(ЦелУкз сам, цел значение, ткст newmsg);
extern (C) проц wxProgressDialog_Resume(ЦелУкз сам);
extern (C) бул wxProgressDialog_Show(ЦелУкз сам, бул показ);
//! \endcond

//-----------------------------------------------------------------------------
export class ДиалогПрогресса : Диалог
{
    public const цел МОЖЕТ_АБОРТИРОВАТЬСЯ      = 0x0001;
    public const цел ПРИЛ_МОДАЛЬНОЕ      = 0x0002;
    public const цел АВТОСКРЫТИЕ      = 0x0004;
    public const цел ПРОШЛО_ВРЕМЕНИ   = 0x0008;
    public const цел ПРИБЛИЗИТ_ВРЕМЯ = 0x0010;
    public const цел ОСТАВШЕЕСЯ_ВРЕМЯ = 0x0040;

    //---------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(ткст титул, ткст сообщение, цел maximum = 100, Окно родитель = пусто, цел стиль = ПРИЛ_МОДАЛЬНОЕ | АВТОСКРЫТИЕ)
    {
        this(wxProgressDialog_ctor(титул, сообщение, maximum, ВизОбъект.безопУк(родитель), cast(бцел)стиль));
    }

    //-----------------------------------------------------------------------------

    export бул обнови(цел значение)
    {
        return wxProgressDialog_Update(вхобъ, значение, "");
    }

    //---------------------------------------------------------------------

    export бул обнови(цел значение, ткст новсооб)
    {
        return wxProgressDialog_Update(вхобъ, значение, новсооб);
    }

    //---------------------------------------------------------------------

    export проц возобнови()
    {
        wxProgressDialog_Resume(вхобъ);
    }

    //---------------------------------------------------------------------

    export override бул показ(бул показ = да)
    {
        return wxProgressDialog_Show(вхобъ, показ);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxProgressDialog_dtor(вхобъ);
    }
		//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
}

