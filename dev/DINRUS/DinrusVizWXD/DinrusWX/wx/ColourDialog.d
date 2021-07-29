module wx.ColourDialog;
public import wx.common;
public import wx.Colour;
public import wx.Dialog;

//! \cond EXTERN
extern (C) ЦелУкз wxColourData_ctor();

extern (C) проц   wxColourData_SetChooseFull(ЦелУкз сам, бул флаг);
extern (C) бул   wxColourData_GetChooseFull(ЦелУкз сам);

extern (C) проц   wxColourData_SetColour(ЦелУкз сам, ЦелУкз цвет);
extern (C) ЦелУкз wxColourData_GetColour(ЦелУкз сам);

extern (C) проц   wxColourData_SetCustomColour(ЦелУкз сам, цел i, ЦелУкз цвет);
extern (C) ЦелУкз wxColourData_GetCustomColour(ЦелУкз сам, цел i);
//! \endcond

//---------------------------------------------------------------------

export class ДанныеЦвета : ВизОбъект
{
    private this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxColourData_ctor());
    }

    //---------------------------------------------------------------------

    export бул выбериПолн()
    {
        return wxColourData_GetChooseFull(this.м_вхобъ);
    }
    export проц выбериПолн(бул значение)
    {
        wxColourData_SetChooseFull(this.м_вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export Цвет цвет()
    {
        return cast(Цвет)найдиОбъект(wxColourData_GetColour(this.м_вхобъ), &Цвет.Нов);
    }
    export проц цвет(Цвет значение)
    {
        wxColourData_SetColour(this.м_вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    export Цвет дайЦветПользователя(цел i)
    {
        return new Цвет(wxColourData_GetCustomColour(this.м_вхобъ, i), да);
    }

    export проц устЦветПользователя(цел i, Цвет цвет)
    {
        wxColourData_SetCustomColour(this.м_вхобъ, i, ВизОбъект.безопУк(цвет));
    }

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new ДанныеЦвета(ptr);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxColourDialog_ctor();
extern (C) бул   wxColourDialog_Create(ЦелУкз сам, ЦелУкз родитель, ЦелУкз данные);
extern (C) ЦелУкз wxColourDialog_GetColourData(ЦелУкз сам);
extern (C) цел    wxColourDialog_ShowModal(ЦелУкз сам);

extern (C) ЦелУкз wxColourDialog_GetColourFromUser(ЦелУкз родитель, ЦелУкз цвИниц);
//! \endcond

//---------------------------------------------------------------------

export class ДиалогЦвета : Диалог
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxColourDialog_ctor());
    }

    export this(Окно родитель, ДанныеЦвета данные = пусто)
    {
        super(wxColourDialog_ctor());
        if (!создай(родитель, данные))
        {
            throw new ИсклНевернОперации("Не удалось создать ДиалогЦвета");
        }
    }

    export бул создай(Окно родитель, ДанныеЦвета данные = пусто)
    {
        return wxColourDialog_Create(this.м_вхобъ, ВизОбъект.безопУк(родитель),
                                     ВизОбъект.безопУк(данные));
    }

    //---------------------------------------------------------------------

    export ДанныеЦвета данныеЦвета()
    {
        return cast(ДанныеЦвета)найдиОбъект(wxColourDialog_GetColourData(this.м_вхобъ), &ДанныеЦвета.Нов);
    }

    //---------------------------------------------------------------------

    export override цел покажиМодально()
    {
        return wxColourDialog_ShowModal(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

}

export static Цвет дайЦветОтПользователя(Окно родитель=пусто, Цвет цвИниц=пусто)
{
    return new Цвет(wxColourDialog_GetColourFromUser(ВизОбъект.безопУк(родитель), ВизОбъект.безопУк(цвИниц)));
}
