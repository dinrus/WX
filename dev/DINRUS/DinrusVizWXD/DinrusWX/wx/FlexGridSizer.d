module wx.FlexGridSizer;
public import wx.common;
public import wx.GridSizer;

public enum ПРежимРостаГибкогоПеремерщика
{
    Никакой = 0,
    Назначенный,
    Все
}

//! \cond EXTERN
extern (C) ЦелУкз wxFlexGridSizer_ctor(цел ряды, цел клнки, цел вертГэп, цел горизГэп);
extern (C) проц wxFlexGridSizer_dtor(ЦелУкз сам);
extern (C) проц wxFlexGridSizer_RecalcSizes(ЦелУкз сам);
extern (C) проц wxFlexGridSizer_CalcMin(ЦелУкз сам, inout Размер размер);
extern (C) проц wxFlexGridSizer_AddGrowableRow(ЦелУкз сам, бцел инд);
extern (C) проц wxFlexGridSizer_RemoveGrowableRow(ЦелУкз сам, бцел инд);
extern (C) проц wxFlexGridSizer_AddGrowableCol(ЦелУкз сам, бцел инд);
extern (C) проц wxFlexGridSizer_RemoveGrowableCol(ЦелУкз сам, бцел инд);
extern (C) цел wxFlexGridSizer_GetFlexibleDirection(ЦелУкз сам);
extern (C) проц wxFlexGridSizer_SetFlexibleDirection(ЦелУкз сам, цел направление);
extern (C) ПРежимРостаГибкогоПеремерщика wxFlexGridSizer_GetNonFlexibleGrowMode(ЦелУкз сам);
extern (C) проц wxFlexGridSizer_SetNonFlexibleGrowMode(ЦелУкз сам,ПРежимРостаГибкогоПеремерщика режим);
//! \endcond

//---------------------------------------------------------------------

export class ГибкийПеремерщикСетки : ПеремерщикСетки
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(цел клнки, цел вертГэп, цел горизГэп)
    {
        this(0, клнки, вертГэп, горизГэп);
    }

    export this(цел ряды, цел клнки, цел вертГэп, цел горизГэп)
    {
        super(wxFlexGridSizer_ctor(ряды, клнки, вертГэп, горизГэп));
    }

    //---------------------------------------------------------------------

    export override проц пересчётРазмеров()
    {
        wxFlexGridSizer_RecalcSizes(вхобъ);
    }

    //---------------------------------------------------------------------

    export override Размер вычислиМин()
    {
        Размер размер;
        wxFlexGridSizer_CalcMin(вхобъ, размер);
        return размер;
    }

    //---------------------------------------------------------------------

    export проц добавьНаращиваемыйРяд(цел инд)
    {
        wxFlexGridSizer_AddGrowableRow(вхобъ, cast(бцел)инд);
    }

    export проц убериНаращиваемыйРяд(цел инд)
    {
        wxFlexGridSizer_RemoveGrowableRow(вхобъ, cast(бцел)инд);
    }

    //---------------------------------------------------------------------

    export проц добавьНаращиваемуюКолонку(цел инд)
    {
        wxFlexGridSizer_AddGrowableCol(вхобъ, cast(бцел)инд);
    }

    export проц убериНаращиваемуюКолонку(цел инд)
    {
        wxFlexGridSizer_RemoveGrowableCol(вхобъ, cast(бцел)инд);
    }

    //---------------------------------------------------------------------

    export проц устГибкоеНаправление(цел направление)
    {
        wxFlexGridSizer_SetFlexibleDirection(вхобъ, направление);
    }

    export цел дайГибкоеНаправление()
    {
        return wxFlexGridSizer_GetFlexibleDirection(вхобъ);
    }

    //---------------------------------------------------------------------

    export проц устРежимНегибкогоРоста(ПРежимРостаГибкогоПеремерщика режим)
    {
        wxFlexGridSizer_SetNonFlexibleGrowMode(вхобъ, режим);
    }

    export ПРежимРостаГибкогоПеремерщика  дайРежимНегибкогоРоста()
    {
        return wxFlexGridSizer_GetNonFlexibleGrowMode(вхобъ);
    }
}
