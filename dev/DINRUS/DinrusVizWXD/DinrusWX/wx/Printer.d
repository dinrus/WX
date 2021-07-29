module wx.Printer;
public import wx.common;
public import wx.Window;
public import wx.PrintData;

public enum ПОшибкаПринтера
{
    Нет = 0,
    Отменено,
    Ошибка
}

//! \cond EXTERN
extern (C) ЦелУкз wxPrinter_ctor(ЦелУкз данные);
extern (C) ЦелУкз wxPrinter_CreateAbortWindow(ЦелУкз сам, ЦелУкз родитель, ЦелУкз отпечатка);
extern (C) проц   wxPrinter_ReportError(ЦелУкз сам, ЦелУкз родитель, ЦелУкз отпечатка, ткст сообщение);
extern (C) ЦелУкз wxPrinter_GetPrintDialogData(ЦелУкз сам);
extern (C) бул   wxPrinter_GetAbort(ЦелУкз сам);
extern (C) цел    wxPrinter_GetLastError(ЦелУкз сам);
extern (C) бул   wxPrinter_Setup(ЦелУкз сам, ЦелУкз родитель);
extern (C) бул   wxPrinter_Print(ЦелУкз сам, ЦелУкз родитель, ЦелУкз отпечатка, бул промпт);
extern (C) ЦелУкз wxPrinter_PrintDialog(ЦелУкз сам, ЦелУкз родитель);
//! \endcond

//-----------------------------------------------------------------------------

