module wx.Brush;
public import wx.common;
public import wx.Bitmap;

//! \cond EXTERN
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

extern (C) ЦелУкз wxBrush_ctor();
extern (C) бул   wxBrush_Ok(ЦелУкз сам);
extern (C) ПСтильЗаливки wxBrush_GetStyle(ЦелУкз сам);
extern (C) проц   wxBrush_SetStyle(ЦелУкз сам, ПСтильЗаливки стиль);
extern (C) ЦелУкз wxBrush_GetStipple(ЦелУкз сам);
extern (C) проц   wxBrush_SetStipple(ЦелУкз сам, ЦелУкз stipple);
extern (C) ЦелУкз wxBrush_GetColour(ЦелУкз сам);
extern (C) проц   wxBrush_SetColour(ЦелУкз сам, ЦелУкз кол);
//! \endcond

//---------------------------------------------------------------------

export class Кисть : ОбъектИГУ
{
    public static Кисть СИНЯЯ;
    public static Кисть ЗЕЛЁНАЯ;
    public static Кисть БЕЛАЯ;
    public static Кисть ЧЁРНАЯ;
    public static Кисть СЕРАЯ;
    public static Кисть МЕДИУМ_СЕРАЯ;
    public static Кисть СВЕТЛО_СЕРАЯ;
    public static Кисть ПРОЗРАЧНАЯ;
    public static Кисть ЦЫАН;
    public static Кисть КРАСНАЯ;
    public static Кисть НуллКисть;
/+
static this()
{

СИНЯЯ = cast(Кисть) wxBLUE_BRUSH_Get();
ЗЕЛЁНАЯ = cast(Кисть) wxGREEN_BRUSH_Get();
БЕЛАЯ = cast(Кисть) wxWHITE_BRUSH_Get();
ЧЁРНАЯ = cast(Кисть) wxBLACK_BRUSH_Get();
СЕРАЯ = cast(Кисть) wxGREY_BRUSH_Get();
МЕДИУМ_СЕРАЯ = cast(Кисть) wxMEDIUM_GREY_BRUSH_Get();
СВЕТЛО_СЕРАЯ = cast(Кисть) wxLIGHT_GREY_BRUSH_Get();
ПРОЗРАЧНАЯ = cast(Кисть) wxTRANSPARENT_BRUSH_Get();
ЦЫАН = cast(Кисть) wxCYAN_BRUSH_Get();
КРАСНАЯ = cast(Кисть) wxRED_BRUSH_Get();

}

export static Кисть синяя(){return this.СИНЯЯ;}
export static  Кисть зелёная(){return this.ЗЕЛЁНАЯ;}
export static  Кисть белая(){return this.БЕЛАЯ;}
export static  Кисть чёрная(){return this.ЧЁРНАЯ;}
export static  Кисть серая(){return this.СЕРАЯ;}
export static  Кисть среднеСерая(){return this.МЕДИУМ_СЕРАЯ;}
export  static Кисть светлоСерая(){return this.СВЕТЛО_СЕРАЯ;}
export static  Кисть прозрачная(){return this.ПРОЗРАЧНАЯ;}
export static  Кисть цыан(){return this.ЦЫАН;}
export static  Кисть красная(){return this.КРАСНАЯ;}
+/
    export this()
    {
        this(wxBrush_ctor());
    }

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(Цвет цвет)
    {
        this(цвет, ПСтильЗаливки.Плотная);
    }

    export this(Цвет цвет, ПСтильЗаливки стиль)
    {
        this();
        this.цвет = цвет;
        this.стиль = стиль;
    }

    export this(Битмап стиплБмп)
    {
        this();
        this.пунктир = стиплБмп;
    }

    export this(ткст имя)
    {
        this(имя, ПСтильЗаливки.Плотная);
    }

    export this(ткст имя, ПСтильЗаливки стиль)
    {
        this();
        this.цвет = new Цвет(имя);
        this.стиль = стиль;
    }

    //---------------------------------------------------------------------

    export бул Ок()
    {
        return wxBrush_Ok(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

    export ПСтильЗаливки стиль()
    {
        return wxBrush_GetStyle(вхобъ);
    }
    export проц стиль(ПСтильЗаливки значение)
    {
        wxBrush_SetStyle(this.м_вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export Битмап пунктир()
    {
        return cast(Битмап)найдиОбъект(wxBrush_GetStipple(this.м_вхобъ), &Битмап.Нов);
    }
    export проц пунктир(Битмап значение)
    {
        wxBrush_SetStipple(вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    export Цвет цвет()
    {
        return new Цвет(wxBrush_GetColour(this.м_вхобъ), да);
    }
    export проц цвет(Цвет значение)
    {
        wxBrush_SetColour(вхобъ, ВизОбъект.безопУк(значение));
    }
}
