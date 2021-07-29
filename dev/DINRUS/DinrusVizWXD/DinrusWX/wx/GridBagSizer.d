module wx.GridBagSizer;
public import wx.common;
public import wx.SizerItem;
public import wx.FlexGridSizer;

//version(LDC) { pragma(ldc, "verbose") }

//! \cond EXTERN
extern (C) ЦелУкз wxGBSizerItem_ctor(цел ширь, цел высь, ЦелУкз поз, ЦелУкз спан, цел флаг, цел бордюр, ЦелУкз пользоватДан);
extern (C) ЦелУкз wxGBSizerItem_ctorWindow(ЦелУкз окно, ЦелУкз поз, ЦелУкз спан, цел флаг, цел бордюр, ЦелУкз пользоватДан);
extern (C) ЦелУкз wxGBSizerItem_ctorSizer(ЦелУкз сайзер, ЦелУкз поз, ЦелУкз спан, цел флаг, цел бордюр, ЦелУкз пользоватДан);
extern (C) ЦелУкз wxGBSizerItem_ctorDefault();

extern (C) ЦелУкз wxGBSizerItem_GetPos(ЦелУкз сам);

extern (C) ЦелУкз wxGBSizerItem_GetSpan(ЦелУкз сам);
//extern (C) проц   wxGBSizerItem_GetSpan(ЦелУкз сам, ЦелУкз спанРяда, ЦелУкз спанКол);

extern (C) бул   wxGBSizerItem_SetPos(ЦелУкз сам, ЦелУкз поз);
extern (C) бул   wxGBSizerItem_SetSpan(ЦелУкз сам, ЦелУкз спан);

extern (C) бул   wxGBSizerItem_IntersectsSizer(ЦелУкз сам, ЦелУкз другой);
extern (C) бул   wxGBSizerItem_IntersectsSpan(ЦелУкз сам, ЦелУкз поз, ЦелУкз спан);

extern (C) проц   wxGBSizerItem_GetEndPos(ЦелУкз сам, inout цел ряд, inout цел кол);
extern (C) ЦелУкз wxGBSizerItem_GetGBSizer(ЦелУкз сам);
extern (C) проц   wxGBSizerItem_SetGBSizer(ЦелУкз сам, ЦелУкз сайзер);
//! \endcond

//-----------------------------------------------------------------------------

export class ЭлтГБПеремерщика : ЭлтПеремерщика
{
    export this(цел ширь, цел высь, ГБПозиция поз, ГБСпан спан, цел флаг, цел бордюр, ВизОбъект пользоватДан)
    {
        this(wxGBSizerItem_ctor(ширь, высь, ВизОбъект.безопУк(поз), ВизОбъект.безопУк(спан), флаг, бордюр, ВизОбъект.безопУк(пользоватДан)));
    }

    export this(Окно окно, ГБПозиция поз, ГБСпан спан, цел флаг, цел бордюр, ВизОбъект пользоватДан)
    {
        this(wxGBSizerItem_ctorWindow(ВизОбъект.безопУк(окно), ВизОбъект.безопУк(поз), ВизОбъект.безопУк(спан), флаг, бордюр, ВизОбъект.безопУк(пользоватДан)));
    }

    export this(Перемерщик сайзер, ГБПозиция поз, ГБСпан спан, цел флаг, цел бордюр, ВизОбъект пользоватДан)
    {
        this(wxGBSizerItem_ctorSizer(ВизОбъект.безопУк(сайзер), ВизОбъект.безопУк(поз), ВизОбъект.безопУк(спан), флаг, бордюр, ВизОбъект.безопУк(пользоватДан)));
    }

    export this()
    {
        this(wxGBSizerItem_ctorDefault());
    }

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export ГБПозиция поз()
    {
        return cast(ГБПозиция)найдиОбъект(wxGBSizerItem_GetPos(вхобъ), &ГБПозиция.Нов);
    }
    export проц поз(ГБПозиция значение)
    {
        wxGBSizerItem_SetPos(вхобъ, ВизОбъект.безопУк(значение));
    }

    //-----------------------------------------------------------------------------