export class Принтер : ВизОбъект
{
    private this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        this(cast(ДанныеДиалогаПечати)пусто);
    }
    export this(ДанныеДиалогаПечати данные)
    {
        this(wxPrinter_ctor(ВизОбъект.безопУк(данные)));
    }

    //-----------------------------------------------------------------------------

    export Окно создайОкноАборта(Окно родитель, Отпечатка отпечатка)
    {
        return cast(Окно)найдиОбъект(wxPrinter_CreateAbortWindow(вхобъ, ВизОбъект.безопУк(родитель), ВизОбъект.безопУк(отпечатка)), &Окно.Нов);
    }

    //-----------------------------------------------------------------------------

    export проц сообщиОбОшибке(Окно родитель, Отпечатка отпечатка, ткст сообщение)
    {
        wxPrinter_ReportError(вхобъ, ВизОбъект.безопУк(родитель), ВизОбъект.безопУк(отпечатка), сообщение);
    }

    //-----------------------------------------------------------------------------

    export ДанныеДиалогаПечати данныеДиалогаПечати()
    {
        return cast(ДанныеДиалогаПечати)найдиОбъект(wxPrinter_GetPrintDialogData(вхобъ), &ДанныеДиалогаПечати.Нов);
    }

    //-----------------------------------------------------------------------------

    export бул аборт()
    {
        return wxPrinter_GetAbort(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export ПОшибкаПринтера последнОш()
    {
        return cast(ПОшибкаПринтера)wxPrinter_GetLastError(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул настройка(Окно родитель)
    {
        return wxPrinter_Setup(вхобъ, ВизОбъект.безопУк(родитель));
    }

    //-----------------------------------------------------------------------------

    export бул печать(Окно родитель, Отпечатка отпечатка, бул промпт)
    {
        return wxPrinter_Print(вхобъ, ВизОбъект.безопУк(родитель), ВизОбъект.безопУк(отпечатка), промпт);
    }

    //-----------------------------------------------------------------------------

    export КонтекстУстройства диалогПечати(Окно родитель)
    {
        return cast(КонтекстУстройства)найдиОбъект(wxPrinter_PrintDialog(вхобъ, ВизОбъект.безопУк(родитель)), &КонтекстУстройства.Нов);
    }
}


//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C)
{
    alias проц function(Отпечатка объ) Virtual_NoParams;
    alias бул function(Отпечатка объ, цел i) Virtual_ParamsInt;
    alias бул function(Отпечатка объ, цел начСтраница, цел конСтраница) Virtual_OnBeginDocument;
    alias проц function(Отпечатка объ, inout цел минСтраница, inout цел максСтраница, inout цел страницаОтКоторой, inout цел страницаДоКоторой) Virtual_GetPageInfo;
}

extern (C) ЦелУкз wxPrintout_ctor(ткст титул);
extern (C) бул   wxPrintout_OnBeginDocument(ЦелУкз сам, цел начСтраница, цел конСтраница);
extern (C) проц   wxPrintout_OnEndDocument(ЦелУкз сам);
extern (C) проц   wxPrintout_OnBeginPrinting(ЦелУкз сам);
extern (C) проц   wxPrintout_OnEndPrinting(ЦелУкз сам);
extern (C) проц   wxPrintout_OnPreparePrinting(ЦелУкз сам);
extern (C) бул   wxPrintout_HasPage(ЦелУкз сам, цел страница);
extern (C) проц   wxPrintout_GetPageInfo(ЦелУкз сам, inout цел минСтраница, inout цел максСтраница, inout цел страницаОтКоторой, inout цел страницаДоКоторой);
extern (C) ЦелУкз wxPrintout_GetTitle(ЦелУкз сам);
extern (C) ЦелУкз wxPrintout_GetDC(ЦелУкз сам);
extern (C) проц   wxPrintout_SetDC(ЦелУкз сам, ЦелУкз ку);
extern (C) проц   wxPrintout_SetPageSizePixels(ЦелУкз сам, цел w, цел h);
extern (C) проц   wxPrintout_GetPageSizePixels(ЦелУкз сам, inout цел w, inout цел h);
extern (C) проц   wxPrintout_SetPageSizeMM(ЦелУкз сам, цел w, цел h);
extern (C) проц   wxPrintout_GetPageSizeMM(ЦелУкз сам, inout цел w, inout цел h);
extern (C) проц   wxPrintout_SetPPIScreen(ЦелУкз сам, цел x, цел y);
extern (C) проц   wxPrintout_GetPPIScreen(ЦелУкз сам, inout цел x, inout цел y);
extern (C) проц   wxPrintout_SetPPIPrinter(ЦелУкз сам, цел x, цел y);
extern (C) проц   wxPrintout_GetPPIPrinter(ЦелУкз сам, inout цел x, inout цел y);
extern (C) бул   wxPrintout_IsPreview(ЦелУкз сам);
extern (C) проц   wxPrintout_SetIsPreview(ЦелУкз сам, бул p);

extern (C) проц   wxPrintout_RegisterVirtual(ЦелУкз сам, Отпечатка объ, Virtual_OnBeginDocument onBeginDocument, Virtual_NoParams onEndDocument, Virtual_NoParams onBeginPrinting, Virtual_NoParams onEndPrinting, Virtual_NoParams onPreparePrinting, Virtual_ParamsInt hasPage, Virtual_ParamsInt onPrintPage, Virtual_GetPageInfo getPageInfo);
//! \endcond

//-----------------------------------------------------------------------------

export abstract class Отпечатка : ВизОбъект
{
    private this(ЦелУкз вхобъ)
    {
        super(вхобъ);

        wxPrintout_RegisterVirtual(вхобъ,this,
                                   &staticOnBeginDocument,
                                   &staticOnEndDocument,
                                   &staticOnBeginPrinting,
                                   &staticOnEndPrinting,
                                   &staticOnPreparePrinting,
                                   &staticHasPage,
                                   &staticOnPrintPage,
                                   &staticGetPageInfo);
    }

    export this(ткст титул)
    {
        this(wxPrintout_ctor(титул));
    }

//	export static ВизОбъект Нов(ЦелУкз ptr) { return new Отпечатка(ptr); }
    //-----------------------------------------------------------------------------

    static export extern(C) бул staticOnBeginDocument(Отпечатка объ, цел начСтраница, цел конСтраница)
    {
        return объ.приНачалеДокумента(начСтраница, конСтраница);
    }
    export  бул приНачалеДокумента(цел начСтраница, цел конСтраница)
    {
        return wxPrintout_OnBeginDocument(вхобъ, начСтраница, конСтраница);
    }

    static export extern(C) проц staticOnEndDocument(Отпечатка объ)
    {
        объ.приЗавершенииДокумента();
    }
    export  проц приЗавершенииДокумента()
    {
        wxPrintout_OnEndDocument(вхобъ);
    }

    //-----------------------------------------------------------------------------

    static export extern(C) проц staticOnBeginPrinting(Отпечатка объ)
    {
        объ.приНачалеПечатания();
    }
    export  проц приНачалеПечатания()
    {
        wxPrintout_OnBeginPrinting(вхобъ);
    }

    static export extern(C) проц staticOnEndPrinting(Отпечатка объ)
    {
        объ.приЗавершенииПечатания();
    }
    export  проц приЗавершенииПечатания()
    {
        wxPrintout_OnEndPrinting(вхобъ);
    }

    static export extern(C) проц staticOnPreparePrinting(Отпечатка объ)
    {
        объ.приПодготовкеКПечатанию();
    }
    export  проц приПодготовкеКПечатанию()
    {
        wxPrintout_OnPreparePrinting(вхобъ);
    }

    //-----------------------------------------------------------------------------

    static export extern(C) бул staticHasPage(Отпечатка объ, цел страница)
    {
        return объ.естьСтраница(страница);
    }
    export  бул естьСтраница(цел страница)
    {
        return wxPrintout_HasPage(вхобъ, страница);
    }

    //-----------------------------------------------------------------------------

    static export extern(C) бул staticOnPrintPage(Отпечатка объ,цел страница)
    {
        return объ.приПечатиСтраницы(страница);
    }
    export abstract бул приПечатиСтраницы(цел страница);

    //-----------------------------------------------------------------------------

    static export extern(C) проц staticGetPageInfo(Отпечатка объ, inout цел минСтраница, inout цел максСтраница, inout цел страницаОтКоторой, inout цел страницаДоКоторой)
    {
        объ.дайИнфОСтранице(минСтраница, максСтраница, страницаОтКоторой, страницаДоКоторой);
    }
    export  проц дайИнфОСтранице(inout цел минСтраница, inout цел максСтраница, inout цел страницаОтКоторой, inout цел страницаДоКоторой)
    {
        wxPrintout_GetPageInfo(вхобъ, минСтраница, максСтраница, страницаОтКоторой, страницаДоКоторой);
    }

    //-----------------------------------------------------------------------------

    export ткст титул()
    {
        return cast(ткст) new ВизТкст(wxPrintout_GetTitle(вхобъ), да);
    }

    //-----------------------------------------------------------------------------

    export КонтекстУстройства ку()
    {
        return cast(КонтекстУстройства)найдиОбъект(wxPrintout_GetDC(вхобъ), &КонтекстУстройства.Нов);
    }
    export проц ку(КонтекстУстройства значение)
    {
        wxPrintout_SetDC(вхобъ, ВизОбъект.безопУк(значение));
    }

    //-----------------------------------------------------------------------------

    export проц устПикселиРазмераСтраницы(цел w, цел h)
    {
        wxPrintout_SetPageSizePixels(вхобъ, w, h);
    }

    export проц дайПикселиРазмераСтраницы(out цел w, out цел h)
    {
        w = h = 0;
        wxPrintout_GetPageSizePixels(вхобъ, w, h);
    }

    //-----------------------------------------------------------------------------

    export проц устРазмСтраницыКП(цел w, цел h)
    {
        wxPrintout_SetPageSizeMM(вхобъ, w, h);
    }

    export проц дайРазмСтраницыКП(out цел w, out цел h)
    {
        w = h = 0;
        wxPrintout_GetPageSizeMM(вхобъ, w, h);
    }

    //-----------------------------------------------------------------------------

    export проц устПНДЭкрана(цел x, цел y)
    {
        wxPrintout_SetPPIScreen(вхобъ, x, y);
    }

    //-----------------------------------------------------------------------------

    export проц дайПНДЭкрана(out цел x, out цел y)
    {
        x = y = 0;
        wxPrintout_GetPPIScreen(вхобъ, x, y);
    }

    //-----------------------------------------------------------------------------

    export проц устПНДПринтера(цел x, цел y)
    {
        wxPrintout_SetPPIPrinter(вхобъ, x, y);
    }

    //-----------------------------------------------------------------------------

    export проц дайПНДПринтера(out цел x, out цел y)
    {
        x = y = 0;
        wxPrintout_GetPPIPrinter(вхобъ, x, y);
    }

    //-----------------------------------------------------------------------------

    export бул предпросмотр_ли()
    {
        return wxPrintout_IsPreview(вхобъ);
    }
    export проц предпросмотр_ли(бул значение)
    {
        wxPrintout_SetIsPreview(вхобъ, значение);
    }
}

