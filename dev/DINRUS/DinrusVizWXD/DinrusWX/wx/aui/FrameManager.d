module  wx.aui.FrameManager;

public import wx.wx;
public import wx.MiniFrame;
public import wx.Image;
public import wx.Event;
public import wx.EvtHandler;
public import wx.aui.DockArt;

enum ПДокМенеджераРамки
{
    Нет = 0,
    Верхний = 1,
    Правый = 2,
    Нижний = 3,
    Левый = 4,
    Центральный = 5,
};

enum ПОпцияМенеджераРамки
{
    wxAUI_MGR_ALLOW_FLOATING        = 1 << 0,
    wxAUI_MGR_ALLOW_ACTIVE_PANE     = 1 << 1,
    wxAUI_MGR_TRANSPARENT_DRAG      = 1 << 2,
    wxAUI_MGR_TRANSPARENT_HINT      = 1 << 3,
    wxAUI_MGR_TRANSPARENT_HINT_FADE = 1 << 4,

    wxAUI_MGR_Дефолт = wxAUI_MGR_ALLOW_FLOATING |
                        wxAUI_MGR_TRANSPARENT_HINT |
                        wxAUI_MGR_TRANSPARENT_HINT_FADE
};

enum ПНастройкаПаноДокАрта
{
    wxAUI_ART_SASH_SIZE = 0,
    wxAUI_ART_CAPTION_SIZE = 1,
    wxAUI_ART_GRIPPER_SIZE = 2,
    wxAUI_ART_PANE_BORDER_SIZE = 3,
    wxAUI_ART_PANE_BUTTON_SIZE = 4,
    wxAUI_ART_BACKGROUND_COLOUR = 5,
    wxAUI_ART_SASH_COLOUR = 6,
    wxAUI_ART_ACTIVE_CAPTION_COLOUR = 7,
    wxAUI_ART_ACTIVE_CAPTION_GRADIENT_COLOUR = 8,
    wxAUI_ART_INACTIVE_CAPTION_COLOUR = 9,
    wxAUI_ART_INACTIVE_CAPTION_GRADIENT_COLOUR = 10,
    wxAUI_ART_ACTIVE_CAPTION_TEXT_COLOUR = 11,
    wxAUI_ART_INACTIVE_CAPTION_TEXT_COLOUR = 12,
    wxAUI_ART_BORDER_COLOUR = 13,
    wxAUI_ART_GRIPPER_COLOUR = 14,
    wxAUI_ART_CAPTION_FONT = 15,
    wxAUI_ART_GRADIENT_TYPE = 16
};

enum ПГрадиентыПаноДокАрта
{
    Нет = 0,
    Вертикальный = 1,
    Горизонтальный = 2
};

enum ПСостояниеКнопкиПано
{
    Норма = 0,
    Ховер = 1,
    Нажата = 2
};

enum ПУровеньВставкиПано
{
    Пано = 0,
    Ряд = 1,
    Док = 2
};

//-----------------------------------------------------------------------------

