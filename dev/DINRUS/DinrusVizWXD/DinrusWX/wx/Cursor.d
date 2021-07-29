module wx.Cursor;
public import wx.common;
public import wx.Bitmap;

public enum ПСтокКурсор
{
    Нет,
    Стрелка,
    ПраваяСтрелка,
    ГлазБыка,
    CHAR,
    Крест,
    Рука,
    IBEAM,
    LEFT_BUTTON,
    MAGNIFIER,
    MIDDLE_BUTTON,
    NO_ENTRY,
    PAINT_BRUSH,
    PENCIL,
    POINT_LEFT,
    POINT_RIGHT,
    QUESTION_ARROW,
    RIGHT_BUTTON,
    SIZENESW,
    SIZENS,
    SIZENWSE,
    SIZEWE,
    SIZING,
    SPRAYCAN,
    WAIT,
    WATCH,
    BLANK,
    ARROWWAIT,
    Макс
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxCursor_ctorById(ПСтокКурсор ид);
extern (C) ЦелУкз wxCursor_ctorImage(ЦелУкз рисунок);
extern (C) ЦелУкз wxCursor_ctorCopy(ЦелУкз курсор);

extern (C) бул   wxCursor_Ok(ЦелУкз сам);

extern (C) проц   wxCursor_SetCursor(ЦелУкз курсор);
//! \endcond

//---------------------------------------------------------------------

export class Курсор : Битмап
{
    public static Курсор СТАНДАРТНЫЙ;
    public static Курсор ПЕСОЧНЫЕ_ЧАСЫ;
    public static Курсор КРЕСТ;
    public static Курсор НуллКурсор;

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(ПСтокКурсор ид)
    {
        super(wxCursor_ctorById(ид));
    }

    export this(Рисунок рисунок)
    {
        super(wxCursor_ctorImage(ВизОбъект.безопУк(рисунок)));
    }

    export this(Курсор курсор)
    {
        super(wxCursor_ctorCopy(ВизОбъект.безопУк(курсор)));
    }
    /+
    override export проц вымести()
    {
        if (this !== СТАНДАРТНЫЙ
                     &&  this !== ПЕСОЧНЫЕ_ЧАСЫ
                                  &&  this !== КРЕСТ)
        {
            super.вымести();
        }
    }
    +/
    //---------------------------------------------------------------------

    export override бул Ок()
    {
        return wxCursor_Ok(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

    export static проц устКурсор(Курсор курсор)
    {
        wxCursor_SetCursor(ВизОбъект.безопУк(курсор));
    }
}
