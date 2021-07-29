module wx.Font;
public import wx.common;
public import wx.GDIObject;

// Шрифт encodings - taken от wx/fontenc.h
// Author: Vadim Zeitlin, (C) Vadim Zeitlin
public enum ПКодировкаШрифта
{
    Система = -1,     // system default
    Дефолт,         // current default кодировка

    // ISO8859 standard defines a число of single-byte charsets
    ISO8859_1,           // West European (Latin1)
    ISO8859_2,           // Central and East European (Latin2)
    ISO8859_3,           // Esperanto (Latin3)
    ISO8859_4,           // Baltic (old) (Latin4)
    ISO8859_5,           // Cyrillic
    ISO8859_6,           // Arabic
    ISO8859_7,           // Greek
    ISO8859_8,           // Hebrew
    ISO8859_9,           // Turkish (Latin5)
    ISO8859_10,          // Variation of Latin4 (Latin6)
    ISO8859_11,          // Thai
    ISO8859_12,          // doesn't exist currently, кноп put it
    // here anyhow до make all ISO8859
    // consecutive numbers
    ISO8859_13,          // Baltic (Latin7)
    ISO8859_14,          // Latin8
    ISO8859_15,          // Latin9 (a.k.a. Latin0, includes euro)
    ISO8859_MAX,

    // Cyrillic гарнитура soup (see http://czyborra.com/charsets/cyrillic.html)
    KOI8,                // we don't support any of KOI8 variants
    ALTERNATIVE,         // same as MS-DOS CP866
    BULGARIAN,           // used under Linux in Bulgaria
    // what would we do without Microsoft? They have their own encodings
    // for DOS
    CP437,               // original MS-DOS codepage
    CP850,               // CP437 merged with Latin1
    CP852,               // CP437 merged with Latin2
    CP855,               // anдругой cyrillic кодировка
    CP866,               // and anдругой one
    // and for Windows
    CP874,               // WinThai
    CP932,               // Japanese (шифт-JIS)
    CP936,               // Chinese simplified (GB)
    CP949,               // Korean (Hangul гарнитура)
    CP950,               // Chinese (traditional - Big5)
    CP1250,              // WinLatin2
    CP1251,              // WinCyrillic
    CP1252,              // WinLatin1
    CP1253,              // WinGreek (8859-7)
    CP1254,              // WinTurkish
    CP1255,              // WinHebrew
    CP1256,              // WinArabic
    CP1257,              // WinBaltic (same as Latin 7)
    CP12_MAX,

    UTF7,                // UTF-7 Unicode кодировка
    UTF8,                // UTF-8 Unicode кодировка

    // Far Eastern encodings
    // Chinese
    GB2312 = CP936,       // Simplified Chinese
    BIG5 = CP950,         // Traditional Chinese

    // Japanese (see http://zsigri.tripod.com/fontboard/cjk/jis.html)
    Shift_JIS = CP932,    // Shift JIS
    EUC_JP,                              // Extended Unix Codepage for Japanese

    UNICODE,         // Unicode - currently used only by
    // wxEncodingConverter class

    Макс
}

public enum ПСемействоШрифтов
{
    // текст шрифт families
    Дефолт    = 70,
    Декоративный,
    Роман,
    Скрипт,
    Швейцарский,
    Модерн,
    Телетайп,
    Макс,

    // Proportional or Fixed ширь fonts (not yet used)
    Переменный   = 80,
    Фиксированный,

    Нормальный     = 90,
    Лёгкий,
    Полужирный,
    // Also Нормальный for normal (non-italic текст)
    Курсивный,
    Слант
}

public enum ПВесШрифта
{
    Нормальный = 90,
    Лёгкий,
    Полужирный,
    Макс
}

public enum ПСтильШрифта
{
    Нормальный = 90,
    Курсивный = 93,
    Слант  = 94,
    Макс
}

public enum ПФлагШрифта
{
    Дефолт          = 0,

    Курсивный           = 1 << 0,
    Слант            = 1 << 1,

    Лёгкий            = 1 << 2,
    Полужирный             = 1 << 3,

    Сглаженный      = 1 << 4,
    Несглаженный  = 1 << 5,

    Подчёркнутый       = 1 << 6,
    Перечёркнутый    = 1 << 7,

