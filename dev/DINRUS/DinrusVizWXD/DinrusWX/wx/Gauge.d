module wx.Gauge;
public import wx.common;
public import wx.Control;

//! \cond EXTERN
extern (C) ЦелУкз wxGauge_ctor();
extern (C) проц   wxGauge_dtor(ЦелУкз сам);
extern (C) бул   wxGauge_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, цел диапазон, inout Точка поз, inout Размер размер, бцел стиль, ЦелУкз оценщик, ткст имя);
extern (C) проц   wxGauge_SetRange(ЦелУкз сам, цел диапазон);
extern (C) цел    wxGauge_GetRange(ЦелУкз сам);
extern (C) проц   wxGauge_SetValue(ЦелУкз сам, цел поз);
extern (C) цел    wxGauge_GetValue(ЦелУкз сам);
extern (C) проц   wxGauge_SetShadowWidth(ЦелУкз сам, цел w);
extern (C) цел    wxGauge_GetShadowWidth(ЦелУкз сам);
extern (C) проц   wxGauge_SetBezelFace(ЦелУкз сам, цел w);
extern (C) цел    wxGauge_GetBezelFace(ЦелУкз сам);
extern (C) бул   wxGauge_AcceptsFocus(ЦелУкз сам);
extern (C) бул   wxGauge_IsVertical(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

alias Gauge wxGauge;
export class Gauge :  Контрол
{
    enum
    {
        ГОРИЗОНТАЛЬНЫЙ       = ПОриентация.Горизонталь,
        ВЕРТИКАЛЬНЫЙ         = ПОриентация.Вертикаль,
        ПРОГРЕССБАР      = 0x0010,
    }

    // Windows only
    public const цел ГЛАДКИЙ           = 0x0020;

    public const ткст wxGaugeNameStr = "gauge";
    //---------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxGauge_ctor());
    }

    export this(Окно родитель, цел ид, цел диапазон, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ,
                цел стиль = ГОРИЗОНТАЛЬНЫЙ, Оценщик оценщик = пусто, ткст имя = wxGaugeNameStr)
    {
        super(wxGauge_ctor());
        if (!создай(родитель, ид, диапазон, поз, размер, стиль, оценщик, имя))
        {
            throw new ИсклНевернОперации("Не удалось создать Gauge");
        }
    }

    export static ВизОбъект Нов(ЦелУкз вхобъ)
    {
        return new Gauge(вхобъ);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    export this(Окно родитель, цел диапазон, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ,
                цел стиль = ГОРИЗОНТАЛЬНЫЙ, Оценщик оценщик = пусто, ткст имя = wxGaugeNameStr)
    {
        this(родитель, Окно.уникИд, диапазон, поз, размер, стиль, оценщик, имя);
    }

    //---------------------------------------------------------------------

    export бул создай(Окно родитель, цел ид, цел диапазон, inout Точка поз,
                       inout Размер размер, цел стиль, Оценщик оценщик,
                       ткст имя)
    {
        return wxGauge_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, диапазон,
                              поз, размер, cast(бцел)стиль,
                              ВизОбъект.безопУк(оценщик), имя);
    }

    //---------------------------------------------------------------------

    export цел диапазон()
    {
        return wxGauge_GetRange(вхобъ);
    }

    export проц диапазон(цел значение)
    {
        wxGauge_SetRange(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export цел значение()
    {
        return wxGauge_GetValue(вхобъ);
    }

    export проц значение(цел значение)
    {
        wxGauge_SetValue(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export цел ширинаТени()
    {
        return wxGauge_GetShadowWidth(вхобъ);
    }

    export проц ширинаТени(цел значение)
    {
        wxGauge_SetShadowWidth(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export цел BezelFace()
    {
        return wxGauge_GetBezelFace(вхобъ);
    }

    export проц BezelFace(цел значение)
    {
        wxGauge_SetBezelFace(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export override бул фокусируем()
    {
        return wxGauge_AcceptsFocus(вхобъ);
    }

    //---------------------------------------------------------------------

    export бул вертикален()
    {
        return wxGauge_IsVertical(вхобъ);
    }
}
