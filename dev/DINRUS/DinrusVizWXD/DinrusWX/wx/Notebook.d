module wx.Notebook;
public import wx.common;
public import wx.Event;
public import wx.Control;
public import wx.ImageList;

//! \cond EXTERN
extern (C) ЦелУкз wxNotebookEvent_ctor(цел типКоманды, цел ид, цел члоВыб, цел члоСтарВыб);
extern (C) цел    wxNotebookEvent_GetSelection(ЦелУкз сам);
extern (C) проц   wxNotebookEvent_SetSelection(ЦелУкз сам, цел члоВыб);
extern (C) цел    wxNotebookEvent_GetOldSelection(ЦелУкз сам);
extern (C) проц   wxNotebookEvent_SetOldSelection(ЦелУкз сам, цел члоСтарВыб);
extern (C) проц wxNotebookEvent_Veto(ЦелУкз сам);
extern (C) проц wxNotebookEvent_Allow(ЦелУкз сам);
extern (C) бул wxNotebookEvent_IsAllowed(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class СобытиеНоутбука : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(цел типКоманды, цел ид, цел члоВыб, цел члоСтарВыб)
    {
        super(wxNotebookEvent_ctor(типКоманды, ид, члоВыб, члоСтарВыб));
    }

    //-----------------------------------------------------------------------------

    export цел выделение()
    {
        return wxNotebookEvent_GetSelection(вхобъ);
    }
    export проц выделение(цел значение)
    {
        wxNotebookEvent_SetSelection(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export цел старВыделение()
    {
        return wxNotebookEvent_GetOldSelection(вхобъ);
    }
    export проц старВыделение(цел значение)
    {
        wxNotebookEvent_SetOldSelection(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export проц запрет()
    {
        wxNotebookEvent_Veto(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц позволить()
    {
        wxNotebookEvent_Allow(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул позволено()
    {
        return wxNotebookEvent_IsAllowed(вхобъ);
    }

    private static Событие Нов(ЦелУкз объ)
    {
        return new СобытиеНоутбука(объ);
    }

    static this()
    {
        this.Тип.СОБ_КОМАНДА_НОУТБУК_СТРАНИЦА_ИЗМЕНЕНА = wxEvent_EVT_COMMAND_NOTEBOOK_PAGE_CHANGED();
        this.Тип.СОБ_КОМАНДА_НОУТБУК_СТРАНИЦА_ИЗМЕНЯЕТСЯ = wxEvent_EVT_COMMAND_NOTEBOOK_PAGE_CHANGING();

        добавьТипСоб (this.Тип.СОБ_КОМАНДА_НОУТБУК_СТРАНИЦА_ИЗМЕНЕНА,   &СобытиеНоутбука.Нов);
        добавьТипСоб (this.Тип.СОБ_КОМАНДА_НОУТБУК_СТРАНИЦА_ИЗМЕНЯЕТСЯ,  &СобытиеНоутбука.Нов);
    }
}

//! \cond EXTERN
extern (C) ЦелУкз wxNotebook_ctor();
extern (C) бул   wxNotebook_AddPage(ЦелУкз сам, ЦелУкз страница, ткст текст, бул селект, цел идРисунка);
extern (C) бул   wxNotebook_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер размер, бцел стиль, ткст имя);
extern (C) цел    wxNotebook_GetPageCount(ЦелУкз сам);
extern (C) ЦелУкз wxNotebook_GetPage(ЦелУкз сам, цел члоСтр);
extern (C) цел    wxNotebook_GetSelection(ЦелУкз сам);
extern (C) бул   wxNotebook_SetPageText(ЦелУкз сам, цел члоСтр, ткст стрТекст);
extern (C) ЦелУкз wxNotebook_GetPageText(ЦелУкз сам, цел члоСтр);
extern (C) проц   wxNotebook_SetImageList(ЦелУкз сам, ЦелУкз списокРисунков);
extern (C) проц   wxNotebook_AssignImageList(ЦелУкз сам, ЦелУкз списокРисунков);
extern (C) ЦелУкз wxNotebook_GetImageList(ЦелУкз сам);
extern (C) цел    wxNotebook_GetPageImage(ЦелУкз сам, цел члоСтр);
extern (C) бул   wxNotebook_SetPageImage(ЦелУкз сам, цел члоСтр, цел nImage);
extern (C) цел    wxNotebook_GetRowCount(ЦелУкз сам);
extern (C) проц   wxNotebook_SetPageSize(ЦелУкз сам, inout Размер размер);
extern (C) проц   wxNotebook_SetPadding(ЦелУкз сам, inout Размер padding);
extern (C) проц   wxNotebook_SetTabSize(ЦелУкз сам, inout Размер рм);
extern (C) бул   wxNotebook_DeletePage(ЦелУкз сам, цел члоСтр);
extern (C) бул   wxNotebook_RemovePage(ЦелУкз сам, цел члоСтр);
extern (C) бул   wxNotebook_DeleteAllPages(ЦелУкз сам);
extern (C) бул   wxNotebook_InsertPage(ЦелУкз сам, цел члоСтр, ЦелУкз pPage, ткст стрТекст, бул выделить, цел идРисунка);
extern (C) цел    wxNotebook_SetSelection(ЦелУкз сам, цел члоСтр);
extern (C) проц   wxNotebook_AdvanceSelection(ЦелУкз сам, бул вперёд);
//! \endcond

//---------------------------------------------------------------------

export class Ноутбук : Контрол
{
    public const цел ФИКСШИР       = 0x0010;
    public const цел ВЕРХ              = 0x0000;
    public const цел ЛЕВО             = 0x0020;
    public const цел ПРАВО            = 0x0040;
    public const цел НИЗ           = 0x0080;
    public const цел МНОГОСТРОК        = 0x0100;

    public const ткст СтрИмениНоутбука = "notebook";
    //-----------------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxNotebook_ctor());
    }

    export this(Окно родитель, цел ид, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = 0, ткст имя = СтрИмениНоутбука)
    {
        super(wxNotebook_ctor());
        if (!wxNotebook_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, поз, размер, стиль, имя))
        {
            throw new ИсклНевернОперации("Не удалось создать Ноутбук");
        }
    }

    export static ВизОбъект Нов(ЦелУкз вхобъ)
    {
        return new Ноутбук(вхобъ);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    export this(Окно родитель, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = 0, ткст имя = СтрИмениНоутбука)
    {
        this(родитель, Окно.уникИд, поз, размер, стиль, имя);
    }

    //---------------------------------------------------------------------

    // TODO: Switch окно with НоутбукPage

    export бул добавьСтраницу(Окно страница, ткст текст)
    {
        return добавьСтраницу(страница, текст, нет, -1);
    }

    export бул добавьСтраницу(Окно страница, ткст текст, бул селект)
    {
        return добавьСтраницу(страница, текст, селект, -1);
    }

    export бул добавьСтраницу(Окно страница, ткст текст, бул селект, цел идРисунка)
    {
        return wxNotebook_AddPage(вхобъ, ВизОбъект.безопУк(страница), текст, селект, идРисунка);
    }

    //---------------------------------------------------------------------

    export проц рисунки(СписокРисунков значение)
    {
        wxNotebook_SetImageList(вхобъ, ВизОбъект.безопУк(значение));
    }
    export СписокРисунков рисунки()
    {
        return cast(СписокРисунков)найдиОбъект(wxNotebook_GetImageList(вхобъ));
    }

    //---------------------------------------------------------------------

    export цел счётСтраниц()
    {
        return wxNotebook_GetPageCount(вхобъ);
    }

    // TODO: Switch окно with НоутбукPage
    export Окно дайСтраницу(цел страница)
    {
        return cast(Окно)найдиОбъект(wxNotebook_GetPage(вхобъ, страница));
    }

    //---------------------------------------------------------------------

    export цел выделение()
    {
        return wxNotebook_GetSelection(вхобъ);
    }
    export проц выделение(цел значение)
    {
        wxNotebook_SetSelection(вхобъ, значение);
    }

    export проц продвиньВыделение(бул вперёд)
    {
        wxNotebook_AdvanceSelection(вхобъ, вперёд);
    }

    //---------------------------------------------------------------------

    export бул устТекстСтраницы(цел страница, ткст текст)
    {
        return wxNotebook_SetPageText(вхобъ, страница, текст);
    }

    export ткст дайТекстСтраницы(цел страница)
    {
        return cast(ткст) new ВизТкст(wxNotebook_GetPageText(вхобъ, страница), да);
    }

    //---------------------------------------------------------------------

    export проц присвойСписокРисунков(СписокРисунков списокРисунков)
    {
        wxNotebook_AssignImageList(вхобъ, ВизОбъект.безопУк(списокРисунков));
    }

    //---------------------------------------------------------------------

    export цел дайРисунокСтраницы(цел страница)
    {
        return wxNotebook_GetPageImage(вхобъ, страница);
    }

    export бул устРисунокСтраницы(цел страница, цел рисунок)
    {
        return wxNotebook_SetPageImage(вхобъ, страница, рисунок);
    }

    //---------------------------------------------------------------------

    export цел счётРядов()
    {
        return wxNotebook_GetRowCount(вхобъ);
    }

    //---------------------------------------------------------------------

    export проц размерСтраницы(Размер значение)
    {
        wxNotebook_SetPageSize(вхобъ, значение);
    }

    export проц паддинг(Размер значение)
    {
        wxNotebook_SetPadding(вхобъ, значение);
    }

    export проц размерТаб(Размер значение)
    {
        wxNotebook_SetTabSize(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export бул удалиСтраницу(цел страница)
    {
        return wxNotebook_DeletePage(вхобъ, страница);
    }

    export бул удалиСтраницу2(цел страница)
    {
        return wxNotebook_RemovePage(вхобъ, страница);
    }

    export бул удалиВсеСтраницы()
    {
        return wxNotebook_DeleteAllPages(вхобъ);
    }

    //---------------------------------------------------------------------

    // TODO: Switch окно with НоутбукPage
    export бул вставьСтраницу(цел страница, Окно окно, ткст текст,
                           бул селект, цел рисунок)
    {
        return wxNotebook_InsertPage(вхобъ, страница,
                                     ВизОбъект.безопУк(окно), текст, селект,
                                     рисунок);
    }

    //---------------------------------------------------------------------

    export проц PageChange_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_НОУТБУК_СТРАНИЦА_ИЗМЕНЕНА, ид, значение, this);
    }
    export проц PageChange_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц PageChanging_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_НОУТБУК_СТРАНИЦА_ИЗМЕНЯЕТСЯ, ид, значение, this);
    }
    export проц PageChanging_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }
}
