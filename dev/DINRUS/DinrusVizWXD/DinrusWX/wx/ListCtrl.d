module wx.ListCtrl;
public import wx.common;
public import wx.Control;
public import wx.ClientData;
public import wx.ImageList;

//! \cond EXTERN
extern (C) ЦелУкз wxListItem_ctor();
extern (C) проц   wxListItem_Clear(ЦелУкз сам);
extern (C) проц   wxListItem_ClearAttributes(ЦелУкз сам);
extern (C) цел    wxListItem_GetAlign(ЦелУкз сам);
extern (C) ЦелУкз wxListItem_GetBackgroundColour(ЦелУкз сам);
extern (C) цел    wxListItem_GetColumn(ЦелУкз сам);
extern (C) ЦелУкз wxListItem_GetData(ЦелУкз сам);
extern (C) ЦелУкз wxListItem_GetFont(ЦелУкз сам);
extern (C) цел    wxListItem_GetId(ЦелУкз сам);
extern (C) цел    wxListItem_GetImage(ЦелУкз сам);
extern (C) цел    wxListItem_GetMask(ЦелУкз сам);
extern (C) цел    wxListItem_GetState(ЦелУкз сам);
extern (C) ЦелУкз wxListItem_GetText(ЦелУкз сам);
extern (C) ЦелУкз wxListItem_GetTextColour(ЦелУкз сам);
extern (C) цел    wxListItem_GetWidth(ЦелУкз сам);
extern (C) проц   wxListItem_SetAlign(ЦелУкз сам, цел раскладка);
extern (C) проц   wxListItem_SetBackgroundColour(ЦелУкз сам, ЦелУкз кол);
extern (C) проц   wxListItem_SetColumn(ЦелУкз сам, цел кол);
extern (C) проц   wxListItem_SetData(ЦелУкз сам, ЦелУкз данные);
extern (C) проц   wxListItem_SetFont(ЦелУкз сам, ЦелУкз шрифт);
extern (C) проц   wxListItem_SetId(ЦелУкз сам, цел ид);
extern (C) проц   wxListItem_SetImage(ЦелУкз сам, цел рисунок);
extern (C) проц   wxListItem_SetMask(ЦелУкз сам, цел маска);
extern (C) проц   wxListItem_SetState(ЦелУкз сам, цел состояние);
extern (C) проц   wxListItem_SetStateMask(ЦелУкз сам, цел маскаСостояния);
extern (C) проц   wxListItem_SetText(ЦелУкз сам, ткст текст);
extern (C) проц   wxListItem_SetTextColour(ЦелУкз сам, ЦелУкз кол);
extern (C) проц   wxListItem_SetWidth(ЦелУкз сам, цел ширь);

extern (C) ЦелУкз wxListItem_GetAttributes(ЦелУкз сам);
extern (C) бул   wxListItem_HasAttributes(ЦелУкз сам);
//! \endcond

