module wx.Window;
public import wx.common;
public import wx.EvtHandler;
public import wx.Cursor;
public import wx.Font;
public import wx.Colour;
public import wx.Region;
public import wx.Validator;
public import wx.Palette;
public import wx.Accelerator;

public import wx.Caret;
public import wx.DC;
public import wx.DND;
public import wx.Sizer;
public import wx.Menu;
public import wx.ToolTip;

public enum ПВариантОкна
{
    НОРМАЛЬНЫЙ,  // Normal Размер
    МАЛЕНЬКИЙ,   // Smaller Размер (about 25 % smaller than normal)
    МИНИ,    // Mini Размер (about 33 % smaller than normal)
    БОЛЬШОЙ,   // Large Размер (about 25 % larger than normal)
    МАКС
};

//---------------------------------------------------------------------

public enum ПСтильФона
{
    СИСТЕМНЫЙ,
    ЦВЕТНОЙ,
    ОСОБЫЙ
};

//---------------------------------------------------------------------

public enum ПБордюр
{
    ДЕФОЛТ = 0,

    НИКАКОЙ   = 0x00200000,
    СТАТИЧЕСКИЙ = 0x01000000,
    ПРОСТОЙ = 0x02000000,
    ПОДНЯТЫЙ = 0x04000000,
    УТОПЛЕННЫЙ = 0x08000000,
    ДВОЙНОЙ = 0x10000000,

    МАСКА   = 0x1f200000,

    ДВОЙНОЙ_БОРДЮР   = ДВОЙНОЙ,
    УТОПЛЕННЫЙ_БОРДЮР   = УТОПЛЕННЫЙ,
    ПОДНЯТЫЙ_БОРДЮР   = ПОДНЯТЫЙ,
    БОРДЮР          = ПРОСТОЙ,
    ПРОСТОЙ_БОРДЮР   = ПРОСТОЙ,
    СТАТИЧЕСКИЙ_БОРДЮР   = СТАТИЧЕСКИЙ,
    БЕЗ_БОРДЮРА       = НИКАКОЙ
};

