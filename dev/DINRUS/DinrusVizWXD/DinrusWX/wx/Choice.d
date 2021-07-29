module wx.Choice;
public import wx.common;
public import wx.Control;
public import wx.ClientData;
public import wx.IControlWithItems;
public import wx.ArrayString;

//! \cond EXTERN
extern (C) ЦелУкз wxChoice_ctor();
extern (C) бул   wxChoice_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер размер, цел ч, ткст0 выборы, цел стиль, ЦелУкз оценщик, ткст имя);
extern (C) проц   wxChoice_dtor(ЦелУкз сам);

extern (C) проц   wxChoice_SetSelection(ЦелУкз сам, цел ч);
extern (C) бул   wxChoice_SetStringSelection(ЦелУкз сам, ткст т);
extern (C) ЦелУкз wxChoice_GetStringSelection(ЦелУкз сам);

extern (C) проц   wxChoice_SetColumns(ЦелУкз сам, цел ч);
extern (C) цел    wxChoice_GetColumns(ЦелУкз сам);

extern (C) проц   wxChoice_Command(ЦелУкз сам, ЦелУкз соб);
extern (C) цел    wxChoice_GetCount(ЦелУкз сам);
extern (C) ЦелУкз wxChoice_GetString(ЦелУкз сам, цел ч);
extern (C) цел    wxChoice_GetSelection(ЦелУкз сам);

extern (C) ЦелУкз wxChoice_GetClientData(ЦелУкз сам, цел ч);
extern (C) проц   wxChoice_SetClientData(ЦелУкз сам, цел ч, ЦелУкз данные);

extern (C) цел    wxChoice_FindString(ЦелУкз сам, ткст стр);

extern (C) проц   wxChoice_Delete(ЦелУкз сам, цел ч);
extern (C) проц   wxChoice_Clear(ЦелУкз сам);

extern (C) цел   wxChoice_Append(ЦелУкз сам, ткст элт);
extern (C) цел   wxChoice_AppendData(ЦелУкз сам, ткст элт, ЦелУкз данные);

extern (C)	проц wxChoice_AppendString(ЦелУкз сам, ткст элт);

extern (C)	проц wxChoice_AppendArrayString(ЦелУкз сам, цел ч, ткст0 тксты);

extern (C)	цел wxChoice_Insert(ЦелУкз сам, ткст элт, цел поз);
extern (C)	цел wxChoice_InsertClientData(ЦелУкз сам, ткст элт, цел поз, ЦелУкз данныеКлиента);

extern (C)	ЦелУкз wxChoice_GetStrings(ЦелУкз сам);

extern (C)	проц wxChoice_SetClientObject(ЦелУкз сам, цел ч, ЦелУкз данныеКлиента);
extern (C)	ЦелУкз wxChoice_GetClientObject(ЦелУкз сам, цел ч);
extern (C)	бул wxChoice_HasClientObjectData(ЦелУкз сам);
extern (C)	бул wxChoice_HasClientUntypedData(ЦелУкз сам);

extern (C) проц wxChoice_SetString(ЦелУкз сам, цел ч, ткст текст);

extern (C) проц wxChoice_Select(ЦелУкз сам, цел ч);

extern (C)	бул wxChoice_ShouldInheritColours(ЦелУкз сам);

