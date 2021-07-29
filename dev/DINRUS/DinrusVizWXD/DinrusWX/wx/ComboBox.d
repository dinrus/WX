module wx.ComboBox;
public import wx.common;
public import wx.Control;
public import wx.ClientData;


//! \cond EXTERN
extern (C) ЦелУкз wxComboBox_ctor();
extern (C) бул   wxComboBox_Create(ЦелУкз сам, ЦелУкз окно, цел ид, ткст значение, inout Точка поз, inout Размер размер, цел ч, ткст0 выборы, бцел стиль, ЦелУкз оценщик, ткст имя);

extern (C) проц   wxComboBox_Append(ЦелУкз сам, ткст элт);
extern (C) проц   wxComboBox_AppendData(ЦелУкз сам, ткст элт, ЦелУкз данные);

extern (C) проц   wxComboBox_Clear(ЦелУкз сам);
extern (C) проц   wxComboBox_Delete(ЦелУкз сам, цел ч);

extern (C) цел    wxComboBox_FindString(ЦелУкз сам, ткст стр);

extern (C) цел    wxComboBox_GetCount(ЦелУкз сам);
extern (C) цел    wxComboBox_GetSelection(ЦелУкз сам);
extern (C) ЦелУкз wxComboBox_GetString(ЦелУкз сам, цел ч);
//extern (C) проц   wxComboBox_SetString(ЦелУкз сам, цел ч, ткст текст);

extern (C) ЦелУкз wxComboBox_GetValue(ЦелУкз сам);
extern (C) проц   wxComboBox_SetValue(ЦелУкз сам, ткст текст);

extern (C) ЦелУкз wxComboBox_GetStringSelection(ЦелУкз сам);
extern (C) проц   wxComboBox_SetStringSelection(ЦелУкз сам, ткст значение);

extern (C) ЦелУкз wxComboBox_GetClientData(ЦелУкз сам, цел ч);
extern (C) проц   wxComboBox_SetClientData(ЦелУкз сам, цел ч, ЦелУкз данные);

extern (C) проц   wxComboBox_Copy(ЦелУкз сам);
extern (C) проц   wxComboBox_Cut(ЦелУкз сам);
extern (C) проц   wxComboBox_Paste(ЦелУкз сам);

extern (C) проц   wxComboBox_SetInsertionPoint(ЦелУкз сам, бцел поз);
extern (C) бцел   wxComboBox_GetInsertionPoint(ЦелУкз сам);
extern (C) проц   wxComboBox_SetInsertionPointEnd(ЦелУкз сам);
extern (C) бцел   wxComboBox_GetLastPosition(ЦелУкз сам);

extern (C) проц   wxComboBox_Replace(ЦелУкз сам, бцел от, бцел до, ткст значение);
extern (C) проц   wxComboBox_SetSelectionSingle(ЦелУкз сам, цел ч);
extern (C) проц   wxComboBox_SetSelectionMult(ЦелУкз сам, бцел от, бцел до);
extern (C) проц   wxComboBox_SetEditable(ЦелУкз сам, бул редактируемый);
extern (C) проц   wxComboBox_Remove(ЦелУкз сам, бцел от, бцел до);

extern (C) проц wxComboBox_SetSelection(ЦелУкз сам, цел ч);

extern (C) проц wxComboBox_Select(ЦелУкз сам, цел ч);
//! \endcond

//---------------------------------------------------------------------

export class КомбоБокс : Контрол
{
    public const цел КБ_ПРОСТОЙ           = 0x0004;
    public const цел КБ_СОРТИРУЮЩИЙ             = 0x0008;
    public const цел КБ_ТОЛЬКОЧТЕНИЕ         = 0x0010;
    public const цел КБ_ЗАБРОС         = 0x0020;

