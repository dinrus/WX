module wx.GdiCommon;
public import wx.common;
public import wx.Bitmap;
public import wx.Cursor;
public import wx.Icon;
public import wx.Pen;
public import wx.Brush;
public import wx.Font;
public import wx.Colour;

//! \cond EXTERN
extern (C) ЦелУкз wxSTANDARD_CURSOR_Get();
extern (C) ЦелУкз wxHOURGLASS_CURSOR_Get();
extern (C) ЦелУкз wxCROSS_CURSOR_Get();

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

extern (C) ЦелУкз wxBLUE_BRUSH_Get();
extern (C) ЦелУкз wxGREEN_BRUSH_Get();
extern (C) ЦелУкз wxWHITE_BRUSH_Get();
extern (C) ЦелУкз wxBLACK_BRUSH_Get();
extern (C) ЦелУкз wxGREY_BRUSH_Get();
extern (C) ЦелУкз wxMEDIUM_GREY_BRUSH_Get();
extern (C) ЦелУкз wxLIGHT_GREY_BRUSH_Get();
extern (C) ЦелУкз wxTRANSPARENT_BRUSH_Get();
extern (C) ЦелУкз wxCYAN_BRUSH_Get();
extern (C) ЦелУкз wxRED_BRUSH_Get();

extern (C) ЦелУкз wxNullBitmap_Get();
extern (C) ЦелУкз wxNullIcon_Get();
extern (C) ЦелУкз wxNullCursor_Get();
extern (C) ЦелУкз wxNullPen_Get();
extern (C) ЦелУкз wxNullBrush_Get();
extern (C) ЦелУкз wxNullPalette_Get();
extern (C) ЦелУкз wxNullFont_Get();
extern (C) ЦелУкз wxNullColour_Get();
//! \endcond


