module wx.FindReplaceDialog;
public import wx.common;
public import wx.Dialog;
public import wx.CommandEvent;

//! \cond EXTERN
extern (C) ЦелУкз wxFindReplaceDialog_ctor();
extern (C) бул   wxFindReplaceDialog_Create(ЦелУкз сам, ЦелУкз родитель, ЦелУкз данные, ткст титул, бцел стиль);

extern (C) ЦелУкз wxFindReplaceDialog_GetData(ЦелУкз сам);
extern (C) проц   wxFindReplaceDialog_SetData(ЦелУкз сам, ЦелУкз данные);
//! \endcond

//-----------------------------------------------------------------------------

export class ДиалогНайдиЗамени : Диалог
{
    public const цел wxFR_DOWN       = 1;
    public const цел wxFR_WHOLEWORD  = 2;
    public const цел wxFR_MATCHCASE  = 4;

    public const цел wxFR_REPLACEDIALOG = 1;
    public const цел wxFR_NOUPDOWN      = 2;
    public const цел wxFR_NOMATCHCASE   = 4;
    public const цел wxFR_NOWHOLEWORD   = 8;

    //-----------------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxFindReplaceDialog_ctor());
    }

    export this(Окно родитель, ДанныеНайдиЗамени данные, ткст титул, цел стиль = 0)
    {
        super(wxFindReplaceDialog_ctor());
        if (!создай(родитель, данные, титул, стиль))
        {
            throw new ИсклНевернОперации("Не удалось создать ДиалогНайдиЗамени");
        }
    }

    export бул создай(Окно родитель, ДанныеНайдиЗамени данные, ткст титул, цел стиль = 0)
    {
        return wxFindReplaceDialog_Create(вхобъ, ВизОбъект.безопУк(родитель), ВизОбъект.безопУк(данные), титул, cast(бцел)стиль);
    }

    //-----------------------------------------------------------------------------

    export ДанныеНайдиЗамени данные()
    {
        return cast(ДанныеНайдиЗамени)найдиОбъект(wxFindReplaceDialog_GetData(вхобъ), &ДанныеНайдиЗамени.Нов);
    }
    export проц данные(ДанныеНайдиЗамени значение)
    {
        wxFindReplaceDialog_SetData(вхобъ, ВизОбъект.безопУк(значение));
    }

    //-----------------------------------------------------------------------------

    export проц Find_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_НАЙДИ, ид, значение, this);
    }
    export проц Find_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц FindNext_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_НАЙДИ_СЛЕДЩ, ид, значение, this);
    }
    export проц FindNext_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц FindReplace_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_НАЙДИ_ЗАМЕНИ, ид, значение, this);
    }
    export проц FindReplace_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц FindReplaceAll_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_НАЙДИ_ЗАМЕНИ_ВСЕ, ид, значение, this);
    }
    export проц FindReplaceAll_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц FindClose_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_НАЙДИ_ЗАКРЫТЬ, ид, значение, this);
    }
    export проц FindClose_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxFindDialogEvent_ctor(цел типКоманды, цел ид);

extern (C) цел    wxFindDialogEvent_GetFlags(ЦелУкз сам);
extern (C) проц   wxFindDialogEvent_SetFlags(ЦелУкз сам, цел флаги);

extern (C) ЦелУкз wxFindDialogEvent_GetFindString(ЦелУкз сам);
extern (C) проц   wxFindDialogEvent_SetFindString(ЦелУкз сам, ткст стр);

extern (C) ЦелУкз wxFindDialogEvent_GetReplaceString(ЦелУкз сам);
extern (C) проц   wxFindDialogEvent_SetReplaceString(ЦелУкз сам, ткст стр);