//! \cond EXTERN
static export extern (C) ЦелУкз wxPaneInfo_ctor();
static export extern (C) проц wxPaneInfo_Copy(ЦелУкз сам, ЦелУкз c);
static export extern (C) бул wxPaneInfo_IsOk(ЦелУкз сам);
static export extern (C) бул wxPaneInfo_IsFixed(ЦелУкз сам);
static export extern (C) бул wxPaneInfo_IsResizable(ЦелУкз сам);
static export extern (C) бул wxPaneInfo_IsShown(ЦелУкз сам);
static export extern (C) бул wxPaneInfo_IsFloating(ЦелУкз сам);
static export extern (C) бул wxPaneInfo_IsDocked(ЦелУкз сам);
static export extern (C) бул wxPaneInfo_IsToolbar(ЦелУкз сам);
static export extern (C) бул wxPaneInfo_IsTopDockable(ЦелУкз сам);
static export extern (C) бул wxPaneInfo_IsBottomDockable(ЦелУкз сам);
static export extern (C) бул wxPaneInfo_IsLeftDockable(ЦелУкз сам);
static export extern (C) бул wxPaneInfo_IsRightDockable(ЦелУкз сам);
static export extern (C) бул wxPaneInfo_IsFloatable(ЦелУкз сам);
static export extern (C) бул wxPaneInfo_IsMovable(ЦелУкз сам);
static export extern (C) бул wxPaneInfo_HasCaption(ЦелУкз сам);
static export extern (C) бул wxPaneInfo_HasGripper(ЦелУкз сам);
static export extern (C) бул wxPaneInfo_HasBorder(ЦелУкз сам);
static export extern (C) бул wxPaneInfo_HasCloseButton(ЦелУкз сам);
static export extern (C) бул wxPaneInfo_HasMaximizeButton(ЦелУкз сам);
static export extern (C) бул wxPaneInfo_HasMinimizeButton(ЦелУкз сам);
static export extern (C) бул wxPaneInfo_HasPinButton(ЦелУкз сам);
static export extern (C) ЦелУкз wxPaneInfo_Window(ЦелУкз сам, ЦелУкз w);
static export extern (C) ЦелУкз wxPaneInfo_Name(ЦелУкз сам, ткст ч);
static export extern (C) ЦелУкз wxPaneInfo_Caption(ЦелУкз сам, ткст c);
static export extern (C) ЦелУкз wxPaneInfo_Left(ЦелУкз сам);
static export extern (C) ЦелУкз wxPaneInfo_Right(ЦелУкз сам);
static export extern (C) ЦелУкз wxPaneInfo_Top(ЦелУкз сам);
static export extern (C) ЦелУкз wxPaneInfo_Bottom(ЦелУкз сам);
static export extern (C) ЦелУкз wxPaneInfo_Center(ЦелУкз сам);
static export extern (C) ЦелУкз wxPaneInfo_Centre(ЦелУкз сам);
static export extern (C) ЦелУкз wxPaneInfo_Direction(ЦелУкз сам, цел направление);
static export extern (C) ЦелУкз wxPaneInfo_Layer(ЦелУкз сам, цел слой);
static export extern (C) ЦелУкз wxPaneInfo_Row(ЦелУкз сам, цел ряд);
static export extern (C) ЦелУкз wxPaneInfo_Position(ЦелУкз сам, цел поз);
static export extern (C) ЦелУкз wxPaneInfo_BestSize(ЦелУкз сам, inout Размер размер);
static export extern (C) ЦелУкз wxPaneInfo_MinSize(ЦелУкз сам, inout Размер размер);
static export extern (C) ЦелУкз wxPaneInfo_MaxSize(ЦелУкз сам, inout Размер размер);
static export extern (C) ЦелУкз wxPaneInfo_BestSizeXY(ЦелУкз сам, цел x, цел y);
static export extern (C) ЦелУкз wxPaneInfo_MinSizeXY(ЦелУкз сам, цел x, цел y);
static export extern (C) ЦелУкз wxPaneInfo_MaxSizeXY(ЦелУкз сам, цел x, цел y);
static export extern (C) ЦелУкз wxPaneInfo_FloatingPosition(ЦелУкз сам, inout Точка поз);
static export extern (C) ЦелУкз wxPaneInfo_FloatingPositionXY(ЦелУкз сам, цел x, цел y);
static export extern (C) ЦелУкз wxPaneInfo_FloatingSize(ЦелУкз сам, inout Размер размер);
static export extern (C) ЦелУкз wxPaneInfo_FloatingSizeXY(ЦелУкз сам, цел x, цел y);
static export extern (C) ЦелУкз wxPaneInfo_Fixed(ЦелУкз сам);
static export extern (C) ЦелУкз wxPaneInfo_Resizable(ЦелУкз сам, бул перемеряем = да);
static export extern (C) ЦелУкз wxPaneInfo_Dock(ЦелУкз сам);
static export extern (C) ЦелУкз wxPaneInfo_Float(ЦелУкз сам);
static export extern (C) ЦелУкз wxPaneInfo_Hide(ЦелУкз сам);
static export extern (C) ЦелУкз wxPaneInfo_Show(ЦелУкз сам, бул показ = да);
static export extern (C) ЦелУкз wxPaneInfo_CaptionVisible(ЦелУкз сам, бул видим = да);
static export extern (C) ЦелУкз wxPaneInfo_PaneBorder(ЦелУкз сам, бул видим = да);
static export extern (C) ЦелУкз wxPaneInfo_Gripper(ЦелУкз сам, бул видим = да);
static export extern (C) ЦелУкз wxPaneInfo_CloseButton(ЦелУкз сам, бул видим = да);
static export extern (C) ЦелУкз wxPaneInfo_MaximizeButton(ЦелУкз сам, бул видим = да);
static export extern (C) ЦелУкз wxPaneInfo_MinimizeButton(ЦелУкз сам, бул видим = да);
static export extern (C) ЦелУкз wxPaneInfo_PinButton(ЦелУкз сам, бул видим = да);
static export extern (C) ЦелУкз wxPaneInfo_DestroyOnClose(ЦелУкз сам, бул с = да);
static export extern (C) ЦелУкз wxPaneInfo_TopDockable(ЦелУкз сам, бул с = да);
static export extern (C) ЦелУкз wxPaneInfo_BottomDockable(ЦелУкз сам, бул с = да);
static export extern (C) ЦелУкз wxPaneInfo_LeftDockable(ЦелУкз сам, бул с = да);
static export extern (C) ЦелУкз wxPaneInfo_RightDockable(ЦелУкз сам, бул с = да);
static export extern (C) ЦелУкз wxPaneInfo_Floatable(ЦелУкз сам, бул с = да);
static export extern (C) ЦелУкз wxPaneInfo_Movable(ЦелУкз сам, бул с = да);
static export extern (C) ЦелУкз wxPaneInfo_Dockable(ЦелУкз сам, бул с = да);
static export extern (C) ЦелУкз wxPaneInfo_DefaultPane(ЦелУкз сам);
static export extern (C) ЦелУкз wxPaneInfo_CentrePane(ЦелУкз сам);
static export extern (C) ЦелУкз wxPaneInfo_CenterPane(ЦелУкз сам);
static export extern (C) ЦелУкз wxPaneInfo_ToolbarPane(ЦелУкз сам);
static export extern (C) ЦелУкз wxPaneInfo_SetFlag(ЦелУкз сам, бцел флаг, бул состоянОпц);
static export extern (C) бул wxPaneInfo_HasFlag(ЦелУкз сам, бцел флаг);
static export extern (C) ткст wxPaneInfo_GetName(ЦелУкз сам);
static export extern (C) ткст wxPaneInfo_GetCaption(ЦелУкз сам);
static export extern (C) ЦелУкз wxPaneInfo_GetWindow(ЦелУкз сам);
static export extern (C) ЦелУкз wxPaneInfo_GetFrame(ЦелУкз сам);
static export extern (C) бцел wxPaneInfo_GetState(ЦелУкз сам);
static export extern (C) цел wxPaneInfo_GetDock_Direction(ЦелУкз сам);
static export extern (C) цел wxPaneInfo_GetDock_Layer(ЦелУкз сам);
static export extern (C) цел wxPaneInfo_GetDock_Row(ЦелУкз сам);
static export extern (C) цел wxPaneInfo_GetDock_Pos(ЦелУкз сам);
static export extern (C) проц wxPaneInfo_GetBest_Size(ЦелУкз сам, out Размер размер);
static export extern (C) проц wxPaneInfo_GetMin_Size(ЦелУкз сам, out Размер размер);
static export extern (C) проц wxPaneInfo_GetMax_Size(ЦелУкз сам, out Размер размер);
static export extern (C) проц wxPaneInfo_GetFloating_Pos(ЦелУкз сам, out Точка Точка);
static export extern (C) проц wxPaneInfo_GetFloating_Size(ЦелУкз сам, out Размер размер);
static export extern (C) цел wxPaneInfo_GetDock_Proportion(ЦелУкз сам);
static export extern (C) проц wxPaneInfo_GetRect(ЦелУкз сам, out Прямоугольник прям);
//! \endcond

