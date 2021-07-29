module wx.Bitmap;
public import wx.common;
public import wx.GDIObject;
public import wx.Colour;
public import wx.Palette;
public import wx.Image;
public import wx.Icon;

//! \cond EXTERN
extern (C) ЦелУкз wxBitmap_ctor();
extern (C) ЦелУкз wxBitmap_ctorByImage(ЦелУкз рисунок, цел глубь);
extern (C) ЦелУкз wxBitmap_ctorByName(ткст имя, ПТипБитмап тип);
extern (C) ЦелУкз wxBitmap_ctorBySize(цел ширь, цел высь, цел глубь);
extern (C) ЦелУкз wxBitmap_ctorByBitmap(ЦелУкз битмап);
//extern (C) проц   wxBitmap_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);

extern (C) ЦелУкз wxBitmap_ConvertToImage(ЦелУкз сам);
extern (C) бул   wxBitmap_LoadFile(ЦелУкз сам, ткст имя, ПТипБитмап тип);
extern (C) бул   wxBitmap_SaveFile(ЦелУкз сам, ткст имя, ПТипБитмап тип, ЦелУкз палитра);
extern (C) бул   wxBitmap_Ok(ЦелУкз сам);

extern (C) цел    wxBitmap_GetHeight(ЦелУкз сам);
extern (C) проц   wxBitmap_SetHeight(ЦелУкз сам, цел высь);

extern (C) цел    wxBitmap_GetWidth(ЦелУкз сам);
extern (C) проц   wxBitmap_SetWidth(ЦелУкз сам, цел ширь);

extern (C) цел    wxBitmap_GetDepth(ЦелУкз сам);
extern (C) проц   wxBitmap_SetDepth(ЦелУкз сам, цел глубь);

extern (C) ЦелУкз wxBitmap_GetSubBitmap(ЦелУкз сам, inout Прямоугольник прям);

extern (C) ЦелУкз wxBitmap_GetMask(ЦелУкз сам);
extern (C) ЦелУкз wxBitmap_SetMask(ЦелУкз сам, ЦелУкз маска);

extern (C) ЦелУкз wxBitmap_GetPalette(ЦелУкз сам);
extern (C) бул   wxBitmap_CopyFromIcon(ЦелУкз сам, ЦелУкз пиктограмма);

