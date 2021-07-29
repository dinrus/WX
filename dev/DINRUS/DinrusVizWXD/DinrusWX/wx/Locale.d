module wx.Locale;
public import wx.common;
public import wx.Font;

public enum ПЯзык
{
    Дефолт,
    UNKNOWN,

    ABKHAZIAN,
    AFAR,
    AFRIKAANS,
    ALBANIAN,
    AMHARIC,
    ARABIC,
    ARABIC_ALGERIA,
    ARABIC_BAHRAIN,
    ARABIC_EGYPT,
    ARABIC_IRAQ,
    ARABIC_JORDAN,
    ARABIC_KUWAIT,
    ARABIC_LEBANON,
    ARABIC_LIBYA,
    ARABIC_MOROCCO,
    ARABIC_OMAN,
    ARABIC_QATAR,
    ARABIC_SAUDI_ARABIA,
    ARABIC_SUDAN,
    ARABIC_SYRIA,
    ARABIC_TUNISIA,
    ARABIC_UAE,
    ARABIC_YEMEN,
    ARMENIAN,
    ASSAMESE,
    AYMARA,
    AZERI,
    AZERI_CYRILLIC,
    AZERI_LATIN,
    BASHKIR,
    BASQUE,
    BELARUSIAN,
    BENGALI,
    BHUTANI,
    BIHARI,
    BISLAMA,
    BRETON,
    BULGARIAN,
    BURMESE,
    CAMBODIAN,
    CATALAN,
    CHINESE,
    CHINESE_SIMPLIFIED,
    CHINESE_TRADITIONAL,
    CHINESE_HONGKONG,
    CHINESE_MACAU,
    CHINESE_SINGAPORE,
    CHINESE_TAIWAN,
    CORSICAN,
    CROATIAN,
    CZECH,
    DANISH,
    DUTCH,
    DUTCH_BELGIAN,
    ENGLISH,
    ENGLISH_UK,
    ENGLISH_US,
    ENGLISH_AUSTRALIA,
    ENGLISH_BELIZE,
    ENGLISH_BOTSWANA,
    ENGLISH_CANADA,
    ENGLISH_CARIBBEAN,
    ENGLISH_DENMARK,
    ENGLISH_EIRE,
    ENGLISH_JAMAICA,
    ENGLISH_NEW_ZEALAND,
    ENGLISH_PHILIPPINES,
    ENGLISH_SOUTH_AFRICA,
    ENGLISH_TRINIDAD,
    ENGLISH_ZIMBABWE,
    ESPERANTO,
    ESTONIAN,
    FAEROESE,
    FARSI,
    FIJI,
    FINNISH,
    FRENCH,
    FRENCH_BELGIAN,
    FRENCH_CANADIAN,
    FRENCH_LUXEMBOURG,
    FRENCH_MONACO,
    FRENCH_SWISS,
    FRISIAN,
    GALICIAN,
    GEORGIAN,
    GERMAN,
    GERMAN_AUSTRIAN,
    GERMAN_BELGIUM,
    GERMAN_LIECHTENSTEIN,
    GERMAN_LUXEMBOURG,
    GERMAN_SWISS,
    GREEK,
    GREENLANDIC,
    GUARANI,
    GUJARATI,
    HAUSA,
    HEBREW,
    HINDI,
    HUNGARIAN,
    ICELANDIC,
    INDONESIAN,
    INTERLINGUA,
    INTERLINGUE,
    INUKTITUT,
    INUPIAK,
    IRISH,
    ITALIAN,
    ITALIAN_SWISS,
    JAPANESE,
    JAVANESE,
    KANNADA,
    KASHMIRI,
    KASHMIRI_INDIA,
    KAZAKH,
    KERNEWEK,
    KINYARWANDA,
    KIRGHIZ,
    KIRUNDI,
    KONKANI,
    KOREAN,
    KURDISH,
    LAOTHIAN,
    LATIN,
    LATVIAN,
    LINGALA,
    LITHUANIAN,
    MACEDONIAN,
    MALAGASY,
    MALAY,
    MALAYALAM,
    MALAY_BRUNEI_DARUSSALAM,
    MALAY_MALAYSIA,
    MALTESE,
    MANIPURI,
    MAORI,
    MARATHI,
    MOLDAVIAN,
    MONGOLIAN,
    NAURU,
    NEPALI,
    NEPALI_INDIA,
    NORWEGIAN_BOKMAL,
    NORWEGIAN_NYNORSK,
    OCCITAN,
    ORIYA,
    OROMO,
    PASHTO,
    POLISH,
    PORTUGUESE,
    PORTUGUESE_BRAZILIAN,
    PUNJABI,
    QUECHUA,
    RHAETO_ROMANCE,
    ROMANIAN,
    RUSSIAN,
    RUSSIAN_UKRAINE,
    SAMOAN,
    SANGHO,
    SANSKRIT,
    SCOTS_GAELIC,
    SERBIAN,
    SERBIAN_CYRILLIC,
    SERBIAN_LATIN,
    SERBO_CROATIAN,
    SESOTHO,
    SETSWANA,
    SHONA,
    SINDHI,
    SINHALESE,
    SISWATI,
    SLOVAK,
    SLOVENIAN,
    SOMALI,
    SPANISH,
    SPANISH_ARGENTINA,
    SPANISH_BOLIVIA,
    SPANISH_CHILE,
    SPANISH_COLOMBIA,
    SPANISH_COSTA_RICA,
    SPANISH_DOMINICAN_REPUBLIC,
    SPANISH_ECUADOR,
    SPANISH_EL_SALVADOR,
    SPANISH_GUATEMALA,
    SPANISH_HONDURAS,
    SPANISH_MEXICAN,
    SPANISH_MODERN,
    SPANISH_NICARAGUA,
    SPANISH_PANAMA,
    SPANISH_PARAGUAY,
    SPANISH_PERU,
    SPANISH_PUERTO_RICO,
    SPANISH_URUGUAY,
    SPANISH_US,
    SPANISH_VENEZUELA,
    SUNDANESE,
    SWAHILI,
    SWEDISH,
    SWEDISH_FINLAND,
    TAGALOG,
    TAJIK,
    TAMIL,
    TATAR,
    TELUGU,
    THAI,
    TIBETAN,
    TIGRINYA,
    TONGA,
    TSONGA,
    TURKISH,
    TURKMEN,
    TWI,
    UIGHUR,
    UKRAINIAN,
    URDU,
    URDU_INDIA,
    URDU_PAKISTAN,
    UZBEK,
    UZBEK_CYRILLIC,
    UZBEK_LATIN,
    VIETNAMESE,
    VOLAPUK,
    WELSH,
    WOLOF,
    XHOSA,
    YIDDISH,
    YORUBA,
    ZHUANG,
    ZULU,

