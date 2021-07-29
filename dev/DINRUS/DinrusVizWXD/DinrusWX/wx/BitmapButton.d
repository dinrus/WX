module wx.BitmapButton;
public import wx.common;
public import wx.Bitmap;
public import wx.Button;
public import wx.Control;

//! \cond EXTERN
extern (C)
{
    alias проц function(КнопкаБитмап объ) Virtual_OnSetBitmap;
}

extern (C) ЦелУкз wxBitmapButton_ctor();
extern (C) проц   wxBitmapButton_RegisterVirtual(ЦелУкз сам, КнопкаБитмап объ,Virtual_OnSetBitmap onУстBitmap);
//extern (C) проц   wxBitmapButton_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
extern (C) бул   wxBitmapButton_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ЦелУкз ярлык, inout Точка поз, inout Размер размер, бцел стиль, ЦелУкз оценщик, ткст имя);
extern (C) проц   wxBitmapButton_SetDefault(ЦелУкз сам);

extern (C) проц wxBitmapButton_SetLabel(ЦелУкз сам, ткст ярлык);
extern (C) ЦелУкз wxBitmapButton_GetLabel(ЦелУкз сам);

extern (C) бул wxBitmapButton_Enable(ЦелУкз сам, бул вкл);

extern (C) проц   wxBitmapButton_SetBitmapLabel(ЦелУкз сам, ЦелУкз битмап);
extern (C) ЦелУкз wxBitmapButton_GetBitmapLabel(ЦелУкз сам);

extern (C) проц wxBitmapButton_SetBitmapSelected(ЦелУкз сам, ЦелУкз битмап);
extern (C) ЦелУкз wxBitmapButton_GetBitmapSelected(ЦелУкз сам);

extern (C) проц wxBitmapButton_SetBitmapFocus(ЦелУкз сам, ЦелУкз битмап);
extern (C) ЦелУкз wxBitmapButton_GetBitmapFocus(ЦелУкз сам);

extern (C) проц wxBitmapButton_SetBitmapDisabled(ЦелУкз сам, ЦелУкз битмап);
extern (C) ЦелУкз wxBitmapButton_GetBitmapDisabled(ЦелУкз сам);

extern (C) проц wxBitmapButton_OnSetBitmap(ЦелУкз сам);

//static export extern (C) проц wxBitmapButton_ApplyParentThemeBackground(ЦелУкз сам, ЦелУкз цвет);
//! \endcond

//---------------------------------------------------------------------

public const цел КБ_АВТОРИС      =  0x0004;

//---------------------------------------------------------------------

export class КнопкаБитмап : Контрол
{
    export this(ЦелУкз объ)
    {
        super(объ);
    }

    export this()
    {
        this(wxBitmapButton_ctor());
        wxBitmapButton_RegisterVirtual(this.м_вхобъ, this, &staticOnSetBitmap);
    }

    export this(Окно родитель, цел ид, Битмап ярлык)
    {
        this(родитель, ид, ярлык, ДЕФПОЗ, ДЕФРАЗМ, 0, пусто, пусто);
    }

    export this(Окно родитель, цел ид, Битмап ярлык, Точка поз)
    {
        this(родитель, ид, ярлык, поз, ДЕФРАЗМ, 0, пусто, пусто);
    }

    export this(Окно родитель, цел ид, Битмап ярлык, Точка поз, Размер размер)
    {
        this(родитель, ид, ярлык, поз, размер, 0, пусто, пусто);
    }

    export this(Окно родитель, цел ид, Битмап ярлык, Точка поз, Размер размер, цел стиль)
    {
        this(родитель, ид, ярлык, поз, размер, стиль, пусто, пусто);
    }

    export this(Окно родитель, цел ид, Битмап ярлык, Точка поз, Размер размер, цел стиль, Оценщик оценщик)
    {
        this(родитель, ид, ярлык, поз, размер, стиль, оценщик, пусто);
    }

    export this(Окно родитель, цел ид, Битмап ярлык, Точка поз, Размер размер, цел стиль, Оценщик оценщик, ткст имя)
    {
        this();

        if (!создай(родитель, ид, ярлык, поз, размер, стиль, оценщик, имя))
        {
            throw new ИсклНевернОперации("Не удалось создать КнопкаБитмап");
        }
    }

