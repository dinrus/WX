module wx.NotebookSizer;
public import wx.common;
public import wx.Sizer;
public import wx.Notebook;

//! \cond EXTERN
extern (C) ЦелУкз wxNotebookSizer_ctor(ЦелУкз nb);
extern (C) проц wxNotebookSizer_RecalcSizes(ЦелУкз сам);
extern (C) проц wxNotebookSizer_CalcMin(ЦелУкз сам, inout Размер размер);
extern (C) ЦелУкз wxNotebookSizer_GetNotebook(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

/*deprecated*/ export class ПеремерщикНоутбука : Перемерщик
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(Ноутбук nb)
    {
        super(wxNotebookSizer_ctor(ВизОбъект.безопУк(nb)));
    }

    //---------------------------------------------------------------------

    export override проц пересчётРазмеров()
    {
        wxNotebookSizer_RecalcSizes(вхобъ);
    }

    //---------------------------------------------------------------------

    export override Размер вычислиМин()
    {
        Размер размер;
        wxNotebookSizer_CalcMin(вхобъ, размер);
        return размер;
    }

    //---------------------------------------------------------------------

    export Ноутбук ноутбук()
    {
        return cast(Ноутбук)найдиОбъект(
                   wxNotebookSizer_GetNotebook(вхобъ)
               );
    }

    //---------------------------------------------------------------------
}
