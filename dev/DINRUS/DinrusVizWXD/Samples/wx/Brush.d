module wx.Brush;
public import wx.common;
public import wx.Bitmap;

//---------------------------------------------------------------------

extern(D) class Кисть : ОбъектИГУ
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
    public this();
    public this(ЦелУкз вхобъ);
    public this(Цвет цвет);
    public this(Цвет цвет, ПСтильЗаливки стиль);
    public this(Битмап стиплБмп);
    public this(ткст имя);
    public this(ткст имя, ПСтильЗаливки стиль);
    public бул Ок();
    public ПСтильЗаливки стиль();
    public проц стиль(ПСтильЗаливки значение);
    public Битмап пунктир();
    public проц пунктир(Битмап значение);
    public Цвет цвет();
    public проц цвет(Цвет значение);
}