//-----------------------------------------------------------------------------

//! \cond EXTERN
static export extern (C) ЦелУкз wxFrameManager_ctor(ЦелУкз рамка = пусто, бцел флаги = ПОпцияМенеджераРамки.wxAUI_MGR_Дефолт);
static export extern (C) проц wxFrameManager_dtor(ЦелУкз сам);
static export extern (C) проц wxFrameManager_UnInit(ЦелУкз сам);
static export extern (C) проц wxFrameManager_SetFlags(ЦелУкз сам, бцел флаги);
static export extern (C) бцел wxFrameManager_GetFlags(ЦелУкз сам);
static export extern (C) проц wxFrameManager_SetFrame(ЦелУкз сам, ЦелУкз рамка);
static export extern (C) ЦелУкз wxFrameManager_GetFrame(ЦелУкз сам);
static export extern (C) проц wxFrameManager_SetArtProvider(ЦелУкз сам, ЦелУкз артПров);
static export extern (C) ЦелУкз wxFrameManager_GetArtProvider(ЦелУкз сам);
static export extern (C) ЦелУкз wxFrameManager_GetPaneByWindow(ЦелУкз сам, ЦелУкз окно);
static export extern (C) ЦелУкз wxFrameManager_GetPaneByName(ЦелУкз сам, ткст имя);
static export extern (C) цел wxFrameManager_GetPaneCount(ЦелУкз сам);
static export extern (C) ЦелУкз wxFrameManager_GetPane(ЦелУкз сам, цел индекс);
static export extern (C) бул wxFrameManager_AddPane(ЦелУкз сам, ЦелУкз окно, ЦелУкз инфОПано);
static export extern (C) бул wxFrameManager_AddPane2(ЦелУкз сам, ЦелУкз окно, цел направление, ткст заголовок);
static export extern (C) бул wxFrameManager_InsertPane(ЦелУкз сам, ЦелУкз окно, ЦелУкз инфОПано, цел уровеньВставки = ПУровеньВставкиПано.Пано);
static export extern (C) бул wxFrameManager_DetachPane(ЦелУкз сам, ЦелУкз окно);
static export extern (C) ткст wxFrameManager_SavePerspective(ЦелУкз сам);
static export extern (C) бул wxFrameManager_LoadPerspective(ЦелУкз сам, ткст перспектива, бул обновить = да);
static export extern (C) проц wxFrameManager_Update(ЦелУкз сам);

