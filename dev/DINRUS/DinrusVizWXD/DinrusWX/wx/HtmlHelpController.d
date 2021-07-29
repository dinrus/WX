module wx.HtmlHelpController;
public import wx.common;

public import wx.Config;
public import wx.Frame;

//! \cond EXTERN
extern (C) ЦелУкз wxHtmlHelpController_ctor(цел стиль);
extern (C) проц   wxHtmlHelpController_SetTitleFormat(ЦелУкз сам, ткст format);
extern (C) проц   wxHtmlHelpController_SetTempDir(ЦелУкз сам, ткст путь);
extern (C) бул   wxHtmlHelpController_AddBook(ЦелУкз сам, ткст улрКниги);
extern (C) бул   wxHtmlHelpController_Display(ЦелУкз сам, ткст x);
extern (C) бул   wxHtmlHelpController_DisplayInt(ЦелУкз сам, цел ид);
extern (C) бул   wxHtmlHelpController_DisplayContents(ЦелУкз сам);
extern (C) бул   wxHtmlHelpController_DisplayIndex(ЦелУкз сам);
extern (C) бул   wxHtmlHelpController_KeywordSearch(ЦелУкз сам, ткст кслово, цел режим);
extern (C) проц   wxHtmlHelpController_UseConfig(ЦелУкз сам, ЦелУкз конфиг, ткст рутПуть);
extern (C) проц   wxHtmlHelpController_ReadCustomization(ЦелУкз сам, ЦелУкз кфг, ткст путь);
extern (C) проц   wxHtmlHelpController_WriteCustomization(ЦелУкз сам, ЦелУкз кфг, ткст путь);
extern (C) ЦелУкз wxHtmlHelpController_GetFrame(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------


export class КонтроллерСправкиГЯР : ВизОбъект
{
    enum
    {
        ТУЛБАР =	0x0001,
        СОДЕРЖИМОЕ =	0x0002,
        ИНДЕКС =		0x0004,
        ПОИСК =		0x0008,
        ЗАКЛАДКИ =	0x0010,
        ОТКРЫТЬ_ФАЙЛЫ =	0x0020,
        ПЕЧАТЬ = 		0x0040,
        ПЛОСКИЙ_ТУЛБАР =	0x0080,
        СОВМЕСТИТЬ_КНИГИ =	0x0100,
        ИКОНКИ_КНИГ =	0x0200,
        ИКОНКИ_ГЛАВ_КНИГ = 0x0400,
        ИКОНКИ_ТОМА = 0x0000,
        ДЕФ_СТИЛЬ =		(ТУЛБАР | СОДЕРЖИМОЕ |
                                     ИНДЕКС | ПОИСК |
                                     ЗАКЛАДКИ | ПЕЧАТЬ),
        ОФАЙЛЫ =	ОТКРЫТЬ_ФАЙЛЫ,
        ПТУЛБАР = 	ПЛОСКИЙ_ТУЛБАР,
        ДЕФСТИЛЬ =	ДЕФ_СТИЛЬ,
    }
    //-----------------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(цел стиль = ДЕФ_СТИЛЬ)
    {
        super(wxHtmlHelpController_ctor(стиль));
    }

    //-----------------------------------------------------------------------------

    export проц форматТитула(ткст значение)
    {
        wxHtmlHelpController_SetTitleFormat(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export проц времПапка(ткст значение)
    {
        wxHtmlHelpController_SetTempDir(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export бул добавьКнигу(ткст улрКниги)
    {
        return wxHtmlHelpController_AddBook(вхобъ, улрКниги);
    }

    //-----------------------------------------------------------------------------

    export бул дисплей(ткст x)
    {
        return wxHtmlHelpController_Display(вхобъ, x);
    }

    //-----------------------------------------------------------------------------

    export бул дисплей(цел ид)
    {
        return wxHtmlHelpController_DisplayInt(вхобъ, ид);
    }

    //-----------------------------------------------------------------------------

    export бул показатьСодержимое()
    {
        return wxHtmlHelpController_DisplayContents(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул показатьИндекс()
    {
        return wxHtmlHelpController_DisplayIndex(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул поискКслова(ткст кслово)
    {
        return поискКслова(кслово, ПРежимПоискаСправки.ИскатьВсе);
    }

    export бул поискКслова(ткст кслово, ПРежимПоискаСправки режим)
    {
        return wxHtmlHelpController_KeywordSearch(вхобъ, кслово, cast(цел)режим);
    }

    //-----------------------------------------------------------------------------

    export проц используйКонфиг(Конфиг конфиг)
    {
        используйКонфиг(конфиг, "");
    }

    export проц используйКонфиг(Конфиг конфиг, ткст рутПуть)
    {
        wxHtmlHelpController_UseConfig(вхобъ, ВизОбъект.безопУк(конфиг), рутПуть);
    }

    //-----------------------------------------------------------------------------

    export проц читайКустомизацию(Конфиг кфг)
    {
        читайКустомизацию(кфг, "");
    }

    export проц читайКустомизацию(Конфиг кфг, ткст путь)
    {
        wxHtmlHelpController_ReadCustomization(вхобъ, ВизОбъект.безопУк(кфг), путь);
    }

    //-----------------------------------------------------------------------------

    export проц пишиКустомизацию(Конфиг кфг)
    {
        пишиКустомизацию(кфг, "");
    }

    export проц пишиКустомизацию(Конфиг кфг, ткст путь)
    {
        wxHtmlHelpController_WriteCustomization(вхобъ, ВизОбъект.безопУк(кфг), путь);
    }

    //-----------------------------------------------------------------------------

    export Рамка рамка()
    {
        ЦелУкз tmp = wxHtmlHelpController_GetFrame(вхобъ);
        if ( tmp != ЦелУкз.init )
            return new Рамка(tmp);
        else
            return пусто;
    }
}
