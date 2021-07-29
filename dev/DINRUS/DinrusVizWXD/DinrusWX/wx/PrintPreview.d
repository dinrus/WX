module wx.PrintPreview;
public import wx.common;
public import wx.Panel;
public import wx.Frame;
public import wx.ScrolledWindow;
public import wx.PrintData;
public import wx.Printer;

//! \cond EXTERN
extern (C) ЦелУкз wxPrintPreview_ctor(ЦелУкз отпечатка, ЦелУкз отпечаткаДляПечати, ЦелУкз данные);
extern (C) ЦелУкз wxPrintPreview_ctorPrintData(ЦелУкз отпечатка, ЦелУкз отпечаткаДляПечати, ЦелУкз данные);
extern (C) бул   wxPrintPreview_SetCurrentPage(ЦелУкз сам, цел номСтраницы);
extern (C) цел    wxPrintPreview_GetCurrentPage(ЦелУкз сам);
extern (C) проц   wxPrintPreview_SetPrintout(ЦелУкз сам, ЦелУкз отпечатка);
extern (C) ЦелУкз wxPrintPreview_GetPrintout(ЦелУкз сам);
extern (C) ЦелУкз wxPrintPreview_GetPrintoutForPrinting(ЦелУкз сам);
extern (C) проц   wxPrintPreview_SetFrame(ЦелУкз сам, ЦелУкз рамка);
extern (C) проц   wxPrintPreview_SetCanvas(ЦелУкз сам, ЦелУкз канвас);
extern (C) ЦелУкз wxPrintPreview_GetFrame(ЦелУкз сам);
extern (C) ЦелУкз wxPrintPreview_GetCanvas(ЦелУкз сам);
extern (C) бул   wxPrintPreview_PaintPage(ЦелУкз сам, ЦелУкз канвас, ЦелУкз ку);
extern (C) бул   wxPrintPreview_DrawBlankPage(ЦелУкз сам, ЦелУкз канвас, ЦелУкз ку);
extern (C) бул   wxPrintPreview_RenderPage(ЦелУкз сам, цел номСтраницы);
extern (C) ЦелУкз wxPrintPreview_GetPrintDialogData(ЦелУкз сам);
extern (C) проц   wxPrintPreview_SetZoom(ЦелУкз сам, цел percent);
extern (C) цел    wxPrintPreview_GetZoom(ЦелУкз сам);
extern (C) цел    wxPrintPreview_GetMaxPage(ЦелУкз сам);
extern (C) цел    wxPrintPreview_GetMinPage(ЦелУкз сам);
extern (C) бул   wxPrintPreview_Ok(ЦелУкз сам);
extern (C) проц   wxPrintPreview_SetOk(ЦелУкз сам, бул ok);
extern (C) бул   wxPrintPreview_Print(ЦелУкз сам, бул интерактивно);
extern (C) проц   wxPrintPreview_DetermineScaling(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class ПредпросмотрПечати : ВизОбъект
{
    private this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(Отпечатка отпечатка, Отпечатка отпечаткаДляПечати, ДанныеДиалогаПечати данные)
    {
        this(wxPrintPreview_ctor(ВизОбъект.безопУк(отпечатка), ВизОбъект.безопУк(отпечаткаДляПечати), ВизОбъект.безопУк(данные)));
    }

    export this(Отпечатка отпечатка, Отпечатка отпечаткаДляПечати)
    {
        this(отпечатка, отпечаткаДляПечати, cast(ДанныеПечати)пусто);
    }
    export this(Отпечатка отпечатка, Отпечатка отпечаткаДляПечати, ДанныеПечати данные)
    {
        this(wxPrintPreview_ctor(ВизОбъект.безопУк(отпечатка), ВизОбъект.безопУк(отпечаткаДляПечати), ВизОбъект.безопУк(данные)));
    }

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new ПредпросмотрПечати(ptr);
    }
    //-----------------------------------------------------------------------------

    export бул устТекущСтраницу(цел номСтраницы)
    {
        return wxPrintPreview_SetCurrentPage(вхобъ, номСтраницы);
    }

    export цел текущСтраница()
    {
        return wxPrintPreview_GetCurrentPage(вхобъ);
    }
    export проц текущСтраница(цел значение)
    {
        устТекущСтраницу(значение);
    }

    //-----------------------------------------------------------------------------

    export проц отпечатка(Отпечатка значение)
    {
        wxPrintPreview_SetPrintout(вхобъ, ВизОбъект.безопУк(значение));
    }
    export Отпечатка отпечатка()
    {
        return cast(Отпечатка)найдиОбъект(wxPrintPreview_GetPrintout(вхобъ)/*, &Отпечатка.Нов*/);
    }

    //-----------------------------------------------------------------------------

    export Отпечатка отпечаткаДляПечати()
    {
        return cast(Отпечатка)найдиОбъект(wxPrintPreview_GetPrintoutForPrinting(вхобъ)/*, &Отпечатка.Нов*/);
    }

    //-----------------------------------------------------------------------------

    export проц рамка(Рамка значение)
    {
        wxPrintPreview_SetFrame(вхобъ, ВизОбъект.безопУк(значение));
    }
    export Рамка рамка()
    {
        return cast(Рамка)найдиОбъект(wxPrintPreview_GetFrame(вхобъ), &Рамка.Нов);
    }

    //-----------------------------------------------------------------------------

    export Окно канвас()
    {
        return cast(Окно)найдиОбъект(wxPrintPreview_GetCanvas(вхобъ), &Окно.Нов);
    }
    export проц канвас(Окно значение)
    {
        wxPrintPreview_SetCanvas(вхобъ, ВизОбъект.безопУк(значение));
    }

    //-----------------------------------------------------------------------------

    export бул окрасьСтраницу(Окно канвас, inout КонтекстУстройства ку)
    {
        return wxPrintPreview_PaintPage(вхобъ, ВизОбъект.безопУк(канвас), ВизОбъект.безопУк(ку));
    }

    //-----------------------------------------------------------------------------

    export бул нарисуйПустуюСтраницу(Окно канвас, inout КонтекстУстройства ку)
    {
        return wxPrintPreview_DrawBlankPage(вхобъ, ВизОбъект.безопУк(канвас), ВизОбъект.безопУк(ку));
    }

    //-----------------------------------------------------------------------------

    export бул отобразиСтраницу(цел номСтраницы)
    {
        return wxPrintPreview_RenderPage(вхобъ, номСтраницы);
    }

    //-----------------------------------------------------------------------------

    export ДанныеДиалогаПечати данныеДиалогаПечати()
    {
        return cast(ДанныеДиалогаПечати)найдиОбъект(wxPrintPreview_GetPrintDialogData(вхобъ), &ДанныеДиалогаПечати.Нов);
    }

    //-----------------------------------------------------------------------------

    export проц зум(цел значение)
    {
        wxPrintPreview_SetZoom(вхобъ, значение);
    }
    export цел зум()
    {
        return wxPrintPreview_GetZoom(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export цел максСтраница()
    {
        return wxPrintPreview_GetMaxPage(вхобъ);
    }

    export цел минСтраница()
    {
        return wxPrintPreview_GetMinPage(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул Ок()
    {
        return wxPrintPreview_Ok(вхобъ);
    }
    export проц Ок(бул значение)
    {
        wxPrintPreview_SetOk(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export бул печать(бул интерактивно)
    {
        return wxPrintPreview_Print(вхобъ, интерактивно);
    }

    //-----------------------------------------------------------------------------

    export проц определиМасштабирование()
    {
        wxPrintPreview_DetermineScaling(вхобъ);
    }
}

//! \cond EXTERN
extern (C) ЦелУкз wxPreviewFrame_ctor(ЦелУкз предпросмотр, ЦелУкз родитель, ткст титул, inout Точка поз, inout Размер размер, бцел стиль, ткст имя);
extern (C) проц   wxPreviewFrame_Initialize(ЦелУкз сам);
extern (C) проц   wxPreviewFrame_CreateCanvas(ЦелУкз сам);
extern (C) проц   wxPreviewFrame_CreateControlBar(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class РамкаПредпросмотра : Рамка
{
    private this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(ПредпросмотрПечати предпросмотр, Окно родитель, ткст титул = "Предпросмотр Печати", Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = ДЕФ_СТИЛЬ_РАМКИ, ткст имя = "рамка")
    {
        this(wxPreviewFrame_ctor(ВизОбъект.безопУк(предпросмотр), ВизОбъект.безопУк(родитель), титул, поз, размер, cast(бцел)стиль, имя));
    }

    //-----------------------------------------------------------------------------

    export проц иниц()
    {
        wxPreviewFrame_Initialize(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц создайКанвас()
    {
        wxPreviewFrame_CreateCanvas(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц создайКонтролБар()
    {
        wxPreviewFrame_CreateControlBar(вхобъ);
    }
}

//! \cond EXTERN
extern (C) ЦелУкз wxPreviewControlBar_ctor(ЦелУкз предпросмотр, цел buttons, ЦелУкз родитель, inout Точка поз, inout Размер размер, бцел стиль, ткст имя);
extern (C) проц   wxPreviewControlBar_CreateButtons(ЦелУкз сам);
extern (C) проц   wxPreviewControlBar_SetZoomControl(ЦелУкз сам, цел zoom);
extern (C) цел    wxPreviewControlBar_GetZoomControl(ЦелУкз сам);
extern (C) ЦелУкз wxPreviewControlBar_GetPrintPreview(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class КонтролБарПредпросмотра : Панель
{
    const цел ПЕЧАТЬ       =  1;
    const цел ПРЕДЫДУШАЯ    =  2;
    const цел СЛЕДУЮЩАЯ        =  4;
    const цел ЗУМ        =  8;
    const цел ПЕРВАЯ       = 16;
    const цел ПОСЛЕДНЯЯ        = 32;
    const цел ПЕРЕЙТИ_К        = 64;

    const цел ДЕФ_ПРЕДПРОСМОТР     = ПРЕДЫДУШАЯ|СЛЕДУЮЩАЯ|ЗУМ
                                      |ПЕРВАЯ|ПЕРЕЙТИ_К|ПОСЛЕДНЯЯ;

    // Ids for controls
    const цел ПРЕДПРОСМ_ЗАКР      = 1;
    const цел ПРЕДПРОСМ_СЛЕДЩ       = 2;
    const цел ПРЕДПРОСМ_ПРЕДШ   = 3;
    const цел ПРЕДПРОСМ_ПЕЧАТЬ      = 4;
    const цел ПРЕДПРОСМ_ЗУМ       = 5;
    const цел ПРЕДПРОСМ_ПЕРВ      = 6;
    const цел ПРЕДПРОСМ_ПОСЛЕДН       = 7;
    const цел ПРЕДПРОСМ_ПЕРЕЙТИК       = 8;

    private this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(ПредпросмотрПечати предпросмотр, цел buttons, Окно родитель, Точка поз=ДЕФПОЗ, Размер размер=ДЕФРАЗМ, цел стиль=ТАБ_ТРАВЕРЗА, ткст имя="панель")
    {
        this(wxPreviewControlBar_ctor(ВизОбъект.безопУк(предпросмотр), buttons, ВизОбъект.безопУк(родитель), поз, размер, cast(бцел)стиль, имя));
    }

    //-----------------------------------------------------------------------------

    export проц создайКнопки()
    {
        wxPreviewControlBar_CreateButtons(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export цел зумКонтрола()
    {
        return wxPreviewControlBar_GetZoomControl(вхобъ);
    }
    export проц зумКонтрола(цел значение)
    {
        wxPreviewControlBar_SetZoomControl(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export ПредпросмотрПечати предпросмотрПечати()
    {
        return cast(ПредпросмотрПечати)найдиОбъект(wxPreviewControlBar_GetPrintPreview(вхобъ), &ПредпросмотрПечати.Нов);
    }
}

//! \cond EXTERN
extern (C) ЦелУкз wxPreviewCanvas_ctor(ЦелУкз предпросмотр, ЦелУкз родитель, inout Точка поз, inout Размер размер, бцел стиль, ткст имя);
//! \endcond

//-----------------------------------------------------------------------------

export class КанвасПредпросмотра : ОкноСПрокруткой
{
    private this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(ПредпросмотрПечати предпросмотр, Окно родитель, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = 0, ткст имя = "canvas")
    {
        this(wxPreviewCanvas_ctor(ВизОбъект.безопУк(предпросмотр), ВизОбъект.безопУк(родитель), поз, размер, cast(бцел)стиль, имя));
    }
}