    public const ткст СтрИмениКомбоБокса = "comboBox";
    //---------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxComboBox_ctor());
    }

    export this(Окно родитель, цел ид, ткст значение="", Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, ткст[] выборы = пусто, цел стиль = 0, Оценщик знач = пусто, ткст имя = СтрИмениКомбоБокса)
    {
        super(wxComboBox_ctor());
        if(!wxComboBox_Create(вхобъ, ВизОбъект.безопУк(родитель), ид,
                              значение, поз, размер,
                              выборы.length, cast(ткст0) выборы.ptr, cast(бцел)стиль,
                              ВизОбъект.безопУк(оценщик), имя))
        {
            throw new ИсклНевернОперации("Не удалось создать КомбоБокс");
        }
    }

    export static ВизОбъект Нов(ЦелУкз вхобъ)
    {
        return new КомбоБокс(вхобъ);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    export this(Окно родитель)
    {
        this(родитель, Окно.уникИд, "", ДЕФПОЗ, ДЕФРАЗМ, cast(ткст[])пусто, 0, пусто, пусто);
    }

    export this(Окно родитель, ткст значение="", Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, ткст[] выборы = пусто, цел стиль = 0, Оценщик знач = пусто, ткст имя = СтрИмениКомбоБокса)
    {
        this(родитель, Окно.уникИд, значение, поз, размер, выборы, стиль, оценщик, имя);
    }

    //---------------------------------------------------------------------

    export бул создай(Окно родитель, цел ид, ткст значение,
                       Точка поз, Размер размер,
                       ткст[] выборы, цел стиль, Оценщик оценщик,
                       ткст имя)
    {
        return wxComboBox_Create(вхобъ, ВизОбъект.безопУк(родитель), ид,
                                 значение, поз, размер,
                                 выборы.length, cast(ткст0) выборы.ptr,
                                 cast(бцел)стиль, ВизОбъект.безопУк(оценщик), имя);
    }

    //---------------------------------------------------------------------

    export цел выделение()
    {
        return wxComboBox_GetSelection(this.м_вхобъ);
    }
    export проц выделение(цел значение)
    {
        wxComboBox_SetSelectionSingle(this.м_вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export ткст выделениеТекста()
    {
        return cast(ткст) new ВизТкст(wxComboBox_GetStringSelection(this.м_вхобъ), да);
    }
    export проц выделениеТекста(ткст значение)
    {
        wxComboBox_SetStringSelection(this.м_вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export цел счёт()
    {
        return wxComboBox_GetCount(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

    export ткст дайТкст(цел ч)
    {
        return cast(ткст) new ВизТкст(wxComboBox_GetString(this.м_вхобъ, ч), да);
    }

    //---------------------------------------------------------------------

    export ДанныеКлиента дайДанныеКлиента(цел ч)
    {
        return cast(ДанныеКлиента)найдиОбъект(wxComboBox_GetClientData(this.м_вхобъ, ч));
    }

    export проц устДанныеКлиента(цел ч, ДанныеКлиента данные)
    {
        wxComboBox_SetClientData(this.м_вхобъ, ч, ВизОбъект.безопУк(данные));
    }

    //---------------------------------------------------------------------

    export цел найдиТкст(ткст стр)
    {
        return wxComboBox_FindString(this.м_вхобъ, стр);
    }

    //---------------------------------------------------------------------

    export проц удали(цел ч)
    {
        wxComboBox_Delete(this.м_вхобъ, ч);
    }

    export проц очисть()
    {
        wxComboBox_Clear(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

    export проц добавь(ткст элт)
    {
        wxComboBox_Append(this.м_вхобъ, элт);
    }

    export проц добавь(ткст элт, ДанныеКлиента данные)
    {
        wxComboBox_AppendData(this.м_вхобъ, элт, ВизОбъект.безопУк(данные));
    }

    //---------------------------------------------------------------------

    export проц копируй()
    {
        wxComboBox_Copy(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

    export проц вырежи()
    {
        wxComboBox_Cut(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

    export проц вставь()
    {
        wxComboBox_Paste(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

    export цел точкаВставки()
    {
        return wxComboBox_GetInsertionPoint(this.м_вхобъ);
    }
    export проц точкаВставки(цел значение)
    {
        wxComboBox_SetInsertionPoint(this.м_вхобъ, cast(бцел)значение);
    }

    //---------------------------------------------------------------------

    export проц устКонецТочкиВставки()
    {
        wxComboBox_SetInsertionPointEnd(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

    export цел дайПоследнПоз()
    {
        return wxComboBox_GetLastPosition(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

    export проц замени(цел от, цел до, ткст значение)
    {
        wxComboBox_Replace(this.м_вхобъ, cast(бцел)от, cast(бцел)до, значение);
    }

    //---------------------------------------------------------------------

    export проц устВыделение(цел от, цел до)
    {
        wxComboBox_SetSelectionMult(this.м_вхобъ, cast(бцел)от, cast(бцел)до);
    }

    export проц устВыделение(цел ч)
    {
        wxComboBox_SetSelection(this.м_вхобъ, ч);
    }

    //---------------------------------------------------------------------

    export проц рисуйНевидимо(бул значение)
    {
        wxComboBox_SetEditable(this.м_вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export проц удали(цел от, цел до)
    {
        wxComboBox_Remove(this.м_вхобъ, cast(бцел)от, cast(бцел)до);
    }

    //---------------------------------------------------------------------

    export ткст значение()
    {
        return cast(ткст) new ВизТкст(wxComboBox_GetValue(this.м_вхобъ), да);
    }
    export проц значение(ткст значение)
    {
        wxComboBox_SetValue(this.м_вхобъ, значение);
    }

    export проц выдели(цел ч)
    {
        wxComboBox_Select(this.м_вхобъ, ч);
    }

    //---------------------------------------------------------------------

    export проц добавьВыбран(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_КОМБОБОКС_ВЫБРАН, ид, значение, this);
    }

    export проц удалиВыбран(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }
}