static export extern (C) ТипСобытия wxEvent_EVT_AUI_PANEBUTTON();
//! \endcond

//-----------------------------------------------------------------------------

//! \cond EXTERN
static export extern (C) проц wxFrameManagerEvent_SetPane(ЦелУкз сам, ЦелУкз p);
static export extern (C) ЦелУкз wxFrameManagerEvent_GetPane(ЦелУкз сам);
static export extern (C) проц wxFrameManagerEvent_SetButton(ЦелУкз сам, цел с);
static export extern (C) цел wxFrameManagerEvent_GetButton(ЦелУкз сам);
static export extern (C) ЦелУкз wxFrameManagerEvent_Clone(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class ИнфОПано : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        this(wxPaneInfo_ctor());
    }

    export this(ИнфОПано c)
    {
        this();
        wxPaneInfo_Copy(вхобъ, c.вхобъ);
    }

    export бул Ок()
    {
        return wxPaneInfo_IsOk(вхобъ);
    }
    export бул фиксирован()
    {
        return wxPaneInfo_IsFixed(вхобъ);
    }
    export бул размИзменяем()
    {
        return wxPaneInfo_IsResizable(вхобъ);
    }
    export бул виден()
    {
        return wxPaneInfo_IsShown(вхобъ);
    }
    export бул плавающ()
    {
        return wxPaneInfo_IsFloating(вхобъ);
    }
    export бул докирован()
    {
        return wxPaneInfo_IsDocked(вхобъ);
    }
    export бул тулбар_ли()
    {
        return wxPaneInfo_IsToolbar(вхобъ);
    }
    export бул докируемВверху()
    {
        return wxPaneInfo_IsTopDockable(вхобъ);
    }
    export бул докируемВнизу()
    {
        return wxPaneInfo_IsBottomDockable(вхобъ);
    }
    export бул докируемСлева()
    {
        return wxPaneInfo_IsLeftDockable(вхобъ);
    }
    export бул докируемСправа()
    {
        return wxPaneInfo_IsRightDockable(вхобъ);
    }
    export бул можетПлавать()
    {
        return wxPaneInfo_IsFloatable(вхобъ);
    }
    export бул можетПеремещаться()
    {
        return wxPaneInfo_IsMovable(вхобъ);
    }
    export бул естьКапшн()
    {
        return wxPaneInfo_HasCaption(вхобъ);
    }
    export бул естьГриппер()
    {
        return wxPaneInfo_HasGripper(вхобъ);
    }
    export бул естьБордюр()
    {
        return wxPaneInfo_HasBorder(вхобъ);
    }
    export бул естьКнопкаЗакрыть()
    {
        return wxPaneInfo_HasCloseButton(вхобъ);
    }
    export бул естьКнопкаМаксимируй()
    {
        return wxPaneInfo_HasMaximizeButton(вхобъ);
    }
    export бул естьКнопкаМинимируй()
    {
        return wxPaneInfo_HasMinimizeButton(вхобъ);
    }
    export бул естьКнопкаПришпилить()
    {
        return wxPaneInfo_HasPinButton(вхобъ);
    }

    export ИнфОПано окно(Окно w)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_Window(вхобъ, ВизОбъект.безопУк(w)));
    }
    export ИнфОПано имя(ткст ч)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_Name(вхобъ, ч));
    }
    export ИнфОПано капшн(ткст c)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_Caption(вхобъ, c));
    }
    export ИнфОПано лево()
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_Left(вхобъ));
    }
    export ИнфОПано право()
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_Right(вхобъ));
    }
    export ИнфОПано верх()
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_Top(вхобъ));
    }
    export ИнфОПано низ()
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_Bottom(вхобъ));
    }
    export ИнфОПано центруй()
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_Center(вхобъ));
    }
    export ИнфОПано центр()
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_Centre(вхобъ));
    }
    export ИнфОПано направление(цел направление)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_Direction(вхобъ, направление));
    }
    export ИнфОПано слой(цел слой)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_Layer(вхобъ, слой));
    }
    export ИнфОПано ряд(цел ряд)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_Row(вхобъ, ряд));
    }
    export ИнфОПано позиция(цел поз)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_Position(вхобъ, поз));
    }
    export ИнфОПано лучшийРазм(ref Размер размер)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_BestSize(вхобъ, размер));
    }
    export ИнфОПано минРазм(ref Размер размер)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_MinSize(вхобъ, размер));
    }
    export ИнфОПано максРазм(ref Размер размер)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_MaxSize(вхобъ, размер));
    }
    export ИнфОПано лучшийРаз(цел x, цел y)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_BestSizeXY(вхобъ, x, y));
    }
    export ИнфОПано минРазм(цел x, цел y)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_MinSizeXY(вхобъ, x, y));
    }
    export ИнфОПано максРазм(цел x, цел y)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_MaxSizeXY(вхобъ, x, y));
    }
    export ИнфОПано плавающПоложение(ref Точка поз)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_FloatingPosition(вхобъ, поз));
    }
    export ИнфОПано плавающПоложение(цел x, цел y)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_FloatingPositionXY(вхобъ, x, y));
    }
    export ИнфОПано плавающРазм(ref Размер размер)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_FloatingSize(вхобъ, размер));
    }
    export ИнфОПано плавающРазм(цел x, цел y)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_FloatingSizeXY(вхобъ, x, y));
    }
    export ИнфОПано фиксированый()
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_Fixed(вхобъ));
    }
    export ИнфОПано изменяемыйРазм(бул перемеряем = да)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_Resizable(вхобъ, перемеряем));
    }
    export ИнфОПано докируй()
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_Dock(вхобъ));
    }
    export ИнфОПано плавай()
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_Float(вхобъ));
    }
    export ИнфОПано спрячь()
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_Hide(вхобъ));
    }
    export ИнфОПано показ(бул показ = да)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_Show(вхобъ, показ));
    }
    export ИнфОПано капшнВиден(бул видим = да)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_CaptionVisible(вхобъ, видим));
    }
    export ИнфОПано бордюрПано(бул видим = да)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_PaneBorder(вхобъ, видим));
    }
    export ИнфОПано гриппер(бул видим = да)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_Gripper(вхобъ, видим));
    }
    export ИнфОПано кнопкаЗакрыть(бул видим = да)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_CloseButton(вхобъ, видим));
    }
    export ИнфОПано кнопкаМаксимируй(бул видим = да)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_MaximizeButton(вхобъ, видим));
    }
    export ИнфОПано кнопкаМинимируй(бул видим = да)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_MinimizeButton(вхобъ, видим));
    }
    export ИнфОПано КнопкаПришпиль(бул видим = да)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_PinButton(вхобъ, видим));
    }
    export ИнфОПано разрушьПриЗакрытии(бул с = да)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_DestroyOnClose(вхобъ, с));
    }
    export ИнфОПано докимуемыйВверху(бул с = да)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_TopDockable(вхобъ, с));
    }
    export ИнфОПано ДокируемыйВнизу(бул с = да)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_BottomDockable(вхобъ, с));
    }
    export ИнфОПано докируемыйСлева(бул с = да)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_LeftDockable(вхобъ, с));
    }
    export ИнфОПано докируемыйСправа(бул с = да)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_RightDockable(вхобъ, с));
    }
    export ИнфОПано плавающий(бул с = да)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_Floatable(вхобъ, с));
    }
    export ИнфОПано перемещаемый(бул с = да)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_Movable(вхобъ, с));
    }
    export ИнфОПано докируемый(бул с = да)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_Dockable(вхобъ, с));
    }
    export ИнфОПано дефПано()
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_DefaultPane(вхобъ));
    }
    export ИнфОПано центрПано()
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_CentrePane(вхобъ));
    }
    export ИнфОПано центрируйПано()
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_CenterPane(вхобъ));
    }
    export ИнфОПано паноТулбара()
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_ToolbarPane(вхобъ));
    }
    export ИнфОПано устФлаг(бцел флаг, бул состоянОпц)
    {
        return cast(ИнфОПано) найдиОбъект(wxPaneInfo_SetFlag(вхобъ, флаг, состоянОпц));
    }
    export бул естьФлаг(бцел флаг)
    {
        return wxPaneInfo_HasFlag(вхобъ, флаг);
    }

    export ткст имя()
    {
        return wxPaneInfo_GetName(вхобъ);
    }
    export ткст заголовок()
    {
        return wxPaneInfo_GetCaption(вхобъ);
    }

    export Окно окно()
    {
        ЦелУкз ptr = wxPaneInfo_GetWindow(вхобъ);
        ВизОбъект o = найдиОбъект(ptr);
        return (o)? cast(Окно)o : new Окно(ptr);
    }
    export Окно рамка()
    {
        ЦелУкз ptr = wxPaneInfo_GetFrame(вхобъ);
        ВизОбъект o = найдиОбъект(ptr);
        return (o)? cast(Окно)o : new Окно(ptr);
    }
    export бцел состояние()
    {
        return wxPaneInfo_GetState(вхобъ);
    }

    export цел докНаправление()
    {
        return wxPaneInfo_GetDock_Direction(вхобъ);
    }
    export цел докСлой()
    {
        return wxPaneInfo_GetDock_Layer(вхобъ);
    }
    export цел докРяд()
    {
        return wxPaneInfo_GetDock_Row(вхобъ);
    }
    export цел докПоз()
    {
        return wxPaneInfo_GetDock_Pos(вхобъ);
    }

    export Размер лучшРазм()
    {
        Размер размер;
        wxPaneInfo_GetBest_Size(вхобъ, размер);
        return размер;
    }
    export Размер минРазм()
    {
        Размер размер;
        wxPaneInfo_GetMin_Size(вхобъ, размер);
        return размер;
    }
    export Размер максРазм()
    {
        Размер размер;
        wxPaneInfo_GetMax_Size(вхобъ, размер);
        return размер;
    }

    export Точка плавПоз()
    {
        Точка Точка;
        wxPaneInfo_GetFloating_Pos(вхобъ, Точка);
        return Точка;
    }
    export Размер плавРазм()
    {
        Размер размер;
        wxPaneInfo_GetFloating_Size(вхобъ, размер);
        return размер;
    }
    export цел докПропорция()
    {
        return wxPaneInfo_GetDock_Proportion(вхобъ);
    }

    export Прямоугольник прям()
    {
        Прямоугольник прям;
        wxPaneInfo_GetRect(вхобъ, прям);
        return прям;
    }

    public enum ПСостояниеПано
    {
        optionFloating        = 1 << 0,
        optionHidden          = 1 << 1,
        optionLeftDockable    = 1 << 2,
        optionRightDockable   = 1 << 3,
        optionTopDockable     = 1 << 4,
        optionBottomDockable  = 1 << 5,
        optionFloatable       = 1 << 6,
        optionMovable         = 1 << 7,
        optionResizable       = 1 << 8,
        optionPaneBorder      = 1 << 9,
        optionCaption         = 1 << 10,
        optionGripper         = 1 << 11,
        optionDestroyOnClose  = 1 << 12,
        optionToolbar         = 1 << 13,
        optionActive          = 1 << 14,

        buttonClose           = 1 << 24,
        buttonMaximize        = 1 << 25,
        buttonMinimize        = 1 << 26,
        buttonPin             = 1 << 27,
        buttonCustom1         = 1 << 28,
        buttonCustom2         = 1 << 29,
        buttonCustom3         = 1 << 30,
        actionPane            = 1 << 31  // used internally
    }
}


