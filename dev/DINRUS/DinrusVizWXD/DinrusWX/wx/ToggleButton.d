module wx.ToggleButton;
public import wx.common;
public import wx.Control;

//! \cond EXTERN
extern (C) ЦелУкз wxToggleButton_ctor();
extern (C) бул   wxToggleButton_Create(ЦелУкз сам, ЦелУкз родитель,
        цел ид, ткст ярлык, inout Точка поз, inout Размер размер, бцел стиль,
        ЦелУкз оценщик, ткст имя);
extern (C) бул wxToggleButton_GetValue(ЦелУкз сам);
extern (C) бул wxToggleButton_SetValue(ЦелУкз сам, бул состояние);
//! \endcond

//---------------------------------------------------------------------

export class КнопкаПереключатель : Контрол
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxToggleButton_ctor());
    }

    export this(Окно родитель, цел ид, ткст ярлык, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = 0, Оценщик оценщик = пусто, ткст имя = "checkbox")
    {
        super(wxToggleButton_ctor());
        if (!создай(родитель, ид, ярлык, поз, размер, стиль, оценщик, имя))
        {
            throw new ИсклНевернОперации("Не удалось создать КнопкаПереключатель");
        }
    }

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new КнопкаПереключатель(ptr);
    }

    //---------------------------------------------------------------------

    export this(Окно родитель, ткст ярлык, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = 0, Оценщик оценщик = пусто, ткст имя = "checkbox")
    {
        this(родитель, Окно.уникИд, ярлык, поз, размер, стиль, оценщик, имя);
    }

    //---------------------------------------------------------------------

    export бул создай(Окно родитель, цел ид, ткст ярлык, inout Точка поз, inout Размер размер,
                       цел стиль, Оценщик оценщик, ткст имя)
    {
        return wxToggleButton_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, ярлык, поз, размер,
                                     cast(бцел)стиль, ВизОбъект.безопУк(оценщик), имя);
    }

    //---------------------------------------------------------------------

    export бул состояние()
    {
        return wxToggleButton_GetValue(вхобъ);
    }
    export проц состояние(бул значение)
    {
        wxToggleButton_SetValue(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export проц добавьНажатие(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_ПЕРЕКЛЮЧАТЕЛЬ_НАЖАТ, ид, значение, this);
    }
    export проц удалиНажатие(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }
}