проц иницСтокОбъекты()
{
    Курсор.СТАНДАРТНЫЙ = new Курсор(wxSTANDARD_CURSOR_Get());
    Курсор.ПЕСОЧНЫЕ_ЧАСЫ = new Курсор(wxHOURGLASS_CURSOR_Get());
    Курсор.КРЕСТ = new Курсор(wxCROSS_CURSOR_Get());

    Перо.КРАСНОЕ = new Перо(wxGDIObj_GetRedPen());
    Перо.ЦЫАН = new Перо(wxGDIObj_GetCyanPen());
    Перо.ЗЕЛЁНОЕ = new Перо(wxGDIObj_GetGreenPen());
    Перо.ЧЁРНОЕ = new Перо(wxGDIObj_GetBlackPen());
    Перо.БЕЛОЕ = new Перо(wxGDIObj_GetWhitePen());
    Перо.ПРОЗРАЧНОЕ = new Перо(wxGDIObj_GetTransparentPen());
    Перо.ЧЕРНОЕ_ПУНКТИРНОЕ = new Перо(wxGDIObj_GetBlackDashedPen());
    Перо.СЕРОЕ = new Перо(wxGDIObj_GetGreyPen());
    Перо.МЕДИУМ_СЕРОЕ = new Перо(wxGDIObj_GetMediumGreyPen());
    Перо.СВЕТЛО_СЕРОЕ = new Перо(wxGDIObj_GetLightGreyPen());

    Кисть.СИНЯЯ = new Кисть(wxBLUE_BRUSH_Get());
    Кисть.ЗЕЛЁНАЯ = new Кисть(wxGREEN_BRUSH_Get());
    Кисть.БЕЛАЯ = new Кисть(wxWHITE_BRUSH_Get());
    Кисть.ЧЁРНАЯ = new Кисть(wxBLACK_BRUSH_Get());
    Кисть.СЕРАЯ = new Кисть(wxGREY_BRUSH_Get());
    Кисть.МЕДИУМ_СЕРАЯ = new Кисть(wxMEDIUM_GREY_BRUSH_Get());
    Кисть.СВЕТЛО_СЕРАЯ = new Кисть(wxLIGHT_GREY_BRUSH_Get());
    Кисть.ПРОЗРАЧНАЯ = new Кисть(wxTRANSPARENT_BRUSH_Get());
    Кисть.ЦЫАН = new Кисть(wxCYAN_BRUSH_Get());
    Кисть.КРАСНАЯ = new Кисть(wxRED_BRUSH_Get());

    Цвет.ЧЁРНЫЙ       = new Цвет("Black");
    Цвет.БЕЛЫЙ       = new Цвет("White");
    Цвет.КРАСНЫЙ         = new Цвет("красный");
    Цвет.СИНИЙ        = new Цвет("синий");
    Цвет.ЗЕЛЁНЫЙ       = new Цвет("зелёный");
    Цвет.ЦЫАН        = new Цвет("Cyan");
    Цвет.СВЕТЛО_СЕРЫЙ  = new Цвет("Light Gray");

    Битмап.НуллБитмап = new Битмап(wxNullBitmap_Get());
    Пиктограмма.НуллИконка = new Пиктограмма(wxNullIcon_Get());
    Курсор.НуллКурсор = new Курсор(wxNullCursor_Get());
    Перо.НуллПеро = new Перо(wxNullPen_Get());
    Кисть.НуллКисть = new Кисть(wxNullBrush_Get());
    Палитра.НуллПалитра = new Палитра(wxNullPalette_Get());
    Шрифт.НуллШрифт = new Шрифт(wxNullFont_Get());
    Цвет.НуллЦвет = new Цвет(wxNullColour_Get());
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxColourDatabase_ctor();
extern (C) проц wxColourDataBase_dtor(ЦелУкз сам);
extern (C) ЦелУкз wxColourDatabase_Find(ЦелУкз сам, ткст имя);
extern (C) ЦелУкз wxColourDatabase_FindName(ЦелУкз сам, ЦелУкз цвет);
extern (C) проц wxColourDatabase_AddColour(ЦелУкз сам, ткст имя, ЦелУкз цвет);
//! \endcond

//-----------------------------------------------------------------------------

export class БазаДанныхЦветов : ВизОбъект
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
        this(wxColourDatabase_ctor(), да);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxColourDataBase_dtor(вхобъ);
    }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
    //-----------------------------------------------------------------------------

    export Цвет найди(ткст имя)
    {
        return new Цвет(wxColourDatabase_Find(вхобъ, имя), да);
    }

    //-----------------------------------------------------------------------------

    export ткст найдиИмя(Цвет цвет)
    {
        return cast(ткст) new ВизТкст(wxColourDatabase_FindName(вхобъ, ВизОбъект.безопУк(цвет)), да);
    }

    //-----------------------------------------------------------------------------

    export проц добавьЦвет(ткст имя, Цвет цвет)
    {
        wxColourDatabase_AddColour(вхобъ, имя, ВизОбъект.безопУк(цвет));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxPenList_ctor();
//extern (C) проц wxPenList_AddPen(ЦелУкз сам, ЦелУкз перо);
//extern (C) проц wxPenList_RemovePen(ЦелУкз сам, ЦелУкз перо);
extern (C) ЦелУкз wxPenList_FindOrCreatePen(ЦелУкз сам, ЦелУкз цвет, цел ширь, цел стиль);
//! \endcond

//-----------------------------------------------------------------------------

export class СписокПерьев : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxPenList_ctor());
    }

    //-----------------------------------------------------------------------------
    /+
    export проц AddPen(Перо перо)
    {
        wxPenList_AddPen(вхобъ, ВизОбъект.безопУк(перо));
    }
    +/
    //-----------------------------------------------------------------------------
    /+
    export проц RemovePen(Перо перо)
    {
        wxPenList_RemovePen(вхобъ, ВизОбъект.безопУк(перо));
    }
    +/
    //-----------------------------------------------------------------------------

    export Перо найдиИлиСоздайПеро(Цвет цвет, цел ширь, цел стиль)
    {
        return new Перо(wxPenList_FindOrCreatePen(вхобъ, ВизОбъект.безопУк(цвет), ширь, стиль));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxBrushList_ctor();
//extern (C) проц wxBrushList_AddBrush(ЦелУкз сам, ЦелУкз кисть);
//extern (C) проц wxBrushList_RemoveBrush(ЦелУкз сам, ЦелУкз кисть);
extern (C) ЦелУкз wxBrushList_FindOrCreateBrush(ЦелУкз сам, ЦелУкз цвет, цел стиль);
//! \endcond

//-----------------------------------------------------------------------------

export class СписокКистей : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxBrushList_ctor());
    }

    //-----------------------------------------------------------------------------
    /+
    export проц добавьКисть(Кисть кисть)
    {
        wxBrushList_AddBrush(вхобъ, ВизОбъект.безопУк(кисть));
    }

    //-----------------------------------------------------------------------------

    export проц удалиКисть(Кисть кисть)
    {
        wxBrushList_RemoveBrush(вхобъ, ВизОбъект.безопУк(кисть));
    }
    +/
    //-----------------------------------------------------------------------------

    export Кисть найдиИлиСоздайКисть(Цвет цвет, цел стиль)
    {
        return new Кисть(wxBrushList_FindOrCreateBrush(вхобъ, ВизОбъект.безопУк(цвет), стиль));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxFontList_ctor();
//extern (C) проц wxFontList_AddFont(ЦелУкз сам, ЦелУкз шрифт);
//extern (C) проц wxFontList_RemoveFont(ЦелУкз сам, ЦелУкз шрифт);
extern (C) ЦелУкз wxFontList_FindOrCreateFont(ЦелУкз сам,
        цел размТочки,
        цел семейство,
        цел стиль,
        цел вес,
        бул подчеркни,
        ткст фас,
        ПКодировкаШрифта кодировка);
//! \endcond

//-----------------------------------------------------------------------------

export class СписокШрифтов : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxFontList_ctor());
    }

    //-----------------------------------------------------------------------------
    /+
    export проц добавьШрифт(Шрифт шрифт)
    {
        wxFontList_AddFont(вхобъ, ВизОбъект.безопУк(шрифт));
    }

    //-----------------------------------------------------------------------------

    export проц удалиШрифт(Шрифт шрифт)
    {
        wxFontList_RemoveFont(вхобъ, ВизОбъект.безопУк(шрифт));
    }
    +/
    //-----------------------------------------------------------------------------

    export Шрифт найдиИлиСоздайШрифт(цел размТочки, цел семейство, цел стиль, цел вес)
    {
        return найдиИлиСоздайШрифт(размТочки, семейство, стиль, вес, нет, "", ПКодировкаШрифта.Дефолт);
    }

    export Шрифт найдиИлиСоздайШрифт(цел размТочки, цел семейство, цел стиль, цел вес, бул подчеркни)
    {
        return найдиИлиСоздайШрифт(размТочки, семейство, стиль, вес, подчеркни, "", ПКодировкаШрифта.Дефолт);
    }

    export Шрифт найдиИлиСоздайШрифт(цел размТочки, цел семейство, цел стиль, цел вес, бул подчеркни, ткст фас)
    {
        return найдиИлиСоздайШрифт(размТочки, семейство, стиль, вес, подчеркни, фас, ПКодировкаШрифта.Дефолт);
    }


    export Шрифт найдиИлиСоздайШрифт(цел размТочки, цел семейство, цел стиль, цел вес, бул подчеркни, ткст фас, ПКодировкаШрифта кодировка)
    {
        return new Шрифт(wxFontList_FindOrCreateFont(вхобъ, размТочки, семейство, стиль, вес, подчеркни, фас, кодировка));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxBitmapList_ctor();
extern (C) проц   wxBitmapList_AddBitmap(ЦелУкз сам, ЦелУкз битмап);
extern (C) проц   wxBitmapList_RemoveBitmap(ЦелУкз сам, ЦелУкз битмап);
//! \endcond

//-----------------------------------------------------------------------------

export class СписокБитмапов : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxBitmapList_ctor());
    }

    //-----------------------------------------------------------------------------

    export проц добавьБитмап(Битмап битмап)
    {
        wxBitmapList_AddBitmap(вхобъ, ВизОбъект.безопУк(битмап));
    }

    //-----------------------------------------------------------------------------

    export проц удалиБитмап(Битмап битмап)
    {
        wxBitmapList_RemoveBitmap(вхобъ, ВизОбъект.безопУк(битмап));
    }
}

//-----------------------------------------------------------------------------
