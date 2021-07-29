// Changes/Additions до C++ version:
//    + ToString() метод for simple formatting of display properties
//    + Implemented IComparable до разрешить for simple sorting of режимы
//    + Did not implement IsOK -- maybee I did not understand it кноп
//      it seems impossible до not be да.
//
// Note that == and the Matches метод differ in how they work. == is
// да equality of all properties. Matches implements the wxWidgets
// concept of display equivalence.
//
// ВидеоРежим is immutable: it can not be modified once created, either manually
// via it'т constructor or more likely by calling a метод in дисплей.

module wx.VideoMode;
public import wx.common;

version(Dinrus)
{
  private import stdrus;
  alias stdrus.вТкст toString;
}

version(Rulada)
{
	import std.string;
}

export struct ВидеоРежим // : IComparable
{
    /** struct constructor */
    export static ВидеоРежим opCall(цел ширь, цел высь, цел глубь, цел частота)
    {
        ВидеоРежим v;
        v.w = ширь;
        v.h = высь;
        v.bpp = глубь;
        v.обновление = частота;
        return v;
    }
    /+
    export цел opCmp(ВидеоРежим другой)
    {
        //	ВидеоРежим другой = cast(ВидеоРежим) объ;
        if (другой.w > w)
            return -1;
        else if (другой.w < w)
            return 1;
        else if (другой.h > h)
            return -1;
        else if (другой.h < h)
            return 1;
        else if (другой.bpp > bpp)
            return -1;
        else if (другой.bpp < bpp)
            return 1;
        else if (другой.обновление > обновление)
            return -1;
        else if (другой.обновление < обновление)
            return 1;
        else
            return 0;
    }

    export override цел opEquals(Объект объ)
    {
        if (объ === пусто) return нет;
        ВидеоРежим другой = cast(ВидеоРежим) объ;
        return (w == другой.w) && (h == другой.h) &&
               (bpp == другой.bpp) && (обновление == другой.обновление);
    }

    export override бцел toHash()
    {
        return w ^ h ^ bpp ^ обновление;
    }
    +/
    // Возвращщает да, если этот режим совпадает с другим, в плане что все
    // ненулевые поля другого режима имеют такое же значение, как в этом
    // (ктоме обновление, который может иметь большее значение).
    export бул совпадаетС(ВидеоРежим другой)
    {
        return (другой.w == 0 || w == другой.w) &&
               (другой.h == 0 || h == другой.h) &&
               (другой.bpp == 0 || bpp == другой.bpp) &&
               (другой.обновление == 0 || обновление >= другой.обновление);
    }

    // trivial accessors
    export цел ширь()
    {
        return w;
    }

    export цел высь()
    {
        return h;
    }

    export цел глубь()
    {
        return bpp;
    }

    // This is not defined in vidmode.h
    export цел частотаОбновленияВГц()
    {
        return обновление;
    }


    // returns да if the object есть been initialized
    // not implemented -- seems impossible
    // бул Ок() const { return w && h; }


        export ткст вТкст()
        {
            ткст т;

                т = toString(w) ~ "x" ~ toString(h);
                if ( bpp > 0 )
                    т ~= ", " ~ toString(bpp) ~ "bpp";

                if ( обновление > 0 )
                    т ~= ", " ~ toString(обновление) ~ "Hz";

            return т;
        }


    // Размер экрана в пикселях (напр., 640*480), 0 означает "незадан".
    private цел w, h;

    // Битов на пиксель (напр., 32), 1 значит "монохромный"; а 0 означает "незадан"/"неизвестен".
    private цел bpp;

    // Частота обновления в Гц, 0 означает "незадан"/"неизвестен".
    private цел обновление;
}
