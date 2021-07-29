module wx.Pen;
public import wx.common;
public import wx.Defs;
public import wx.GDIObject;
public import wx.Colour;

//! \cond EXTERN
extern (C) ЦелУкз wxGDIObj_GetRedPen();
extern (C) ЦелУкз wxGDIObj_GetCyanPen();
extern (C) ЦелУкз wxGDIObj_GetGreenPen();
extern (C) ЦелУкз wxGDIObj_GetBlackPen();
extern (C) ЦелУкз wxGDIObj_GetWhitePen();
extern (C) ЦелУкз wxGDIObj_GetTransparentPen();
extern (C) ЦелУкз wxGDIObj_GetBlackDashedPen();
extern (C) ЦелУкз wxGDIObj_GetGreyPen();
extern (C) ЦелУкз wxGDIObj_GetMediumGreyPen();
extern (C) ЦелУкз wxGDIObj_GetLightGreyPen();

extern (C) ЦелУкз wxPen_ctor(ЦелУкз кол, цел ширь, ПСтильЗаливки стиль);
extern (C) ЦелУкз wxPen_ctorByName(ткст имя, цел ширь, ПСтильЗаливки стиль);

extern (C) ЦелУкз wxPen_GetColour(ЦелУкз сам);
extern (C) проц   wxPen_SetColour(ЦелУкз сам, ЦелУкз кол);

extern (C) проц   wxPen_SetWidth(ЦелУкз сам, цел ширь);
extern (C) цел    wxPen_GetWidth(ЦелУкз сам);

extern (C) цел    wxPen_GetCap(ЦелУкз сам);
extern (C) цел    wxPen_GetJoin(ЦелУкз сам);
extern (C) цел    wxPen_GetStyle(ЦелУкз сам);
extern (C) бул   wxPen_Ok(ЦелУкз сам);
extern (C) проц   wxPen_SetCap(ЦелУкз сам, цел capStyle);
extern (C) проц   wxPen_SetJoin(ЦелУкз сам, цел join_style);
extern (C) проц   wxPen_SetStyle(ЦелУкз сам, цел стиль);

//---------------------------------------------------------------------
extern (C) ЦелУкз wxNullPen_Get();
//! \endcond

export class Перо : ОбъектИГУ
{
    public static Перо КРАСНОЕ;
    public static Перо ЦЫАН;
    public static Перо ЗЕЛЁНОЕ;
    public static Перо ЧЁРНОЕ;
    public static Перо БЕЛОЕ;
    public static Перо ПРОЗРАЧНОЕ;
    public static Перо ЧЕРНОЕ_ПУНКТИРНОЕ;
    public static Перо СЕРОЕ;
    public static Перо МЕДИУМ_СЕРОЕ;
    public static Перо СВЕТЛО_СЕРОЕ;
    public static Перо НуллПеро;

    /+
    override export проц вымести()
    {
        if (this !== КРАСНОЕ
                     &&  this !== ЦЫАН
                                  &&  this !== ЗЕЛЁНОЕ
                                               &&  this !== ЧЁРНОЕ
                                                       &&  this !== БЕЛОЕ
                                                               &&  this !== ПРОЗРАЧНОЕ
                                                                       &&  this !== ЧЕРНОЕ_ПУНКТИРНОЕ
                                                                               &&  this !== СЕРОЕ
                                                                                       &&  this !== МЕДИУМ_СЕРОЕ
                                                                                               &&  this !== СВЕТЛО_СЕРОЕ)
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

    export this(ткст имя)
    {
        this(имя, 1, ПСтильЗаливки.Плотная);
    }

    export this(ткст имя, цел ширь)
    {
        this(имя, ширь, ПСтильЗаливки.Плотная);
    }

    export this(ткст имя, цел ширь, ПСтильЗаливки стиль)
    {
        super(wxPen_ctorByName(имя, ширь, стиль));
    }

    export this(Цвет цвет)
    {
        this(цвет, 1, ПСтильЗаливки.Плотная);
    }

    export this(Цвет цвет, цел ширь)
    {
        this(цвет, ширь, ПСтильЗаливки.Плотная);
    }

    export this(Цвет кол, цел ширь, ПСтильЗаливки стиль)
    {
        super(wxPen_ctor(ВизОбъект.безопУк(кол), ширь, стиль));
    }


    //---------------------------------------------------------------------

    export Цвет цвет()
    {
        return cast(Цвет)найдиОбъект(wxPen_GetColour(вхобъ), &Цвет.Нов);
    }
    export проц цвет(Цвет значение)
    {
        wxPen_SetColour(вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    export цел ширь()
    {
        return wxPen_GetWidth(вхобъ);
    }
    export проц ширь(цел значение)
    {
        wxPen_SetWidth(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export цел шапка()
    {
        return wxPen_GetCap(вхобъ);
    }
    export проц шапка(цел значение)
    {
        wxPen_SetCap(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export цел соединение()
    {
        return wxPen_GetJoin(вхобъ);
    }
    export проц соединение(цел значение)
    {
        wxPen_SetJoin(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export цел стиль()
    {
        return wxPen_GetStyle(вхобъ);
    }
    export проц стиль(цел значение)
    {
        wxPen_SetStyle(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export бул Ок()
    {
        return wxPen_Ok(вхобъ);
    }

    static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new Перо(ptr);
    }
}