export class ЭлтСписка : ВизОбъект
{
    //---------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxListItem_ctor());
    }

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new ЭлтСписка(ptr);
    }

    //---------------------------------------------------------------------

    export проц очисть()
    {
        wxListItem_Clear(вхобъ);
    }

    //---------------------------------------------------------------------

    export проц очистьАтрибуты()
    {
        wxListItem_ClearAttributes(вхобъ);
    }

    //---------------------------------------------------------------------

    export цел расположи()
    {
        return wxListItem_GetAlign(вхобъ);
    }
    export проц расположи(цел значение)
    {
        wxListItem_SetAlign(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export Цвет цветФона()
    {
        return new Цвет(wxListItem_GetBackgroundColour(вхобъ), да);
    }
    export проц цветФона(Цвет значение)
    {
        wxListItem_SetBackgroundColour(вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    export цел колонка()
    {
        return wxListItem_GetColumn(вхобъ);
    }
    export проц колонка(цел значение)
    {
        wxListItem_SetColumn(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export ДанныеКлиента данные()
    {
        return cast(ДанныеКлиента)найдиОбъект(wxListItem_GetData(вхобъ));
    }
    export проц данные(ДанныеКлиента значение)
    {
        wxListItem_SetData(вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    export Шрифт шрифт()
    {
        return new Шрифт(wxListItem_GetFont(вхобъ));
    }
    export проц шрифт(Шрифт значение)
    {
        wxListItem_SetFont(вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    export цел ид()
    {
        return wxListItem_GetId(вхобъ);
    }
    export проц ид(цел значение)
    {
        wxListItem_SetId(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export цел рисунок()
    {
        return wxListItem_GetImage(вхобъ);
    }
    export проц рисунок(цел значение)
    {
        wxListItem_SetImage(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export цел маска()
    {
        return wxListItem_GetMask(вхобъ);
    }
    export проц маска(цел значение)
    {
        wxListItem_SetMask(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export цел состояние()
    {
        return wxListItem_GetState(вхобъ);
    }
    export проц состояние(цел значение)
    {
        wxListItem_SetState(вхобъ, значение);
    }

    export проц маскаСостояния(цел значение)
    {
        wxListItem_SetStateMask(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export ткст текст()
    {
        return cast(ткст) new ВизТкст(wxListItem_GetText(вхобъ), да);
    }
    export проц текст(ткст значение)
    {
        wxListItem_SetText(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export Цвет цветТекста()
    {
        return new Цвет(wxListItem_GetTextColour(вхобъ), да);
    }
    export проц цветТекста(Цвет значение)
    {
        wxListItem_SetTextColour(вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    export цел ширь()
    {
        return wxListItem_GetWidth(вхобъ);
    }
    export проц ширь(цел значение)
    {
        wxListItem_SetWidth(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export АтрЭлтаСписка атрибуты()
    {
        return cast(АтрЭлтаСписка)найдиОбъект(wxListItem_GetAttributes(вхобъ), &АтрЭлтаСписка.Нов);
    }

    //---------------------------------------------------------------------

    export бул естьАтрибуты()
    {
        return wxListItem_HasAttributes(вхобъ);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxListItemAttr_ctor();
extern (C) ЦелУкз wxListItemAttr_ctor2(ЦелУкз цвТекст, ЦелУкз цвФон, ЦелУкз шрифт);
extern (C) проц   wxListItemAttr_dtor(ЦелУкз сам);
extern (C) проц   wxListItemAttr_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
extern (C) проц   wxListItemAttr_SetTextColour(ЦелУкз сам, ЦелУкз цвТекст);
extern (C) проц   wxListItemAttr_SetBackgroundColour(ЦелУкз сам, ЦелУкз цвФон);
extern (C) проц   wxListItemAttr_SetFont(ЦелУкз сам, ЦелУкз шрифт);
extern (C) бул   wxListItemAttr_HasTextColour(ЦелУкз сам);
extern (C) бул   wxListItemAttr_HasBackgroundColour(ЦелУкз сам);
extern (C) бул   wxListItemAttr_HasFont(ЦелУкз сам);
extern (C) ЦелУкз wxListItemAttr_GetTextColour(ЦелУкз сам);
extern (C) ЦелУкз wxListItemAttr_GetBackgroundColour(ЦелУкз сам);
extern (C) ЦелУкз wxListItemAttr_GetFont(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class АтрЭлтаСписка : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    private this(ЦелУкз вхобъ, бул памСобств)
    {
        super(вхобъ);
        this.памСобств = памСобств;
    }

    export this()
    {
        this(wxListItemAttr_ctor(), да);
        wxListItemAttr_RegisterDisposable(вхобъ, &VirtualDispose);
    }

    export this(Цвет цвТекст, Цвет цвФон, Шрифт шрифт)
    {
        this(wxListItemAttr_ctor2(ВизОбъект.безопУк(цвТекст), ВизОбъект.безопУк(цвФон), ВизОбъект.безопУк(шрифт)), да);
        wxListItemAttr_RegisterDisposable(вхобъ, &VirtualDispose);
    }

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new АтрЭлтаСписка(ptr);
    }
    //---------------------------------------------------------------------

    private override проц dtor()
    {
        wxListItemAttr_dtor(вхобъ);
    }

    //---------------------------------------------------------------------

    export Цвет цветТекста()
    {
        return new Цвет(wxListItemAttr_GetTextColour(вхобъ), да);
    }
    export проц цветТекста(Цвет значение)
    {
        wxListItemAttr_SetTextColour(вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    export Цвет цветФона()
    {
        return new Цвет(wxListItemAttr_GetBackgroundColour(вхобъ), да);
    }
    export проц цветФона(Цвет значение)
    {
        wxListItemAttr_SetBackgroundColour(вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    export Шрифт шрифт()
    {
        return new Шрифт(wxListItemAttr_GetFont(вхобъ), да);
    }
    export проц шрифт(Шрифт значение)
    {
        wxListItemAttr_SetFont(вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    export бул естьЦветТекста()
    {
        return wxListItemAttr_HasTextColour(вхобъ);
    }

    //---------------------------------------------------------------------

    export бул естьЦветФона()
    {
        return wxListItemAttr_HasBackgroundColour(вхобъ);
    }

    //---------------------------------------------------------------------

    export бул естьШрифт()
    {
        return wxListItemAttr_HasFont(вхобъ);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C)
{
    alias ЦелУкз function (СписокКтрл, цел) Virtual_OnGetItemAttr;
    alias цел function (СписокКтрл, цел) Virtual_OnGetItemImage;
    alias цел function (СписокКтрл, цел, цел) Virtual_OnGetItemColumnImage;
    alias ткст function (СписокКтрл, цел, цел) Virtual_OnGetItemText;

    alias цел function(цел элт1, цел элт2, цел sortData) списокКтрлСравни;
}

extern (C) ЦелУкз wxListCtrl_ctor();
extern (C) проц   wxListCtrl_dtor(ЦелУкз сам);
extern (C) проц   wxListCtrl_RegisterVirtual(ЦелУкз сам, СписокКтрл объ, Virtual_OnGetItemAttr onGetItemAttr,
        Virtual_OnGetItemImage onGetItemImage,
        Virtual_OnGetItemColumnImage onGetItemColumnImage,
        Virtual_OnGetItemText onGetItemText);
extern (C) бул   wxListCtrl_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер размер, бцел стиль, ЦелУкз оценщик, ткст имя);
extern (C) бул   wxListCtrl_GetColumn(ЦелУкз сам, цел кол, inout ЦелУкз элт);
extern (C) бул   wxListCtrl_SetColumn(ЦелУкз сам, цел кол, ЦелУкз элт);
extern (C) цел    wxListCtrl_GetColumnWidth(ЦелУкз сам, цел кол);
extern (C) бул   wxListCtrl_SetColumnWidth(ЦелУкз сам, цел кол, цел ширь);
extern (C) цел    wxListCtrl_GetCountPerPage(ЦелУкз сам);
extern (C) ЦелУкз wxListCtrl_GetItem(ЦелУкз сам, ЦелУкз инфо, inout бул retval);
extern (C) бул   wxListCtrl_SetItem(ЦелУкз сам, ЦелУкз инфо);
extern (C) цел    wxListCtrl_SetItem_By_Row_Col(ЦелУкз сам, цел индекс, цел кол, ткст ярлык, цел идРисунка);
extern (C) цел    wxListCtrl_GetItemState(ЦелУкз сам, цел элт, цел маскаСостояния);
extern (C) бул   wxListCtrl_SetItemState(ЦелУкз сам, цел элт, цел состояние, цел маскаСостояния);
extern (C) бул   wxListCtrl_SetItemImage(ЦелУкз сам, цел элт, цел рисунок, цел выделенРис);
extern (C) ЦелУкз wxListCtrl_GetItemText(ЦелУкз сам, цел элт);
extern (C) проц   wxListCtrl_SetItemText(ЦелУкз сам, цел элт, ткст стр);
extern (C) ЦелУкз wxListCtrl_GetItemData(ЦелУкз сам, цел элт);
extern (C) бул   wxListCtrl_SetItemData(ЦелУкз сам, цел элт, ЦелУкз данные);
extern (C) бул   wxListCtrl_SetItemData2(ЦелУкз сам, цел элт, цел данные);
extern (C) бул   wxListCtrl_GetItemRect(ЦелУкз сам, цел элт, out Прямоугольник прям, цел код);
extern (C) бул   wxListCtrl_GetItemPosition(ЦелУкз сам, цел элт, out Точка поз);
extern (C) бул   wxListCtrl_SetItemPosition(ЦелУкз сам, цел элт, inout Точка поз);
extern (C) цел    wxListCtrl_GetItemCount(ЦелУкз сам);
extern (C) цел    wxListCtrl_GetColumnCount(ЦелУкз сам);
extern (C) проц   wxListCtrl_SetItemTextColour(ЦелУкз сам, цел элт, ЦелУкз кол);
extern (C) ЦелУкз wxListCtrl_GetItemTextColour(ЦелУкз сам, цел элт);
extern (C) проц   wxListCtrl_SetItemBackgroundColour(ЦелУкз сам, цел элт, ЦелУкз кол);
extern (C) ЦелУкз wxListCtrl_GetItemBackgroundColour(ЦелУкз сам, цел элт);
extern (C) цел    wxListCtrl_GetSelectedItemCount(ЦелУкз сам);
extern (C) ЦелУкз wxListCtrl_GetTextColour(ЦелУкз сам);
extern (C) проц   wxListCtrl_SetTextColour(ЦелУкз сам, ЦелУкз кол);
extern (C) цел    wxListCtrl_GetTopItem(ЦелУкз сам);
extern (C) проц   wxListCtrl_SetSingleStyle(ЦелУкз сам, бцел стиль, бул добавить);
extern (C) проц   wxListCtrl_SetWindowStyleFlag(ЦелУкз сам, бцел стиль);
extern (C) цел    wxListCtrl_GetNextItem(ЦелУкз сам, цел элт, цел geometry, цел состояние);
extern (C) ЦелУкз wxListCtrl_GetImageList(ЦелУкз сам, цел который);
extern (C) проц   wxListCtrl_SetImageList(ЦелУкз сам, ЦелУкз списокРисунков, цел который);
extern (C) проц   wxListCtrl_AssignImageList(ЦелУкз сам, ЦелУкз списокРисунков, цел который);
extern (C) бул   wxListCtrl_Arrange(ЦелУкз сам, цел флаг);
extern (C) проц   wxListCtrl_ClearAll(ЦелУкз сам);
extern (C) бул   wxListCtrl_DeleteItem(ЦелУкз сам, цел элт);
extern (C) бул   wxListCtrl_DeleteAllItems(ЦелУкз сам);
extern (C) бул   wxListCtrl_DeleteAllColumns(ЦелУкз сам);
extern (C) бул   wxListCtrl_DeleteColumn(ЦелУкз сам, цел кол);
extern (C) проц   wxListCtrl_SetItemCount(ЦелУкз сам, цел счёт);
extern (C) проц   wxListCtrl_EditLabel(ЦелУкз сам, цел элт);
extern (C) бул   wxListCtrl_EnsureVisible(ЦелУкз сам, цел элт);
extern (C) цел    wxListCtrl_FindItem(ЦелУкз сам, цел старт, ткст стр, бул частично);
extern (C) цел    wxListCtrl_FindItemData(ЦелУкз сам, цел старт, ЦелУкз данные);
extern (C) цел    wxListCtrl_FindItemPoint(ЦелУкз сам, цел старт, inout Точка тчк, цел направление);
extern (C) цел    wxListCtrl_HitTest(ЦелУкз сам, inout Точка Точка, цел флаги);
extern (C) цел    wxListCtrl_InsertItem(ЦелУкз сам, ЦелУкз инфо);
extern (C) цел    wxListCtrl_InsertTextItem(ЦелУкз сам, цел индекс, ткст ярлык);
extern (C) цел    wxListCtrl_InsertImageItem(ЦелУкз сам, цел индекс, цел индексРис);
extern (C) цел    wxListCtrl_InsertTextImageItem(ЦелУкз сам, цел индекс, ткст ярлык, цел индексРис);
extern (C) цел    wxListCtrl_InsertColumn(ЦелУкз сам, цел кол, ЦелУкз инфо);
extern (C) цел    wxListCtrl_InsertTextColumn(ЦелУкз сам, цел кол, ткст заг, цел format, цел ширь);
extern (C) бул   wxListCtrl_ScrollList(ЦелУкз сам, цел dx, цел dy);
extern (C) бул   wxListCtrl_SortItems(ЦелУкз сам, списокКтрлСравни fn, цел данные);

extern (C) проц   wxListCtrl_GetViewRect(ЦелУкз сам, inout Прямоугольник прям);

extern (C) проц   wxListCtrl_RefreshItem(ЦелУкз сам, цел элт);
extern (C) проц   wxListCtrl_RefreshItems(ЦелУкз сам, цел элтFrom, цел элтTo);
//! \endcond

export class СписокКтрл : Контрол
{
    public const цел wxLC_VRULES           = 0x0001;
    public const цел wxLC_HRULES           = 0x0002;

    public const цел wxLC_ICON             = 0x0004;
    public const цел wxLC_SMALL_ICON       = 0x0008;
    public const цел wxLC_LIST             = 0x0010;
    public const цел wxLC_REPORT           = 0x0020;

    public const цел wxLC_ALIGN_TOP        = 0x0040;
    public const цел wxLC_ALIGN_LEFT       = 0x0080;
    public const цел wxLC_AUTO_ARRANGE     = 0x0100;
    public const цел wxLC_VIRTUAL          = 0x0200;
    public const цел wxLC_EDIT_LABELS      = 0x0400;
    public const цел wxLC_NO_HEADER        = 0x0800;
    public const цел wxLC_NO_SORT_HEADER   = 0x1000;
    public const цел wxLC_SINGLE_SEL       = 0x2000;
    public const цел wxLC_SORT_ASCENDING   = 0x4000;
    public const цел wxLC_SORT_DESCENDING  = 0x8000;

    public const цел wxLC_MASK_TYPE        = (wxLC_ICON | wxLC_SMALL_ICON | wxLC_LIST | wxLC_REPORT);
    public const цел wxLC_MASK_ALIGN       = (wxLC_ALIGN_TOP | wxLC_ALIGN_LEFT);
    public const цел wxLC_MASK_SORT        = (wxLC_SORT_ASCENDING | wxLC_SORT_DESCENDING);

    public const цел wxLIST_FORMAT_LEFT     = 0;
    public const цел wxLIST_FORMAT_RIGHT    = 1;
    public const цел wxLIST_FORMAT_CENTRE   = 2;
    public const цел wxLIST_FORMAT_CENTER   = wxLIST_FORMAT_CENTRE;

    public const цел wxLIST_MASK_STATE         = 0x0001;
    public const цел wxLIST_MASK_TEXT          = 0x0002;
    public const цел wxLIST_MASK_IMAGE         = 0x0004;
    public const цел wxLIST_MASK_DATA          = 0x0008;
    public const цел wxLIST_SET_ITEM           = 0x0010;
    public const цел wxLIST_MASK_WIDTH         = 0x0020;
    public const цел wxLIST_MASK_FORMAT        = 0x0040;

    public const цел wxLIST_NEXT_ABOVE     = 1;
    public const цел wxLIST_NEXT_ALL       = 2;
    public const цел wxLIST_NEXT_BELOW     = 3;
    public const цел wxLIST_NEXT_LEFT      = 4;
    public const цел wxLIST_NEXT_RIGHT     = 5;

    public const цел wxLIST_STATE_DONTCARE     = 0x0000;
    public const цел wxLIST_STATE_DROPHILITED  = 0x0001;
    public const цел wxLIST_STATE_FOCUSED      = 0x0002;
    public const цел wxLIST_STATE_SELECTED     = 0x0004;
    public const цел wxLIST_STATE_CUT          = 0x0008;

    public const цел wxLIST_HITTEST_ABOVE          = 0x0001;
    public const цел wxLIST_HITTEST_BELOW          = 0x0002;
    public const цел wxLIST_HITTEST_NOWHERE        = 0x0004;
    public const цел wxLIST_HITTEST_ONITEMICON     = 0x0020;
    public const цел wxLIST_HITTEST_ONITEMLABEL    = 0x0080;
    public const цел wxLIST_HITTEST_ONITEMRIGHT    = 0x0100;
    public const цел wxLIST_HITTEST_ONITEMSTATEICON= 0x0200;
    public const цел wxLIST_HITTEST_TOLEFT         = 0x0400;
    public const цел wxLIST_HITTEST_TORIGHT        = 0x0800;

    public const цел wxLIST_AUTOSIZE			= -1;
    public const цел wxLIST_AUTOSIZE_USEHEADER	= -2;

    //---------------------------------------------------------------------

    //---------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxListCtrl_ctor());
    }

    export this(Окно родитель, цел ид /*= ЛЮБОЙ*/, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = wxLC_ICON, Оценщик оценщик = пусто, ткст имя = "СписокКтрл")
    {
        super(wxListCtrl_ctor());
        if (!создай(родитель, ид, поз, размер, стиль, оценщик, имя))
        {
            throw new ИсклНевернОперации("Не удалось создать СписокКтрл");
        }

        wxListCtrl_RegisterVirtual(вхобъ, this, &staticOnGetItemAttr,
                                   &staticOnGetItemImage, &staticOnGetItemColumnImage,
                                   &staticOnGetItemText);
    }

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new СписокКтрл(ptr);
    }
    //---------------------------------------------------------------------
    // ctors with сам created ид

    export this(Окно родитель, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = wxLC_ICON, Оценщик оценщик = пусто, ткст имя = "СписокКтрл")
    {
        this(родитель, Окно.уникИд, поз, размер, стиль, оценщик, имя);
    }

    //---------------------------------------------------------------------

    export бул создай(Окно родитель, цел ид, Точка поз, Размер размер, цел стиль, Оценщик оценщик, ткст имя)
    {
        return wxListCtrl_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, поз, размер, cast(бцел)стиль, ВизОбъект.безопУк(оценщик), имя);
    }

    //---------------------------------------------------------------------

    static export extern(C) ЦелУкз staticOnGetItemAttr(СписокКтрл объ, цел элт)
    {
        return ВизОбъект.безопУк(объ.приПолученииАтраЭлта(элт));
    }
    export  АтрЭлтаСписка приПолученииАтраЭлта(цел элт)
    {
        return пусто;
    }

    //---------------------------------------------------------------------

    static export extern(C) цел staticOnGetItemImage(СписокКтрл объ, цел элт)
    {
        return объ.приПолученииРисункаЭлта(элт);
    }
    export  цел приПолученииРисункаЭлта(цел элт)
    {
        return -1;
    }

    //---------------------------------------------------------------------

    static export extern(C) цел staticOnGetItemColumnImage(СписокКтрл объ, цел элт, цел колонка)
    {
        return объ.приПолученииРисункаКолонкиЭлта(элт, колонка);
    }
    export  цел приПолученииРисункаКолонкиЭлта(цел элт, цел колонка)
    {
        return -1;
    }

    //---------------------------------------------------------------------

    static export extern(C) ткст staticOnGetItemText(СписокКтрл объ, цел элт, цел колонка)
    {
        return объ.приПолученииТекстаЭлта(элт, колонка);
    }
    export  ткст приПолученииТекстаЭлта(цел элт, цел колонка)
    {
        assert(0, "Вызова генерного приПолученииТекстаЭлта не предполагалось");
    }

    //---------------------------------------------------------------------

    export бул дайКолонку(цел кол, out ЭлтСписка элт)
    {
        элт = new ЭлтСписка();
        return wxListCtrl_GetColumn(м_вхобъ, кол, элт.м_вхобъ);
    }

    //---------------------------------------------------------------------

    export бул устКолонку(цел кол, ЭлтСписка элт)
    {
        return wxListCtrl_SetColumn(м_вхобъ, кол, ВизОбъект.безопУк(элт));
    }

    //---------------------------------------------------------------------

    export цел дайШиринуКолонки(цел кол)
    {
        return wxListCtrl_GetColumnWidth(вхобъ, кол);
    }

    //---------------------------------------------------------------------

    export бул устШиринуКолонки(цел кол, цел ширь)
    {
        return wxListCtrl_SetColumnWidth(вхобъ, кол, ширь);
    }

    //---------------------------------------------------------------------

    export цел счётПостранично()
    {
        return wxListCtrl_GetCountPerPage(вхобъ);
    }

    //---------------------------------------------------------------------

    export бул дайЭлт(inout ЭлтСписка инфо)
    {
        бул retval = нет;
        инфо  = cast(ЭлтСписка)найдиОбъект(wxListCtrl_GetItem(вхобъ, ВизОбъект.безопУк(инфо), retval), &ЭлтСписка.Нов);
        return retval;
    }

    //---------------------------------------------------------------------

    export бул устЭлт(ЭлтСписка инфо)
    {
        return wxListCtrl_SetItem(вхобъ, ВизОбъект.безопУк(инфо));
    }

    export цел устЭлт(цел индекс, цел кол, ткст ярлык)
    {
        return устЭлт(индекс, кол, ярлык, -1);
    }

    export цел устЭлт(цел индекс, цел кол, ткст ярлык, цел идРисунка)
    {
        return wxListCtrl_SetItem_By_Row_Col(вхобъ, индекс, кол, ярлык, идРисунка);
    }


    //---------------------------------------------------------------------

    export проц устТекстЭлта(цел индекс, ткст ярлык)
    {
        wxListCtrl_SetItemText(вхобъ, индекс, ярлык);
    }

    //---------------------------------------------------------------------

    export ткст дайТекстЭлта(цел элт)
    {
        return cast(ткст) new ВизТкст(wxListCtrl_GetItemText(вхобъ, элт), да);
    }

    //---------------------------------------------------------------------

    export цел дайСостояниеЭлта(цел элт, цел маскаСостояния)
    {
        return wxListCtrl_GetItemState(вхобъ, элт, маскаСостояния);
    }

    export бул устСостояниеЭлта(цел элт, цел состояние, цел маскаСостояния)
    {
        return wxListCtrl_SetItemState(вхобъ, элт, состояние, маскаСостояния);
    }

    //---------------------------------------------------------------------

    export бул устРисунокЭлта(цел элт, цел рисунок, цел выделенРис)
    {
        return wxListCtrl_SetItemImage(вхобъ, элт, рисунок, выделенРис);
    }

    //---------------------------------------------------------------------

    export ДанныеКлиента дайДанныеЭлта(цел элт)
    {
        return cast(ДанныеКлиента)найдиОбъект(wxListCtrl_GetItemData(вхобъ, элт));
    }

    //---------------------------------------------------------------------

    export бул устДанныеЭлта(цел элт, ДанныеКлиента данные)
    {
        return wxListCtrl_SetItemData(вхобъ, элт, ВизОбъект.безопУк(данные));
    }

    //---------------------------------------------------------------------

    export бул устДанныеЭлта(цел элт, цел данные)
    {
        return wxListCtrl_SetItemData2(вхобъ, элт, данные);
    }

    //---------------------------------------------------------------------

    export бул дайПрямЭлта(цел элт, out Прямоугольник прям, цел код)
    {
        return wxListCtrl_GetItemRect(вхобъ, элт, прям, код);
    }

    //---------------------------------------------------------------------

    export бул дайПозициюЭлта(цел элт, out Точка поз)
    {
        return wxListCtrl_GetItemPosition(вхобъ, элт, поз);
    }

    //---------------------------------------------------------------------

    export бул устПозЭлта(цел элт, Точка поз)
    {
        return wxListCtrl_SetItemPosition(вхобъ, элт, поз);
    }

    //---------------------------------------------------------------------

    export цел счётЭлтов()
    {
        return wxListCtrl_GetItemCount(вхобъ);
    }
    export проц счётЭлтов(цел значение)
    {
        wxListCtrl_SetItemCount(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export цел счётКолонок()
    {
        return wxListCtrl_GetColumnCount(вхобъ);
    }

    //---------------------------------------------------------------------

    export проц устЦветТекстаЭлта(цел элт, Цвет кол)
    {
        wxListCtrl_SetItemTextColour(вхобъ, элт, ВизОбъект.безопУк(кол));
    }

    //---------------------------------------------------------------------

    export Цвет дайЦветТекстаЭлта(цел элт)
    {
        return new Цвет(wxListCtrl_GetItemTextColour(вхобъ, элт), да);
    }

    //---------------------------------------------------------------------

    export проц устЦветФонаТекстаЭлта(цел элт, Цвет кол)
    {
        wxListCtrl_SetItemBackgroundColour(вхобъ, элт, ВизОбъект.безопУк(кол));
    }

    //---------------------------------------------------------------------

    export Цвет дайЦветФонаЭлта(цел элт)
    {
        return new Цвет(wxListCtrl_GetItemBackgroundColour(вхобъ, элт), да);
    }

    //---------------------------------------------------------------------

    export цел члоВыбранныхЭлтов()
    {
        return wxListCtrl_GetSelectedItemCount(вхобъ);
    }

    //---------------------------------------------------------------------

    export Цвет цветТекста()
    {
        return new Цвет(wxListCtrl_GetTextColour(вхобъ), да);
    }
    export проц цветТекста(Цвет значение)
    {
        wxListCtrl_SetTextColour(вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    export цел верхнийЭлт()
    {
        return wxListCtrl_GetTopItem(вхобъ);
    }

    //---------------------------------------------------------------------

    export проц устЕдинСтиль(цел стиль, бул добавить)
    {
        wxListCtrl_SetSingleStyle(вхобъ, cast(бцел)стиль, добавить);
    }

    //---------------------------------------------------------------------

    export проц флагСтиляОкна(цел значение)
    {
        wxListCtrl_SetWindowStyleFlag(вхобъ, cast(бцел)значение);
    }

    //---------------------------------------------------------------------

    export цел дайСледщЭлт(цел элт, цел geometry, цел состояние)
    {
        return wxListCtrl_GetNextItem(вхобъ, элт, geometry, состояние);
    }

    //---------------------------------------------------------------------

    export СписокРисунков дайСписокРисунков(цел который)
    {
        return cast(СписокРисунков)найдиОбъект(wxListCtrl_GetImageList(вхобъ, который), &СписокРисунков.Нов);
    }

    //---------------------------------------------------------------------

    export проц устСписокРисунков(СписокРисунков списокРисунков, цел который)
    {
        wxListCtrl_SetImageList(вхобъ, ВизОбъект.безопУк(списокРисунков), который);
    }

    //---------------------------------------------------------------------

    export проц присвойСписокРисунков(СписокРисунков списокРисунков, цел который)
    {
        wxListCtrl_AssignImageList(вхобъ, ВизОбъект.безопУк(списокРисунков), который);
    }

    //---------------------------------------------------------------------

    export бул аранжируй(цел флаг)
    {
        return wxListCtrl_Arrange(вхобъ, флаг);
    }

    //---------------------------------------------------------------------

    export проц очистьВсё()
    {
        wxListCtrl_ClearAll(вхобъ);
    }

    //---------------------------------------------------------------------

    export бул удалиЭлт(цел элт)
    {
        return wxListCtrl_DeleteItem(вхобъ, элт);
    }

    //---------------------------------------------------------------------

    export бул удалиВсеЭлты()
    {
        return wxListCtrl_DeleteAllItems(вхобъ);
    }

    //---------------------------------------------------------------------

    export бул удалиВсеКолонки()
    {
        return wxListCtrl_DeleteAllColumns(вхобъ);
    }

    //---------------------------------------------------------------------

    export бул удалиКолонку(цел кол)
    {
        return wxListCtrl_DeleteColumn(вхобъ, кол);
    }

    //---------------------------------------------------------------------

    export проц редактируйНадпись(цел элт)
    {
        wxListCtrl_EditLabel(вхобъ, элт);
    }

    //---------------------------------------------------------------------

    export бул убедисьЧтоВиден(цел элт)
    {
        return wxListCtrl_EnsureVisible(вхобъ, элт);
    }

    //---------------------------------------------------------------------

    export цел найдиЭлт(цел старт, ткст стр, бул частично)
    {
        return wxListCtrl_FindItem(вхобъ, старт, стр, частично);
    }

    // TODO: Verify данные
    export цел найдиЭлт(цел старт, ДанныеКлиента данные)
    {
        return wxListCtrl_FindItemData(вхобъ, старт, ВизОбъект.безопУк(данные));
    }

    export цел найдиЭлт(цел старт, Точка тчк, цел направление)
    {
        return wxListCtrl_FindItemPoint(вхобъ, старт, тчк, направление);
    }

    //---------------------------------------------------------------------

    export цел тестНажатия(Точка точка, цел флаги)
    {
        return wxListCtrl_HitTest(вхобъ, точка, флаги);
    }

    //---------------------------------------------------------------------

    export цел вставьЭлт(ЭлтСписка инфо)
    {
        return wxListCtrl_InsertItem(вхобъ, ВизОбъект.безопУк(инфо));
    }

    export цел вставьЭлт(цел индекс, ткст ярлык)
    {
        return wxListCtrl_InsertTextItem(вхобъ, индекс, ярлык);
    }

    export цел вставьЭлт(цел индекс, цел индексРис)
    {
        return wxListCtrl_InsertImageItem(вхобъ, индекс, индексРис);
    }

    export цел вставьЭлт(цел индекс, ткст ярлык, цел индексРис)
    {
        return wxListCtrl_InsertTextImageItem(вхобъ, индекс, ярлык, индексРис);
    }

    //---------------------------------------------------------------------

    export цел вставьКолонку(цел кол, ЭлтСписка инфо)
    {
        return wxListCtrl_InsertColumn(вхобъ, кол, ВизОбъект.безопУк(инфо));
    }

    export цел вставьКолонку(цел кол, ткст заг)
    {
        return вставьКолонку(кол, заг, wxLIST_FORMAT_LEFT, -1);
    }

    export цел вставьКолонку(цел кол, ткст заг, цел format, цел ширь)
    {
        return wxListCtrl_InsertTextColumn(вхобъ, кол, заг, format, ширь);
    }

    //---------------------------------------------------------------------

    export бул промотайСписок(цел dx, цел dy)
    {
        return wxListCtrl_ScrollList(вхобъ, dx, dy);
    }

    //---------------------------------------------------------------------

    export Прямоугольник покажиПрям()
    {
        Прямоугольник прям;
        wxListCtrl_GetViewRect(вхобъ, прям);
        return прям;
    }

    //---------------------------------------------------------------------

    export проц освежиЭлт(цел элт)
    {
        wxListCtrl_RefreshItem(вхобъ, элт);
    }

    //---------------------------------------------------------------------

    export проц освежиЭлты(цел элтFrom, цел элтTo)
    {
        wxListCtrl_RefreshItems(вхобъ, элтFrom, элтTo);
    }

    //-----------------------------------------------------------------------------

    export бул сортируйЭлты(списокКтрлСравни fn, цел данные)
    {
        бул retval = wxListCtrl_SortItems(вхобъ, fn, данные);

        fn = пусто;

        return retval;
    }

    //-----------------------------------------------------------------------------

    export проц BeginDrag_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_СПИСОК_НАЧАЛО_ТЯГА, ид, значение, this);
    }
    export проц BeginDrag_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    //-----------------------------------------------------------------------------

    export проц BeginRightDrag_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_СПИСОК_НАЧАЛО_ПТЯГА, ид, значение, this);
    }
    export проц BeginRightDrag_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    //-----------------------------------------------------------------------------

    export проц BeginLabelEdit_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_СПИСОК_НАЧАЛО_РЕДАКТИРОВАНИЯ_ЯРЛЫКА, ид, значение, this);
    }
    export проц BeginLabelEdit_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    //-----------------------------------------------------------------------------

    export проц EndLabelEdit_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_СПИСОК_КОНЕЦ_РЕДАКТИРОВАНИЯ_ЯРЛЫКА, ид, значение, this);
    }
    export проц EndLabelEdit_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    //-----------------------------------------------------------------------------

    export проц ItemDelete_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_СПИСОК_УДАЛИТЬ_ЭЛТ, ид, значение, this);
    }
    export проц ItemDelete_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    //-----------------------------------------------------------------------------

    export проц ItemDeleteAll_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_СПИСОК_УДАЛИТЬ_ВСЕ_ЭЛТЫ, ид, значение, this);
    }
    export проц ItemDeleteAll_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    //-----------------------------------------------------------------------------

    export проц GetInfo_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_СПИСОК_ДАТЬ_ИНФО, ид, значение, this);
    }
    export проц GetInfo_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    //-----------------------------------------------------------------------------

    export проц SetInfo_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_СПИСОК_УСТ_ИНФО, ид, значение, this);
    }
    export проц SetInfo_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    //-----------------------------------------------------------------------------

    export проц ItemSelect_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_СПИСОК_ЭЛТ_ВЫДЕЛЕН, ид, значение, this);
    }
    export проц ItemSelect_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    //-----------------------------------------------------------------------------

    export проц ItemDeselect_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_СПИСОК_ЭЛТ_ДЕСЕЛЕКТИРОВАН, ид, значение, this);
    }
    export проц ItemDeselect_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    //-----------------------------------------------------------------------------

    export проц ItemActivate_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_СПИСОК_ЭЛТ_АКТИВИРОВАН, ид, значение, this);
    }
    export проц ItemActivate_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    //-----------------------------------------------------------------------------

    export проц ItemFocus_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_СПИСОК_ЭЛТ_ФОКУСИРОВАН, ид, значение, this);
    }
    export проц ItemFocus_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    //-----------------------------------------------------------------------------

    export проц ItemMiddleClick_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_СПИСОК_ЭЛТ_СРЕДНЯЯ_НАЖАТА, ид, значение, this);
    }
    export проц ItemMiddleClick_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    //-----------------------------------------------------------------------------

    export проц ItemRightClick_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_СПИСОК_ЭЛТ_ПРАВАЯ_НАЖАТА, ид, значение, this);
    }
    export проц ItemRightClick_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    //-----------------------------------------------------------------------------

    export override проц KeyDown_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_СПИСОК_КЛАВИША_ВНИЗУ, ид, значение, this);
    }
    export override проц KeyDown_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    //-----------------------------------------------------------------------------

    export проц Insert_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_СПИСОК_ВСТАВИТЬ_ЭЛТ, ид, значение, this);
    }
    export проц Insert_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    //-----------------------------------------------------------------------------

    export проц ColumnClick_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_СПИСОК_КОЛ_НАЖАТА, ид, значение, this);
    }
    export проц ColumnClick_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    //-----------------------------------------------------------------------------

    export проц ColumnRightClick_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_СПИСОК_КОЛ_ПРАВАЯ_НАЖАТА, ид, значение, this);
    }
    export проц ColumnRightClick_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    //-----------------------------------------------------------------------------

    export проц ColumnBeginDrag_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_СПИСОК_КОЛ_НАЧАЛО_ТЯГА, ид, значение, this);
    }
    export проц ColumnBeginDrag_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    //-----------------------------------------------------------------------------

    export проц ColumnDragging_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_СПИСОК_КОЛ_ТЯГ, ид, значение, this);
    }
    export проц ColumnDragging_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    //-----------------------------------------------------------------------------

    export проц ColumnEndDrag_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_СПИСОК_КОЛ_КОНЕЦ_ТЯГА, ид, значение, this);
    }
    export проц ColumnEndDrag_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    //-----------------------------------------------------------------------------

    export проц CacheHint_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_СПИСОК_КЭШ_ХИНТ, ид, значение, this);
    }
    export проц CacheHint_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxListEvent_ctor(цел типКоманды, цел ид);
