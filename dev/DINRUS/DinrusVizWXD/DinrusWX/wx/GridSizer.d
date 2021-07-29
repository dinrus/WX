module wx.GridSizer;
public import wx.common;
public import wx.Sizer;

//! \cond EXTERN
extern (C) ЦелУкз wxGridSizer_ctor(цел ряды, цел клнки, цел вертГэп, цел горизГэп);
extern (C) проц wxGridSizer_RecalcSizes(ЦелУкз сам);
extern (C) проц wxGridSizer_CalcMin(ЦелУкз сам, inout Размер размер);
extern (C) проц wxGridSizer_SetCols(ЦелУкз сам, цел клнки);
extern (C) проц wxGridSizer_SetRows(ЦелУкз сам, цел ряды);
extern (C) проц wxGridSizer_SetVGap(ЦелУкз сам, цел gap);
extern (C) проц wxGridSizer_SetHGap(ЦелУкз сам, цел gap);
extern (C) цел wxGridSizer_GetCols(ЦелУкз сам);
extern (C) цел wxGridSizer_GetRows(ЦелУкз сам);
extern (C) цел wxGridSizer_GetVGap(ЦелУкз сам);
extern (C) цел wxGridSizer_GetHGap(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

export class ПеремерщикСетки : Перемерщик
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(цел ряды, цел клнки, цел вертГэп, цел горизГэп)
    {
        super(wxGridSizer_ctor(ряды, клнки, вертГэп, горизГэп));
    }

    export this(цел клнки, цел вертГэп = 0, цел горизГэп = 0)
    {
        this(клнки == 0 ? 1 : 0, клнки, вертГэп, горизГэп);
    }

    //---------------------------------------------------------------------

    export override проц пересчётРазмеров()
    {
        wxGridSizer_RecalcSizes(вхобъ);
    }

    //---------------------------------------------------------------------

    export override Размер вычислиМин()
    {
        Размер размер;
        wxGridSizer_CalcMin(вхобъ, размер);
        return размер;
    }

    //---------------------------------------------------------------------

    export проц колонки(цел значение)
    {
        wxGridSizer_SetCols(вхобъ, значение);
    }
    export цел колонки()
    {
        return wxGridSizer_GetCols(вхобъ);
    }

    export проц ряды(цел значение)
    {
        wxGridSizer_SetRows(вхобъ, значение);
    }
    export цел ряды()
    {
        return wxGridSizer_GetRows(вхобъ);
    }

    //---------------------------------------------------------------------

    export проц вертГэп(цел значение)
    {
        wxGridSizer_SetVGap(вхобъ, значение);
    }
    export цел вертГэп()
    {
        return wxGridSizer_GetVGap(вхобъ);
    }

    export проц горизГэп(цел значение)
    {
        wxGridSizer_SetHGap(вхобъ, значение);
    }
    export цел горизГэп()
    {
        return wxGridSizer_GetHGap(вхобъ);
    }

    //---------------------------------------------------------------------
}
