module wx.Wizard;
public import wx.common;
public import wx.Dialog;
public import wx.Panel;
//public import wx.NotifyEvent;
public import wx.WizardPage;

//! \cond EXTERN
extern (C) ЦелУкз wxWizard_ctor(ЦелУкз родитель, цел ид, ткст титул, ЦелУкз битмап, inout Точка поз, цел стиль);
extern (C) бул   wxWizard_RunWizard(ЦелУкз сам, ЦелУкз первоеОкно);
extern (C) проц   wxWizard_SetPageSize(ЦелУкз сам, inout Размер размер);
//! \endcond

//---------------------------------------------------------------------

export class Мастер : Диалог
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(Окно родитель, цел ид = ЛЮБОЙ, ткст титул = "", Битмап битмап = Битмап.НуллБитмап, Точка поз = ДЕФПОЗ, цел стиль = ДЕФ_СТИЛЬ_ДИАЛОГА)
    {
        super(wxWizard_ctor(ВизОбъект.безопУк(родитель), ид, титул, ВизОбъект.безопУк(битмап), поз, стиль));
    }

    //---------------------------------------------------------------------

    export бул выполниМастер(СтраницаМастера первоеОкно)
    {
        if (первоеОкно is пусто)
            throw new ИсклНуллАргумента("первоеОкно");

        return wxWizard_RunWizard(вхобъ, первоеОкно.вхобъ);
    }

    //---------------------------------------------------------------------

    export проц размерСтраницы(Размер значение)
    {
        wxWizard_SetPageSize(вхобъ, значение);
    }
}

//! \cond EXTERN
extern (C) ЦелУкз wxWizardEvent_ctor(цел тип,цел ид, бул направление,ЦелУкз страница);
extern (C) бул   wxWizardEvent_GetDirection(ЦелУкз сам);
extern (C) ЦелУкз wxWizardEvent_GetPage(ЦелУкз сам);

extern (C) ТипСобытия wxEvent_WIZARD_PAGE_CHANGED();
extern (C) ТипСобытия wxEvent_WIZARD_PAGE_CHANGING();
extern (C) ТипСобытия wxEvent_WIZARD_CANCEL();
extern (C) ТипСобытия wxEvent_WIZARD_HELP();
extern (C) ТипСобытия wxEvent_WIZARD_FINISHED();
//! \endcond

/+
alias WizardEvent wxWizardEvent;
export class WizardEvent : СобытиеУведоми
{
    static ТипСобытия wxEVT_WIZARD_PAGE_CHANGED;
    static ТипСобытия wxEVT_WIZARD_PAGE_CHANGING;
    static ТипСобытия wxEVT_WIZARD_CANCEL;
    static ТипСобытия wxEVT_WIZARD_HELP;
    static ТипСобытия wxEVT_WIZARD_FINISHED;

    static this()
    {
        wxEVT_WIZARD_PAGE_CHANGED  = wxEvent_WIZARD_PAGE_CHANGED();
        wxEVT_WIZARD_PAGE_CHANGING = wxEvent_WIZARD_PAGE_CHANGING();
        wxEVT_WIZARD_CANCEL   = wxEvent_WIZARD_CANCEL();
        wxEVT_WIZARD_HELP     = wxEvent_WIZARD_HELP();
        wxEVT_WIZARD_FINISHED = wxEvent_WIZARD_FINISHED();

        добавьТипСоб(wxEVT_WIZARD_PAGE_CHANGED,  &WizardEvent.Нов);
        добавьТипСоб(wxEVT_WIZARD_PAGE_CHANGING, &WizardEvent.Нов);
        добавьТипСоб(wxEVT_WIZARD_CANCEL,   &WizardEvent.Нов);
        добавьТипСоб(wxEVT_WIZARD_HELP,     &WizardEvent.Нов);
        добавьТипСоб(wxEVT_WIZARD_FINISHED, &WizardEvent.Нов);
    }

    this(ЦелУкз ptr)
    {
        super(ptr);
    }

    this(ТипСобытия тип = соб.СОБ_НУЛЛ, цел ид = ЛЮБОЙ, бул направление = да, СтраницаМастера страница = пусто)
    {
        this(wxWizardEvent_ctor(тип,ид,направление,ВизОбъект.безопУк(страница)));
    }

    static Событие Нов(ЦелУкз ptr)
    {
        return new WizardEvent(ptr);
    }

    бул ПНаправление()
    {
        return wxWizardEvent_GetDirection(вхобъ);
    }
    СтраницаМастера Page()
    {
        return cast(СтраницаМастера)найдиОбъект(wxWizardEvent_GetPage(вхобъ),&СтраницаМастера.Нов);
    }
}
+/