    Маска = Курсивный             |
                      Слант              |
                      Лёгкий              |
                      Полужирный               |
                      Сглаженный        |
                      Несглаженный    |
                      Подчёркнутый         |
                      Перечёркнутый
}

//! \cond EXTERN
extern (C)        ЦелУкз wxFont_NORMAL_FONT();
extern (C)        ЦелУкз wxFont_SMALL_FONT();
extern (C)        ЦелУкз wxFont_ITALIC_FONT();
extern (C)        ЦелУкз wxFont_SWISS_FONT();
extern (C) ЦелУкз wxNullFont_Get();

extern (C)        ЦелУкз wxFont_ctorDef();
extern (C)        ЦелУкз wxFont_ctor(цел размТочки, цел семейство, цел стиль, цел вес, бул подчеркни, ткст имяФас, ПКодировкаШрифта кодировка);
extern (C) проц   wxFont_dtor(ЦелУкз сам);
extern (C) бул   wxFont_Ok(ЦелУкз сам);
extern (C) цел    wxFont_GetPointSize(ЦелУкз сам);
extern (C) цел    wxFont_GetFamily(ЦелУкз сам);
extern (C) цел    wxFont_GetStyle(ЦелУкз сам);
extern (C) цел    wxFont_GetWeight(ЦелУкз сам);
extern (C) бул   wxFont_GetUnderlined(ЦелУкз сам);
extern (C) ЦелУкз wxFont_GetFaceName(ЦелУкз сам);
extern (C) цел    wxFont_GetEncoding(ЦелУкз сам);
extern (C)        ЦелУкз wxFont_GetNativeFontInfo(ЦелУкз сам);
extern (C) бул   wxFont_IsFixedWidth(ЦелУкз сам);
extern (C) ЦелУкз wxFont_GetNativeFontInfoDesc(ЦелУкз сам);
extern (C) ЦелУкз wxFont_GetNativeFontInfoUserDesc(ЦелУкз сам);
extern (C) проц   wxFont_SetPointSize(ЦелУкз сам, цел размТочки);
extern (C) проц   wxFont_SetFamily(ЦелУкз сам, цел семейство);
extern (C) проц   wxFont_SetStyle(ЦелУкз сам, цел стиль);
extern (C) проц   wxFont_SetWeight(ЦелУкз сам, цел вес);
extern (C) проц   wxFont_SetFaceName(ЦелУкз сам, ткст имяФас);
extern (C) проц   wxFont_SetUnderlined(ЦелУкз сам, бул underlined);
extern (C) проц   wxFont_SetEncoding(ЦелУкз сам, цел кодировка);
extern (C) проц   wxFont_SetNativeFontInfoUserDesc(ЦелУкз сам, ЦелУкз инфо);
extern (C) ЦелУкз wxFont_GetFamilyString(ЦелУкз сам);
extern (C) ЦелУкз wxFont_GetStyleString(ЦелУкз сам);
extern (C) ЦелУкз wxFont_GetWeightString(ЦелУкз сам);
extern (C) проц   wxFont_SetNoAntiAliasing(ЦелУкз сам, бул no);
extern (C) бул   wxFont_GetNoAntiAliasing(ЦелУкз сам);
extern (C) цел    wxFont_GetDefaultEncoding();
extern (C) проц   wxFont_SetDefaultEncoding(цел кодировка);

extern (C) ЦелУкз wxFont_New(ткст стрОписаниеНативнШрифта);
//! \endcond

//---------------------------------------------------------------------

export class Шрифт : ОбъектИГУ, ИКлонируемый
{
    // in wxWidgets 2.8 fonts are dynamic, and crash if accessed too early
    export static Шрифт Нормальный()
    {
        return new Шрифт(wxFont_NORMAL_FONT());
    }
    export static Шрифт Маленький()
    {
        return new Шрифт(wxFont_SMALL_FONT());
    }
    export static Шрифт Курсивный()
    {
        return new Шрифт(wxFont_ITALIC_FONT());
    }
    export static Шрифт Швейцарский()
    {
        return new Шрифт(wxFont_SWISS_FONT());
    }
    export static Шрифт НуллШрифт;

    /+
    override export проц вымести()
    {
        if (this !== Нормальный
                     &&  this !== Маленький
                                  &&  this !== Курсивный
                                               &&  this !== Швейцарский)
        {
            super.вымести();
        }
    }
    +/
    //---------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(ЦелУкз вхобъ, бул памСобств)
    {
        super(вхобъ);
        this.памСобств = памСобств;
    }