extern (C)	бул wxChoice_IsEmpty(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

export class Выбор : Контрол, ИКонтролСЭлементами
{
    public const ткст СтрИмениВыборКтрл = "choice";

    export this(ЦелУкз объ)
    {
        super(объ);
    }

    export this()
    {
        super(wxChoice_ctor());
    }

    export this(Окно родитель, цел ид, Точка поз, Размер размер, ткст[] выборы = пусто, цел стиль = 0, Оценщик знач = пусто,ткст имя = СтрИмениВыборКтрл)
    {
        super(wxChoice_ctor());
        if(!wxChoice_Create(this.м_вхобъ, ВизОбъект.безопУк(родитель), ид, поз,
                            размер, выборы.length, cast(ткст0) выборы.ptr, стиль,
                            ВизОбъект.безопУк(оценщик), имя))
        {
            throw new ИсклНевернОперации("Не удалось создать ЛистБокс");
        }
    }

    export static ВизОбъект Нов(ЦелУкз объ)
    {
        return new Выбор(объ);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    export this(Окно родитель, Точка поз, Размер размер, ткст[] выборы = пусто, цел стиль = 0, Оценщик знач = пусто,ткст имя = СтрИмениВыборКтрл)
    {
        this(родитель, Окно.уникИд, поз, размер, выборы, стиль, оценщик, имя);
    }

    //---------------------------------------------------------------------

    export бул создай(Окно родитель, цел ид, inout Точка поз, inout Размер размер,
                       ткст[] выборы, цел стиль, Оценщик оценщик,
                       ткст имя)
    {
        return wxChoice_Create(this.м_вхобъ, ВизОбъект.безопУк(родитель), ид,
                               поз, размер, выборы.length, cast(ткст0)выборы.ptr,
                               cast(бцел)стиль, ВизОбъект.безопУк(оценщик), имя);
    }

    //-----------------------------------------------------------------------------

    export цел добавь(ткст элт)
    {
        return wxChoice_Append(this.м_вхобъ, элт);
    }

    export цел добавь(ткст элт, ДанныеКлиента данныеКлиента)
    {
        return wxChoice_AppendData(вхобъ, элт, ВизОбъект.безопУк(данныеКлиента));
    }

    //-----------------------------------------------------------------------------

    export проц добавьТкст(ткст элт)
    {
        wxChoice_AppendString(this.м_вхобъ, элт);
    }

    //-----------------------------------------------------------------------------

    export проц добавь(ткст[] строки)
    {
        wxChoice_AppendArrayString(this.м_вхобъ, строки.length, cast(ткст0)  строки.ptr);
    }

    //-----------------------------------------------------------------------------

    export цел вставь(ткст элт, цел поз)
    {
        return wxChoice_Insert(this.м_вхобъ, элт, поз);
    }

    export цел вставь(ткст элт, цел поз, ДанныеКлиента данныеКлиента)
    {
        return wxChoice_InsertClientData(this.м_вхобъ, элт, поз, ВизОбъект.безопУк(данныеКлиента));
    }

    //-----------------------------------------------------------------------------

    export ткст[] дайТксты()
    {
        return (new ТкстМассива(wxChoice_GetStrings(вхобъ), да)).вМассив();
    }

    //-----------------------------------------------------------------------------

    export проц устОбъКлиента(цел ч, ДанныеКлиента данныеКлиента)
    {
        wxChoice_SetClientObject(this.м_вхобъ, ч, ВизОбъект.безопУк(данныеКлиента));
    }

    export ДанныеКлиента дайОбъКлиента(цел ч)
    {
        return cast(ДанныеКлиента)найдиОбъект(wxChoice_GetClientObject(this.м_вхобъ, ч), &ДанныеКлиента.Нов);
    }

    //-----------------------------------------------------------------------------

    export бул естьДанныеОбъКлиента()
    {
        return wxChoice_HasClientObjectData(this.м_вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул естьНетипированнДанныеКлиента()
    {
        return wxChoice_HasClientUntypedData(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

    export цел выделение()
    {
        return wxChoice_GetSelection(this.м_вхобъ);
    }
    export проц выделение(цел значение)
    {
        wxChoice_SetSelection(this.м_вхобъ, значение);
    }

    export цел дайВыделение()
    {
        return wxChoice_GetSelection(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

    export ткст выделениеТекста()
    {
        return cast(ткст) new ВизТкст(wxChoice_GetStringSelection(this.м_вхобъ), да);
    }
    export проц выделениеТекста(ткст значение)
    {
        wxChoice_SetStringSelection(this.м_вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export цел колонки()
    {
        return wxChoice_GetColumns(this.м_вхобъ);
    }
    export проц колонки(цел значение)
    {
        wxChoice_SetColumns(this.м_вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export проц команда(Событие соб)
    {
        wxChoice_Command(this.м_вхобъ, ВизОбъект.безопУк(соб));
    }

    //---------------------------------------------------------------------

    export цел счёт()
    {
        return wxChoice_GetCount(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

    export ткст дайТкст(цел ч)
    {
        return cast(ткст) new ВизТкст(wxChoice_GetString(this.м_вхобъ, ч), да);
    }

    //---------------------------------------------------------------------

    // TODO: найди way до pass данные through C# object

    export ДанныеКлиента дайДанныеКлиента(цел ч)
    {
        return cast(ДанныеКлиента)найдиОбъект(wxChoice_GetClientData(вхобъ, ч));
    }

    export проц устДанныеКлиента(цел ч, ДанныеКлиента данные)
    {
        wxChoice_SetClientData(this.м_вхобъ, ч, ВизОбъект.безопУк(данные));
    }

    //---------------------------------------------------------------------

    export цел найдиТкст(ткст стр)
    {
        return wxChoice_FindString(this.м_вхобъ, стр);
    }

    //---------------------------------------------------------------------

    export проц удали(цел ч)
    {
        wxChoice_Delete(this.м_вхобъ, ч);
    }

    //---------------------------------------------------------------------

    export проц очисть()
    {
        wxChoice_Clear(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

    export проц устТкст(цел ч, ткст стр)
    {
        wxChoice_SetString(this.м_вхобъ, ч, стр);
    }

    //---------------------------------------------------------------------

    export проц выдели(цел ч)
    {
        wxChoice_Select(this.м_вхобъ, ч);
    }

    //-----------------------------------------------------------------------------

    export override бул наследоватьЦвета()
    {
        return wxChoice_ShouldInheritColours(this.м_вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул пуст()
    {
        return wxChoice_IsEmpty(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

    export проц добавьВыбран(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_ВЫБОР_ВЫБРАН, ид, значение, this);
    }
    export проц удалиВыбран(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

}