    USER_DEFINED
}

//-----------------------------------------------------------------------------

public enum ПЛокальКатегория
{
    Число,
    Дата,
    Деньги,
    Макс
}

//-----------------------------------------------------------------------------

public enum ПИнфОЛокале
{
    РазделитТысяч,
    ДесятичнТчк
}

//-----------------------------------------------------------------------------

public enum ПИницФлагиЛокали
{
    ЗагрузитьДефолт  = 0x0001,
    КонвКодировку = 0x0002
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxLanguageInfo_ctor();
extern (C) проц   wxLanguageInfo_dtor(ЦелУкз сам);
extern (C) проц   wxLanguageInfo_SetLanguage(ЦелУкз сам, цел значение);
extern (C) цел    wxLanguageInfo_GetLanguage(ЦелУкз сам);
extern (C) проц   wxLanguageInfo_SetCanonicalName(ЦелУкз сам, ткст имя);
extern (C) ЦелУкз wxLanguageInfo_GetCanonicalName(ЦелУкз сам);
extern (C) проц   wxLanguageInfo_SetDescription(ЦелУкз сам, ткст имя);
extern (C) ЦелУкз wxLanguageInfo_GetDescription(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class ИнфОЯзыке : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    private this(ЦелУкз вхобъ, бул памСобств)
    {
        super(вхобъ);
        this.памСобств = памСобств;
    }

    export this()
    {
        this(wxLanguageInfo_ctor(), да);
    }


    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new ИнфОЯзыке(ptr);
    }
    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxLanguageInfo_dtor(вхобъ);
    }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
    //---------------------------------------------------------------------

    export цел язык()
    {
        return wxLanguageInfo_GetLanguage(вхобъ);
    }
    export проц язык(цел значение)
    {
        wxLanguageInfo_SetLanguage(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export ткст канонИмя()
    {
        return cast(ткст) new ВизТкст(wxLanguageInfo_GetCanonicalName(вхобъ), да);
    }
    export проц канонИмя(ткст значение)
    {
        wxLanguageInfo_SetCanonicalName(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export ткст описание()
    {
        return cast(ткст) new ВизТкст(wxLanguageInfo_GetDescription(вхобъ), да);
    }
    export проц описание(ткст значение)
    {
        wxLanguageInfo_SetDescription(вхобъ, значение);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxLocale_ctor();
extern (C) ЦелУкз wxLocale_ctor2(цел язык, цел флаги);
extern (C) проц   wxLocale_dtor(ЦелУкз сам);
extern (C) бул   wxLocale_Init(ЦелУкз сам, цел язык, цел флаги);
extern (C) бул   wxLocale_AddCatalog(ЦелУкз сам, ткст стрДомен);
extern (C) бул   wxLocale_AddCatalog2(ЦелУкз сам, ткст стрДомен, цел языкидаСооб, ткст гарнитураидаСооб);
extern (C) проц   wxLocale_AddCatalogLookupPathPrefix(ЦелУкз сам, ткст префикс);
extern (C) проц   wxLocale_AddLanguage(ЦелУкз инфо);
extern (C) ЦелУкз wxLocale_FindLanguageInfo(ткст локаль);
extern (C) ЦелУкз wxLocale_GetCanonicalName(ЦелУкз сам);
extern (C) цел    wxLocale_GetLanguage(ЦелУкз сам);
extern (C) ЦелУкз wxLocale_GetLanguageInfo(цел яз);
extern (C) ЦелУкз wxLocale_GetLanguageName(цел яз);
extern (C) ЦелУкз wxLocale_GetLocale(ЦелУкз сам);
extern (C) ЦелУкз wxLocale_GetName(ЦелУкз сам);
extern (C) ЦелУкз wxLocale_GetString(ЦелУкз сам, ткст стрОриг, ткст стрДомен);
extern (C) ЦелУкз wxLocale_GetHeaderValue(ЦелУкз сам, ткст стрЗаг, ткст стрДомен);
extern (C) ЦелУкз wxLocale_GetSysName(ЦелУкз сам);
extern (C) цел    wxLocale_GetSystemEncoding();
extern (C) ЦелУкз wxLocale_GetSystemEncodingName();
extern (C) цел    wxLocale_GetSystemLanguage();
extern (C) бул   wxLocale_IsLoaded(ЦелУкз сам, ткст домен);
extern (C) бул   wxLocale_IsOk(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------


export class Локаль : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    private this(ЦелУкз вхобъ, бул памСобств)
    {
        super(вхобъ);
        this.памСобств = памСобств;
    }

    export this()
    {
        this(wxLocale_ctor(), да);
    }

    export this(цел язык)
    {
        this(язык, ПИницФлагиЛокали.ЗагрузитьДефолт | ПИницФлагиЛокали.КонвКодировку);
    }

    export this(цел язык, ПИницФлагиЛокали флаги)
    {
        this(wxLocale_ctor2(язык, cast(цел)флаги), да);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxLocale_dtor(вхобъ);
    }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
    //-----------------------------------------------------------------------------

    export бул иниц()
    {
        return иниц(ПЯзык.Дефолт, ПИницФлагиЛокали.ЗагрузитьДефолт | ПИницФлагиЛокали.КонвКодировку);
    }

    export бул иниц(ПЯзык язык)
    {
        return иниц(язык,  ПИницФлагиЛокали.ЗагрузитьДефолт | ПИницФлагиЛокали.КонвКодировку);
    }

    export бул иниц(ПЯзык язык, ПИницФлагиЛокали флаги)
    {
        return wxLocale_Init(вхобъ, cast(цел)язык, cast(цел)флаги);
    }

    //-----------------------------------------------------------------------------

    export бул добавьКаталог(ткст стрДомен)
    {
        return wxLocale_AddCatalog(вхобъ, стрДомен);
    }

    export бул добавьКаталог(ткст стрДомен, ПЯзык языкидаСооб, ткст гарнитураидаСооб)
    {
        return wxLocale_AddCatalog2(вхобъ, стрДомен, cast(цел)языкидаСооб, гарнитураидаСооб);
    }

    //-----------------------------------------------------------------------------

    export проц добавьПрефиксПутиПоискаКаталога(ткст префикс)
    {
        wxLocale_AddCatalogLookupPathPrefix(вхобъ, префикс);
    }

    //-----------------------------------------------------------------------------

    export static проц добавьЯзык(ИнфОЯзыке инфо)
    {
        wxLocale_AddLanguage(ВизОбъект.безопУк(инфо));
    }

    //-----------------------------------------------------------------------------

    export static ИнфОЯзыке найдиИнфОЯзыке(ткст локаль)
    {
        return cast(ИнфОЯзыке)найдиОбъект(wxLocale_FindLanguageInfo(локаль), &ИнфОЯзыке.Нов);
    }

    //-----------------------------------------------------------------------------

    export ткст канонИмя()
    {
        return cast(ткст) new ВизТкст(wxLocale_GetCanonicalName(вхобъ), да);
    }

    //-----------------------------------------------------------------------------

    export ПЯзык язык()
    {
        return cast(ПЯзык)wxLocale_GetLanguage(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export static ИнфОЯзыке дайИнфОЯзыке(ПЯзык яз)
    {
        return cast(ИнфОЯзыке)найдиОбъект(wxLocale_GetLanguageInfo(cast(цел)яз), &ИнфОЯзыке.Нов);
    }

    //-----------------------------------------------------------------------------

    export static ткст дайИмяЯзыка(ПЯзык яз)
    {
        return cast(ткст) new ВизТкст(wxLocale_GetLanguageName(cast(цел)яз), да);
    }

    //-----------------------------------------------------------------------------

    export ткст дайЛокаль()
    {
        return cast(ткст) new ВизТкст(wxLocale_GetLocale(вхобъ), да);
    }

    //-----------------------------------------------------------------------------

    export ткст имя()
    {
        return cast(ткст) new ВизТкст(wxLocale_GetName(вхобъ), да);
    }

    //-----------------------------------------------------------------------------

    export ткст дайТкст(ткст стрОриг)
    {
        return дайТкст(стрОриг, пусто);
    }

    export ткст дайТкст(ткст стрОриг, ткст стрДомен)
    {
        return cast(ткст) new ВизТкст(wxLocale_GetString(вхобъ, стрОриг, стрДомен), да);
    }

    //-----------------------------------------------------------------------------

    export ткст дайЗначениеЗаголовка(ткст стрЗаг)
    {
        return дайЗначениеЗаголовка(стрЗаг, пусто);
    }

    export ткст дайЗначениеЗаголовка(ткст стрЗаг, ткст стрДомен)
    {
        return cast(ткст) new ВизТкст(wxLocale_GetHeaderValue(вхобъ, стрЗаг, стрДомен), да);
    }

    //-----------------------------------------------------------------------------

    export ткст сисИмя()
    {
        return cast(ткст) new ВизТкст(wxLocale_GetSysName(вхобъ), да);
    }

    //-----------------------------------------------------------------------------

    static ПКодировкаШрифта сисКодировка()
    {
        return cast(ПКодировкаШрифта)wxLocale_GetSystemEncoding();
    }

    //-----------------------------------------------------------------------------

    static ткст имяСисКодировки()
    {
        return cast(ткст) new ВизТкст(wxLocale_GetSystemEncodingName(), да);
    }

    //-----------------------------------------------------------------------------

    static ПЯзык сисЯзык()
    {
        return cast(ПЯзык)wxLocale_GetSystemLanguage();
    }

    //-----------------------------------------------------------------------------

    export бул загружен(ткст домен)
    {
        return wxLocale_IsLoaded(вхобъ, домен);
    }

    //-----------------------------------------------------------------------------

    export бул Ок()
    {
        return wxLocale_IsOk(вхобъ);
    }
}