export class МенеджерРамки : ОбработчикСоб
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(Рамка рамка = пусто, бцел флаги = ПОпцияМенеджераРамки.wxAUI_MGR_Дефолт)
    {
        this(wxFrameManager_ctor(ВизОбъект.безопУк(рамка), флаги));
    }

    export проц деиниц()
    {
        wxFrameManager_UnInit(вхобъ);
    }

    export проц устФлаги(бцел флаги)
    {
        wxFrameManager_SetFlags(вхобъ, флаги);
    }
    export бцел дайФлаги()
    {
        return wxFrameManager_GetFlags(вхобъ);
    }

    export проц устРамку(Рамка рамка)
    {
        wxFrameManager_SetFrame(вхобъ, ВизОбъект.безопУк(рамка));
    }
    export Рамка дайРамку()
    {
        ЦелУкз ptr = wxFrameManager_GetFrame(вхобъ);
        ВизОбъект o = найдиОбъект(ptr);
        if (o) return cast(Рамка)o;
        else return new Рамка(ptr);
    }

    export проц устАртПровайдер(ДокАрт артПров)
    {
        wxFrameManager_SetArtProvider(вхобъ, ВизОбъект.безопУк(артПров));
    }
    export ДокАрт дайАртПровайдер()
    {
        ЦелУкз ptr = wxFrameManager_GetArtProvider(вхобъ);
        ВизОбъект o = найдиОбъект(ptr);
        if (o) return cast(ДокАрт)o;
        else return new ДокАрт(ptr);
    }

    export ИнфОПано дайПано(Окно окно)
    {
        ЦелУкз ptr = wxFrameManager_GetPaneByWindow(вхобъ, ВизОбъект.безопУк(окно));
        ВизОбъект o = найдиОбъект(ptr);
        if (o) return cast(ИнфОПано)o;
        else return new ИнфОПано(ptr);
    }
    export ИнфОПано дайПано(ткст имя)
    {
        ЦелУкз ptr = wxFrameManager_GetPaneByName(вхобъ, имя);
        ВизОбъект o = найдиОбъект(ptr);
        if (o) return cast(ИнфОПано)o;
        else return new ИнфОПано(ptr);
    }
    export цел дайЧлоПано()
    {
        return wxFrameManager_GetPaneCount(вхобъ);
    }
    export ИнфОПано дайПано(цел индекс)
    {
        ЦелУкз ptr = wxFrameManager_GetPane(вхобъ, индекс);
        ВизОбъект o = найдиОбъект(ptr);
        if (o) return cast(ИнфОПано)o;
        else return new ИнфОПано(ptr);
    }

    export бул добавьПано(Окно окно, ИнфОПано инфОПано)
    {
        return wxFrameManager_AddPane(вхобъ, ВизОбъект.безопУк(окно), ВизОбъект.безопУк(инфОПано));
    }

    export бул добавьПано(Окно окно,
                        цел направление = ПНаправление.Влево,
                        ткст заголовок = "")
    {
        return wxFrameManager_AddPane2(вхобъ, ВизОбъект.безопУк(окно), направление, заголовок);
    }

    export бул вставьПано(Окно окно,
                           ИнфОПано инфОПано,
                           цел уровеньВставки = ПУровеньВставкиПано.Пано)
    {
        return wxFrameManager_InsertPane(вхобъ, ВизОбъект.безопУк(окно), ВизОбъект.безопУк(инфОПано), уровеньВставки);
    }

    export бул отторочьПано(Окно окно)
    {
        return wxFrameManager_DetachPane(вхобъ, ВизОбъект.безопУк(окно));
    }

    export ткст сохраниПерспективу()
    {
        return wxFrameManager_SavePerspective(вхобъ);
    }

    export бул загрузиПерспективу(ткст перспектива,
                                бул обновить = да)
    {
        return wxFrameManager_LoadPerspective(вхобъ, перспектива, обновить);
    }

    export проц обнови()
    {
        return wxFrameManager_Update(вхобъ);
    }