//! \cond EXTERN
extern (C) ЦелУкз wxVisualAttributes_ctor();
extern (C) проц   wxVisualAttributes_dtor(ЦелУкз сам);
extern (C) проц   wxVisualAttributes_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
extern (C) проц   wxVisualAttributes_SetFont(ЦелУкз сам, ЦелУкз шрифт);
extern (C) ЦелУкз wxVisualAttributes_GetFont(ЦелУкз сам);
extern (C) проц   wxVisualAttributes_SetColourFg(ЦелУкз сам, ЦелУкз цвет);
extern (C) ЦелУкз wxVisualAttributes_GetColourFg(ЦелУкз сам);
extern (C) проц   wxVisualAttributes_SetColourBg(ЦелУкз сам, ЦелУкз цвет);
extern (C) ЦелУкз wxVisualAttributes_GetColourBg(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

export class ВизАтрибуты : ВизОбъект
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
        this(wxVisualAttributes_ctor(), да);
        wxVisualAttributes_RegisterDisposable(вхобъ, &VirtualDispose);
    }

    //---------------------------------------------------------------------

    export Шрифт шрифт()
    {
        return new Шрифт(wxVisualAttributes_GetFont(вхобъ), да);
    }
    export проц шрифт(Шрифт значение)
    {
        wxVisualAttributes_SetFont(вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    export Цвет цветПП()
    {
        return new Цвет(wxVisualAttributes_GetColourFg(вхобъ), да);
    }
    //---------------------------------------------------------------------

    export Цвет цветЗП()
    {
        return new Цвет(wxVisualAttributes_GetColourBg(вхобъ), да);
    }
    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxVisualAttributes_dtor(вхобъ);
    }
		//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxWindow_ctor(ЦелУкз родитель, цел ид, inout Точка поз, inout Размер размер, бцел стиль, ткст имя);
extern (C) бул   wxWindow_Close(ЦелУкз сам, бул сила);
extern (C) проц   wxWindow_GetBestSize(ЦелУкз сам, out Размер размер);
extern (C) проц   wxWindow_GetClientSize(ЦелУкз сам, out Размер размер);
extern (C) цел    wxWindow_GetId(ЦелУкз сам);
extern (C) бцел   wxWindow_GetWindowStyleFlag(ЦелУкз сам);
extern (C) бцел   wxWindow_Layout(ЦелУкз сам);
extern (C) проц   wxWindow_SetAutoLayout(ЦелУкз сам, бул autoLayout);
extern (C) проц   wxWindow_SetBackgroundColour(ЦелУкз сам, ЦелУкз цвет);
extern (C) ЦелУкз wxWindow_GetBackgroundColour(ЦелУкз сам);
extern (C) проц   wxWindow_SetForegroundColour(ЦелУкз сам, ЦелУкз цвет);
extern (C) ЦелУкз wxWindow_GetForegroundColour(ЦелУкз сам);
extern (C) проц   wxWindow_SetCursor(ЦелУкз сам, ЦелУкз курсор);
extern (C) проц   wxWindow_SetId(ЦелУкз сам, цел ид);
extern (C) проц   wxWindow_SetSize(ЦелУкз сам, цел x, цел y, цел ширь, цел высь, бцел флаги);
extern (C) проц   wxWindow_SetSize2(ЦелУкз сам, цел ширь, цел высь);
extern (C) проц   wxWindow_SetSize3(ЦелУкз сам, inout Размер размер);
extern (C) проц   wxWindow_SetSize4(ЦелУкз сам, inout Прямоугольник прям);
extern (C) проц   wxWindow_SetSizer(ЦелУкз сам, ЦелУкз сайзер, бул удалитьСтар);
extern (C) проц   wxWindow_SetWindowStyleFlag(ЦелУкз сам, бцел стиль);
extern (C) бул   wxWindow_Show(ЦелУкз сам, бул показ);
extern (C) бул   wxWindow_SetFont(ЦелУкз сам, ЦелУкз шрифт);
extern (C) ЦелУкз wxWindow_GetFont(ЦелУкз сам);
extern (C) проц   wxWindow_SetToolTip(ЦелУкз сам, ткст подсказка);
extern (C) бул 	 wxWindow_Enable(ЦелУкз сам, бул вкл);
extern (C) бул   wxWindow_IsEnabled(ЦелУкз сам);

extern (C) цел    wxWindow_EVT_TRANSFERDATAFROMWINDOW();
extern (C) цел    wxWindow_EVT_TRANSFERDATATOWINDOW();

//extern (C) бул wxWindow_LoadFromResource(ЦелУкз сам, ЦелУкз родитель, ткст resourceName, ЦелУкз таблица);
//extern (C) ЦелУкз wxWindow_CreateItem(ЦелУкз сам, ЦелУкз childResource, ЦелУкз parentResource, ЦелУкз таблица);
extern (C) бул   wxWindow_Destroy(ЦелУкз сам);
extern (C) бул   wxWindow_DestroyChildren(ЦелУкз сам);
extern (C) проц   wxWindow_SetTitle(ЦелУкз сам, ткст титул);
extern (C) ЦелУкз wxWindow_GetTitle(ЦелУкз сам);
extern (C) проц   wxWindow_SetName(ЦелУкз сам, ткст имя);
extern (C) ЦелУкз wxWindow_GetName(ЦелУкз сам);
extern (C) цел    wxWindow_NewControlId();
extern (C) цел    wxWindow_NextControlId(цел ид);
extern (C) цел    wxWindow_PrevControlId(цел ид);
extern (C) проц   wxWindow_Move(ЦелУкз сам, цел x, цел y, цел флаги);
extern (C) проц   wxWindow_Raise(ЦелУкз сам);
extern (C) проц   wxWindow_Lower(ЦелУкз сам);
extern (C) проц   wxWindow_SetClientSize(ЦелУкз сам, цел ширь, цел высь);
extern (C) проц   wxWindow_GetPosition(ЦелУкз сам, out Точка Точка);
extern (C) проц   wxWindow_GetSize(ЦелУкз сам, out Размер размер);
extern (C) проц   wxWindow_GetRect(ЦелУкз сам, out Прямоугольник прям);
extern (C) проц   wxWindow_GetClientAreaOrigin(ЦелУкз сам, out Точка Точка);
extern (C) проц   wxWindow_GetClientRect(ЦелУкз сам, out Прямоугольник прям);
extern (C) проц   wxWindow_GetAdjustedBestSize(ЦелУкз сам, out Размер размер);
extern (C) проц   wxWindow_Center(ЦелУкз сам, цел направление);
extern (C) проц   wxWindow_CenterOnScreen(ЦелУкз сам, цел dir);
extern (C) проц   wxWindow_CenterOnParent(ЦелУкз сам, цел dir);
extern (C) проц   wxWindow_Fit(ЦелУкз сам);
extern (C) проц   wxWindow_FitInside(ЦелУкз сам);
extern (C) проц   wxWindow_SetSizeHints(ЦелУкз сам, цел минШ, цел минВ, цел максШ, цел максВ, цел incW, цел incH);
extern (C) проц   wxWindow_SetVirtualSizeHints(ЦелУкз сам, цел минШ, цел минВ, цел максШ, цел максВ);
extern (C) цел    wxWindow_GetMinWidth(ЦелУкз сам);
extern (C) цел    wxWindow_GetMinHeight(ЦелУкз сам);
extern (C) проц   wxWindow_GetMinSize(ЦелУкз сам, out Размер размер);
extern (C) проц   wxWindow_SetMinSize(ЦелУкз сам, Размер* Размер);
extern (C) цел    wxWindow_GetMaxWidth(ЦелУкз сам);
extern (C) цел    wxWindow_GetMaxHeight(ЦелУкз сам);
extern (C) проц   wxWindow_GetMaxSize(ЦелУкз сам, out Размер размер);
extern (C) проц   wxWindow_SetMaxSize(ЦелУкз сам, Размер* Размер);
extern (C) проц   wxWindow_SetVirtualSize(ЦелУкз сам, inout Размер размер);
extern (C) проц   wxWindow_GetVirtualSize(ЦелУкз сам, out Размер размер);
extern (C) проц   wxWindow_GetBestVirtualSize(ЦелУкз сам, out Размер размер);
extern (C) бул   wxWindow_Hide(ЦелУкз сам);
extern (C) бул   wxWindow_Disable(ЦелУкз сам);
extern (C) бул   wxWindow_IsShown(ЦелУкз сам);
extern (C) проц   wxWindow_SetWindowStyle(ЦелУкз сам, бцел стиль);
extern (C) бцел   wxWindow_GetWindowStyle(ЦелУкз сам);
extern (C) бул   wxWindow_HasFlag(ЦелУкз сам, цел флаг);
extern (C) бул   wxWindow_IsRetained(ЦелУкз сам);
extern (C) проц   wxWindow_SetExtraStyle(ЦелУкз сам, бцел exStyle);
extern (C) бцел   wxWindow_GetExtraStyle(ЦелУкз сам);
extern (C) проц   wxWindow_MakeModal(ЦелУкз сам, бул modal);
extern (C) проц   wxWindow_SetThemeEnabled(ЦелУкз сам, бул enableTheme);
extern (C) бул   wxWindow_GetThemeEnabled(ЦелУкз сам);
extern (C) проц   wxWindow_SetFocus(ЦелУкз сам);
extern (C) проц   wxWindow_SetFocusFromKbd(ЦелУкз сам);
extern (C) ЦелУкз wxWindow_FindFocus();
extern (C) бул   wxWindow_AcceptsFocus(ЦелУкз сам);
extern (C) бул   wxWindow_AcceptsFocusFromKeyboard(ЦелУкз сам);
extern (C) ЦелУкз wxWindow_GetParent(ЦелУкз сам);
extern (C) ЦелУкз wxWindow_GetGrandParent(ЦелУкз сам);
extern (C) бул   wxWindow_IsTopLevel(ЦелУкз сам);
extern (C) проц   wxWindow_SetParent(ЦелУкз сам, ЦелУкз родитель);
extern (C) бул   wxWindow_Reparent(ЦелУкз сам, ЦелУкз новРодитель);
extern (C) проц   wxWindow_AddChild(ЦелУкз сам, ЦелУкз отпрыск);
extern (C) проц   wxWindow_RemoveChild(ЦелУкз сам, ЦелУкз отпрыск);
extern (C) ЦелУкз wxWindow_FindWindowId(ЦелУкз сам, цел ид);
extern (C) ЦелУкз wxWindow_FindWindowName(ЦелУкз сам, ткст имя);
extern (C) ЦелУкз wxWindow_FindWindowById(цел ид, ЦелУкз родитель);
extern (C) ЦелУкз wxWindow_FindWindowByName(ткст имя, ЦелУкз родитель);
extern (C) ЦелУкз wxWindow_FindWindowByLabel(ткст ярлык, ЦелУкз родитель);
extern (C) ЦелУкз wxWindow_GetEventHandler(ЦелУкз сам);
extern (C) проц   wxWindow_SetEventHandler(ЦелУкз сам, ЦелУкз обработчик);
extern (C) проц   wxWindow_PushEventHandler(ЦелУкз сам, ЦелУкз обработчик);
extern (C) ЦелУкз wxWindow_PopEventHandler(ЦелУкз сам, бул удалиОбраб);
extern (C) бул   wxWindow_RemoveEventHandler(ЦелУкз сам, ЦелУкз обработчик);
extern (C) проц   wxWindow_SetValidator(ЦелУкз сам, ЦелУкз оценщик);
extern (C) ЦелУкз wxWindow_GetValidator(ЦелУкз сам);
extern (C) бул   wxWindow_Validate(ЦелУкз сам);
extern (C) бул   wxWindow_TransferDataToWindow(ЦелУкз сам);
extern (C) бул   wxWindow_TransferDataFromWindow(ЦелУкз сам);
extern (C) проц   wxWindow_InitDialog(ЦелУкз сам);
extern (C) проц   wxWindow_SetAcceleratorTable(ЦелУкз сам, ЦелУкз accel);
extern (C) ЦелУкз wxWindow_GetAcceleratorTable(ЦелУкз сам);
extern (C) проц   wxWindow_ConvertPixelsToDialogPoint(ЦелУкз сам, inout Точка тчк, out Точка Точка);
extern (C) проц   wxWindow_ConvertDialogToPixelsPoint(ЦелУкз сам, inout Точка тчк, out Точка Точка);
extern (C) проц   wxWindow_ConvertPixelsToDialogSize(ЦелУкз сам, inout Размер рм, out Размер размер);
extern (C) проц   wxWindow_ConvertDialogToPixelsSize(ЦелУкз сам, inout Размер рм, out Размер размер);
extern (C) проц   wxWindow_WarpPointer(ЦелУкз сам, цел x, цел y);
extern (C) проц   wxWindow_CaptureMouse(ЦелУкз сам);
extern (C) проц   wxWindow_ReleaseMouse(ЦелУкз сам);
extern (C) ЦелУкз wxWindow_GetCapture();
extern (C) бул   wxWindow_HasCapture(ЦелУкз сам);
extern (C) проц   wxWindow_Refresh(ЦелУкз сам, бул стеретьФон, inout Прямоугольник прям);
extern (C) проц   wxWindow_RefreshRect(ЦелУкз сам, inout Прямоугольник прям);
extern (C) проц   wxWindow_Update(ЦелУкз сам);
extern (C) проц   wxWindow_ClearBackground(ЦелУкз сам);
extern (C) проц   wxWindow_Freeze(ЦелУкз сам);
extern (C) проц   wxWindow_Thaw(ЦелУкз сам);
extern (C) проц   wxWindow_PrepareDC(ЦелУкз сам, ЦелУкз ку);
extern (C) бул   wxWindow_IsExposed(ЦелУкз сам, цел x, цел y, цел w, цел h);
extern (C) проц   wxWindow_SetCaret(ЦелУкз сам, ЦелУкз каретка);
extern (C) ЦелУкз wxWindow_GetCaret(ЦелУкз сам);
extern (C) цел    wxWindow_GetCharHeight(ЦелУкз сам);
extern (C) цел    wxWindow_GetCharWidth(ЦелУкз сам);
extern (C) проц   wxWindow_GetTextExtent(ЦелУкз сам, ткст стр, out цел x, out цел y, out цел descent, out цел внешнееВступление, ЦелУкз theFont);
extern (C) проц   wxWindow_ClientToScreen(ЦелУкз сам, inout цел x, inout цел y);
extern (C) проц   wxWindow_ScreenToClient(ЦелУкз сам, inout цел x, inout цел y);
extern (C) проц   wxWindow_ClientToScreen(ЦелУкз сам, inout Точка тчк, out Точка Точка);
extern (C) проц   wxWindow_ScreenToClient(ЦелУкз сам, inout Точка тчк, out Точка Точка);
//extern (C) wxHitTest wxWindow_HitTest(ЦелУкз сам, Coord x, Coord y);
//extern (C) wxHitTest wxWindow_HitTest(ЦелУкз сам, inout Точка тчк);
extern (C) цел    wxWindow_GetBorder(ЦелУкз сам);
extern (C) цел    wxWindow_GetBorderByFlags(ЦелУкз сам, бцел флаги);
extern (C) проц   wxWindow_UpdateWindowUI(ЦелУкз сам);
extern (C) бул   wxWindow_PopupMenu(ЦелУкз сам, ЦелУкз меню, inout Точка поз);
extern (C) бул   wxWindow_HasScrollbar(ЦелУкз сам, цел ориент);
extern (C) проц   wxWindow_SetScrollbar(ЦелУкз сам, цел ориент, цел поз, цел thumbvisible, цел диапазон, бул освежи);
extern (C) проц   wxWindow_SetScrollPos(ЦелУкз сам, цел ориент, цел поз, бул освежи);
extern (C) цел    wxWindow_GetScrollPos(ЦелУкз сам, цел ориент);
extern (C) цел    wxWindow_GetScrollThumb(ЦелУкз сам, цел ориент);
extern (C) цел    wxWindow_GetScrollRange(ЦелУкз сам, цел ориент);
extern (C) проц   wxWindow_ScrollWindow(ЦелУкз сам, цел dx, цел dy, inout Прямоугольник прям);
extern (C) бул   wxWindow_ScrollLines(ЦелУкз сам, цел строки);
extern (C) бул   wxWindow_ScrollPages(ЦелУкз сам, цел страницы);
extern (C) бул   wxWindow_LineUp(ЦелУкз сам);
extern (C) бул   wxWindow_LineDown(ЦелУкз сам);
extern (C) бул   wxWindow_PageUp(ЦелУкз сам);
extern (C) бул   wxWindow_PageDown(ЦелУкз сам);
extern (C) проц   wxWindow_SetHelpText(ЦелУкз сам, ткст текст);
extern (C) проц   wxWindow_SetHelpTextForId(ЦелУкз сам, ткст текст);
extern (C) ЦелУкз wxWindow_GetHelpText(ЦелУкз сам);
//extern (C) проц wxWindow_SetToolTip(ЦелУкз сам, ЦелУкз подсказка);
//extern (C) ЦелУкз wxWindow_GetToolTip(ЦелУкз сам);
extern (C) проц   wxWindow_SetDropTarget(ЦелУкз сам, ЦелУкз мишеньСброса);
extern (C) ЦелУкз wxWindow_GetDropTarget(ЦелУкз сам);
extern (C) проц   wxWindow_SetConstraints(ЦелУкз сам, ЦелУкз constraints);
extern (C) ЦелУкз wxWindow_GetConstraints(ЦелУкз сам);
extern (C) бул   wxWindow_GetAutoLayout(ЦелУкз сам);
extern (C) проц   wxWindow_SetSizerAndFit(ЦелУкз сам, ЦелУкз сайзер, бул удалитьСтар);
extern (C) ЦелУкз wxWindow_GetSizer(ЦелУкз сам);
extern (C) проц   wxWindow_SetContainingSizer(ЦелУкз сам, ЦелУкз сайзер);
extern (C) ЦелУкз wxWindow_GetContainingSizer(ЦелУкз сам);
extern (C) ЦелУкз wxWindow_GetPalette(ЦелУкз сам);
extern (C) проц   wxWindow_SetPalette(ЦелУкз сам, ЦелУкз pal);
extern (C) бул   wxWindow_HasCustomPalette(ЦелУкз сам);
extern (C) ЦелУкз wxWindow_GetUpdateRegion(ЦелУкз сам);

extern (C) проц   wxWindow_SetWindowVariant(ЦелУкз сам, цел вариант);
extern (C) цел    wxWindow_GetWindowVariant(ЦелУкз сам);
extern (C) бул   wxWindow_IsBeingDeleted(ЦелУкз сам);
extern (C) проц   wxWindow_InvalidateBestSize(ЦелУкз сам);
extern (C) проц   wxWindow_CacheBestSize(ЦелУкз сам, Размер размер);
extern (C) проц   wxWindow_GetBestFittingSize(ЦелУкз сам, inout Размер размер);
extern (C) проц   wxWindow_SetBestFittingSize(ЦелУкз сам, inout Размер размер);
extern (C) ЦелУкз wxWindow_GetChildren(ЦелУкз сам, цел чис);
extern (C) цел    wxWindow_GetChildrenCount(ЦелУкз сам);
extern (C) ЦелУкз wxWindow_GetDefaultAttributes(ЦелУкз сам);
extern (C) ЦелУкз wxWindow_GetClassDefaultAttributes(цел вариант);
extern (C) проц   wxWindow_SetBackgroundStyle(ЦелУкз сам, цел стиль);
extern (C) цел    wxWindow_GetBackgroundStyle(ЦелУкз сам);
//extern (C) ЦелУкз wxWindow_GetToolTipText(ЦелУкз сам);
extern (C) ЦелУкз wxWindow_GetAncestorWithCustomPalette(ЦелУкз сам);
extern (C) проц   wxWindow_InheritAttributes(ЦелУкз сам);
extern (C) бул   wxWindow_ShouldInheritColours(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

/// Окно is the base class for all windows and represents any
/// видим object on screen. All controls, top level windows and so on
/// are windows. Sizers and device contexts are not, however, as they don't
/// appear on screen themselves.
export class Окно : ОбработчикСоб
{
    enum
    {
        ВПРОКРУТ			= cast(цел)0x80000000,
        ГПРОКРУТ			= 0x40000000,
        ЗАГОЛОВОК			= 0x20000000,

        КЛИП_ОТПРЫСКИ			= 0x00400000,
        МИНИМИРУЙ_БОКС 			= 0x00000400,
        ЗАКРОЙ_БОКС			= 0x1000,
        МАКСИМИРУЙ_БОКС			= 0x0200,
        БЕЗ_3Д				= 0x00800000,
        ПЕРЕМЕР_ГРАНИЦ			= 0x00000040,
        СИСТЕМНОЕ_МЕНЮ			= 0x00000800,
        ТАБ_ТРАВЕРЗА			= 0x00008000,

        ПОЛН_ПЕРЕРИС_ПРИ_ПЕРЕМЕРЕ	= 0x00010000,

        ОК			= 5100,
        ОТМЕНА			= 5101,
        ДА			= 5103,
        НЕТ			= 5104,

        ЛЮБОЙ			= -1,
        ABOUT			= 5013,

        ОСТАВАТЬСЯ_ВВЕРХУ			= 0x8000,
        ИКОНИЗИРОВАТЬ			= 0x4000,
        МИНИМИРОВАТЬ			= ИКОНИЗИРОВАТЬ,
        МАКСИМИРОВАТЬ			= 0x2000,

        ТИНИ_КАПШН_ГОРИЗ		= 0x0100,
        ТИНИ_КАПШН_ВЕРТ		= 0x0080,

        ДИАЛОГ_БЕЗ_РОДИТЕЛЯ		= 0x0001,
        РАМКА_БЕЗ_ТАСКБАРА		= 0x0002,
        wxFRAME_TOOL_WINDOW		= 0x0004,
        wxFRAME_FLOAT_ON_PARENT		= 0x0008,
        wxFRAME_SHAPED			= 0x0010,
        wxFRAME_EX_CONTEXTHELP		= 0x00000004,

        //---------------------------------------------------------------------

        ДЕФОЛТ		= 0x00000000,
        НИКАКОЙ			= 0x00200000,
        СТАТИЧЕСКИЙ			= 0x01000000,
        ПРОСТОЙ			= 0x02000000,
        ПОДНЯТЫЙ			= 0x04000000,
        УТОПЛЕННЫЙ			= 0x08000000,
        ДВОЙНОЙ			= 0x10000000,
        МАСКА			= 0x1f200000,

        // ПБордюр флаги
        ДВОЙНОЙ_БОРДЮР			= ДВОЙНОЙ,
        УТОПЛЕННЫЙ_БОРДЮР			= УТОПЛЕННЫЙ,
        ПОДНЯТЫЙ_БОРДЮР			= ПОДНЯТЫЙ,
        БОРДЮР			= ПРОСТОЙ,
        ПРОСТОЙ_БОРДЮР			= ПРОСТОЙ,
        СТАТИЧЕСКИЙ_БОРДЮР			= СТАТИЧЕСКИЙ,
        БЕЗ_БОРДЮРА			= НИКАКОЙ,

        НУЖНЫ_СИМВ			= 0x00040000,

        ДЕФ_РАМКА			= СИСТЕМНОЕ_МЕНЮ | ПЕРЕМЕР_ГРАНИЦ |
                                  МИНИМИРУЙ_БОКС | МАКСИМИРУЙ_БОКС | ЗАГОЛОВОК |
                                  КЛИП_ОТПРЫСКИ | ЗАКРОЙ_БОКС,
        ДЕФ_СТИЛЬ_РАМКИ		= ДЕФ_РАМКА,

        ДЕФ_СТИЛЬ_ДИАЛОГА		= СИСТЕМНОЕ_МЕНЮ | ЗАГОЛОВОК | ЗАКРОЙ_БОКС,
    }

    private static цел уникИД			= 10000; // старт with 10000 до not interfere with the old ид system

    //---------------------------------------------------------------------

    public const Точка ДЕФПОЗ = {Х:-1, У:-1};
    public const wx.common.Размер  ДЕФРАЗМ     = {ширь:-1, высь:-1};
    const ткст СтрИмениПанели = "панель";

    //---------------------------------------------------------------------

    export this(Окно родитель, цел ид, Точка поз=ДЕФПОЗ, wx.common.Размер размер=ДЕФРАЗМ, цел стиль=0, ткст имя=СтрИмениПанели)
    {
        this(wxWindow_ctor(ВизОбъект.безопУк(родитель), ид, поз, размер, стиль, имя),
             нет /*a Окно will always be destroyed by its родитель*/);
    }

    export this(Окно родитель, Точка поз=ДЕФПОЗ, wx.common.Размер размер=ДЕФРАЗМ, цел стиль=0, ткст имя=СтрИмениПанели)
    {
        this(родитель, Окно.уникИд, поз, размер, стиль, имя);
    }

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
        добавьДатчикСобытий(wxWindow_EVT_TRANSFERDATATOWINDOW(), &поПередачеДанныхОкну);
        добавьДатчикСобытий(wxWindow_EVT_TRANSFERDATAFROMWINDOW(), &поПередачеДанныхОтОкна);
    }

    private this(ЦелУкз вхобъ, бул памСобств)
    {
        super(вхобъ);
        this.памСобств = памСобств;

        добавьДатчикСобытий(wxWindow_EVT_TRANSFERDATATOWINDOW(), &поПередачеДанныхОкну);
        добавьДатчикСобытий(wxWindow_EVT_TRANSFERDATAFROMWINDOW(), &поПередачеДанныхОтОкна);
    }


    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new Окно(ptr);
    }
    //---------------------------------------------------------------------

    export  проц   цветФона(Цвет значение)
    {
        wxWindow_SetBackgroundColour(вхобъ, ВизОбъект.безопУк(значение));
    }
    export  Цвет цветФона()
    {
        return new Цвет(wxWindow_GetBackgroundColour(вхобъ), да);
    }

    export  Цвет цветПП()
    {
        return new Цвет(wxWindow_GetForegroundColour(вхобъ), да);
    }
    export  проц   цветПП(Цвет значение)
    {
        wxWindow_SetForegroundColour(вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    // Note: was previously defined as WindowFont
    export  проц шрифт(Шрифт значение)
    {
        wxWindow_SetFont(вхобъ, значение.вхобъ);
    }
    export  Шрифт шрифт()
    {
        return new Шрифт(wxWindow_GetFont(вхобъ), да);
    }


    //---------------------------------------------------------------------

    export  wx.common.Размер лучшийРазмер()
    {
        Размер размер;
        wxWindow_GetBestSize(вхобъ, размер);
        return размер;
    }

    //---------------------------------------------------------------------

    export  wx.common.Размер размерКлиента()
    {
        Размер размер;
        wxWindow_GetClientSize(вхобъ, размер);
        return размер;
    }
    export  проц размерКлиента(wx.common.Размер значение)
    {
        wxWindow_SetClientSize(вхобъ, значение.ширь, значение.высь);
    }

    //---------------------------------------------------------------------

    export  бул закрой()
    {
        return wxWindow_Close(вхобъ, нет);
    }

    export  бул закрой(бул сила)
    {
        return wxWindow_Close(вхобъ, сила);
    }

    //---------------------------------------------------------------------

    export  цел ид()
    {
        return wxWindow_GetId(вхобъ);
    }
    export  проц ид(цел значение)
    {
        wxWindow_SetId(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export static цел уникИд()
    {
        return ++уникИД;
    }

    //---------------------------------------------------------------------

    export  проц раскладка()
    {
        wxWindow_Layout(вхобъ);
    }

    //---------------------------------------------------------------------

    export  проц устКурсор(Курсор значение)
    {
        wxWindow_SetCursor(вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    export  проц устРазм(цел x, цел y, цел ширь, цел высь)
    {
        wxWindow_SetSize(вхобъ, x, y, ширь, высь, 0);
    }

    export  проц устРазм(цел ширь, цел высь)
    {
        wxWindow_SetSize2(вхобъ, ширь, высь);
    }

    export  проц устРазм(wx.common.Размер размер)
    {
        wxWindow_SetSize3(вхобъ, размер);
    }

    export  проц устРазм(Прямоугольник прям)
    {
        wxWindow_SetSize4(вхобъ, прям);
    }

    //---------------------------------------------------------------------

    export  проц устПеремерщик(Перемерщик сайзер, бул удалитьСтар=да)
    {
        wxWindow_SetSizer(вхобъ, сайзер.вхобъ, удалитьСтар);
    }

    //---------------------------------------------------------------------

    export  бул показ(бул показ=да)
    {
        return wxWindow_Show(вхобъ, показ);
    }

    //---------------------------------------------------------------------

    export  цел  флагиСтиля()
    {
        return wxWindow_GetWindowStyleFlag(вхобъ);
    }
    export  проц флагиСтиля(бцел значение)
    {
        wxWindow_SetWindowStyleFlag(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    private проц поПередачеДанныхОтОкна(Объект отправитель, Событие e)
    {
        if (!передатьДанныеОтОкна())
            e.пропусти();
    }

    //---------------------------------------------------------------------

    private проц поПередачеДанныхОкну(Объект отправитель, Событие e)
    {
        if (!передатьДанныеОкну())
            e.пропусти();
    }

    //---------------------------------------------------------------------

    export  проц тултип(ткст значение)
    {
        wxWindow_SetToolTip(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export  проц активен(бул значение)
    {
        wxWindow_Enable(вхобъ, значение);
    }
    export  бул активен()
    {
        return wxWindow_IsEnabled(вхобъ);
    }

    //---------------------------------------------------------------------

    export  бул разрушь()
    {
        return wxWindow_Destroy(вхобъ);
    }

    export  бул разрушьОтпрыски()
    {
        return wxWindow_DestroyChildren(вхобъ);
    }

    //---------------------------------------------------------------------

    export  проц  титул(ткст значение)
    {
        wxWindow_SetTitle(вхобъ, значение);
    }
    export  ткст титул()
    {
        return cast(ткст) new ВизТкст(wxWindow_GetTitle(вхобъ), да);
    }

    //---------------------------------------------------------------------

    export  проц имя(ткст значение)
    {
        wxWindow_SetName(вхобъ, значение);
    }
    export  ткст имя()
    {
        return cast(ткст) new ВизТкст(wxWindow_GetName(вхобъ), да);
    }

    //---------------------------------------------------------------------

    export static цел новИдКонтрола()
    {
        return wxWindow_NewControlId();
    }

    export static цел следщИдКонтрола(цел ид)
    {
        return wxWindow_NextControlId(ид);
    }

    export static цел предшИдКонтрола(цел ид)
    {
        return wxWindow_PrevControlId(ид);
    }

    //---------------------------------------------------------------------

    export  проц сдвинь(цел x, цел y, цел флаги)
    {
        wxWindow_Move(вхобъ, x, y, флаги);
    }

    //---------------------------------------------------------------------

    export  проц повысь()
    {
        wxWindow_Raise(вхобъ);
    }

    export  проц понизь()
    {
        wxWindow_Lower(вхобъ);
    }

    //---------------------------------------------------------------------

    export  Точка позиция()
    {
        Точка точка;
        wxWindow_GetPosition(вхобъ, точка);
        return точка;
    }
    export  проц  позиция(Точка значение)
    {
        сдвинь(значение.Х, значение.У, 0);
    }

    //---------------------------------------------------------------------

    export  Размер размер()
    {
        Размер размер;
        wxWindow_GetSize(вхобъ, размер);
        return размер;
    }
    export  проц размер(wx.common.Размер значение)
    {
        wxWindow_SetSize(вхобъ, позиция.Х, позиция.У,
                         значение.ширь, значение.высь, 0);
    }

    //---------------------------------------------------------------------

    export  Прямоугольник прям()
    {
        Прямоугольник прям;
        wxWindow_GetRect(вхобъ, прям);
        return прям;
    }

    //---------------------------------------------------------------------

    export  Точка исходнаяЗоныКлиента()
    {
        Точка точка;
        wxWindow_GetClientAreaOrigin(вхобъ, точка);
        return точка;
    }

    //---------------------------------------------------------------------

    export  Прямоугольник прямКлиента()
    {
        Прямоугольник прям;
        wxWindow_GetClientRect(вхобъ, прям);
        return прям;
    }

    //---------------------------------------------------------------------

    export  Размер настройЛучшРазм()
    {
        Размер размер;
        wxWindow_GetAdjustedBestSize(вхобъ, размер);
        return размер;
    }

    //---------------------------------------------------------------------

    export  проц центр()
    {
        центруй( ПОриентация.Оба );
    }

    export  проц центруй()
    {
        центруй( ПОриентация.Оба );
    }

    export  проц центр(цел направление)
    {
        центруй( направление );
    }

    export  проц центруй(цел направление)
    {
        wxWindow_Center(вхобъ, направление);
    }

    export  проц центрНаЭкране()
    {
        центруйНаЭкране( ПОриентация.Оба );
    }

    export  проц центруйНаЭкране()
    {
        центруйНаЭкране( ПОриентация.Оба );
    }

    export  проц центрНаЭкране(цел направление)
    {
        центруйНаЭкране( направление );
    }

    export  проц центруйНаЭкране(цел направление)
    {
        wxWindow_CenterOnScreen(вхобъ, направление);
    }

    export  проц центрНаРодителе()
    {
        центруйНаРодителе( ПОриентация.Оба );
    }

    export  проц центруйНаРодителе()
    {
        центруйНаРодителе( ПОриентация.Оба );
    }

    export  проц центрНаРодителе(цел направление)
    {
        центруйНаРодителе( направление );
    }

    export  проц центруйНаРодителе(цел направление)
    {
        wxWindow_CenterOnParent(вхобъ, направление);
    }

    //---------------------------------------------------------------------

    export  проц встрой()
    {
        wxWindow_Fit(вхобъ);
    }

    export  проц встройВнутрь()
    {
        wxWindow_FitInside(вхобъ);
    }

    //---------------------------------------------------------------------

    export  проц устРазмПодсказ(цел минШ, цел минВ)
    {
        устРазмПодсказ(минШ, минВ, -1, -1, -1, -1);
    }

    export  проц устРазмПодсказ(цел минШ, цел минВ, цел максШ, цел максВ)
    {
        устРазмПодсказ(минШ, минВ, максШ, максВ, -1, -1);
    }

    export  проц устРазмПодсказ(цел минШ, цел минВ, цел максШ, цел максВ, цел incW, цел incH)
    {
        wxWindow_SetSizeHints(вхобъ, минШ, минВ, максШ, максВ, incW, incH);
    }

    export  проц устВиртуалРазмПодсказ(цел минШ, цел минВ, цел максШ, цел максВ)
    {
        wxWindow_SetVirtualSizeHints(вхобъ, минШ, минВ, максШ, максВ);
    }

    //---------------------------------------------------------------------

    export  цел минШирь()
    {
        return wxWindow_GetMinWidth(вхобъ);
    }

    export  цел минВысь()
    {
        return wxWindow_GetMinHeight(вхобъ);
    }

    export  цел максШирь()
    {
        return wxWindow_GetMaxWidth(вхобъ);
    }

    export  цел максВысь()
    {
        return wxWindow_GetMaxHeight(вхобъ);
    }

    //---------------------------------------------------------------------

    export  Размер минРазм()
    {
        Размер размер;
        wxWindow_GetMinSize(вхобъ, размер);
        return размер;
    }

    export проц минРазм(Размер размер)
    {
        wxWindow_SetMinSize(вхобъ, &размер);
    }

    export  Размер максРазм()
    {
        Размер размер;
        wxWindow_GetMaxSize(вхобъ, размер);
        return размер;
    }

    export проц максРазм(Размер размер)
    {
        wxWindow_SetMaxSize(вхобъ, &размер);
    }

    //---------------------------------------------------------------------

    export  Размер виртуалРазм()
    {
        Размер размер;
        wxWindow_GetVirtualSize(вхобъ, размер);
        return размер;
    }
    export  проц  виртуалРазм(Размер значение)
    {
        wxWindow_SetVirtualSize(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export  Размер лучшийВиртуалРазм()
    {
        Размер размер;
        wxWindow_GetBestVirtualSize(вхобъ, размер);
        return размер;
    }

    //---------------------------------------------------------------------

    export  бул спрячь()
    {
        return wxWindow_Hide(вхобъ);
    }

    export  бул отключи()
    {
        return wxWindow_Disable(вхобъ);
    }

    export  бул виден()
    {
        return wxWindow_IsShown(вхобъ);
    }

    //---------------------------------------------------------------------

    export  цел стильОкна()
    {
        return wxWindow_GetWindowStyle(вхобъ);
    }
    export  проц стильОкна(бцел значение)
    {
        wxWindow_SetWindowStyle(вхобъ, значение);
    }

    export  бул естьФлаг(цел флаг)
    {
        return wxWindow_HasFlag(вхобъ, флаг);
    }

    //---------------------------------------------------------------------

    export  бул IsRetained()
    {
        return wxWindow_IsRetained(вхобъ);
    }

    //---------------------------------------------------------------------

    export  цел экстраСтиль()
    {
        return wxWindow_GetExtraStyle(вхобъ);
    }
    export  проц экстраСтиль(бцел значение)
    {
        wxWindow_SetExtraStyle(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export проц сделайМодал(бул значение)
    {
        wxWindow_MakeModal(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export бул темаАктивна()
    {
        return wxWindow_GetThemeEnabled(вхобъ);
    }
    export проц темаАктивна(бул значение)
    {
        wxWindow_SetThemeEnabled(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export  проц устФокус()
    {
        wxWindow_SetFocus(вхобъ);
    }

    export  проц устФокусПоКлв()
    {
        wxWindow_SetFocusFromKbd(вхобъ);
    }

    export static Окно найдиФокус()
    {
        return cast(Окно)найдиОбъект(wxWindow_FindFocus());
    }

    //---------------------------------------------------------------------

    export  бул фокусируем()
    {
        return wxWindow_AcceptsFocus(вхобъ);
    }

    export  бул фокусируемоПоКлавиатуре()
    {
        return wxWindow_AcceptsFocusFromKeyboard(вхобъ);
    }

    //---------------------------------------------------------------------

    export  Окно родитель()
    {
        return cast(Окно)найдиОбъект(wxWindow_GetParent(вхобъ));
    }
    export  проц родитель(Окно значение)
    {
        wxWindow_SetParent(вхобъ, ВизОбъект.безопУк(значение));
    }

    export  Окно праРодитель()
    {
        return cast(Окно)найдиОбъект(wxWindow_GetGrandParent(вхобъ));
    }

    export  бул новРодитель(Окно новРодитель)
    {
        return wxWindow_Reparent(вхобъ, ВизОбъект.безопУк(новРодитель));
    }

    //---------------------------------------------------------------------

    export  бул верхнеУровневое()
    {
        return wxWindow_IsTopLevel(вхобъ);
    }
    //---------------------------------------------------------------------

    export  проц добавьОтпрыск(Окно отпрыск)
    {
        wxWindow_AddChild(вхобъ, ВизОбъект.безопУк(отпрыск));
    }

    export  проц УдалиОтпрыск(Окно отпрыск)
    {
        wxWindow_RemoveChild(вхобъ, ВизОбъект.безопУк(отпрыск));
    }

    //---------------------------------------------------------------------

    export  Окно найдиОкно(цел ид)
    {
        return cast(Окно)найдиОбъект(wxWindow_FindWindowId(вхобъ, ид));
    }

    export  Окно найдиОкно(цел ид, новфункц функц)
    {
        return cast(Окно)найдиОбъект(wxWindow_FindWindowId(вхобъ, ид), функц);
    }

    export  Окно найдиОкно(ткст имя)
    {
        return cast(Окно)найдиОбъект(wxWindow_FindWindowName(вхобъ, имя));
    }

    //---------------------------------------------------------------------

    export static Окно найдиОкноПоИд(цел ид, Окно родитель)
    {
        return cast(Окно)найдиОбъект(wxWindow_FindWindowById(ид, ВизОбъект.безопУк(родитель)));
    }

    export static Окно найдиОкноПоИмени(ткст имя, Окно родитель)
    {
        return cast(Окно)найдиОбъект(wxWindow_FindWindowByName(имя, ВизОбъект.безопУк(родитель)));
    }

    export static Окно найдиОкноПоЯрлыку(ткст ярлык, Окно родитель)
    {
        return cast(Окно)найдиОбъект(wxWindow_FindWindowByLabel(ярлык, ВизОбъект.безопУк(родитель)));
    }

    //---------------------------------------------------------------------

    export ОбработчикСоб обработчикСобытий()
    {
        ЦелУкз ptr = wxWindow_GetEventHandler(вхобъ);
        ВизОбъект o = найдиОбъект(ptr);
        if (o) return cast(ОбработчикСоб)o;
        else return new ОбработчикСоб(ptr);
        //	return cast(ОбработчикСоб)найдиОбъект(wxWindow_GetEventHandler(вхобъ),&ОбработчикСоб.Нов);
    }
    export проц обработчикСобытий(ОбработчикСоб значение)
    {
        wxWindow_SetEventHandler(вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    export проц суньОбрСоб(ОбработчикСоб обработчик)
    {
        wxWindow_PushEventHandler(вхобъ, ВизОбъект.безопУк(обработчик));
    }

    export ОбработчикСоб выньОбрСоб(бул удалиОбраб)
    {
        ЦелУкз ptr = wxWindow_PopEventHandler(вхобъ, удалиОбраб);
        ВизОбъект o = найдиОбъект(ptr);
        if (o) return cast(ОбработчикСоб)o;
        else return new ОбработчикСоб(ptr);
        //	return cast(ОбработчикСоб)найдиОбъект(wxWindow_PopEventHandler(вхобъ, удалиОбраб),&ОбработчикСоб.Нов);
    }

    export бул удалиОбрСоб(ОбработчикСоб обработчик)
    {
        return wxWindow_RemoveEventHandler(вхобъ, ВизОбъект.безопУк(обработчик));
    }

    //---------------------------------------------------------------------

    export  Оценщик оценщик()
    {
        return cast(Оценщик)найдиОбъект(wxWindow_GetValidator(вхобъ));
    }
    export  проц оценщик(Оценщик значение)
    {
        wxWindow_SetValidator(вхобъ, ВизОбъект.безопУк(значение));
    }

    export  бул оцени()
    {
        return wxWindow_Validate(вхобъ);
    }

    //---------------------------------------------------------------------

    export  бул передатьДанныеОкну()
    {
        //return wxWindow_TransferDataToWindow(вхобъ);
        return да;
    }

    export  бул передатьДанныеОтОкна()
    {
        //return wxWindow_TransferDataFromWindow(вхобъ);
        return да;
    }

    //---------------------------------------------------------------------

    export  проц иницДиалог()
    {
        wxWindow_InitDialog(вхобъ);
    }

    //---------------------------------------------------------------------

    export  Точка преобразуйПикселиВДиалог(Точка тчк)
    {
        Точка точка;
        wxWindow_ConvertPixelsToDialogPoint(вхобъ, тчк, точка);
        return точка;
    }

    export  Точка преобразуйДиалогВПиксели(Точка тчк)
    {
        Точка точка;
        wxWindow_ConvertDialogToPixelsPoint(вхобъ, тчк, точка);
        return точка;
    }

    export  Размер преобразуйПикселиВДиалог(Размер рм)
    {
        Размер размер;
        wxWindow_ConvertPixelsToDialogSize(вхобъ, рм, размер);
        return размер;
    }

    export  Размер преобразуйДиалогВПиксели(Размер рм)
    {
        Размер размер;
        wxWindow_ConvertPixelsToDialogSize(вхобъ, рм, размер);
        return размер;
    }

    //---------------------------------------------------------------------

    export  проц устУказательКурсора(цел x, цел y)
    {
        wxWindow_WarpPointer(вхобъ, x, y);
    }

    export  проц захватиМышь()
    {
        wxWindow_CaptureMouse(вхобъ);
    }

    export  проц отпустиМышь()
    {
        wxWindow_ReleaseMouse(вхобъ);
    }

    export static Окно получиЗахват()
    {
        return cast(Окно)найдиОбъект(wxWindow_GetCapture());
    }

    export  бул естьЗахват()
    {
        return wxWindow_HasCapture(вхобъ);
    }

    //---------------------------------------------------------------------

    export  проц освежи()
    {
        освежи(да, прямКлиента);
    }

    export  проц освежи(бул стеретьФон)
    {
        освежи(стеретьФон, прямКлиента);
    }

    export  проц освежи(бул стеретьФон, Прямоугольник прям)
    {
        wxWindow_Refresh(вхобъ, стеретьФон, прям);
    }

    export  проц освежиПрямоугольник(Прямоугольник прям)
    {
        wxWindow_RefreshRect(вхобъ, прям);
    }

    //---------------------------------------------------------------------

    export  проц обнови()
    {
        wxWindow_Update(вхобъ);
    }

    export  проц очистьФон()
    {
        wxWindow_ClearBackground(вхобъ);
    }

    //---------------------------------------------------------------------

    export  проц заморозь()
    {
        wxWindow_Freeze(вхобъ);
    }

    export  проц оттай()
    {
        wxWindow_Thaw(вхобъ);
    }

    //---------------------------------------------------------------------

    export  проц подготовьКУ(КонтекстУстройства ку)
    {
        wxWindow_PrepareDC(вхобъ, ВизОбъект.безопУк(ку));
    }

    //---------------------------------------------------------------------

    export  бул  выставлен(цел x, цел y, цел w, цел h)
    {
        return wxWindow_IsExposed(вхобъ, x, y, w, h);
    }

    //---------------------------------------------------------------------

    export  Каретка каретка()
    {
        return cast(Каретка)найдиОбъект(wxWindow_GetCaret(вхобъ),&Каретка.Нов);
    }
    export  проц каретка(Каретка значение)
    {
        wxWindow_SetCaret(вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    export  цел высьСим()
    {
        return wxWindow_GetCharHeight(вхобъ);
    }

    export  цел ширьСим()
    {
        return wxWindow_GetCharWidth(вхобъ);
    }

    //---------------------------------------------------------------------

    export проц дайПротяженностьТекста(ткст стр, out цел x, out цел y, out цел descent,
                              out цел внешнееВступление, Шрифт шрифт)
    {
        wxWindow_GetTextExtent(вхобъ, стр, x, y, descent,
                               внешнееВступление, ВизОбъект.безопУк(шрифт));
    }

    //---------------------------------------------------------------------

    export проц клиентКЭкрану(inout цел x, inout цел y)
    {
        wxWindow_ClientToScreen(вхобъ, x, y);
    }

    export Точка клиентКЭкрану(Точка точкаКлиента)
    {
        Точка точкаЭкрана;
        wxWindow_ClientToScreen(вхобъ, точкаКлиента, точкаЭкрана);
        return точкаЭкрана;
    }

    export  проц экранККлиенту(inout цел x, inout цел y)
    {
        wxWindow_ScreenToClient(вхобъ, x, y);
    }

    export Точка экранККлиенту(Точка точкаЭкрана)
    {
        Точка точкаКлиента;
        wxWindow_ScreenToClient(вхобъ, точкаЭкрана, точкаКлиента);
        return точкаКлиента;
    }

    //---------------------------------------------------------------------

    export  проц обновиИПОкна()
    {
        wxWindow_UpdateWindowUI(вхобъ);
    }

    //---------------------------------------------------------------------

    export  бул всплывающееМеню(Меню меню, Точка поз)
    {
        бул tmpbool = wxWindow_PopupMenu(вхобъ, ВизОбъект.безопУк(меню), поз);

        меню.подключиСобытия(this);

        return tmpbool;
    }

    //---------------------------------------------------------------------

    export  бул естьСкроллбар(цел ориент)
    {
        return wxWindow_HasScrollbar(вхобъ, ориент);
    }

    export  проц устСкроллбар(цел ориент, цел поз, цел размТумб, цел диапазон, бул освежи)
    {
        wxWindow_SetScrollbar(вхобъ, ориент, поз, размТумб, диапазон, освежи);
    }

    export  проц устПозПрокр(цел ориент, цел поз, бул освежи)
    {
        wxWindow_SetScrollPos(вхобъ, ориент, поз, освежи);
    }

    //---------------------------------------------------------------------

    export  цел дайПозПрокр(цел ориент)
    {
        return wxWindow_GetScrollPos(вхобъ, ориент);
    }

    export  цел дайПрокрТумб(цел ориент)
    {
        return wxWindow_GetScrollThumb(вхобъ, ориент);
    }

    export  цел дайПрокрДиапазон(цел ориент)
    {
        return wxWindow_GetScrollRange(вхобъ, ориент);
    }

    //---------------------------------------------------------------------

    export  проц прокрутиОкно(цел dx, цел dy, Прямоугольник прям)
    {
        wxWindow_ScrollWindow(вхобъ, dx, dy, прям);
    }

    export  бул прокрутиСтроки(цел строки)
    {
        return wxWindow_ScrollLines(вхобъ, строки);
    }

    export  бул прокрутиСтраницы(цел страницы)
    {
        return wxWindow_ScrollPages(вхобъ, страницы);
    }

    //---------------------------------------------------------------------

    export  бул строкаВыше()
    {
        return wxWindow_LineUp(вхобъ);
    }

    export  бул строкаНиже()
    {
        return wxWindow_LineDown(вхобъ);
    }

    export  бул страницаВыше()
    {
        return wxWindow_PageUp(вхобъ);
    }

    export  бул страницаНиже()
    {
        return wxWindow_PageDown(вхобъ);
    }

    //---------------------------------------------------------------------

    export  ткст текстСправки()
    {
        return cast(ткст) new ВизТкст(wxWindow_GetHelpText(вхобъ), да);
    }
    export  проц текстСправки(ткст значение)
    {
        wxWindow_SetHelpText(вхобъ, значение);
    }

    export  проц устТекстСправкиДляид(ткст текст)
    {
        wxWindow_SetHelpTextForId(вхобъ, текст);
    }

    //---------------------------------------------------------------------
    /+FIXME
    export  МишеньСброса мишеньСброса()
    {
        return cast(МишеньСброса)найдиОбъект(wxWindow_GetDropTarget(вхобъ),&МишеньСброса.Нов);
    }
    +/
    export  проц мишеньСброса(МишеньСброса значение)
    {
        wxWindow_SetDropTarget(вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    // LayoutConstraints are now depreciated.  Should this be implemented?
    /*export LayoutContraints Constraints
    {
    	get
    	{
    		return new LayoutConstraints(wxWindow_GetConstraints(вхобъ));
    	}
    	set
    	{
    		wxWindow_SetConstraints(вхобъ, ВизОбъект.безопУк(значение));
    	}
    }*/

    //---------------------------------------------------------------------

    export  бул автоРаскладка()
    {
        return wxWindow_GetAutoLayout(вхобъ);
    }
    export  проц автоРаскладка(бул значение)
    {
        wxWindow_SetAutoLayout(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export  проц устПеремерщикИВстрой(Перемерщик сайзер, бул удалитьСтар)
    {
        wxWindow_SetSizerAndFit(вхобъ, ВизОбъект.безопУк(сайзер), удалитьСтар);
    }

    //---------------------------------------------------------------------

    export  Перемерщик сайзер()
    {
        return cast(Перемерщик)найдиОбъект(wxWindow_GetSizer(вхобъ));
    }
    export  проц  сайзер(Перемерщик значение)
    {
        устПеремерщик(значение, да);
    }

    //---------------------------------------------------------------------

    export  Перемерщик содержащийПеремерщик()
    {
        return cast(Перемерщик)найдиОбъект(wxWindow_GetContainingSizer(вхобъ));
    }
    export  проц  содержащийПеремерщик(Перемерщик значение)
    {
        wxWindow_SetContainingSizer(вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    export  Палитра палитра()
    {
        return new Палитра(wxWindow_GetPalette(вхобъ));
    }
    export  проц палитра(Палитра значение)
    {
        wxWindow_SetPalette(вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    export  бул особаяПалитра()
    {
        return wxWindow_HasCustomPalette(вхобъ);
    }

    //---------------------------------------------------------------------

    export  Регион обновиРегион()
    {
        return new Регион(wxWindow_GetUpdateRegion(вхобъ));
    }

    //---------------------------------------------------------------------

    // Implement very common System.Windows.Forms.Контрол members

    export  цел верх()
    {
        return this.позиция.У;
    }
    export  проц верх(цел значение)
    {
        this.сдвинь(this.позиция.Х, значение,	0);
    }

    export  цел лево()
    {
        return this.позиция.Х;
    }
    export  проц лево(цел значение)
    {
        this.сдвинь(значение, this.позиция.У,	0);
    }

    export  цел право()
    {
        return this.позиция.Х + this.размер.ширь;
    }
    export  проц право( цел значение)
    {
        this.сдвинь(значение -	this.размер.ширь, this.позиция.У, 0);
    }

    export  цел низ()
    {
        return this.позиция.У + this.размер.высь;
    }
    export  проц низ(цел значение)
    {
        this.сдвинь(this.позиция.Х, значение - this.размер.высь, 0);
    }

    export  цел ширь()
    {
        return this.размер.ширь;
    }
    export  проц ширь(цел значение)
    {
        Размер размер;
        размер.ширь = значение;
        размер.высь = this.размер.высь;
        this.размер = размер;
    }

    export  цел высь()
    {
        return this.размер.высь;
    }
    export  проц высь(цел значение)
    {
        Размер размер;
        размер.ширь = this.размер.ширь;
        размер.высь = значение;
        this.размер = размер;
    }

    //---------------------------------------------------------------------

    export ПВариантОкна вариантОкна()
    {
        return cast(ПВариантОкна)wxWindow_GetWindowVariant(вхобъ);
    }
    //---------------------------------------------------------------------

    export бул удаляется()
    {
        return wxWindow_IsBeingDeleted(вхобъ);
    }

    //---------------------------------------------------------------------

    export проц лучшийРазмКэша(Размер размер)
    {
        wxWindow_CacheBestSize(вхобъ, размер);
    }

    //---------------------------------------------------------------------

    export проц инвалидируйЛучшийРазм()
    {
        wxWindow_InvalidateBestSize(вхобъ);
    }

    //---------------------------------------------------------------------

    export Размер лучшийРазмСовмещения()
    {
        Размер размер;
        wxWindow_GetBestFittingSize(вхобъ, размер);
        return размер;
    }
    export проц лучшийРазмСовмещения(Размер значение)
    {
        wxWindow_SetBestFittingSize(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export Окно[] отпрыски()
    {
        цел счёт = wxWindow_GetChildrenCount(вхобъ);
        Окно[] ret = new Окно[счёт];
        for (цел чис = 0; чис < счёт; чис++)
        {
            ret[чис] = cast(Окно)найдиОбъект(wxWindow_GetChildren(вхобъ, чис));
        }
        return ret;
    }

    //---------------------------------------------------------------------

    export ТаблицаАкселераторов табАкселераторов()
    {
        return cast(ТаблицаАкселераторов)найдиОбъект(wxWindow_GetAcceleratorTable(вхобъ),&ТаблицаАкселераторов.Нов);
    }
    //---------------------------------------------------------------------

    export  ВизАтрибуты дефАтры()
    {
        return new ВизАтрибуты(wxWindow_GetDefaultAttributes(вхобъ), да);
    }

    //---------------------------------------------------------------------

    export static ВизАтрибуты дефАтрыКласса()
    {
        return дефАтрыКласса(ПВариантОкна.НОРМАЛЬНЫЙ);
    }

    export static ВизАтрибуты дефАтрыКласса(ПВариантОкна вариант)
    {
        return new ВизАтрибуты(wxWindow_GetClassDefaultAttributes(cast(цел)вариант), да);
    }

    //---------------------------------------------------------------------

    export  ПСтильФона стильФона()
    {
        return cast(ПСтильФона)wxWindow_GetBackgroundStyle(вхобъ);
    }
    export  проц стильФона(ПСтильФона значение)
    {
        wxWindow_SetBackgroundStyle(вхобъ, cast(цел)значение);
    }

    //---------------------------------------------------------------------

    export ПБордюр бордюр()
    {
        return cast(ПБордюр)wxWindow_GetBorder(вхобъ);
    }
    export ПБордюр бордюрПоФлагам(бцел флаги)
    {
        return cast(ПБордюр)wxWindow_GetBorderByFlags(вхобъ, флаги);
    }

    //---------------------------------------------------------------------

    // TODO Not available in OS Х
    /*
    export ткст ToolTipText() { return cast(ткст) new ВизТкст(wxWindow_GetToolTipText(вхобъ), да); }                */

    //---------------------------------------------------------------------

    export Окно предокСОсобойПалитрой()
    {
        return cast(Окно)найдиОбъект(wxWindow_GetAncestorWithCustomPalette(вхобъ),&Окно.Нов);
    }
    //---------------------------------------------------------------------

    export  проц наследуйАтрибуты()
    {
        wxWindow_InheritAttributes(вхобъ);
    }

    //---------------------------------------------------------------------

    export  бул наследоватьЦвета()
    {
        return wxWindow_ShouldInheritColours(вхобъ);
    }

    //---------------------------------------------------------------------

    export проц LeftUp_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_ЛЕВАЯ_ВВЕРХУ, ид, значение, this);
    }
    export проц LeftUp_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц RightUp_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_ПРАВАЯ_ВВЕРХУ, ид, значение, this);
    }
    export проц RightUp_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц MiddleUp_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_СРЕДНЯЯ_ВВЕРХУ, ид, значение, this);
    }
    export проц MiddleUp_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц LeftDown_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_ЛЕВАЯ_ВНИЗУ, ид, значение, this);
    }
    export проц LeftDown_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц MiddleDown_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_СРЕДНЯЯ_ВНИЗУ, ид, значение, this);
    }
    export проц MiddleDown_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц RightDown_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_ПРАВАЯ_ВНИЗУ, ид, значение, this);
    }
    export проц RightDown_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц LeftDoubleClick_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_ЛЕВАЯ_ДНАЖАТА, ид, значение, this);
    }
    export проц LeftDoubleClick_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц RightDoubleClick_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_ПРАВАЯ_ДНАЖАТА, ид, значение, this);
    }
    export проц RightDoubleClick_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц MiddleDoubleClick_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_СРЕДНЯЯ_ДНАЖАТА, ид, значение, this);
    }
    export проц MiddleDoubleClick_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц MouseMove_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_ДВИЖЕНИЕ, ид, значение, this);
    }
    export проц MouseMove_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц MouseThumbTrack_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_СКРОЛЛ_ТУМБТРЭК, ид, значение, this);
    }
    export проц MouseThumbTrack_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц MouseEnter_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_ВХОД_ОКНО, ид, значение, this);
    }
    export проц MouseEnter_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц MouseLeave_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_ВЫХОД_ОКНО, ид, значение, this);
    }
    export проц MouseLeave_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц ScrollLineUp_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_СКРОЛЛ_СТРОКОЙ_ВЫШЕ, ид, значение, this);
    }
    export проц ScrollLineUp_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц ScrollLineDown_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_СКРОЛЛ_СТРОКОЙ_НИЖЕ, ид, значение, this);
    }
    export проц ScrollLineDown_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц UpdateUI_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_ОБНОВИ_ИП, ид, значение, this);
    }
    export проц UpdateUI_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц KeyDown_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КЛАВИША_ВНИЗУ, ид, значение, this);
    }
    export проц KeyDown_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц KeyUp_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КЛАВИША_ВВЕРХУ, ид, значение, this);
    }
    export проц KeyUp_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц Char_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_СИМВ, ид, значение, this);
    }
    export проц Char_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц Closing_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_ЗАКРОЙ_ОКНО, ид, значение, this);
    }
    export проц Closing_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц Activated_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_АКТИВИРУЙ, ид, значение, this);
    }
    export проц Activated_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц Moved_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_ДВИГАЙ, ид, значение, this);
    }
    export проц Moved_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц Resized_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_РАЗМЕР, ид, значение, this);
    }
    export проц Resized_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }
}