    export ГБСпан спан()
    {
        return cast(ГБСпан)найдиОбъект(wxGBSizerItem_GetSpan(вхобъ), &ГБСпан.Нов);
    }
    export проц спан(ГБСпан значение)
    {
        wxGBSizerItem_SetSpan(вхобъ, ВизОбъект.безопУк(значение));
    }

    //-----------------------------------------------------------------------------

    export бул пересекается(ЭлтГБПеремерщика другой)
    {
        return wxGBSizerItem_IntersectsSizer(вхобъ, ВизОбъект.безопУк(другой));
    }

    export бул пересекается(ГБПозиция поз, ГБСпан спан)
    {
        return wxGBSizerItem_IntersectsSpan(вхобъ, ВизОбъект.безопУк(поз), ВизОбъект.безопУк(спан));
    }

    //-----------------------------------------------------------------------------

    export проц дайКонПоз(inout цел ряд, inout цел кол)
    {
        wxGBSizerItem_GetEndPos(вхобъ, ряд, кол);
    }

    //-----------------------------------------------------------------------------

    export ГридБэгПеремерщик гбПеремерщик()
    {
        return cast(ГридБэгПеремерщик)найдиОбъект(wxGBSizerItem_GetGBSizer(вхобъ), &ГридБэгПеремерщик.Нов);
    }
    export проц гбПеремерщик(ГридБэгПеремерщик значение)
    {
        wxGBSizerItem_SetGBSizer(вхобъ, ВизОбъект.безопУк(значение));
    }

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new ЭлтГБПеремерщика(ptr);
    }
}

//! \cond EXTERN
extern (C) ЦелУкз wxGBSpan_ctorDefault();
extern (C) ЦелУкз wxGBSpan_ctor(цел спанРяда, цел спанКол);

extern (C) проц   wxGBSpan_SetRowspan(ЦелУкз сам, цел спанРяда);
extern (C) цел    wxGBSpan_GetRowspan(ЦелУкз сам);
extern (C) цел    wxGBSpan_GetColspan(ЦелУкз сам);
extern (C) проц   wxGBSpan_SetColspan(ЦелУкз сам, цел спанКол);
//! \endcond

//-----------------------------------------------------------------------------

export class ГБСпан : ВизОбъект
{
    export this()
    {
        super(wxGBSpan_ctorDefault());
    }

    export this(цел спанРяда, цел спанКол)
    {
        super(wxGBSpan_ctor(спанРяда, спанКол));
    }