// wx событие machinery


// right now the only событие that works is СОБ_АУИ_КНОПКАПАНО. A full
// spectrum of events will be implemented in the next incremental version

    public static ТипСобытия СОБ_АУИ_КНОПКАПАНО;

    static this()
    {
        СОБ_АУИ_КНОПКАПАНО = wxEvent_EVT_AUI_PANEBUTTON();
    }

    export проц EVT_AUI_PANEBUTTON(ДатчикСобытий дтчк)
    {
        добавьДатчикСобытий(СОБ_АУИ_КНОПКАПАНО, дтчк);
    }
}



// событие declarations/classes
export class СобытиеМенеджераРамки : Событие
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export Событие клонируй()
    {
        return new СобытиеМенеджераРамки(wxFrameManagerEvent_Clone(вхобъ));
    }

    export проц устПано(ИнфОПано p)
    {
        wxFrameManagerEvent_SetPane(вхобъ, ВизОбъект.безопУк(p));
    }
    export проц устКнопку(цел с)
    {
        wxFrameManagerEvent_SetButton(вхобъ, с);
    }
    export ИнфОПано дайПано()
    {
        ЦелУкз ptr = wxFrameManagerEvent_GetPane(вхобъ);
        ВизОбъект o = найдиОбъект(ptr);
        if (o) return cast(ИнфОПано)o;
        else return new ИнфОПано(ptr);
    }
    export цел дайКнопку()
    {
        return wxFrameManagerEvent_GetButton(вхобъ);
    }
}


