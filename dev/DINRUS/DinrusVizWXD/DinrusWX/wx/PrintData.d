module wx.PrintData;
public import wx.common;

public enum ПРежимПечати
{
    Нет =    0,
    Предпросмотр = 1,   // Preview in external application
    Файл =    2,   // Print до файл
    Принтер = 3    // Send до printer
}

public enum ПКачествоПечати
{
    Высокое    = -1,
    Среднее  = -2,
    Низкое     = -3,
    Черновое   = -4
}

public enum ПРежимДуплекс
{
    Симплекс,
    Горизонтальный,
    Вертикальный
}

public enum ПРазмерБумаги
{
    Нет,               // Use specific dimensions
    LETTER,             // Letter, 8 1/2 by 11 inches
    LEGAL,              // Legal, 8 1/2 by 14 inches
    A4,                 // A4 Sheet, 210 by 297 millimeters
    CSHEET,             // C Sheet, 17 by 22 inches
    DSHEET,             // D Sheet, 22 by 34 inches
    ESHEET,             // E Sheet, 34 by 44 inches
    LETTERSMALL,        // Letter Small, 8 1/2 by 11 inches
    TABLOID,            // Tabloid, 11 by 17 inches
    LEDGER,             // Ledger, 17 by 11 inches
    STATEMENT,          // Statement, 5 1/2 by 8 1/2 inches
    EXECUTIVE,          // Executive, 7 1/4 by 10 1/2 inches
    A3,                 // A3 sheet, 297 by 420 millimeters
    A4SMALL,            // A4 small sheet, 210 by 297 millimeters
    A5,                 // A5 sheet, 148 by 210 millimeters
    B4,                 // B4 sheet, 250 by 354 millimeters
    B5,                 // B5 sheet, 182-by-257-millimeter paper
    FOLIO,              // Folio, 8-1/2-by-13-inch paper
    QUARTO,             // Quarto, 215-by-275-millimeter paper
    Дюйм10х14,              // 10-by-14-inch sheet
    Дюйм11х17,              // 11-by-17-inch sheet
    NOTE,               // Note, 8 1/2 by 11 inches
    ENV_9,              // #9 Envelope, 3 7/8 by 8 7/8 inches
    ENV_10,             // #10 Envelope, 4 1/8 by 9 1/2 inches
    ENV_11,             // #11 Envelope, 4 1/2 by 10 3/8 inches
    ENV_12,             // #12 Envelope, 4 3/4 by 11 inches
    ENV_14,             // #14 Envelope, 5 by 11 1/2 inches
    ENV_DL,             // DL Envelope, 110 by 220 millimeters
    ENV_C5,             // C5 Envelope, 162 by 229 millimeters
    ENV_C3,             // C3 Envelope, 324 by 458 millimeters
    ENV_C4,             // C4 Envelope, 229 by 324 millimeters
    ENV_C6,             // C6 Envelope, 114 by 162 millimeters
    ENV_C65,            // C65 Envelope, 114 by 229 millimeters
    ENV_B4,             // B4 Envelope, 250 by 353 millimeters
    ENV_B5,             // B5 Envelope, 176 by 250 millimeters
    ENV_B6,             // B6 Envelope, 176 by 125 millimeters
    ENV_ITALY,          // Italy Envelope, 110 by 230 millimeters
    ENV_MONARCH,        // Monarch Envelope, 3 7/8 by 7 1/2 inches
    ENV_PERSONAL,       // 6 3/4 Envelope, 3 5/8 by 6 1/2 inches
    FANFOLD_US,         // US Std Fanfold, 14 7/8 by 11 inches
    FANFOLD_STD_GERMAN, // German Std Fanfold, 8 1/2 by 12 inches
    FANFOLD_LGL_GERMAN, // German Legal Fanfold, 8 1/2 by 13 inches

