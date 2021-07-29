module wx.Region;
public import wx.common;
public import wx.GDIObject;
public import wx.Bitmap;
public import wx.Colour;

public enum ПРегионСодержит
{
    ВнешнийРегион = 0,
    ЧастьРегиона,
    ВнутреннийРегион
}

//! \cond EXTERN
extern (C) ЦелУкз wxRegion_ctor();
extern (C) ЦелУкз wxRegion_ctorByCoords(цел x, цел y, цел w, цел h);
extern (C) ЦелУкз wxRegion_ctorByCorners(inout Точка верхнЛев, inout Точка нижнПрав);
extern (C) ЦелУкз wxRegion_ctorByRect(inout Прямоугольник прям);
extern (C) ЦелУкз wxRegion_ctorByPoly(цел ч, inout Точка[] точки, цел стильЗаливки);
extern (C) ЦелУкз wxRegion_ctorByBitmap(ЦелУкз бмп, ЦелУкз трансЦвет, цел толерантность);
extern (C) ЦелУкз wxRegion_ctorByRegion(ЦелУкз регион);

extern (C) проц   wxRegion_dtor(ЦелУкз сам);

extern (C) проц   wxRegion_Clear(ЦелУкз сам);
extern (C) бул   wxRegion_Offset(ЦелУкз сам, цел x, цел y);

extern (C) бул   wxRegion_Union(ЦелУкз сам, цел x, цел y, цел ширь, цел высь);
extern (C) бул   wxRegion_UnionRect(ЦелУкз сам, inout Прямоугольник прям);
extern (C) бул   wxRegion_UnionRegion(ЦелУкз сам, ЦелУкз регион);
extern (C) бул   wxRegion_UnionBitmap(ЦелУкз сам, ЦелУкз бмп, ЦелУкз трансЦвет, цел толерантность);

extern (C) бул   wxRegion_Intersect(ЦелУкз сам, цел x, цел y, цел ширь, цел высь);
extern (C) бул   wxRegion_IntersectRect(ЦелУкз сам, inout Прямоугольник прям);
extern (C) бул   wxRegion_IntersectRegion(ЦелУкз сам, ЦелУкз регион);

extern (C) бул   wxRegion_Subtract(ЦелУкз сам, цел x, цел y, цел ширь, цел высь);
extern (C) бул   wxRegion_SubtractRect(ЦелУкз сам, inout Прямоугольник прям);
extern (C) бул   wxRegion_SubtractRegion(ЦелУкз сам, ЦелУкз регион);

extern (C) бул   wxRegion_Xor(ЦелУкз сам, цел x, цел y, цел ширь, цел высь);
extern (C) бул   wxRegion_XorRect(ЦелУкз сам, inout Прямоугольник прям);
extern (C) бул   wxRegion_XorRegion(ЦелУкз сам, ЦелУкз регион);

extern (C) ПРегионСодержит wxRegion_ContainsCoords(ЦелУкз сам, цел x, цел y);
extern (C) ПРегионСодержит wxRegion_ContainsPoint(ЦелУкз сам, inout Точка тчк);
extern (C) ПРегионСодержит wxRegion_ContainsRectCoords(ЦелУкз сам, цел x, цел y, цел ширь, цел высь);
extern (C) ПРегионСодержит wxRegion_ContainsRect(ЦелУкз сам, inout Прямоугольник прям);

