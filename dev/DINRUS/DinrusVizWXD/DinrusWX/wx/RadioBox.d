module wx.RadioBox;
public import wx.common;
public import wx.Control;

//! \cond EXTERN
extern (C) ЦелУкз wxRadioBox_ctor();
extern (C) бул   wxRadioBox_Create(ЦелУкз сам, ЦелУкз родитель, цел ид,
        ткст ярлык, inout Точка поз, inout Размер размер,
        цел ч, ткст0 выборы, цел majorDimension,
        бцел стиль, ЦелУкз знач, ткст имя);

extern (C) проц   wxRadioBox_SetSelection(ЦелУкз сам, цел ч);
extern (C) цел    wxRadioBox_GetSelection(ЦелУкз сам);

extern (C) ЦелУкз wxRadioBox_GetStringSelection(ЦелУкз сам);
extern (C) бул   wxRadioBox_SetStringSelection(ЦелУкз сам, ткст т);

extern (C) цел    wxRadioBox_GetCount(ЦелУкз сам);
extern (C) цел    wxRadioBox_FindString(ЦелУкз сам, ткст т);

extern (C) ЦелУкз wxRadioBox_GetString(ЦелУкз сам, цел ч);
extern (C) проц   wxRadioBox_SetString(ЦелУкз сам, цел ч, ткст ярлык);

extern (C) проц   wxRadioBox_Enable(ЦелУкз сам, цел ч, бул вкл);
extern (C) проц   wxRadioBox_Show(ЦелУкз сам, цел ч, бул показ);

extern (C) ЦелУкз wxRadioBox_GetLabel(ЦелУкз сам);
extern (C) проц   wxRadioBox_SetLabel(ЦелУкз сам, ткст ярлык);
//! \endcond

//---------------------------------------------------------------------

export class РадиоБокс : Контрол
{
    enum
    {
        СЛЕВА_НА_ПРАВО    = 0x0001,
        СВЕРХУ_ВНИЗ    = 0x0002,
        УКАЗАТЬ_КОЛОНКИ   = ПОриентация.Горизонталь,
        УКАЗАТЬ_РЯДЫ   = ПОриентация.Вертикаль,
        ГОРИЗОНТАЛЬНО     = ПОриентация.Горизонталь,
        ВЕРТИКАЛЬНО       = ПОриентация.Вертикаль,
    }

    public const ткст СтрИмениРадиоБокса = "radioBox";
    //---------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(Окно родитель, цел ид, ткст ярлык, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, ткст[] выборы = пусто, цел majorDimension = 0, цел стиль = ГОРИЗОНТАЛЬНО, Оценщик знач = пусто, ткст имя = СтрИмениРадиоБокса)
    {
        super(wxRadioBox_ctor());
        if (!wxRadioBox_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, ярлык, поз, размер,
                               выборы.length, cast(ткст0)  выборы.ptr, majorDimension, cast(бцел)стиль, ВизОбъект.безопУк(знач), имя))
        {
            throw new ИсклНевернОперации("Не удалось создать РадиоБокс");
        }
    }

    export static ВизОбъект Нов(ЦелУкз вхобъ)
    {
        return new РадиоБокс(вхобъ);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    export this(Окно родитель, ткст ярлык, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, ткст[] выборы = пусто, цел majorDimension = 0, цел стиль = ГОРИЗОНТАЛЬНО, Оценщик знач = пусто, ткст имя = СтрИмениРадиоБокса)
    {
        this(родитель, Окно.уникИд, ярлык, поз, размер, выборы, majorDimension, стиль, знач, имя);
    }

    //---------------------------------------------------------------------

    export проц выделение(цел значение)
    {
        wxRadioBox_SetSelection(вхобъ, значение);
    }
    export цел выделение()
    {
        return wxRadioBox_GetSelection(вхобъ);
    }

    export проц выделениеТекста(ткст значение)
    {
        wxRadioBox_SetStringSelection(вхобъ, значение);
    }
    export ткст выделениеТекста()
    {
        return cast(ткст) new ВизТкст(wxRadioBox_GetStringSelection(вхобъ), да);
    }

    //---------------------------------------------------------------------

    export цел счёт()
    {
        return wxRadioBox_GetCount(вхобъ);
    }

    //---------------------------------------------------------------------

    export цел найдиТкст(ткст т)
    {
        return wxRadioBox_FindString(вхобъ, т);
    }

    //---------------------------------------------------------------------

    export ткст дайТкст(цел ч)
    {
        return cast(ткст) new ВизТкст(wxRadioBox_GetString(вхобъ, ч), да);
    }

    export проц устТкст(цел ч, ткст ярлык)
    {
        wxRadioBox_SetString(вхобъ, ч, ярлык);
    }

    //---------------------------------------------------------------------

    export проц включи(цел ч, бул вкл)
    {
        wxRadioBox_Enable(вхобъ, ч, вкл);
    }

    export проц показ(цел ч, бул показ)
    {
        wxRadioBox_Show(вхобъ, ч, показ);
    }

    //---------------------------------------------------------------------

    export override ткст ярлык()
    {
        return cast(ткст) new ВизТкст(wxRadioBox_GetLabel(вхобъ), да);
    }
    export override проц ярлык(ткст значение)
    {
        wxRadioBox_SetLabel(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export проц Select_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_РАДИОБОКС_ВЫБРАН, ид, значение, this);
    }
    export проц Select_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }
}
