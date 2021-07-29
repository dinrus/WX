module wx.FileDialog;
public import wx.common;
public import wx.Dialog;
public import wx.ArrayString;

version(Dinrus) private import stdrus;


//! \cond EXTERN
extern (C) ЦелУкз wxFileDialog_ctor(ЦелУкз родитель, ткст сообщение, ткст дефПап, ткст дефФайл, ткст уайлдкард, бцел стиль, inout Точка поз);
extern (C) проц   wxFileDialog_dtor(ЦелУкз сам);

extern (C) ЦелУкз wxFileDialog_GetDirectory(ЦелУкз сам);
extern (C) проц   wxFileDialog_SetDirectory(ЦелУкз сам, ткст dir);

extern (C) ЦелУкз wxFileDialog_GetFilename(ЦелУкз сам);
extern (C) проц   wxFileDialog_SetFilename(ЦелУкз сам, ткст имяф);

extern (C) ЦелУкз wxFileDialog_GetPath(ЦелУкз сам);
extern (C) проц   wxFileDialog_SetPath(ЦелУкз сам, ткст путь);

extern (C) проц   wxFileDialog_SetFilterIndex(ЦелУкз сам, цел индексФильтра);
extern (C) цел    wxFileDialog_GetFilterIndex(ЦелУкз сам);

extern (C) ЦелУкз wxFileDialog_GetWildcard(ЦелУкз сам);
extern (C) проц   wxFileDialog_SetWildcard(ЦелУкз сам, ткст уайлдкард);

extern (C) проц   wxFileDialog_SetMessage(ЦелУкз сам, ткст сообщение);
extern (C) ЦелУкз wxFileDialog_GetMessage(ЦелУкз сам);

extern (C) цел    wxFileDialog_ShowModal(ЦелУкз сам);

extern (C) цел    wxFileDialog_GetStyle(ЦелУкз сам);
extern (C) проц   wxFileDialog_SetStyle(ЦелУкз сам, цел стиль);