extern (C) ЦелУкз wxFindDialogEvent_GetDialog(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеДиалогаПоиска : СобытиеКоманды
{
    static this()
    {
        this.Тип.СОБ_КОМАНДА_НАЙДИ = wxEvent_EVT_COMMAND_FIND();
        this.Тип.СОБ_КОМАНДА_НАЙДИ_СЛЕДЩ = wxEvent_EVT_COMMAND_FIND_NEXT();
        this.Тип.СОБ_КОМАНДА_НАЙДИ_ЗАМЕНИ = wxEvent_EVT_COMMAND_FIND_REPLACE();
        this.Тип.СОБ_КОМАНДА_НАЙДИ_ЗАМЕНИ_ВСЕ = wxEvent_EVT_COMMAND_FIND_REPLACE_ALL();
        this.Тип.СОБ_КОМАНДА_НАЙДИ_ЗАКРЫТЬ = wxEvent_EVT_COMMAND_FIND_CLOSE();

        добавьТипСоб (this.Тип.СОБ_КОМАНДА_НАЙДИ,	&СобытиеДиалогаПоиска.Нов);
        добавьТипСоб (this.Тип.СОБ_КОМАНДА_НАЙДИ_СЛЕДЩ,	&СобытиеДиалогаПоиска.Нов);
        добавьТипСоб (this.Тип.СОБ_КОМАНДА_НАЙДИ_ЗАМЕНИ,	&СобытиеДиалогаПоиска.Нов);
        добавьТипСоб (this.Тип.СОБ_КОМАНДА_НАЙДИ_ЗАМЕНИ_ВСЕ,	&СобытиеДиалогаПоиска.Нов);
        добавьТипСоб (this.Тип.СОБ_КОМАНДА_НАЙДИ_ЗАКРЫТЬ,	&СобытиеДиалогаПоиска.Нов);

    }

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(цел типКоманды, цел ид)
    {
        super(wxFindDialogEvent_ctor(типКоманды, ид));
    }

    export static Событие Нов(ЦелУкз ptr)
    {
        return new СобытиеДиалогаПоиска(ptr);
    }

    //-----------------------------------------------------------------------------

    export цел флаги()
    {
        return wxFindDialogEvent_GetFlags(вхобъ);
    }
    export проц флаги(цел значение)
    {
        wxFindDialogEvent_SetFlags(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export ткст найдиТкст()
    {
        return cast(ткст) new ВизТкст(wxFindDialogEvent_GetFindString(вхобъ), да);
    }
    export проц найдиТкст(ткст значение)
    {
        wxFindDialogEvent_SetFindString(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export ткст замениТекст()
    {
        return cast(ткст) new ВизТкст(wxFindDialogEvent_GetReplaceString(вхобъ), да);
    }
    export проц замениТекст(ткст значение)
    {
        wxFindDialogEvent_SetReplaceString(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export ДиалогНайдиЗамени диалог()
    {
        return cast(ДиалогНайдиЗамени)найдиОбъект(wxFindDialogEvent_GetDialog(вхобъ));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxFindReplaceData_ctor(бцел флаги);

extern (C) ЦелУкз wxFindReplaceData_GetFindString(ЦелУкз сам);
extern (C) проц   wxFindReplaceData_SetFindString(ЦелУкз сам, ткст стр);

extern (C) цел    wxFindReplaceData_GetFlags(ЦелУкз сам);
extern (C) проц   wxFindReplaceData_SetFlags(ЦелУкз сам, цел флаги);

extern (C) проц   wxFindReplaceData_SetReplaceString(ЦелУкз сам, ткст стр);
extern (C) ЦелУкз wxFindReplaceData_GetReplaceString(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class ДанныеНайдиЗамени : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        this(0);
    }

    export this(цел флаги)
    {
        super(wxFindReplaceData_ctor(cast(бцел)флаги));
    }

    //-----------------------------------------------------------------------------

    export ткст найдиТкст()
    {
        return cast(ткст) new ВизТкст(wxFindReplaceData_GetFindString(вхобъ), да);
    }
    export проц найдиТкст(ткст значение)
    {
        wxFindReplaceData_SetFindString(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export ткст замениТекст()
    {
        return cast(ткст) new ВизТкст(wxFindReplaceData_GetReplaceString(вхобъ), да);
    }
    export проц замениТекст(ткст значение)
    {
        wxFindReplaceData_SetReplaceString(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export цел флаги()
    {
        return wxFindReplaceData_GetFlags(вхобъ);
    }
    export проц флаги(цел значение)
    {
        wxFindReplaceData_SetFlags(вхобъ, значение);
    }

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new ДанныеНайдиЗамени(ptr);
    }
}