extern (C) ЦелУкз wxListEvent_GetItem(ЦелУкз сам);
extern (C) ЦелУкз wxListEvent_GetLabel(ЦелУкз сам);
extern (C) цел   wxListEvent_GetIndex(ЦелУкз сам);
extern (C) цел    wxListEvent_GetKeyCode(ЦелУкз сам);
extern (C) цел    wxListEvent_GetColumn(ЦелУкз сам);
extern (C) проц   wxListEvent_GetPoint(ЦелУкз сам, inout Точка тчк);
extern (C) ЦелУкз wxListEvent_GetText(ЦелУкз сам);
extern (C) цел wxListEvent_GetImage(ЦелУкз сам);
extern (C) цел wxListEvent_GetData(ЦелУкз сам);
extern (C) цел wxListEvent_GetMask(ЦелУкз сам);
extern (C) цел wxListEvent_GetCacheFrom(ЦелУкз сам);
extern (C) цел wxListEvent_GetCacheTo(ЦелУкз сам);
extern (C) бул wxListEvent_IsEditCancelled(ЦелУкз сам);
extern (C) проц wxListEvent_SetEditCanceled(ЦелУкз сам, бул editCancelled);
extern (C) проц wxListEvent_Veto(ЦелУкз сам);
extern (C) проц wxListEvent_Allow(ЦелУкз сам);
extern (C) бул wxListEvent_IsAllowed(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

export class СобытиеСписка : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(цел типКоманды, цел ид)
    {
        super(wxListEvent_ctor(типКоманды, ид));
    }

    static Событие Нов(ЦелУкз ptr)
    {
        return new СобытиеСписка(ptr);
    }
    //-----------------------------------------------------------------------------

    export ткст ярлык()
    {
        return cast(ткст) new ВизТкст(wxListEvent_GetLabel(вхобъ), да);
    }

    //-----------------------------------------------------------------------------

    export цел кодКл()
    {
        return wxListEvent_GetKeyCode(вхобъ);
    }

    //---------------------------------------------------------------------

    export цел индекс()
    {
        return wxListEvent_GetIndex(вхобъ);
    }

    //---------------------------------------------------------------------

    export ЭлтСписка элемент()
    {
        return new ЭлтСписка(wxListEvent_GetItem(вхобъ));
    }

    //---------------------------------------------------------------------

    export цел колонка()
    {
        return wxListEvent_GetColumn(вхобъ);
    }

    //---------------------------------------------------------------------

    export Точка точка()
    {
        Точка тчк;
        wxListEvent_GetPoint(вхобъ, тчк);
        return тчк;
    }

    //---------------------------------------------------------------------

    export ткст текст()
    {
        return cast(ткст) new ВизТкст(wxListEvent_GetText(вхобъ), да);
    }

    //---------------------------------------------------------------------

    export цел рисунок()
    {
        return wxListEvent_GetImage(вхобъ);
    }

    //---------------------------------------------------------------------

    export цел данные()
    {
        return wxListEvent_GetData(вхобъ);
    }

    //---------------------------------------------------------------------

    export цел маска()
    {
        return wxListEvent_GetMask(вхобъ);
    }

    //---------------------------------------------------------------------

    export цел кэшируйИз()
    {
        return wxListEvent_GetCacheFrom(вхобъ);
    }

    //---------------------------------------------------------------------

    export цел кэшируйВ()
    {
        return wxListEvent_GetCacheTo(вхобъ);
    }

    //---------------------------------------------------------------------

    export бул редактированиеОтменено()
    {
        return wxListEvent_IsEditCancelled(вхобъ);
    }
    export проц редактированиеОтменено(бул значение)
    {
        wxListEvent_SetEditCanceled(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export проц запрет()
    {
        wxListEvent_Veto(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц позволить()
    {
        wxListEvent_Allow(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул позволено()
    {
        return wxListEvent_IsAllowed(вхобъ);
    }

    static this()
    {


        Событие.Тип.СОБ_КОМАНДА_СПИСОК_НАЧАЛО_ТЯГА = wxEvent_EVT_COMMAND_LIST_BEGIN_DRAG();
        Событие.Тип.СОБ_КОМАНДА_СПИСОК_НАЧАЛО_ПТЯГА = wxEvent_EVT_COMMAND_LIST_BEGIN_RDRAG();
        Событие.Тип.СОБ_КОМАНДА_СПИСОК_НАЧАЛО_РЕДАКТИРОВАНИЯ_ЯРЛЫКА = wxEvent_EVT_COMMAND_LIST_BEGIN_LABEL_EDIT();
        Событие.Тип.СОБ_КОМАНДА_СПИСОК_КОНЕЦ_РЕДАКТИРОВАНИЯ_ЯРЛЫКА = wxEvent_EVT_COMMAND_LIST_END_LABEL_EDIT();
        Событие.Тип.СОБ_КОМАНДА_СПИСОК_УДАЛИТЬ_ЭЛТ = wxEvent_EVT_COMMAND_LIST_DELETE_ITEM();
        Событие.Тип.СОБ_КОМАНДА_СПИСОК_УДАЛИТЬ_ВСЕ_ЭЛТЫ = wxEvent_EVT_COMMAND_LIST_DELETE_ALL_ITEMS();
        Событие.Тип.СОБ_КОМАНДА_СПИСОК_ДАТЬ_ИНФО = wxEvent_EVT_COMMAND_LIST_GET_INFO();
        Событие.Тип.СОБ_КОМАНДА_СПИСОК_УСТ_ИНФО = wxEvent_EVT_COMMAND_LIST_SET_INFO();
        Событие.Тип.СОБ_КОМАНДА_СПИСОК_ЭЛТ_ВЫДЕЛЕН = wxEvent_EVT_COMMAND_LIST_ITEM_SELECTED();
        Событие.Тип.СОБ_КОМАНДА_СПИСОК_ЭЛТ_ДЕСЕЛЕКТИРОВАН = wxEvent_EVT_COMMAND_LIST_ITEM_DESELECTED();
        Событие.Тип.СОБ_КОМАНДА_СПИСОК_ЭЛТ_АКТИВИРОВАН = wxEvent_EVT_COMMAND_LIST_ITEM_ACTIVATED();
        Событие.Тип.СОБ_КОМАНДА_СПИСОК_ЭЛТ_ФОКУСИРОВАН = wxEvent_EVT_COMMAND_LIST_ITEM_FOCUSED();
        Событие.Тип.СОБ_КОМАНДА_СПИСОК_ЭЛТ_СРЕДНЯЯ_НАЖАТА = wxEvent_EVT_COMMAND_LIST_ITEM_MIDDLE_CLICK();
        Событие.Тип.СОБ_КОМАНДА_СПИСОК_ЭЛТ_ПРАВАЯ_НАЖАТА = wxEvent_EVT_COMMAND_LIST_ITEM_RIGHT_CLICK();
        Событие.Тип.СОБ_КОМАНДА_СПИСОК_КЛАВИША_ВНИЗУ = wxEvent_EVT_COMMAND_LIST_KEY_DOWN();
        Событие.Тип.СОБ_КОМАНДА_СПИСОК_ВСТАВИТЬ_ЭЛТ = wxEvent_EVT_COMMAND_LIST_INSERT_ITEM();
        Событие.Тип.СОБ_КОМАНДА_СПИСОК_КОЛ_НАЖАТА = wxEvent_EVT_COMMAND_LIST_COL_CLICK();
        Событие.Тип.СОБ_КОМАНДА_СПИСОК_КОЛ_ПРАВАЯ_НАЖАТА = wxEvent_EVT_COMMAND_LIST_COL_RIGHT_CLICK();
        Событие.Тип.СОБ_КОМАНДА_СПИСОК_КОЛ_НАЧАЛО_ТЯГА = wxEvent_EVT_COMMAND_LIST_COL_BEGIN_DRAG();
        Событие.Тип.СОБ_КОМАНДА_СПИСОК_КОЛ_ТЯГ = wxEvent_EVT_COMMAND_LIST_COL_DRAGGING();
        Событие.Тип.СОБ_КОМАНДА_СПИСОК_КОЛ_КОНЕЦ_ТЯГА = wxEvent_EVT_COMMAND_LIST_COL_END_DRAG();
        Событие.Тип.СОБ_КОМАНДА_СПИСОК_КЭШ_ХИНТ = wxEvent_EVT_COMMAND_LIST_CACHE_HINT();

        добавьТипСоб (Событие.Тип.СОБ_КОМАНДА_СПИСОК_НАЧАЛО_ТЯГА,	&СобытиеСписка.Нов);
        добавьТипСоб (Событие.Тип.СОБ_КОМАНДА_СПИСОК_НАЧАЛО_ПТЯГА,	&СобытиеСписка.Нов);
        добавьТипСоб (Событие.Тип.СОБ_КОМАНДА_СПИСОК_НАЧАЛО_РЕДАКТИРОВАНИЯ_ЯРЛЫКА,	&СобытиеСписка.Нов);
        добавьТипСоб (Событие.Тип.СОБ_КОМАНДА_СПИСОК_КОНЕЦ_РЕДАКТИРОВАНИЯ_ЯРЛЫКА,	&СобытиеСписка.Нов);
        добавьТипСоб (Событие.Тип.СОБ_КОМАНДА_СПИСОК_УДАЛИТЬ_ЭЛТ,	&СобытиеСписка.Нов);
        добавьТипСоб (Событие.Тип.СОБ_КОМАНДА_СПИСОК_УДАЛИТЬ_ВСЕ_ЭЛТЫ,	&СобытиеСписка.Нов);
        добавьТипСоб (Событие.Тип.СОБ_КОМАНДА_СПИСОК_ДАТЬ_ИНФО,	&СобытиеСписка.Нов);
        добавьТипСоб (Событие.Тип.СОБ_КОМАНДА_СПИСОК_УСТ_ИНФО,	&СобытиеСписка.Нов);
        добавьТипСоб (Событие.Тип.СОБ_КОМАНДА_СПИСОК_ЭЛТ_ВЫДЕЛЕН,	&СобытиеСписка.Нов);
        добавьТипСоб (Событие.Тип.СОБ_КОМАНДА_СПИСОК_ЭЛТ_ДЕСЕЛЕКТИРОВАН,	&СобытиеСписка.Нов);
        добавьТипСоб (Событие.Тип.СОБ_КОМАНДА_СПИСОК_ЭЛТ_АКТИВИРОВАН,	&СобытиеСписка.Нов);
        добавьТипСоб (Событие.Тип.СОБ_КОМАНДА_СПИСОК_ЭЛТ_ФОКУСИРОВАН,	&СобытиеСписка.Нов);
        добавьТипСоб (Событие.Тип.СОБ_КОМАНДА_СПИСОК_ЭЛТ_СРЕДНЯЯ_НАЖАТА,	&СобытиеСписка.Нов);
        добавьТипСоб (Событие.Тип.СОБ_КОМАНДА_СПИСОК_ЭЛТ_ПРАВАЯ_НАЖАТА,	&СобытиеСписка.Нов);
        добавьТипСоб (Событие.Тип.СОБ_КОМАНДА_СПИСОК_КЛАВИША_ВНИЗУ,	&СобытиеСписка.Нов);
        добавьТипСоб (Событие.Тип.СОБ_КОМАНДА_СПИСОК_ВСТАВИТЬ_ЭЛТ,	&СобытиеСписка.Нов);
        добавьТипСоб (Событие.Тип.СОБ_КОМАНДА_СПИСОК_КОЛ_НАЖАТА,	&СобытиеСписка.Нов);
        добавьТипСоб (Событие.Тип.СОБ_КОМАНДА_СПИСОК_КОЛ_ПРАВАЯ_НАЖАТА,	&СобытиеСписка.Нов);
        добавьТипСоб (Событие.Тип.СОБ_КОМАНДА_СПИСОК_КОЛ_НАЧАЛО_ТЯГА,	&СобытиеСписка.Нов);
        добавьТипСоб (Событие.Тип.СОБ_КОМАНДА_СПИСОК_КОЛ_ТЯГ,	&СобытиеСписка.Нов);
        добавьТипСоб (Событие.Тип.СОБ_КОМАНДА_СПИСОК_КОЛ_КОНЕЦ_ТЯГА,	&СобытиеСписка.Нов);
        добавьТипСоб (Событие.Тип.СОБ_КОМАНДА_СПИСОК_КЭШ_ХИНТ,	&СобытиеСписка.Нов);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxListView_ctor();
extern (C) бул wxListView_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер размер, бцел стиль, ЦелУкз оценщик, ткст имя);
extern (C) проц   wxListView_RegisterVirtual(ЦелУкз сам, СписокКтрл объ, Virtual_OnGetItemAttr onGetItemAttr,
        Virtual_OnGetItemImage onGetItemImage,
        Virtual_OnGetItemColumnImage onGetItemColumnImage,
        Virtual_OnGetItemText onGetItemText);
extern (C) проц wxListView_Select(ЦелУкз сам, бцел ч, бул on);
extern (C) проц wxListView_Focus(ЦелУкз сам, бцел индекс);
extern (C) бцел wxListView_GetFocusedItem(ЦелУкз сам);
extern (C) бцел wxListView_GetNextSelected(ЦелУкз сам, бцел элт);
extern (C) бцел wxListView_GetFirstSelected(ЦелУкз сам);
extern (C) бул wxListView_IsSelected(ЦелУкз сам, бцел индекс);
extern (C) проц wxListView_SetColumnImage(ЦелУкз сам, цел кол, цел рисунок);
extern (C) проц wxListView_ClearColumnImage(ЦелУкз сам, цел кол);
//! \endcond

//-----------------------------------------------------------------------------

export class ОбзорСписка : СписокКтрл
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxListView_ctor());
    }

    export this(Окно родитель)
    {
        this(родитель, Окно.уникИд, ДЕФПОЗ, ДЕФРАЗМ, wxLC_REPORT, пусто, пусто);
    }

    export this(Окно родитель, цел ид)
    {
        this(родитель, ид, ДЕФПОЗ, ДЕФРАЗМ, wxLC_REPORT, пусто, пусто);
    }

    export this(Окно родитель, цел ид, Точка поз)
    {
        this(родитель, ид, поз, ДЕФРАЗМ, wxLC_REPORT, пусто, пусто);
    }

    export this(Окно родитель, цел ид, Точка поз, Размер размер)
    {
        this(родитель, ид, поз, размер, wxLC_REPORT, пусто, пусто);
    }

    export this(Окно родитель, цел ид, Точка поз, Размер размер, цел стиль)
    {
        this(родитель, ид, поз, размер, стиль, пусто, пусто);
    }

    export this(Окно родитель, цел ид, Точка поз, Размер размер, цел стиль, Оценщик оценщик)
    {
        this(родитель, ид, поз, размер, стиль, оценщик, пусто);
    }

    export this(Окно родитель, цел ид, Точка поз, Размер размер, цел стиль, Оценщик оценщик, ткст имя)
    {
        super(wxListView_ctor());
        if (!создай(родитель, ид, поз, размер, стиль, оценщик, имя))
        {
            throw new ИсклНевернОперации("Не удалось создать ОбзорСписка");
        }

        wxListView_RegisterVirtual(вхобъ, this, &staticOnGetItemAttr,
                                   &staticOnGetItemImage, &staticOnGetItemColumnImage,
                                   &staticOnGetItemText);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    export this(Окно родитель, Точка поз)
    {
        this(родитель, Окно.уникИд, поз, ДЕФРАЗМ, wxLC_REPORT, пусто, пусто);
    }

    export this(Окно родитель, Точка поз, Размер размер)
    {
        this(родитель, Окно.уникИд, поз, размер, wxLC_REPORT, пусто, пусто);
    }

    export this(Окно родитель, Точка поз, Размер размер, цел стиль)
    {
        this(родитель, Окно.уникИд, поз, размер, стиль, пусто, пусто);
    }

    export this(Окно родитель, Точка поз, Размер размер, цел стиль, Оценщик оценщик)
    {
        this(родитель, Окно.уникИд, поз, размер, стиль, оценщик, пусто);
    }

    export this(Окно родитель, Точка поз, Размер размер, цел стиль, Оценщик оценщик, ткст имя)
    {
        this(родитель, Окно.уникИд, поз, размер, стиль, оценщик, имя);
    }

    //-----------------------------------------------------------------------------

    export override бул создай(Окно родитель, цел ид, Точка поз, Размер размер, цел стиль, Оценщик оценщик, ткст имя)
    {
        return wxListView_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, поз, размер, cast(бцел)стиль, ВизОбъект.безопУк(оценщик), имя);
    }

    //-----------------------------------------------------------------------------

    export проц выдели(цел ч)
    {
        выдели(ч, да);
    }

    export проц выдели(цел ч, бул on)
    {
        wxListView_Select(вхобъ, cast(бцел)ч, on);
    }

    //-----------------------------------------------------------------------------

    export проц фокусируй(цел индекс)
    {
        wxListView_Focus(вхобъ, cast(бцел)индекс);
    }

    //-----------------------------------------------------------------------------

    export цел элтВФокусе()
    {
        return cast(цел)wxListView_GetFocusedItem(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export цел дайСледщВыдный(цел элт)
    {
        return cast(цел)wxListView_GetNextSelected(вхобъ, cast(бцел)элт);
    }

    //-----------------------------------------------------------------------------

    export цел первВыделенный()
    {
        return cast(цел)wxListView_GetFirstSelected(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул выделен(цел индекс)
    {
        return wxListView_IsSelected(вхобъ, cast(бцел)индекс);
    }

    //-----------------------------------------------------------------------------

    export проц устРисунокКолонки(цел кол, цел рисунок)
    {
        wxListView_SetColumnImage(вхобъ, кол, рисунок);
    }

    //-----------------------------------------------------------------------------

    export проц сотриРисунокКолонки(цел кол)
    {
        wxListView_ClearColumnImage(вхобъ, кол);
    }
}
