module wx.Slider;
public import wx.common;
public import wx.Control;

//! \cond EXTERN
extern (C) ЦелУкз wxSlider_ctor();
extern (C) бул   wxSlider_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, цел значение, цел минЗнач, цел максЗнач, inout Точка поз, inout Размер размер, бцел стиль, ЦелУкз оценщик, ткст имя);
extern (C) цел    wxSlider_GetValue(ЦелУкз сам);
extern (C) проц   wxSlider_SetValue(ЦелУкз сам, цел значение);
extern (C) проц   wxSlider_SetRange(ЦелУкз сам, цел минЗнач, цел максЗнач);
extern (C) цел    wxSlider_GetMin(ЦелУкз сам);
extern (C) цел    wxSlider_GetMax(ЦелУкз сам);
extern (C) проц   wxSlider_SetLineSize(ЦелУкз сам, цел lineSize);
extern (C) проц   wxSlider_SetPageSize(ЦелУкз сам, цел pageSize);
extern (C) цел    wxSlider_GetLineSize(ЦелУкз сам);
extern (C) цел    wxSlider_GetPageSize(ЦелУкз сам);
extern (C) проц   wxSlider_SetThumbLength(ЦелУкз сам, цел lenPixels);
extern (C) цел    wxSlider_GetThumbLength(ЦелУкз сам);
extern (C) проц   wxSlider_SetTickFreq(ЦелУкз сам, цел ч, цел поз);
extern (C) цел    wxSlider_GetTickFreq(ЦелУкз сам);
extern (C) проц   wxSlider_ClearTicks(ЦелУкз сам);
extern (C) проц   wxSlider_SetTick(ЦелУкз сам, цел позТика);
extern (C) проц   wxSlider_ClearSel(ЦелУкз сам);
extern (C) цел    wxSlider_GetSelEnd(ЦелУкз сам);
extern (C) цел    wxSlider_GetSelStart(ЦелУкз сам);
extern (C) проц   wxSlider_SetSelection(ЦелУкз сам, цел мин, цел макс);
//! \endcond

//---------------------------------------------------------------------

export class Слайдер : Контрол
{
    enum
    {
        ГОРИЗОНТАЛЬНЫЙ      = ПОриентация.Горизонталь,
        ВЕРТИКАЛЬНЫЙ        = ПОриентация.Вертикаль,

        СООБЩАТЬ_О_ПЕРЕТЯГЕ     = 0x0000,
        ТИКИ           = 0x0010,
        АВТОТИКИ       = ТИКИ,
        ЯРЛЫКИ          = 0x0020,
        ЛЕВЫЙ            = 0x0040,
        ВЕРХНИЙ             = 0x0080,
        ПРАВЫЙ           = 0x0100,
        НИЖНИЙ          = 0x0200,
        ОБА            = 0x0400,
        ДИАПАЗОН_ВЫБ        = 0x0800,
    }

    public const ткст СтрИмениСлайдера = "slider";
    //---------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxSlider_ctor());
    }

    export this(Окно родитель, цел ид, цел значение, цел минЗнач, цел максЗнач, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = ГОРИЗОНТАЛЬНЫЙ, Оценщик оценщик = пусто, ткст имя = СтрИмениСлайдера)
    {
        super(wxSlider_ctor());
        if(!создай(родитель, ид, значение, минЗнач, максЗнач, поз, размер, стиль, оценщик, имя))
        {
            throw new ИсклНевернОперации("Не удалось создать Слайдер");
        }
    }

    export static ВизОбъект Нов(ЦелУкз вхобъ)
    {
        return new Слайдер(вхобъ);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    export this(Окно родитель, цел значение, цел минЗнач, цел максЗнач, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = ГОРИЗОНТАЛЬНЫЙ, Оценщик оценщик = пусто, ткст имя = СтрИмениСлайдера)
    {
        this(родитель, Окно.уникИд, значение, минЗнач, максЗнач, поз, размер, стиль, оценщик, имя);
    }

    //---------------------------------------------------------------------

    export бул создай(Окно родитель, цел ид, цел значение, цел минЗнач, цел максЗнач, inout Точка поз, inout Размер размер, цел стиль, Оценщик оценщик, ткст имя)
    {
        return wxSlider_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, значение, минЗнач, максЗнач, поз, размер, cast(бцел)стиль, ВизОбъект.безопУк(оценщик), имя);
    }


    //---------------------------------------------------------------------

    export цел значение()
    {
        return wxSlider_GetValue(вхобъ);
    }
    export проц значение(цел значение)
    {
        wxSlider_SetValue(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export проц устДиапазон(цел минЗнач, цел максЗнач)
    {
        wxSlider_SetRange(вхобъ, минЗнач, максЗнач);
    }

    export цел макс()
    {
        return wxSlider_GetMax(вхобъ);
    }

    export цел мин()
    {
        return wxSlider_GetMin(вхобъ);
    }

    //---------------------------------------------------------------------

    export цел размСтроки()
    {
        return wxSlider_GetLineSize(вхобъ);
    }
    export проц размСтроки(цел значение)
    {
        wxSlider_SetLineSize(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export цел размСтраницы()
    {
        return wxSlider_GetPageSize(вхобъ);
    }
    export проц размСтраницы(цел значение)
    {
        wxSlider_SetPageSize(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export цел длинаТумбы()
    {
        return wxSlider_GetThumbLength(вхобъ);
    }
    export проц длинаТумбы(цел значение)
    {
        wxSlider_SetThumbLength(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export цел частотаТиков()
    {
        return wxSlider_GetTickFreq(вхобъ);
    }

    export проц устЧастотуТиков(цел ч, цел поз)
    {
        wxSlider_SetTickFreq(вхобъ, ч, поз);
    }

    //---------------------------------------------------------------------

    export проц устТик(цел позТика)
    {
        wxSlider_SetTick(вхобъ, позТика);
    }

    export проц очистьТик()
    {
        wxSlider_ClearTicks(вхобъ);
    }

    export проц очистьВыд()
    {
        wxSlider_ClearSel(вхобъ);
    }

    //---------------------------------------------------------------------

    export цел выдКонец()
    {
        return wxSlider_GetSelEnd(вхобъ);
    }

    export цел выдСтарт()
    {
        return wxSlider_GetSelStart(вхобъ);
    }

    export проц устВыделение(цел мин, цел макс)
    {
        wxSlider_SetSelection(вхобъ, мин, макс);
    }

    //---------------------------------------------------------------------

    export override проц UpdateUI_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_ПОЛЗУНОК_ОБНОВЛЁН, ид, значение, this);
    }
    export override проц UpdateUI_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }
}