extern (C) проц   wxRegion_GetBox(ЦелУкз сам, inout Прямоугольник прям);
extern (C) бул   wxRegion_IsEmpty(ЦелУкз сам);
extern (C) ЦелУкз wxRegion_ConvertToBitmap(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

export class Регион : ОбъектИГУ
{

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        this(wxRegion_ctor());
    }

    export this(цел x, цел y, цел w, цел h)
    {
        this(wxRegion_ctorByCoords(x, y, w, h));
    }

    export this(Точка верхнЛев, Точка нижнПрав)
    {
        this(wxRegion_ctorByCorners(верхнЛев, нижнПрав));
    }

    export this(Прямоугольник прям)
    {
        this(wxRegion_ctorByRect(прям));
    }

    version(__WXMAC__) {} else
        export this(Точка[] точки, цел стильЗаливки)
    {
        this(wxRegion_ctorByPoly(точки.length, точки, стильЗаливки));
    }

    export this(Битмап бмп, Цвет трансЦвет, цел толерантность)
    {
        this(wxRegion_ctorByBitmap(ВизОбъект.безопУк(бмп), ВизОбъект.безопУк(трансЦвет), толерантность));
    }

    export this(Регион рег)
    {
        this(wxRegion_ctorByRegion(ВизОбъект.безопУк(рег)));
    }

    //---------------------------------------------------------------------

    export проц очисть()
    {
        wxRegion_Clear(вхобъ);
    }

    version(__WXMAC__) {} else
        export бул смещение(цел x, цел y)
    {
        return wxRegion_Offset(вхобъ, x, y);
    }

    //---------------------------------------------------------------------

    export бул союз(цел x, цел y, цел ширь, цел высь)
    {
        return wxRegion_Union(вхобъ, x, y, ширь, высь);
    }

    export бул союз(Прямоугольник прям)
    {
        return wxRegion_UnionRect(вхобъ, прям);
    }

    export бул союз(Регион рег)
    {
        return wxRegion_UnionRegion(вхобъ, ВизОбъект.безопУк(рег));
    }

    export бул союз(Битмап бмп, Цвет трансЦвет, цел толерантность)
    {
        return wxRegion_UnionBitmap(вхобъ, ВизОбъект.безопУк(бмп), ВизОбъект.безопУк(трансЦвет), толерантность);
    }

    //---------------------------------------------------------------------

    export бул пересечение(цел x, цел y, цел ширь, цел высь)
    {
        return wxRegion_Intersect(вхобъ, x, y, ширь, высь);
    }

    export бул пересечение(Прямоугольник прям)
    {
        return wxRegion_IntersectRect(вхобъ, прям);
    }

    export бул пересечение(Регион регион)
    {
        return wxRegion_IntersectRegion(вхобъ, ВизОбъект.безопУк(регион));
    }

    //---------------------------------------------------------------------

    export бул вычти(цел x, цел y, цел ширь, цел высь)
    {
        return wxRegion_Subtract(вхобъ, x, y, ширь, высь);
    }

    export бул вычти(Прямоугольник прям)
    {
        return wxRegion_SubtractRect(вхобъ, прям);
    }

    export бул вычти(Регион регион)
    {
        return wxRegion_SubtractRegion(вхобъ, ВизОбъект.безопУк(регион));
    }

    //---------------------------------------------------------------------

    export бул иили(цел x, цел y, цел ширь, цел высь)
    {
        return wxRegion_Xor(вхобъ, x, y, ширь, высь);
    }

    export бул иили(Прямоугольник прям)
    {
        return wxRegion_XorRect(вхобъ, прям);
    }

    export бул иили(Регион регион)
    {
        return wxRegion_XorRegion(вхобъ, ВизОбъект.безопУк(регион));
    }

    //---------------------------------------------------------------------

    export ПРегионСодержит содержит(цел x, цел y)
    {
        return wxRegion_ContainsCoords(вхобъ, x, y);
    }

    export ПРегионСодержит содержит(Точка тчк)
    {
        return wxRegion_ContainsPoint(вхобъ, тчк);
    }

    export ПРегионСодержит содержит(цел x, цел y, цел ширь, цел высь)
    {
        return wxRegion_ContainsRectCoords(вхобъ, x, y, ширь, высь);
    }

    export ПРегионСодержит содержит(Прямоугольник прям)
    {
        return wxRegion_ContainsRect(вхобъ, прям);
    }

    //---------------------------------------------------------------------

    export Прямоугольник дайБокс()
    {
        Прямоугольник прям;
        wxRegion_GetBox(вхобъ, прям);
        return прям;
    }

    export бул пуст_ли()
    {
        return wxRegion_IsEmpty(вхобъ);
    }

    export Битмап преобразуйВБитмап()
    {
        return new Битмап(wxRegion_ConvertToBitmap(вхобъ));
    }
}

//! \cond EXTERN
extern (C) ЦелУкз wxRegionIterator_ctor();
extern (C) ЦелУкз wxRegionIterator_ctorByRegion(ЦелУкз регион);

extern (C) проц   wxRegionIterator_Reset(ЦелУкз сам);
extern (C) проц   wxRegionIterator_ResetToRegion(ЦелУкз сам, ЦелУкз регион);

extern (C) бул   wxRegionIterator_HaveRects(ЦелУкз сам);

extern (C) цел    wxRegionIterator_GetX(ЦелУкз сам);
extern (C) цел    wxRegionIterator_GetY(ЦелУкз сам);

extern (C) цел    wxRegionIterator_GetW(ЦелУкз сам);
extern (C) цел    wxRegionIterator_GetWidth(ЦелУкз сам);
extern (C) цел    wxRegionIterator_GetH(ЦелУкз сам);
extern (C) цел    wxRegionIterator_GetHeight(ЦелУкз сам);

extern (C) проц   wxRegionIterator_GetRect(ЦелУкз сам, inout Прямоугольник прям);
//! \endcond

//---------------------------------------------------------------------

export class ОбходчикРегиона : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        this(wxRegionIterator_ctor());
    }

    export this(Регион рег)
    {
        this(wxRegionIterator_ctorByRegion(ВизОбъект.безопУк(рег)));
    }

    //---------------------------------------------------------------------

    export проц сбрось()
    {
        wxRegionIterator_Reset(вхобъ);
    }

    export проц сбросьДоРегиона(Регион регион)
    {
        wxRegionIterator_ResetToRegion(вхобъ, ВизОбъект.безопУк(регион));
    }

    //---------------------------------------------------------------------

    export бул естьПрямоугольники()
    {
        return wxRegionIterator_HaveRects(вхобъ);
    }

    //---------------------------------------------------------------------

    export цел Х()
    {
        return wxRegionIterator_GetX(вхобъ);
    }

    export цел У()
    {
        return wxRegionIterator_GetY(вхобъ);
    }

    //---------------------------------------------------------------------

    export цел ширь()
    {
        return wxRegionIterator_GetWidth(вхобъ);
    }

    export цел высь()
    {
        return wxRegionIterator_GetHeight(вхобъ);
    }

    //---------------------------------------------------------------------

    export Прямоугольник прям()
    {
        Прямоугольник прям;
        wxRegionIterator_GetRect(вхобъ, прям);
        return прям;
    }
}