extern (C) ЦелУкз wxBitmap_GetColourMap(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

export class Битмап : ОбъектИГУ
{
    public static Битмап НуллБитмап;
    /*
    		static this()
    		{
    			Рисунок.иницВсеОбработчики();
    		}
    */
    export this()
    {
        this(wxBitmap_ctor());
    }

    export this(Рисунок рисунок)
    {
        this(рисунок, -1);
    }

    export this(Рисунок рисунок, цел глубь)
    {
        this(wxBitmap_ctorByImage(рисунок.вхобъ, глубь));
    }

    export this(ткст имя)
    {
        this(wxBitmap_ctorByName(имя, ПТипБитмап.ЛЮБОЙ));
    }

    export this(ткст имя, ПТипБитмап тип)
    {
        this(wxBitmap_ctorByName(имя, тип));
    }

    export this(цел ширь, цел высь)
    {
        this(ширь, высь, -1);
    }

    export this(цел ширь, цел высь, цел глубь)
    {
        this(wxBitmap_ctorBySize(ширь, высь, глубь));
    }

    export this(Битмап битмап)
    {
        this(wxBitmap_ctorByBitmap(ВизОбъект.безопУк(битмап)));
    }

    export this(ЦелУкз объ)
    {
        super(объ);
    }

    //---------------------------------------------------------------------

    export Рисунок преобразуйВРисунок()
    {
        return new Рисунок(wxBitmap_ConvertToImage(this.м_вхобъ));
    }

    //---------------------------------------------------------------------

    export цел высь()
    {
        return wxBitmap_GetHeight(this.м_вхобъ);
    }
    export проц высь(цел значение)
    {
        wxBitmap_SetHeight(this.м_вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export бул загрузиФайл(ткст имя, ПТипБитмап тип)
    {
        return wxBitmap_LoadFile(this.м_вхобъ, имя, тип);
    }

    //---------------------------------------------------------------------

    export бул сохраниФайл(ткст имя, ПТипБитмап тип)
    {
        return сохраниФайл(имя, тип, пусто);
    }

    export бул сохраниФайл(ткст имя, ПТипБитмап тип, Палитра палитра)
    {
        return wxBitmap_SaveFile(this.м_вхобъ, имя, тип, ВизОбъект.безопУк(палитра));
    }

    //---------------------------------------------------------------------

    export цел ширь()
    {
        return wxBitmap_GetWidth(this.м_вхобъ);
    }
    export проц ширь(цел значение)
    {
        wxBitmap_SetWidth(this.м_вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export  бул Ок()
    {
        return wxBitmap_Ok(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

    export цел глубь()
    {
        return wxBitmap_GetDepth(this.м_вхобъ);
    }
    export проц глубь(цел значение)
    {
        wxBitmap_SetDepth(this.м_вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export Битмап дайПодБитмап(Прямоугольник прям)
    {
        return new Битмап(wxBitmap_GetSubBitmap(this.м_вхобъ, прям));
    }

    //---------------------------------------------------------------------

    export Маска маска()
    {
        return new Маска(wxBitmap_GetMask(this.м_вхобъ));
    }
    export проц маска(Маска значение)
    {
        wxBitmap_SetMask(вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    export Палитра палитра()
    {
        return new Палитра(wxBitmap_GetPalette(this.м_вхобъ));
    }

    //---------------------------------------------------------------------

    export Палитра цветоКарта()
    {
        return new Палитра(wxBitmap_GetColourMap(this.м_вхобъ));
    }

    //---------------------------------------------------------------------

    export бул копируйИзПиктограммы(Пиктограмма пиктограмма)
    {
        return wxBitmap_CopyFromIcon(this.м_вхобъ, ВизОбъект.безопУк(пиктограмма));
    }

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new Битмап(ptr);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxMask_ctor();
extern (C) ЦелУкз wxMask_ctorByBitmpaColour(ЦелУкз битмап, ЦелУкз цвет);
extern (C) ЦелУкз wxMask_ctorByBitmapIndex(ЦелУкз битмап, цел индексПалитры);
extern (C) ЦелУкз wxMask_ctorByBitmap(ЦелУкз битмап);

extern (C) бул wxMask_CreateByBitmapColour(ЦелУкз сам, ЦелУкз битмап, ЦелУкз цвет);
extern (C) бул wxMask_CreateByBitmapIndex(ЦелУкз сам, ЦелУкз битмап, цел индексПалитры);
extern (C) бул wxMask_CreateByBitmap(ЦелУкз сам, ЦелУкз битмап);
//! \endcond

//---------------------------------------------------------------------

export class Маска : ВизОбъект
{

    export this()
    {
        this(wxMask_ctor());
    }

    export this(Битмап битмап, Цвет цвет)
    {
        this(wxMask_ctorByBitmpaColour(ВизОбъект.безопУк(битмап), ВизОбъект.безопУк(цвет)));
    }

    export this(Битмап битмап, цел индексПалитры)
    {
        this(wxMask_ctorByBitmapIndex(ВизОбъект.безопУк(битмап), индексПалитры));
    }

    export this(Битмап битмап)
    {
        this(wxMask_ctorByBitmap(ВизОбъект.безопУк(битмап)));
    }

    export this(ЦелУкз объ)
    {
        super(объ);
    }

    //---------------------------------------------------------------------

    export бул создай(Битмап битмап, Цвет цвет)
    {
        return wxMask_CreateByBitmapColour(this.м_вхобъ, ВизОбъект.безопУк(битмап), ВизОбъект.безопУк(цвет));
    }

    export бул создай(Битмап битмап, цел индексПалитры)
    {
        return wxMask_CreateByBitmapIndex(this.м_вхобъ, ВизОбъект.безопУк(битмап), индексПалитры);
    }

    export бул создай(Битмап битмап)
    {
        return wxMask_CreateByBitmap(this.м_вхобъ, ВизОбъект.безопУк(битмап));
    }
}