    ISO_B4,             // B4 (ISO) 250 x 353 mm
    JAPANESE_POSTCARD,  // Japanese Postcard 100 x 148 mm
    Дюйм9х11,               // 9 x 11 in
    Дюйм10х11,              // 10 x 11 in
    Дюйм15х11,              // 15 x 11 in
    ENV_INVITE,         // Envelope Invite 220 x 220 mm
    LETTER_EXTRA,       // Letter Extra 9 \275 x 12 in
    LEGAL_EXTRA,        // Legal Extra 9 \275 x 15 in
    TABLOID_EXTRA,      // Tabloid Extra 11.69 x 18 in
    A4_EXTRA,           // A4 Extra 9.27 x 12.69 in
    LETTER_TRANSVERSE,  // Letter Transverse 8 \275 x 11 in
    A4_TRANSVERSE,      // A4 Transverse 210 x 297 mm
    LETTER_EXTRA_TRANSVERSE, // Letter Extra Transverse 9\275 x 12 in
    A_PLUS,             // SuperA/SuperA/A4 227 x 356 mm
    B_PLUS,             // SuperB/SuperB/A3 305 x 487 mm
    LETTER_PLUS,        // Letter Plus 8.5 x 12.69 in
    A4_PLUS,            // A4 Plus 210 x 330 mm
    A5_TRANSVERSE,      // A5 Transverse 148 x 210 mm
    B5_TRANSVERSE,      // B5 (JIS) Transverse 182 x 257 mm
    A3_EXTRA,           // A3 Extra 322 x 445 mm
    A5_EXTRA,           // A5 Extra 174 x 235 mm
    B5_EXTRA,           // B5 (ISO) Extra 201 x 276 mm
    A2,                 // A2 420 x 594 mm
    A3_TRANSVERSE,      // A3 Transverse 297 x 420 mm
    A3_EXTRA_TRANSVERSE // A3 Extra Transverse 322 x 445 mm
}

//! \cond EXTERN
extern (C) ЦелУкз wxPageSetupDialogData_ctor();
extern (C) ЦелУкз wxPageSetupDialogData_ctorPrintSetup(ЦелУкз данныеДиалога);
extern (C) ЦелУкз wxPageSetupDialogData_ctorPrintData(ЦелУкз данныеПечати);
extern (C) проц wxPageSetupDialogData_GetPaperSize(ЦелУкз сам, inout Размер размер);
extern (C) цел wxPageSetupDialogData_GetPaperId(ЦелУкз сам);
extern (C) проц wxPageSetupDialogData_GetMinMarginTopLeft(ЦелУкз сам, inout Точка тчк);
extern (C) проц wxPageSetupDialogData_GetMinMarginBottomRight(ЦелУкз сам, inout Точка тчк);
extern (C) проц wxPageSetupDialogData_GetMarginTopLeft(ЦелУкз сам, inout Точка тчк);
extern (C) проц wxPageSetupDialogData_GetMarginBottomRight(ЦелУкз сам, inout Точка тчк);
extern (C) бул wxPageSetupDialogData_GetDefaultMinMargins(ЦелУкз сам);
extern (C) бул wxPageSetupDialogData_GetEnableMargins(ЦелУкз сам);
extern (C) бул wxPageSetupDialogData_GetEnableOrientation(ЦелУкз сам);
extern (C) бул wxPageSetupDialogData_GetEnablePaper(ЦелУкз сам);
extern (C) бул wxPageSetupDialogData_GetEnablePrinter(ЦелУкз сам);
extern (C) бул wxPageSetupDialogData_GetDefaultInfo(ЦелУкз сам);
extern (C) бул wxPageSetupDialogData_GetEnableHelp(ЦелУкз сам);
extern (C) бул wxPageSetupDialogData_Ok(ЦелУкз сам);
extern (C) проц wxPageSetupDialogData_SetPaperSize(ЦелУкз сам, inout Размер рм);
extern (C) проц wxPageSetupDialogData_SetPaperId(ЦелУкз сам, цел ид);
extern (C) проц wxPageSetupDialogData_SetPaperSize(ЦелУкз сам, цел ид);
extern (C) проц wxPageSetupDialogData_SetMinMarginTopLeft(ЦелУкз сам, inout Точка тчк);
extern (C) проц wxPageSetupDialogData_SetMinMarginBottomRight(ЦелУкз сам, inout Точка тчк);
extern (C) проц wxPageSetupDialogData_SetMarginTopLeft(ЦелУкз сам, inout Точка тчк);
extern (C) проц wxPageSetupDialogData_SetMarginBottomRight(ЦелУкз сам, inout Точка тчк);
extern (C) проц wxPageSetupDialogData_SetDefaultMinMargins(ЦелУкз сам, бул флаг);
extern (C) проц wxPageSetupDialogData_SetDefaultInfo(ЦелУкз сам, бул флаг);
extern (C) проц wxPageSetupDialogData_EnableMargins(ЦелУкз сам, бул флаг);
extern (C) проц wxPageSetupDialogData_EnableOrientation(ЦелУкз сам, бул флаг);
extern (C) проц wxPageSetupDialogData_EnablePaper(ЦелУкз сам, бул флаг);
extern (C) проц wxPageSetupDialogData_EnablePrinter(ЦелУкз сам, бул флаг);
extern (C) проц wxPageSetupDialogData_EnableHelp(ЦелУкз сам, бул флаг);
extern (C) проц wxPageSetupDialogData_CalculateIdFromPaperSize(ЦелУкз сам);
extern (C) проц wxPageSetupDialogData_CalculatePaperSizeFromId(ЦелУкз сам);
extern (C) ЦелУкз wxPageSetupDialogData_GetPrintData(ЦелУкз сам);
extern (C) проц wxPageSetupDialogData_SetPrintData(ЦелУкз сам, ЦелУкз данныеПечати);
//! \endcond