    private this(ЦелУкз ptr)
    {
        super(ptr);
    }
    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new ГБСпан(ptr);
    }

    //-----------------------------------------------------------------------------

    export цел спанРядов()
    {
        return wxGBSpan_GetRowspan(вхобъ);
    }
    export проц спанРядов(цел значение)
    {
        wxGBSpan_SetRowspan(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export цел спанКолонок()
    {
        return wxGBSpan_GetColspan(вхобъ);
    }
    export проц спанКолонок(цел значение)
    {
        wxGBSpan_SetColspan(вхобъ, значение);
    }
}

//! \cond EXTERN
extern (C) ЦелУкз wxGridBagSizer_ctor(цел вертГэп, цел горизГэп);
extern (C) бул   wxGridBagSizer_AddWindow(ЦелУкз сам, ЦелУкз окно, ЦелУкз поз, ЦелУкз спан, цел флаг, цел бордюр, ЦелУкз пользоватДан);
extern (C) бул   wxGridBagSizer_AddSizer(ЦелУкз сам, ЦелУкз сайзер, ЦелУкз поз, ЦелУкз спан, цел флаг, цел бордюр, ЦелУкз пользоватДан);
extern (C) бул   wxGridBagSizer_Add(ЦелУкз сам, цел ширь, цел высь, ЦелУкз поз, ЦелУкз спан, цел флаг, цел бордюр, ЦелУкз пользоватДан);
extern (C) бул   wxGridBagSizer_AddItem(ЦелУкз сам, ЦелУкз элт);

extern (C) проц   wxGridBagSizer_GetEmptyCellSize(ЦелУкз сам, inout Размер размер);
extern (C) проц   wxGridBagSizer_SetEmptyCellSize(ЦелУкз сам, inout Размер рм);
extern (C) проц   wxGridBagSizer_GetCellSize(ЦелУкз сам, цел ряд, цел кол, inout Размер размер);

extern (C) ЦелУкз wxGridBagSizer_GetItemPositionWindow(ЦелУкз сам, ЦелУкз окно);
extern (C) ЦелУкз wxGridBagSizer_GetItemPositionSizer(ЦелУкз сам, ЦелУкз сайзер);
extern (C) ЦелУкз wxGridBagSizer_GetItemPositionIndex(ЦелУкз сам, цел индекс);
extern (C) бул   wxGridBagSizer_SetItemPositionWindow(ЦелУкз сам, ЦелУкз окно, ЦелУкз поз);
extern (C) бул   wxGridBagSizer_SetItemPositionSizer(ЦелУкз сам, ЦелУкз сайзер, ЦелУкз поз);
extern (C) бул   wxGridBagSizer_SetItemPositionIndex(ЦелУкз сам, цел индекс, ЦелУкз поз);

extern (C) ЦелУкз wxGridBagSizer_GetItemSpanWindow(ЦелУкз сам, ЦелУкз окно);
extern (C) ЦелУкз wxGridBagSizer_GetItemSpanSizer(ЦелУкз сам, ЦелУкз сайзер);
extern (C) ЦелУкз wxGridBagSizer_GetItemSpanIndex(ЦелУкз сам, цел индекс);
extern (C) бул   wxGridBagSizer_SetItemSpanWindow(ЦелУкз сам, ЦелУкз окно, ЦелУкз спан);
extern (C) бул   wxGridBagSizer_SetItemSpanSizer(ЦелУкз сам, ЦелУкз сайзер, ЦелУкз спан);
extern (C) бул   wxGridBagSizer_SetItemSpanIndex(ЦелУкз сам, цел индекс, ЦелУкз спан);

extern (C) ЦелУкз wxGridBagSizer_FindItemWindow(ЦелУкз сам, ЦелУкз окно);
extern (C) ЦелУкз wxGridBagSizer_FindItemSizer(ЦелУкз сам, ЦелУкз сайзер);
extern (C) ЦелУкз wxGridBagSizer_FindItemAtPosition(ЦелУкз сам, ЦелУкз поз);
extern (C) ЦелУкз wxGridBagSizer_FindItemAtPoint(ЦелУкз сам, inout Точка тчк);
extern (C) ЦелУкз wxGridBagSizer_FindItemWithData(ЦелУкз сам, ЦелУкз пользоватДан);

extern (C) бул   wxGridBagSizer_CheckForIntersectionItem(ЦелУкз сам, ЦелУкз элт, ЦелУкз исклЭлт);
extern (C) бул   wxGridBagSizer_CheckForIntersectionPos(ЦелУкз сам, ЦелУкз поз, ЦелУкз спан, ЦелУкз исклЭлт);
//! \endcond

export class ГридБэгПеремерщик : ГибкийПеремерщикСетки
{
    //-----------------------------------------------------------------------------

    export this(цел вертГэп, цел горизГэп)
    {
        super(wxGridBagSizer_ctor(вертГэп, горизГэп));
    }

    private this(ЦелУкз ptr)
    {
        super(ptr);
    }
    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new ГридБэгПеремерщик(ptr);
    }

    //-----------------------------------------------------------------------------

    export бул добавь(Окно окно, ГБПозиция поз, ГБСпан спан, цел флаг, цел бордюр, ВизОбъект пользоватДан)
    {
        return wxGridBagSizer_AddWindow(вхобъ, ВизОбъект.безопУк(окно), ВизОбъект.безопУк(поз), ВизОбъект.безопУк(спан), флаг, бордюр, ВизОбъект.безопУк(пользоватДан));
    }

    export бул добавь(Перемерщик сайзер, ГБПозиция поз, ГБСпан спан, цел флаг, цел бордюр, ВизОбъект пользоватДан)
    {
        return wxGridBagSizer_AddSizer(вхобъ, ВизОбъект.безопУк(сайзер), ВизОбъект.безопУк(поз), ВизОбъект.безопУк(спан), флаг, бордюр, ВизОбъект.безопУк(пользоватДан));
    }

    export бул добавь(цел ширь, цел высь, ГБПозиция поз, ГБСпан спан, цел флаг, цел бордюр, ВизОбъект пользоватДан)
    {
        return wxGridBagSizer_Add(вхобъ, ширь, высь, ВизОбъект.безопУк(поз), ВизОбъект.безопУк(спан), флаг, бордюр, ВизОбъект.безопУк(пользоватДан));
    }

    export бул добавь(ЭлтГБПеремерщика элт)
    {
        return wxGridBagSizer_AddItem(вхобъ, ВизОбъект.безопУк(элт));
    }

    //-----------------------------------------------------------------------------

    export Размер размерПустойЯчейки()
    {
        Размер размер;
        wxGridBagSizer_GetEmptyCellSize(вхобъ, размер);
        return размер;
    }
    export проц размерПустойЯчейки(Размер значение)
    {
        wxGridBagSizer_SetEmptyCellSize(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export Размер дайРазмЯчейки(цел ряд, цел кол)
    {
        Размер размер;
        wxGridBagSizer_GetCellSize(вхобъ, ряд, кол, размер);
        return размер;
    }

    //-----------------------------------------------------------------------------

    export ГБПозиция дайПозЭлта(Окно окно)
    {
        return cast(ГБПозиция)найдиОбъект(wxGridBagSizer_GetItemPositionWindow(вхобъ, ВизОбъект.безопУк(окно)), &ГБПозиция.Нов);
    }

    export ГБПозиция дайПозЭлта(Перемерщик сайзер)
    {
        return cast(ГБПозиция)найдиОбъект(wxGridBagSizer_GetItemPositionSizer(вхобъ, ВизОбъект.безопУк(сайзер)), &ГБПозиция.Нов);
    }

    export ГБПозиция дайПозЭлта(цел индекс)
    {
        return cast(ГБПозиция)найдиОбъект(wxGridBagSizer_GetItemPositionIndex(вхобъ, индекс), &ГБПозиция.Нов);
    }

    //-----------------------------------------------------------------------------

    export бул устПозЭлта(Окно окно, ГБПозиция поз)
    {
        return wxGridBagSizer_SetItemPositionWindow(вхобъ, ВизОбъект.безопУк(окно), ВизОбъект.безопУк(поз));
    }

    export бул устПозЭлта(Перемерщик сайзер, ГБПозиция поз)
    {
        return wxGridBagSizer_SetItemPositionSizer(вхобъ, ВизОбъект.безопУк(сайзер), ВизОбъект.безопУк(поз));
    }

    export бул устПозЭлта(цел индекс, ГБПозиция поз)
    {
        return wxGridBagSizer_SetItemPositionIndex(вхобъ, индекс, ВизОбъект.безопУк(поз));
    }

    //-----------------------------------------------------------------------------

    export ГБСпан дайСпанЭлта(Окно окно)
    {
        return cast(ГБСпан)найдиОбъект(wxGridBagSizer_GetItemSpanWindow(вхобъ, ВизОбъект.безопУк(окно)), &ГБСпан.Нов);
    }

    export ГБСпан дайСпанЭлта(Перемерщик сайзер)
    {
        return cast(ГБСпан)найдиОбъект(wxGridBagSizer_GetItemSpanSizer(вхобъ, ВизОбъект.безопУк(сайзер)), &ГБСпан.Нов);
    }

    export ГБСпан дайСпанЭлта(цел индекс)
    {
        return cast(ГБСпан)найдиОбъект(wxGridBagSizer_GetItemSpanIndex(вхобъ, индекс), &ГБСпан.Нов);
    }

    //-----------------------------------------------------------------------------

    export бул устСпанЭлта(Окно окно, ГБСпан спан)
    {
        return wxGridBagSizer_SetItemSpanWindow(вхобъ, ВизОбъект.безопУк(окно), ВизОбъект.безопУк(спан));
    }

    export бул устСпанЭлта(Перемерщик сайзер, ГБСпан спан)
    {
        return wxGridBagSizer_SetItemSpanSizer(вхобъ, ВизОбъект.безопУк(сайзер), ВизОбъект.безопУк(спан));
    }

    export бул устСпанЭлта(цел индекс, ГБСпан спан)
    {
        return wxGridBagSizer_SetItemSpanIndex(вхобъ, индекс, ВизОбъект.безопУк(спан));
    }

    //-----------------------------------------------------------------------------

    export ЭлтГБПеремерщика найдиЭлт(Окно окно)
    {
        return cast(ЭлтГБПеремерщика)найдиОбъект(wxGridBagSizer_FindItemWindow(вхобъ, ВизОбъект.безопУк(окно)), &ЭлтГБПеремерщика.Нов);
    }

    export ЭлтГБПеремерщика найдиЭлт(Перемерщик сайзер)
    {
        return cast(ЭлтГБПеремерщика)найдиОбъект(wxGridBagSizer_FindItemSizer(вхобъ, ВизОбъект.безопУк(сайзер)), &ЭлтГБПеремерщика.Нов);
    }

    export ЭлтГБПеремерщика найдиЭлтВПозиции(ГБПозиция поз)
    {
        return cast(ЭлтГБПеремерщика)найдиОбъект(wxGridBagSizer_FindItemAtPosition(вхобъ, ВизОбъект.безопУк(поз)), &ЭлтГБПеремерщика.Нов);
    }

    export ЭлтГБПеремерщика найдиЭлтВТочке(Точка тчк)
    {
        return cast(ЭлтГБПеремерщика)найдиОбъект(wxGridBagSizer_FindItemAtPoint(вхобъ, тчк), &ЭлтГБПеремерщика.Нов);
    }

    export ЭлтГБПеремерщика найдиЭлтСДанными(ВизОбъект пользоватДан)
    {
        return cast(ЭлтГБПеремерщика)найдиОбъект(wxGridBagSizer_FindItemWithData(вхобъ, ВизОбъект.безопУк(пользоватДан)), &ЭлтГБПеремерщика.Нов);
    }

    //-----------------------------------------------------------------------------

    export бул проверьНаПересечение(ЭлтГБПеремерщика элт, ЭлтГБПеремерщика исклЭлт)
    {
        return wxGridBagSizer_CheckForIntersectionItem(вхобъ, ВизОбъект.безопУк(элт), ВизОбъект.безопУк(исклЭлт));
    }

    export бул проверьНаПересечение(ГБПозиция поз, ГБСпан спан, ЭлтГБПеремерщика исклЭлт)
    {
        return wxGridBagSizer_CheckForIntersectionPos(вхобъ, ВизОбъект.безопУк(поз), ВизОбъект.безопУк(спан), ВизОбъект.безопУк(исклЭлт));
    }

}

//! \cond EXTERN
extern (C) ЦелУкз wxGBPosition_ctor();
extern (C) ЦелУкз wxGBPosition_ctorPos(цел ряд, цел кол);
extern (C) цел    wxGBPosition_GetRow(ЦелУкз сам);
extern (C) цел    wxGBPosition_GetCol(ЦелУкз сам);
extern (C) проц   wxGBPosition_SetRow(ЦелУкз сам, цел ряд);
extern (C) проц   wxGBPosition_SetCol(ЦелУкз сам, цел кол);
//! \endcond

//-----------------------------------------------------------------------------


export class ГБПозиция : ВизОбъект
{
    private this(ЦелУкз ptr)
    {
        super(ptr);
    }

    export this()
    {
        super(wxGBPosition_ctor());
    }

    //-----------------------------------------------------------------------------

    //export this(цел ряд, цел кол)
    //    { super(wxGBPosition_ctorPos(ряд, кол)); }

    //-----------------------------------------------------------------------------

    export цел дайРяд()
    {
        return wxGBPosition_GetRow(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export цел дайКол()
    {
        return wxGBPosition_GetCol(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц устРяд(цел ряд)
    {
        wxGBPosition_SetRow(вхобъ, ряд);
    }

    //-----------------------------------------------------------------------------

    export проц устКол(цел кол)
    {
        wxGBPosition_SetCol(вхобъ, кол);
    }

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new ГБПозиция(ptr);
    }
}