    export static ВизОбъект Нов(ЦелУкз объ)
    {
        return new КнопкаБитмап(объ);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    export this(Окно родитель, Битмап ярлык)
    {
        this(родитель, Окно.уникИд, ярлык, ДЕФПОЗ, ДЕФРАЗМ, 0, пусто, пусто);
    }

    export this(Окно родитель, Битмап ярлык, Точка поз)
    {
        this(родитель, Окно.уникИд, ярлык, поз, ДЕФРАЗМ, 0, пусто, пусто);
    }

    export this(Окно родитель, Битмап ярлык, Точка поз, Размер размер)
    {
        this(родитель, Окно.уникИд, ярлык, поз, размер, 0, пусто, пусто);
    }

    export this(Окно родитель, Битмап ярлык, Точка поз, Размер размер, цел стиль)
    {
        this(родитель, Окно.уникИд, ярлык, поз, размер, стиль, пусто, пусто);
    }

    export this(Окно родитель, Битмап ярлык, Точка поз, Размер размер, цел стиль, Оценщик оценщик)
    {
        this(родитель, Окно.уникИд, ярлык, поз, размер, стиль, оценщик, пусто);
    }

    export this(Окно родитель, Битмап ярлык, Точка поз, Размер размер, цел стиль, Оценщик оценщик, ткст имя)
    {
        this(родитель, Окно.уникИд, ярлык, поз, размер, стиль, оценщик, имя);
    }

    //---------------------------------------------------------------------

    export бул создай(Окно родитель, цел ид, Битмап ярлык, Точка поз, Размер размер, бцел стиль, Оценщик оценщик, ткст имя)
    {
        return wxBitmapButton_Create(this.м_вхобъ, ВизОбъект.безопУк(родитель), ид, ВизОбъект.безопУк(ярлык), поз, размер, стиль, ВизОбъект.безопУк(оценщик), имя);
    }

    //---------------------------------------------------------------------

    export проц устДеф()
    {
        wxBitmapButton_SetDefault(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

    export ткст ярлыкСтрока()
    {
        return cast(ткст) new ВизТкст(wxBitmapButton_GetLabel(this.м_вхобъ), да);
    }
    export проц ярлыкСтрока(ткст значение)
    {
        wxBitmapButton_SetLabel(вхобъ, значение);
    }

    export проц УстЯрлык(ткст ярлык)
    {
        wxBitmapButton_SetLabel(this.м_вхобъ, ярлык);
    }

    export ткст дайЯрлык()
    {
        return cast(ткст) new ВизТкст(wxBitmapButton_GetLabel(this.м_вхобъ), да);
    }

    //---------------------------------------------------------------------

    export бул включи()
    {
        return включи(да);
    }

    export бул включи(бул вкл)
    {
        return wxBitmapButton_Enable(this.м_вхобъ, вкл);
    }

    //---------------------------------------------------------------------

    export Битмап ярлыкБитмапа()
    {
        return cast(Битмап)найдиОбъект(wxBitmapButton_GetBitmapLabel(this.м_вхобъ), &Битмап.Нов);
    }
    export проц ярлыкБитмапа(Битмап значение)
    {
        wxBitmapButton_SetBitmapLabel(this.м_вхобъ, ВизОбъект.безопУк(значение));
    }
    /+
    export Битмап ярлык()
    {
        return cast(Битмап)найдиОбъект(wxBitmapButton_GetBitmapLabel(вхобъ), &Битмап.Нов);
    }
    export проц ярлык(Битмап значение)
    {
        wxBitmapButton_SetBitmapLabel(вхобъ, ВизОбъект.безопУк(значение));
    }
    +/

    //---------------------------------------------------------------------

    export Битмап битмапВыбран()
    {
        return cast(Битмап)найдиОбъект(wxBitmapButton_GetBitmapSelected(this.м_вхобъ), &Битмап.Нов);
    }
    export проц БитмапВыбран(Битмап значение)
    {
        wxBitmapButton_SetBitmapSelected(this.м_вхобъ, ВизОбъект.безопУк(значение));
    }

    export Битмап битмапФокус()
    {
        return cast(Битмап)найдиОбъект(wxBitmapButton_GetBitmapFocus(this.м_вхобъ), &Битмап.Нов);
    }
    export проц битмапФокус(Битмап значение)
    {
        wxBitmapButton_SetBitmapFocus(this.м_вхобъ, ВизОбъект.безопУк(значение));
    }

    export Битмап битмапОтключен()
    {
        return cast(Битмап)найдиОбъект(wxBitmapButton_GetBitmapDisabled(вхобъ), &Битмап.Нов);
    }
    export проц битмапОтключен(Битмап значение)
    {
        wxBitmapButton_SetBitmapDisabled(this.м_вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------
    export  проц приУстБитмап()
    {
        wxBitmapButton_OnSetBitmap(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

    /*export  проц ApplyParentThemeBackground(Цвет bg)
    {
    	wxBitmapButton_ApplyParentThemeBackground(вхобъ, ВизОбъект.безопУк(bg));
    }*/
}

//! \cond EXTERN
static export extern(C) проц staticOnSetBitmap(КнопкаБитмап объ)
{
	return объ.приУстБитмап();
}
//! \endcond