//-----------------------------------------------------------------------------

export class ДанныеДиалогаНастройкиСтраницы : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        this(wxPageSetupDialogData_ctor());
    }
    export  this(ДанныеДиалогаНастройкиСтраницы данныеДиалога)
    {
        this(wxPageSetupDialogData_ctorPrintSetup(ВизОбъект.безопУк(данныеДиалога)));
    }
    export  this(ДанныеПечати данныеПечати)
    {
        this(wxPageSetupDialogData_ctorPrintData(ВизОбъект.безопУк(данныеПечати)));
    }

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new ДанныеДиалогаНастройкиСтраницы(ptr);
    }
    //-----------------------------------------------------------------------------

    export Размер размерБумаги()
    {
        Размер размер;
        wxPageSetupDialogData_GetPaperSize(вхобъ, размер);
        return размер;
    }
    export проц размерБумаги(Размер значение)
    {
        wxPageSetupDialogData_SetPaperSize(вхобъ, значение);
    }

    export ПРазмерБумаги идБумаги()
    {
        return cast(ПРазмерБумаги)wxPageSetupDialogData_GetPaperId(вхобъ);
    }
    export проц идБумаги(ПРазмерБумаги значение)
    {
        wxPageSetupDialogData_SetPaperId(вхобъ, cast(цел)значение);
    }

    //-----------------------------------------------------------------------------

    export Точка минМаржинВерхЛево()
    {
        Точка тчк;
        wxPageSetupDialogData_GetMinMarginTopLeft(вхобъ, тчк);
        return тчк;
    }
    export проц минМаржинВерхЛево(Точка значение)
    {
        wxPageSetupDialogData_SetMinMarginTopLeft(вхобъ, значение);
    }

    export Точка минМаржинНизПраво()
    {
        Точка тчк;
        wxPageSetupDialogData_GetMinMarginBottomRight(вхобъ, тчк);
        return тчк;
    }
    export проц минМаржинНизПраво(Точка значение)
    {
        wxPageSetupDialogData_SetMinMarginBottomRight(вхобъ, значение);
    }

    export Точка маржинВерхЛево()
    {
        Точка тчк;
        wxPageSetupDialogData_GetMarginTopLeft(вхобъ, тчк);
        return тчк;
    }
    export проц маржинВерхЛево(Точка значение)
    {
        wxPageSetupDialogData_SetMarginTopLeft(вхобъ, значение);
    }

    export Точка маржинНизПраво()
    {
        Точка тчк;
        wxPageSetupDialogData_GetMarginBottomRight(вхобъ, тчк);
        return тчк;
    }
    export проц маржинНизПраво(Точка значение)
    {
        wxPageSetupDialogData_SetMarginBottomRight(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export бул дефМинМаржины()
    {
        return wxPageSetupDialogData_GetDefaultMinMargins(вхобъ);
    }
    export проц дефМинМаржины(бул значение)
    {
        wxPageSetupDialogData_SetDefaultMinMargins(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export бул вклОриентацию()
    {
        return wxPageSetupDialogData_GetEnableOrientation(вхобъ);
    }
    export проц вклОриентацию(бул значение)
    {
        wxPageSetupDialogData_EnableOrientation(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export бул вклБумагу()
    {
        return wxPageSetupDialogData_GetEnablePaper(вхобъ);
    }
    export проц вклБумагу(бул значение)
    {
        wxPageSetupDialogData_EnablePaper(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export бул вклПринтер()
    {
        return wxPageSetupDialogData_GetEnablePrinter(вхобъ);
    }
    export проц вклПринтер(бул значение)
    {
        wxPageSetupDialogData_EnablePrinter(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export бул дефИнфо()
    {
        return wxPageSetupDialogData_GetDefaultInfo(вхобъ);
    }
    export проц дефИнфо(бул значение)
    {
        wxPageSetupDialogData_SetDefaultInfo(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export бул вклСправку()
    {
        return wxPageSetupDialogData_GetEnableHelp(вхобъ);
    }
    export проц вклСправку(бул значение)
    {
        wxPageSetupDialogData_EnableHelp(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export бул Ок()
    {
        return wxPageSetupDialogData_Ok(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул вклМаржины()
    {
        return wxPageSetupDialogData_GetEnableMargins(вхобъ);
    }
    export проц вклМаржины(бул значение)
    {
        wxPageSetupDialogData_EnableMargins(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export проц вычислиидИзРазмераБумаги()
    {
        wxPageSetupDialogData_CalculateIdFromPaperSize(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц вычислиРазмерБумагиИзид()
    {
        wxPageSetupDialogData_CalculatePaperSizeFromId(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export ДанныеПечати данныеПечати()
    {
        return cast(ДанныеПечати)найдиОбъект(wxPageSetupDialogData_GetPrintData(вхобъ), &ДанныеПечати.Нов);
    }
    export проц данныеПечати(ДанныеПечати значение)
    {
        wxPageSetupDialogData_SetPrintData(вхобъ, ВизОбъект.безопУк(значение));
    }

    //-----------------------------------------------------------------------------
    /+
    export static implicit operator ДанныеДиалогаНастройкиСтраницы (ДанныеПечати данные)
    {
        return new this(данные);
    }
    +/
}

//! \cond EXTERN
extern (C) ЦелУкз wxPrintDialogData_ctor();
extern (C) ЦелУкз wxPrintDialogData_ctorDialogData(ЦелУкз данныеДиалога);
extern (C) ЦелУкз wxPrintDialogData_ctorPrintData(ЦелУкз данныеПечати);
extern (C) цел wxPrintDialogData_GetFromPage(ЦелУкз сам);
extern (C) цел wxPrintDialogData_GetToPage(ЦелУкз сам);
extern (C) цел wxPrintDialogData_GetMinPage(ЦелУкз сам);
extern (C) цел wxPrintDialogData_GetMaxPage(ЦелУкз сам);
extern (C) цел wxPrintDialogData_GetNoCopies(ЦелУкз сам);
extern (C) бул wxPrintDialogData_GetAllPages(ЦелУкз сам);
extern (C) бул wxPrintDialogData_GetSelection(ЦелУкз сам);
extern (C) бул wxPrintDialogData_GetCollate(ЦелУкз сам);
extern (C) бул wxPrintDialogData_GetPrintToFile(ЦелУкз сам);
extern (C) бул wxPrintDialogData_GetSetupDialog(ЦелУкз сам);
extern (C) проц wxPrintDialogData_SetFromPage(ЦелУкз сам, цел v);
extern (C) проц wxPrintDialogData_SetToPage(ЦелУкз сам, цел v);
extern (C) проц wxPrintDialogData_SetMinPage(ЦелУкз сам, цел v);
extern (C) проц wxPrintDialogData_SetMaxPage(ЦелУкз сам, цел v);
extern (C) проц wxPrintDialogData_SetNoCopies(ЦелУкз сам, цел v);
extern (C) проц wxPrintDialogData_SetAllPages(ЦелУкз сам, бул флаг);
extern (C) проц wxPrintDialogData_SetSelection(ЦелУкз сам, бул флаг);
extern (C) проц wxPrintDialogData_SetCollate(ЦелУкз сам, бул флаг);
extern (C) проц wxPrintDialogData_SetPrintToFile(ЦелУкз сам, бул флаг);
extern (C) проц wxPrintDialogData_SetSetupDialog(ЦелУкз сам, бул флаг);
extern (C) проц wxPrintDialogData_EnablePrintToFile(ЦелУкз сам, бул флаг);
extern (C) проц wxPrintDialogData_EnableSelection(ЦелУкз сам, бул флаг);
extern (C) проц wxPrintDialogData_EnablePageNumbers(ЦелУкз сам, бул флаг);
extern (C) проц wxPrintDialogData_EnableHelp(ЦелУкз сам, бул флаг);
extern (C) бул wxPrintDialogData_GetEnablePrintToFile(ЦелУкз сам);
extern (C) бул wxPrintDialogData_GetEnableSelection(ЦелУкз сам);
extern (C) бул wxPrintDialogData_GetEnablePageNumbers(ЦелУкз сам);
extern (C) бул wxPrintDialogData_GetEnableHelp(ЦелУкз сам);
extern (C) бул wxPrintDialogData_Ok(ЦелУкз сам);
extern (C) ЦелУкз wxPrintDialogData_GetPrintData(ЦелУкз сам);
extern (C) проц wxPrintDialogData_SetPrintData(ЦелУкз сам, ЦелУкз данныеПечати);
//! \endcond

export class ДанныеДиалогаПечати : ВизОбъект
{
    //-----------------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        this(wxPrintDialogData_ctor());
    }
    export this(ДанныеДиалогаПечати данныеДиалога)
    {
        this(wxPrintDialogData_ctorDialogData(ВизОбъект.безопУк(данныеДиалога)));
    }
    export this(ДанныеПечати данныеПечати)
    {
        this(wxPrintDialogData_ctorPrintData(ВизОбъект.безопУк(данныеПечати)));
    }
    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new ДанныеДиалогаПечати(ptr);
    }

    //-----------------------------------------------------------------------------

    export цел соСтраницы()
    {
        return wxPrintDialogData_GetFromPage(вхобъ);
    }
    export проц соСтраницы(цел значение)
    {
        wxPrintDialogData_SetFromPage(вхобъ, значение);
    }

    export цел вСтраницу()
    {
        return wxPrintDialogData_GetToPage(вхобъ);
    }
    export проц вСтраницу(цел значение)
    {
        wxPrintDialogData_SetToPage(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export цел минСтраница()
    {
        return wxPrintDialogData_GetMinPage(вхобъ);
    }
    export проц минСтраница(цел значение)
    {
        wxPrintDialogData_SetMinPage(вхобъ, значение);
    }

    export цел максСтраница()
    {
        return wxPrintDialogData_GetMaxPage(вхобъ);
    }
    export проц максСтраница(цел значение)
    {
        wxPrintDialogData_SetMaxPage(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export цел безКопий()
    {
        return wxPrintDialogData_GetNoCopies(вхобъ);
    }
    export проц безКопий(цел значение)
    {
        wxPrintDialogData_SetNoCopies(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export бул всеСтраницы()
    {
        return wxPrintDialogData_GetAllPages(вхобъ);
    }
    export проц всеСтраницы(бул значение)
    {
        wxPrintDialogData_SetAllPages(вхобъ, значение);
    }

    export бул выделение()
    {
        return wxPrintDialogData_GetSelection(вхобъ);
    }
    export проц выделение(бул значение)
    {
        wxPrintDialogData_SetSelection(вхобъ, значение);
    }

    export бул коллируй()
    {
        return wxPrintDialogData_GetCollate(вхобъ);
    }
    export проц коллируй(бул значение)
    {
        wxPrintDialogData_SetCollate(вхобъ, значение);
    }

    export бул печатьВФайл()
    {
        return wxPrintDialogData_GetPrintToFile(вхобъ);
    }
    export проц печатьВФайл(бул значение)
    {
        wxPrintDialogData_SetPrintToFile(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export бул диалогНастройки()
    {
        return wxPrintDialogData_GetSetupDialog(вхобъ);
    }
    export проц диалогНастройки(бул значение)
    {
        wxPrintDialogData_SetSetupDialog(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export проц вклПечатьВФайл(бул значение)
    {
        wxPrintDialogData_EnablePrintToFile(вхобъ, значение);
    }
    export бул вклПечатьВФайл()
    {
        return wxPrintDialogData_GetEnablePrintToFile(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц вклВыделение(бул значение)
    {
        wxPrintDialogData_EnableSelection(вхобъ, значение);
    }
    export бул вклВыделение()
    {
        return wxPrintDialogData_GetEnableSelection(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц вклНомераСтраниц(бул значение)
    {
        wxPrintDialogData_EnablePageNumbers(вхобъ, значение);
    }
    export бул вклНомераСтраниц()
    {
        return wxPrintDialogData_GetEnablePageNumbers(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц вклСправку(бул значение)
    {
        wxPrintDialogData_EnableHelp(вхобъ, значение);
    }
    export бул вклСправку()
    {
        return wxPrintDialogData_GetEnableHelp(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул Ок()
    {
        return wxPrintDialogData_Ok(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export ДанныеПечати данныеПечати()
    {
        return cast(ДанныеПечати)найдиОбъект(wxPrintDialogData_GetPrintData(вхобъ), &ДанныеПечати.Нов);
    }
    export проц данныеПечати(ДанныеПечати значение)
    {
        wxPrintDialogData_SetPrintData(вхобъ, ВизОбъект.безопУк(значение));
    }
}

//! \cond EXTERN
extern (C) ЦелУкз wxPrintData_ctor();
extern (C) ЦелУкз wxPrintData_ctorPrintData(ЦелУкз данныеПечати);
extern (C) цел wxPrintData_GetNoCopies(ЦелУкз сам);
extern (C) бул wxPrintData_GetCollate(ЦелУкз сам);
extern (C) цел wxPrintData_GetOrientation(ЦелУкз сам);
extern (C) бул wxPrintData_Ok(ЦелУкз сам);
extern (C) ЦелУкз wxPrintData_GetPrinterName(ЦелУкз сам);
extern (C) бул wxPrintData_GetColour(ЦелУкз сам);
extern (C) цел wxPrintData_GetDuplex(ЦелУкз сам);
extern (C) цел wxPrintData_GetPaperId(ЦелУкз сам);
extern (C) проц wxPrintData_GetPaperSize(ЦелУкз сам, inout Размер рм);
extern (C) цел wxPrintData_GetQuality(ЦелУкз сам);
extern (C) проц wxPrintData_SetNoCopies(ЦелУкз сам, цел v);
extern (C) проц wxPrintData_SetCollate(ЦелУкз сам, бул флаг);
extern (C) проц wxPrintData_SetOrientation(ЦелУкз сам, цел ориент);
extern (C) проц wxPrintData_SetPrinterName(ЦелУкз сам, ткст имя);
extern (C) проц wxPrintData_SetColour(ЦелУкз сам, бул цвет);
extern (C) проц wxPrintData_SetDuplex(ЦелУкз сам, цел duplex);
extern (C) проц wxPrintData_SetPaperId(ЦелУкз сам, цел sizeId);
extern (C) проц wxPrintData_SetPaperSize(ЦелУкз сам, inout Размер рм);
extern (C) проц wxPrintData_SetQuality(ЦелУкз сам, цел quality);
extern (C) ЦелУкз wxPrintData_GetPrinterCommand(ЦелУкз сам);
extern (C) ЦелУкз wxPrintData_GetPrinterOptions(ЦелУкз сам);
extern (C) ЦелУкз wxPrintData_GetPreviewCommand(ЦелУкз сам);
extern (C) ЦелУкз wxPrintData_GetFilename(ЦелУкз сам);
extern (C) ЦелУкз wxPrintData_GetFontMetricPath(ЦелУкз сам);
extern (C) дво wxPrintData_GetPrinterScaleX(ЦелУкз сам);
extern (C) дво wxPrintData_GetPrinterScaleY(ЦелУкз сам);
extern (C) цел wxPrintData_GetPrinterTranslateX(ЦелУкз сам);
extern (C) цел wxPrintData_GetPrinterTranslateY(ЦелУкз сам);
extern (C) цел wxPrintData_GetPrintMode(ЦелУкз сам);
extern (C) проц wxPrintData_SetPrinterCommand(ЦелУкз сам, ткст command);
extern (C) проц wxPrintData_SetPrinterOptions(ЦелУкз сам, ткст options);
extern (C) проц wxPrintData_SetPreviewCommand(ЦелУкз сам, ткст command);
extern (C) проц wxPrintData_SetFilename(ЦелУкз сам, ткст имяф);
extern (C) проц wxPrintData_SetFontMetricPath(ЦелУкз сам, ткст путь);
extern (C) проц wxPrintData_SetPrinterScaleX(ЦелУкз сам, дво x);
extern (C) проц wxPrintData_SetPrinterScaleY(ЦелУкз сам, дво y);
extern (C) проц wxPrintData_SetPrinterScaling(ЦелУкз сам, дво x, дво y);
extern (C) проц wxPrintData_SetPrinterTranslateX(ЦелУкз сам, цел x);
extern (C) проц wxPrintData_SetPrinterTranslateY(ЦелУкз сам, цел y);
extern (C) проц wxPrintData_SetPrinterTranslation(ЦелУкз сам, цел x, цел y);
extern (C) проц wxPrintData_SetPrintMode(ЦелУкз сам, цел printMode);
//! \endcond

//-----------------------------------------------------------------------------


export class ДанныеПечати : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        this(wxPrintData_ctor());
    }
    export this(ДанныеПечати данныеПечати)
    {
        this(wxPrintData_ctorPrintData(ВизОбъект.безопУк(данныеПечати)));
    }

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new ДанныеПечати(ptr);
    }

    //-----------------------------------------------------------------------------

    export цел безКопий()
    {
        return wxPrintData_GetNoCopies(вхобъ);
    }
    export проц безКопий(цел значение)
    {
        wxPrintData_SetNoCopies(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export бул коллируй()
    {
        return wxPrintData_GetCollate(вхобъ);
    }
    export проц коллируй(бул значение)
    {
        wxPrintData_SetCollate(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export цел ориентация()
    {
        return wxPrintData_GetOrientation(вхобъ);
    }
    export проц ориентация(цел значение)
    {
        wxPrintData_SetOrientation(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export бул Ок()
    {
        return wxPrintData_Ok(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export ткст имяПринтера()
    {
        return cast(ткст) new ВизТкст(wxPrintData_GetPrinterName(вхобъ), да);
    }
    export проц имяПринтера(ткст значение)
    {
        wxPrintData_SetPrinterName(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export бул цвет()
    {
        return wxPrintData_GetColour(вхобъ);
    }
    export проц цвет(бул значение)
    {
        wxPrintData_SetColour(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export ПРежимДуплекс дуплекс()
    {
        return cast(ПРежимДуплекс)wxPrintData_GetDuplex(вхобъ);
    }
    export проц дуплекс(ПРежимДуплекс значение)
    {
        wxPrintData_SetDuplex(вхобъ, cast(цел)значение);
    }

    //-----------------------------------------------------------------------------

    export ПРазмерБумаги идБумаги()
    {
        return cast(ПРазмерБумаги)wxPrintData_GetPaperId(вхобъ);
    }
    export проц идБумаги(ПРазмерБумаги значение)
    {
        wxPrintData_SetPaperId(вхобъ, cast(цел)значение);
    }

    //-----------------------------------------------------------------------------

    export Размер размерБумаги()
    {
        Размер рм;
        wxPrintData_GetPaperSize(вхобъ, рм);
        return рм;
    }
    export проц размерБумаги(Размер значение)
    {
        wxPrintData_SetPaperSize(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export ПКачествоПечати качество()
    {
        return cast(ПКачествоПечати)wxPrintData_GetQuality(вхобъ);
    }
    export проц качество(ПКачествоПечати значение)
    {
        wxPrintData_SetQuality(вхобъ, cast(цел)значение);
    }

    //-----------------------------------------------------------------------------

    export ткст командаПринтера()
    {
        return cast(ткст) new ВизТкст(wxPrintData_GetPrinterCommand(вхобъ), да);
    }
    export проц командаПринтера(ткст значение)
    {
        wxPrintData_SetPrinterCommand(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export ткст опцииПринтера()
    {
        return cast(ткст) new ВизТкст(wxPrintData_GetPrinterOptions(вхобъ), да);
    }
    export проц опцииПринтера(ткст значение)
    {
        wxPrintData_SetPrinterOptions(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export ткст командаПредпросмотра()
    {
        return cast(ткст) new ВизТкст(wxPrintData_GetPreviewCommand(вхобъ), да);
    }
    export проц командаПредпросмотра(ткст значение)
    {
        wxPrintData_SetPreviewCommand(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export ткст имяФайла()
    {
        return cast(ткст) new ВизТкст(wxPrintData_GetFilename(вхобъ), да);
    }
    export проц имяФайла(ткст значение)
    {
        wxPrintData_SetFilename(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export ткст путьМетрикиШрифта()
    {
        return cast(ткст) new ВизТкст(wxPrintData_GetFontMetricPath(вхобъ), да);
    }
    export проц путьМетрикиШрифта(ткст значение)
    {
        wxPrintData_SetFontMetricPath(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export дво масштабХПринтера()
    {
        return wxPrintData_GetPrinterScaleX(вхобъ);
    }
    export проц масштабХПринтера(дво значение)
    {
        wxPrintData_SetPrinterScaleX(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export дво масштабУПринтера()
    {
        return wxPrintData_GetPrinterScaleY(вхобъ);
    }
    export проц масштабУПринтера(дво значение)
    {
        wxPrintData_SetPrinterScaleY(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export цел транслХПринтера()
    {
        return wxPrintData_GetPrinterTranslateX(вхобъ);
    }
    export проц транслХПринтера(цел значение)
    {
        wxPrintData_SetPrinterTranslateX(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export цел транслУПринтера()
    {
        return wxPrintData_GetPrinterTranslateY(вхобъ);
    }
    export проц транслУПринтера(цел значение)
    {
        wxPrintData_SetPrinterTranslateY(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export ПРежимПечати режимПечати()
    {
        return cast(ПРежимПечати)wxPrintData_GetPrintMode(вхобъ);
    }
    export проц режимПечати(ПРежимПечати значение)
    {
        wxPrintData_SetPrintMode(вхобъ, cast(цел)значение);
    }

    //-----------------------------------------------------------------------------

    export проц устМасштабированиеПринтера(дво x, дво y)
    {
        wxPrintData_SetPrinterScaling(вхобъ, x, y);
    }

    //-----------------------------------------------------------------------------

    export проц устТрансляциюПринтера(цел x, цел y)
    {
        wxPrintData_SetPrinterTranslation(вхобъ, x, y);
    }
}