    export this()
    {
        this(wxFont_ctorDef(), да);
    }

    export this(цел размТочки, ПСемействоШрифтов семейство, ПСтильШрифта стиль, ПВесШрифта вес, бул подчеркни = нет, ткст фас = "", ПКодировкаШрифта кодировка = ПКодировкаШрифта.Дефолт)
    {
        this(wxFont_ctor(размТочки, cast(цел)семейство, cast(цел)стиль, cast(цел)вес, подчеркни, фас, кодировка), да);
    }

    ~this()
    {
        вымести();
    }

    //---------------------------------------------------------------------

    export цел размТочки()
    {
        return wxFont_GetPointSize(вхобъ);
    }
    export проц размТочки(цел значение)
    {
        wxFont_SetPointSize(вхобъ, значение);
    }

    export ПСемействоШрифтов семейство()
    {
        return cast(ПСемействоШрифтов)wxFont_GetFamily(вхобъ);
    }
    export проц семейство(ПСемействоШрифтов значение)
    {
        wxFont_SetFamily(вхобъ, cast(цел)значение);
    }

    export ПСтильШрифта стиль()
    {
        return cast(ПСтильШрифта)wxFont_GetStyle(вхобъ);
    }
    export проц стиль(ПСтильШрифта значение)
    {
        wxFont_SetStyle(вхобъ, cast(цел)значение);
    }

    export ПКодировкаШрифта кодировка()
    {
        return cast(ПКодировкаШрифта)wxFont_GetEncoding(вхобъ);
    }
    export проц кодировка(ПКодировкаШрифта значение)
    {
        wxFont_SetEncoding(вхобъ, cast(цел)значение);
    }

    export ПВесШрифта вес()
    {
        return cast(ПВесШрифта)wxFont_GetWeight(вхобъ);
    }
    export проц вес(ПВесШрифта значение)
    {
        wxFont_SetWeight(вхобъ, cast(цел)значение);
    }

    export бул подчёркнут()
    {
        return wxFont_GetUnderlined(вхобъ);
    }
    export проц подчёркнут(бул значение)
    {
        wxFont_SetUnderlined(вхобъ, значение);
    }

    export ткст имяФас()
    {
        return cast(ткст) new ВизТкст(wxFont_GetFaceName(вхобъ), да);
    }
    export проц имяФас(ткст значение)
    {
        wxFont_SetFaceName(вхобъ, значение);
    }

    export ткст ткстСемейства()
    {
        return cast(ткст) new ВизТкст(wxFont_GetFamilyString(вхобъ), да);
    }

    export ткст ткстСтиля()
    {
        return cast(ткст) new ВизТкст(wxFont_GetStyleString(вхобъ), да);
    }

    export ткст ткстВеса()
    {
        return cast(ткст) new ВизТкст(wxFont_GetStyleString(вхобъ), да);
    }

    export бул ширинаФиксирована_ли()
    {
        return wxFont_IsFixedWidth(вхобъ);
    }

    export бул Ок()
    {
        return wxFont_Ok(вхобъ);
    }

    export ЦелУкз инфОНативномШрифте()
    {
        return wxFont_GetNativeFontInfo(вхобъ);
    }

    export ткст инфОНативномШрифтеОписПользователя()
    {
        return cast(ткст) new ВизТкст(wxFont_GetNativeFontInfoUserDesc(вхобъ), да);
    }

    export ткст инфОНативномШрифтеОпис()
    {
        return cast(ткст) new ВизТкст(wxFont_GetNativeFontInfoDesc(вхобъ), да);
    }

    export static Шрифт Нов(ткст стрОписаниеНативнШрифта)
    {
        return new Шрифт(wxFont_New(стрОписаниеНативнШрифта));
    }

    //---------------------------------------------------------------------

    // Implement ИКлонируемый до provide instance copy
    export Объект клонируй()
    {
        return new Шрифт(this);
    }

    // Constructor that copies шрифт passed in
    export this(Шрифт другой)
    {
        this(другой.размТочки,другой.семейство,другой.стиль,другой.вес,другой.подчёркнут,другой.имяФас,другой.кодировка);
    }

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new Шрифт(ptr);
    }
}