extern (C) ЦелУкз wxFileDialog_GetPaths(ЦелУкз сам);
extern (C) ЦелУкз wxFileDialog_GetFilenames(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

export class ДиалогФайла : Диалог
{
    public const цел ОТКРЫТЬ              = 0x0001;
    public const цел СОХРАНИТЬ              = 0x0002;
    public const цел ПРОМПТ_ПЕРЕПИСАТЬ  = 0x0004;
    public const цел СКРЫТЬ_ТОЛЬКОЧТЕНИЕ     = 0x0008;
    public const цел ДОЛЖЕН_СУЩЕСТВОВАТЬ   = 0x0010;
    public const цел НЕСКОЛЬКО          = 0x0020;
    public const цел СМЕНИТЬ_ПАПКУ        = 0x0040;

    public const ткст СтрПромптаВыбораФайла = "Выберите файл";
    version(__WXMSW__)
    {
        public const ткст СтрДефУйлдкардаВыбораФайла = "*.*";
    } else
    {
        public const ткст СтрДефУйлдкардаВыбораФайла = "*";
    }

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(Окно родитель, ткст сообщение = СтрПромптаВыбораФайла, ткст дефПап = "", ткст дефФайл = "", ткст уайлдкард = СтрДефУйлдкардаВыбораФайла, цел стиль = 0, Точка поз = ДЕФПОЗ)
    {
        this(wxFileDialog_ctor(ВизОбъект.безопУк(родитель), сообщение, дефПап, дефФайл, уайлдкард, cast(бцел)стиль, поз));
    }

    //---------------------------------------------------------------------

    export ткст папка()
    {
        return cast(ткст) new ВизТкст(wxFileDialog_GetDirectory(вхобъ), да);
    }
    export проц папка(ткст значение)
    {
        wxFileDialog_SetDirectory(вхобъ, значение);
    }

    export ткст имяФайла()
    {
        return cast(ткст) new ВизТкст(wxFileDialog_GetFilename(вхобъ), да);
    }
    export проц имяФайла(ткст значение)
    {
        wxFileDialog_SetFilename(вхобъ, значение);
    }

    export ткст путь()
    {
        return cast(ткст) new ВизТкст(wxFileDialog_GetPath(вхобъ), да);
    }
    export проц путь(ткст значение)
    {
        wxFileDialog_SetPath(вхобъ, значение);
    }

    export проц индексФильтра(цел значение)
    {
        wxFileDialog_SetFilterIndex(вхобъ,значение);
    }
    export цел индексФильтра()
    {
        return wxFileDialog_GetFilterIndex(вхобъ);
    }

    export проц сообщение(ткст значение)
    {
        wxFileDialog_SetMessage(вхобъ,значение);
    }
    export ткст сообщение()
    {
        return cast(ткст) new ВизТкст(wxFileDialog_GetMessage(вхобъ), да);
    }

    //---------------------------------------------------------------------

    export override цел покажиМодально()
    {
        return wxFileDialog_ShowModal(вхобъ);
    }

    //---------------------------------------------------------------------

    export ткст уайлдкард()
    {
        return cast(ткст) new ВизТкст(wxFileDialog_GetWildcard(вхобъ), да);
    }
    export проц уайлдкард(ткст значение)
    {
        wxFileDialog_SetWildcard(вхобъ, значение);
    }

    export цел стиль()
    {
        return cast(цел)wxFileDialog_GetStyle(вхобъ);
    }
    export проц стиль(цел значение)
    {
        wxFileDialog_SetStyle(вхобъ, cast(цел)значение);
    }

    //---------------------------------------------------------------------

    export ткст[] пути()
    {
        return (new ТкстМассива(wxFileDialog_GetPaths(вхобъ), да)).вМассив();
    }

    export ткст[] именаФайлов()
    {
        return (new ТкстМассива(wxFileDialog_GetFilenames(вхобъ), да)).вМассив();
    }
}

//! \cond EXTERN
extern (C) ЦелУкз wxFileSelector_func(ткст сообщение, ткст дефПуть, ткст дефИмяф, ткст дефРасш, ткст уайлдкард, цел флаги, ЦелУкз родитель, цел x, цел y);
extern (C) ЦелУкз wxFileSelectorEx_func(ткст сообщение, ткст дефПуть, ткст дефИмяф,цел *индДефРасш, ткст уайлдкард, цел флаги, ЦелУкз родитель, цел x, цел y);
extern (C) ЦелУкз wxLoadFileSelector_func(ткст что, ткст расш, ткст дефИмя, ЦелУкз родитель);
extern (C) ЦелУкз wxSaveFileSelector_func(ткст что, ткст расш, ткст дефИмя, ЦелУкз родитель);
//! \endcond

export ткст выборФайла(
    ткст сообщение = ДиалогФайла.СтрПромптаВыбораФайла,
    ткст дефПуть = пусто,
    ткст дефИмяф = пусто,
    ткст дефРасш = пусто,
    ткст уайлдкард = ДиалогФайла.СтрДефУйлдкардаВыбораФайла,
    цел флаги = 0,
    Окно родитель = пусто, цел x = -1, цел y = -1)
{
    return cast(ткст) new ВизТкст(wxFileSelector_func(
                                         сообщение,
                                         дефПуть,
                                         дефИмяф,
                                         дефРасш,
                                         уайлдкард,
                                         флаги,
                                         ВизОбъект.безопУк(родитель),x,y), да);
}

export ткст выборФайлаДоп(
    ткст сообщение = ДиалогФайла.СтрПромптаВыбораФайла,
    ткст дефПуть = пусто,
    ткст дефИмяф = пусто,
    цел *индДефРасш = пусто,
    ткст уайлдкард = ДиалогФайла.СтрДефУйлдкардаВыбораФайла,
    цел флаги = 0,
    Окно родитель = пусто, цел x = -1, цел y = -1)
{
    return cast(ткст) new ВизТкст(wxFileSelectorEx_func(
                                         сообщение,
                                         дефПуть,
                                         дефИмяф,
                                         индДефРасш,
                                         уайлдкард,
                                         флаги,
                                         ВизОбъект.безопУк(родитель),x,y), да);
}

export ткст загрузиВыборФайла(
    ткст что,
    ткст расш,
    ткст дефИмя = пусто,
    Окно родитель = пусто)
{
    return cast(ткст) new ВизТкст(wxLoadFileSelector_func(
                                         что,
                                         расш,
                                         дефИмя,
                                         ВизОбъект.безопУк(родитель)), да);
}

export ткст сохраниВыборФайла(
    ткст что,
    ткст расш,
    ткст дефИмя = пусто,
    Окно родитель = пусто)
{
    return cast(ткст) new ВизТкст(wxSaveFileSelector_func(
                                         что,
                                         расш,
                                         дефИмя,
                                         ВизОбъект.безопУк(родитель)), да);
}

