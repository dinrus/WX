module wx.Event;
public import wx.common;

typedef цел ТипСобытия;

//! \cond EXTERN
extern (C) ТипСобытия wxEvent_GetEventType(ЦелУкз сам);
extern (C) цел    wxEvent_GetId(ЦелУкз сам);
extern (C) бул   wxEvent_GetSkipped(ЦелУкз сам);
extern (C) цел    wxEvent_GetTimestamp(ЦелУкз сам);
extern (C) проц   wxEvent_Skip(ЦелУкз сам, бул skip);
extern (C) ЦелУкз wxEvent_GetEventObject(ЦелУкз сам);
extern (C) проц   wxEvent_SetEventObject(ЦелУкз сам, ЦелУкз object);

//---------------------------------------------------------------------
extern (C) ТипСобытия wxEvent_EVT_NULL();
extern (C) ТипСобытия wxEvent_EVT_IDLE();
extern (C) ТипСобытия wxEvent_EVT_SOCKET();

extern (C) ТипСобытия wxEvent_EVT_COMMAND_BUTTON_CLICKED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_CHECKBOX_CLICKED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_CHOICE_SELECTED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LISTBOX_SELECTED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LISTBOX_DOUBLECLICKED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_CHECKLISTBOX_TOGGLED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TEXT_UPDATED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TEXT_ENTER();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TEXT_URL();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TEXT_MAXLEN();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_MENU_SELECTED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_SLIDER_UPDATED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_RADIOBOX_SELECTED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_RADIOBUTTON_SELECTED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_SCROLLBAR_UPDATED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_VLBOX_SELECTED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_COMBOBOX_SELECTED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TOOL_RCLICKED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TOOL_ENTER();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_SPINCTRL_UPDATED();

// Sockets and timers send events, too
extern (C) ТипСобытия wxEvent_EVT_TIMER ();

// Mouse событие types
extern (C) ТипСобытия wxEvent_EVT_LEFT_DOWN();
extern (C) ТипСобытия wxEvent_EVT_LEFT_UP();
extern (C) ТипСобытия wxEvent_EVT_MIDDLE_DOWN();
extern (C) ТипСобытия wxEvent_EVT_MIDDLE_UP();
extern (C) ТипСобытия wxEvent_EVT_RIGHT_DOWN();
extern (C) ТипСобытия wxEvent_EVT_RIGHT_UP();
extern (C) ТипСобытия wxEvent_EVT_MOTION();
extern (C) ТипСобытия wxEvent_EVT_ENTER_WINDOW();
extern (C) ТипСобытия wxEvent_EVT_LEAVE_WINDOW();
extern (C) ТипСобытия wxEvent_EVT_LEFT_DCLICK();
extern (C) ТипСобытия wxEvent_EVT_MIDDLE_DCLICK();
extern (C) ТипСобытия wxEvent_EVT_RIGHT_DCLICK();
extern (C) ТипСобытия wxEvent_EVT_SET_FOCUS();
extern (C) ТипСобытия wxEvent_EVT_KILL_FOCUS();
extern (C) ТипСобытия wxEvent_EVT_CHILD_FOCUS();
extern (C) ТипСобытия wxEvent_EVT_MOUSEWHEEL();

// Non-клиент mouse events
extern (C) ТипСобытия wxEvent_EVT_NC_LEFT_DOWN();
extern (C) ТипСобытия wxEvent_EVT_NC_LEFT_UP();
extern (C) ТипСобытия wxEvent_EVT_NC_MIDDLE_DOWN();
extern (C) ТипСобытия wxEvent_EVT_NC_MIDDLE_UP();
extern (C) ТипСобытия wxEvent_EVT_NC_RIGHT_DOWN();
extern (C) ТипСобытия wxEvent_EVT_NC_RIGHT_UP();
extern (C) ТипСобытия wxEvent_EVT_NC_MOTION();
extern (C) ТипСобытия wxEvent_EVT_NC_ENTER_WINDOW();
extern (C) ТипСобытия wxEvent_EVT_NC_LEAVE_WINDOW();
extern (C) ТипСобытия wxEvent_EVT_NC_LEFT_DCLICK();
extern (C) ТипСобытия wxEvent_EVT_NC_MIDDLE_DCLICK();
extern (C) ТипСобытия wxEvent_EVT_NC_RIGHT_DCLICK();

// Character ввод событие тип
extern (C) ТипСобытия wxEvent_EVT_CHAR();
extern (C) ТипСобытия wxEvent_EVT_CHAR_HOOK();
extern (C) ТипСобытия wxEvent_EVT_NAVIGATION_KEY();
extern (C) ТипСобытия wxEvent_EVT_KEY_DOWN();
extern (C) ТипСобытия wxEvent_EVT_KEY_UP();
version(wxUSE_HOTKEY)
{
    extern (C) ТипСобытия wxEvent_EVT_HOTKEY();
}

// установи курсор событие
extern (C) ТипСобытия wxEvent_EVT_SET_CURSOR();

// wxScrollbar and Слайдер событие identifiers
extern (C) ТипСобытия wxEvent_EVT_SCROLL_TOP();
extern (C) ТипСобытия wxEvent_EVT_SCROLL_BOTTOM();
extern (C) ТипСобытия wxEvent_EVT_SCROLL_LINEUP();
extern (C) ТипСобытия wxEvent_EVT_SCROLL_LINEDOWN();
extern (C) ТипСобытия wxEvent_EVT_SCROLL_PAGEUP();
extern (C) ТипСобытия wxEvent_EVT_SCROLL_PAGEDOWN();
extern (C) ТипСобытия wxEvent_EVT_SCROLL_THUMBTRACK();
extern (C) ТипСобытия wxEvent_EVT_SCROLL_THUMBRELEASE();
extern (C) ТипСобытия wxEvent_EVT_SCROLL_ENDSCROLL();

// Scroll events от Окно
extern (C) ТипСобытия wxEvent_EVT_SCROLLWIN_TOP();
extern (C) ТипСобытия wxEvent_EVT_SCROLLWIN_BOTTOM();
extern (C) ТипСобытия wxEvent_EVT_SCROLLWIN_LINEUP();
extern (C) ТипСобытия wxEvent_EVT_SCROLLWIN_LINEDOWN();
extern (C) ТипСобытия wxEvent_EVT_SCROLLWIN_PAGEUP();
extern (C) ТипСобытия wxEvent_EVT_SCROLLWIN_PAGEDOWN();
extern (C) ТипСобытия wxEvent_EVT_SCROLLWIN_THUMBTRACK();
extern (C) ТипСобытия wxEvent_EVT_SCROLLWIN_THUMBRELEASE();

// System events
extern (C) ТипСобытия wxEvent_EVT_SIZE();
extern (C) ТипСобытия wxEvent_EVT_SIZING();
extern (C) ТипСобытия wxEvent_EVT_MOVE();
extern (C) ТипСобытия wxEvent_EVT_MOVING();
extern (C) ТипСобытия wxEvent_EVT_CLOSE_WINDOW();
extern (C) ТипСобытия wxEvent_EVT_END_SESSION();
extern (C) ТипСобытия wxEvent_EVT_QUERY_END_SESSION();
extern (C) ТипСобытия wxEvent_EVT_ACTIVATE_APP();
extern (C) ТипСобытия wxEvent_EVT_POWER();
extern (C) ТипСобытия wxEvent_EVT_ACTIVATE();
extern (C) ТипСобытия wxEvent_EVT_CREATE();
extern (C) ТипСобытия wxEvent_EVT_DESTROY();
extern (C) ТипСобытия wxEvent_EVT_SHOW();
extern (C) ТипСобытия wxEvent_EVT_ICONIZE();
extern (C) ТипСобытия wxEvent_EVT_MAXIMIZE();
extern (C) ТипСобытия wxEvent_EVT_MOUSE_CAPTURE_CHANGED();
extern (C) ТипСобытия wxEvent_EVT_PAINT();
extern (C) ТипСобытия wxEvent_EVT_ERASE_BACKGROUND();
extern (C) ТипСобытия wxEvent_EVT_NC_PAINT();
extern (C) ТипСобытия wxEvent_EVT_PAINT_ICON();
extern (C) ТипСобытия wxEvent_EVT_MENU_OPEN();
extern (C) ТипСобытия wxEvent_EVT_MENU_CLOSE();
extern (C) ТипСобытия wxEvent_EVT_MENU_HIGHLIGHT();
extern (C) ТипСобытия wxEvent_EVT_CONTEXT_MENU();
extern (C) ТипСобытия wxEvent_EVT_SYS_COLOUR_CHANGED();
extern (C) ТипСобытия wxEvent_EVT_DISPLAY_CHANGED();
extern (C) ТипСобытия wxEvent_EVT_SETTING_CHANGED();
extern (C) ТипСобытия wxEvent_EVT_QUERY_NEW_PALETTE();
extern (C) ТипСобытия wxEvent_EVT_PALETTE_CHANGED();
extern (C) ТипСобытия wxEvent_EVT_JOY_BUTTON_DOWN();
extern (C) ТипСобытия wxEvent_EVT_JOY_BUTTON_UP();
extern (C) ТипСобытия wxEvent_EVT_JOY_MOVE();
extern (C) ТипСобытия wxEvent_EVT_JOY_ZMOVE();
extern (C) ТипСобытия wxEvent_EVT_DROP_FILES();
extern (C) ТипСобытия wxEvent_EVT_DRAW_ITEM();
extern (C) ТипСобытия wxEvent_EVT_MEASURE_ITEM();
extern (C) ТипСобытия wxEvent_EVT_COMPARE_ITEM();
extern (C) ТипСобытия wxEvent_EVT_INIT_DIALOG();
extern (C) ТипСобытия wxEvent_EVT_UPDATE_UI();

// Generic command events
// Note: a click is a higher-level событие than button down/up
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LEFT_CLICK();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LEFT_DCLICK();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_RIGHT_CLICK();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_RIGHT_DCLICK();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_SET_FOCUS();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_KILL_FOCUS();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_ENTER();

// Help events
extern (C) ТипСобытия wxEvent_EVT_HELP();
extern (C) ТипСобытия wxEvent_EVT_DETAILED_HELP();

//togglebtn
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TOGGLEBUTTON_CLICKED();
extern (C) ТипСобытия wxEvent_EVT_OBJECTDELETED();

// calendar контрол
extern (C) ТипСобытия wxEvent_EVT_CALENDAR_SEL_CHANGED();
extern (C) ТипСобытия wxEvent_EVT_CALENDAR_DAY_CHANGED();
extern (C) ТипСобытия wxEvent_EVT_CALENDAR_MONTH_CHANGED();
extern (C) ТипСобытия wxEvent_EVT_CALENDAR_YEAR_CHANGED();
extern (C) ТипСобытия wxEvent_EVT_CALENDAR_DOUBLECLICKED();
extern (C) ТипСобытия wxEvent_EVT_CALENDAR_WEEKDAY_CLICKED();

// find_replace
extern (C) ТипСобытия wxEvent_EVT_COMMAND_FIND();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_FIND_NEXT();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_FIND_REPLACE();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_FIND_REPLACE_ALL();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_FIND_CLOSE();

extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_BEGIN_DRAG();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_BEGIN_RDRAG();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_BEGIN_LABEL_EDIT();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_END_LABEL_EDIT();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_DELETE_ITEM();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_GET_INFO();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_SET_INFO();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_ITEM_EXPANDED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_ITEM_EXPANDING();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_ITEM_COLLAPSED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_ITEM_COLLAPSING();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_SEL_CHANGED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_SEL_CHANGING();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_KEY_DOWN();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_ITEM_ACTIVATED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_ITEM_RIGHT_CLICK();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_ITEM_MIDDLE_CLICK();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_TREE_END_DRAG();

extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_BEGIN_DRAG();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_BEGIN_RDRAG();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_BEGIN_LABEL_EDIT();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_END_LABEL_EDIT();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_DELETE_ITEM();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_DELETE_ALL_ITEMS();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_GET_INFO();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_SET_INFO();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_ITEM_SELECTED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_ITEM_DESELECTED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_ITEM_ACTIVATED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_ITEM_FOCUSED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_ITEM_MIDDLE_CLICK();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_ITEM_RIGHT_CLICK();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_KEY_DOWN();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_INSERT_ITEM();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_COL_CLICK();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_COL_RIGHT_CLICK();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_COL_BEGIN_DRAG();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_COL_DRAGGING();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_COL_END_DRAG();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LIST_CACHE_HINT();

extern (C) ТипСобытия wxEvent_EVT_COMMAND_NOTEBOOK_PAGE_CHANGED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_NOTEBOOK_PAGE_CHANGING();

extern (C) ТипСобытия wxEvent_EVT_COMMAND_LISTBOOK_PAGE_CHANGED();
extern (C) ТипСобытия wxEvent_EVT_COMMAND_LISTBOOK_PAGE_CHANGING();

version(__WXMSW__)
{
    extern (C) ТипСобытия wxEvent_EVT_COMMAND_TAB_SEL_CHANGED();
    extern (C) ТипСобытия wxEvent_EVT_COMMAND_TAB_SEL_CHANGING();
}
extern (C) ТипСобытия wxEvent_EVT_GRID_CELL_LEFT_CLICK();
extern (C) ТипСобытия wxEvent_EVT_GRID_CELL_RIGHT_CLICK();
extern (C) ТипСобытия wxEvent_EVT_GRID_CELL_LEFT_DCLICK();
extern (C) ТипСобытия wxEvent_EVT_GRID_CELL_RIGHT_DCLICK();
extern (C) ТипСобытия wxEvent_EVT_GRID_LABEL_LEFT_CLICK();
extern (C) ТипСобытия wxEvent_EVT_GRID_LABEL_RIGHT_CLICK();
extern (C) ТипСобытия wxEvent_EVT_GRID_LABEL_LEFT_DCLICK();
extern (C) ТипСобытия wxEvent_EVT_GRID_LABEL_RIGHT_DCLICK();
extern (C) ТипСобытия wxEvent_EVT_GRID_ROW_SIZE();
extern (C) ТипСобытия wxEvent_EVT_GRID_COL_SIZE();
extern (C) ТипСобытия wxEvent_EVT_GRID_RANGE_SELECT();
extern (C) ТипСобытия wxEvent_EVT_GRID_CELL_CHANGE();
extern (C) ТипСобытия wxEvent_EVT_GRID_SELECT_CELL();
extern (C) ТипСобытия wxEvent_EVT_GRID_EDITOR_SHOWN();
extern (C) ТипСобытия wxEvent_EVT_GRID_EDITOR_HIDDEN();
extern (C) ТипСобытия wxEvent_EVT_GRID_EDITOR_CREATED();

extern (C) ТипСобытия wxEvent_EVT_SASH_DRAGGED();

//layoutwin
extern (C) ТипСобытия wxEvent_EVT_QUERY_LAYOUT_INFO();
extern (C) ТипСобытия wxEvent_EVT_CALCULATE_LAYOUT();

//! \endcond
//---------------------------------------------------------------------


export class Событие : ВизОбъект
{

export struct Тип
{
     public static ТипСобытия СОБ_НУЛЛ,
     СОБ_КОМАНДА_КНОПКА_НАЖАТА,
     СОБ_КОМАНДА_ЧЕКБОКС_НАЖАТ,
     СОБ_КОМАНДА_ВЫБОР_ВЫБРАН,
     СОБ_КОМАНДА_ЛИСТБОКС_ВЫБРАН,
     СОБ_КОМАНДА_ЛИСТБОКС_ДВАЖДЫ_НАЖАТ,
     СОБ_КОМАНДА_ЛИСТБОКС_ТОГГЛ,
     СОБ_КОМАНДА_ТЕКСТ_ОБНОВЛЁН,
     СОБ_КОМАНДА_ТЕКСТ_ВВОД,
     СОБ_КОМАНДА_ТЕКСТ_УИР,
     СОБ_КОМАНДА_ТЕКСТ_МАКСДЛИН,
     СОБ_КОМАНДА_МЕНЮ_ВЫБРАНО,
     СОБ_КОМАНДА_ТУЛ_НАЖАТ,
     СОБ_КОМАНДА_ПОЛЗУНОК_ОБНОВЛЁН,
     СОБ_КОМАНДА_РАДИОБОКС_ВЫБРАН,
     СОБ_КОМАНДА_РАДИОКНОПКА_ВЫБРАНА,
     СОБ_КОМАНДА_СКРОЛЛБАР_ОБНОВЛЁН,
     wxEVT_COMMAND_VLBOX_SELECTED,
     СОБ_КОМАНДА_КОМБОБОКС_ВЫБРАН,
     СОБ_КОМАНДА_ТУЛ_ПНАЖАТ,
     СОБ_КОМАНДА_ТУЛ_ВВОД,
     СОБ_КОМАНДА_СПИНКТРЛ_ОБНОВЛЁН,

     СОБ_СОКЕТ,
     СОБ_ТАЙМЕР ,

     СОБ_ЛЕВАЯ_ВНИЗУ,
     СОБ_ЛЕВАЯ_ВВЕРХУ,
     СОБ_СРЕДНЯЯ_ВНИЗУ,
     СОБ_СРЕДНЯЯ_ВВЕРХУ,
     СОБ_ПРАВАЯ_ВНИЗУ,
     СОБ_ПРАВАЯ_ВВЕРХУ,
     СОБ_ДВИЖЕНИЕ,
     СОБ_ВХОД_ОКНО,
     СОБ_ВЫХОД_ОКНО,
     СОБ_ЛЕВАЯ_ДНАЖАТА,
     СОБ_СРЕДНЯЯ_ДНАЖАТА,
     СОБ_ПРАВАЯ_ДНАЖАТА,
     СОБ_УСТ_ФОКУС,
     СОБ_РАСФОКУС,
     СОБ_ОТПРЫСК_ФОКУС,
     СОБ_КОЛЕСО_МЫШИ,

     СОБ_НК_ЛЕВАЯ_ВНИЗУ,
     СОБ_НК_ЛЕВАЯ_ВВЕРХУ,
     СОБ_НК_СРЕДНЯЯ_ВНИЗУ,
     СОБ_НК_СРЕДНЯЯ_ВВЕРХУ,
     СОБ_НК_ПРАВАЯ_ВНИЗУ,
     СОБ_НК_ПРАВАЯ_ВВЕРХУ,
     СОБ_НК_ДВИЖЕНИЕ,
     СОБ_НК_ВХОД_ОКНО,
     СОБ_НК_ВЫХОД_ОКНО,
     СОБ_НК_ЛЕВАЯ_ДНАЖАТА,
     СОБ_НК_СРЕДНЯЯ_ДНАЖАТА,
     СОБ_НК_ПРАВАЯ_ДНАЖАТА,

     СОБ_СИМВ,
     СОБ_СИМВ_ХУК,
     СОБ_НАВИГАЦИЯ_КЛАВИША,
     СОБ_КЛАВИША_ВНИЗУ,
     СОБ_КЛАВИША_ВВЕРХУ,

   // version(wxUSE_HOTKEY)
	СОБ_ГОРЯЧАЯ_КЛАВИША,

     СОБ_УСТ_КУРСОР,

     СОБ_СКРОЛЛ_ВЕРХ,
     СОБ_СКРОЛЛ_НИЗ,
     СОБ_СКРОЛЛ_СТРОКОЙ_ВЫШЕ,
     СОБ_СКРОЛЛ_СТРОКОЙ_НИЖЕ,
     СОБ_СКРОЛЛ_СТРАНИЦАВВЕРХ,
     СОБ_СКРОЛЛ_СТРАНИЦАВНИЗ,
     СОБ_СКРОЛЛ_ТУМБТРЭК,
     СОБ_СКРОЛЛ_ТУМБРЕЛИЗ,
     СОБ_СКРОЛЛ_КОНЕЦПРОКР,
     СОБ_СКРОЛЛВИН_ВЕРХ,
     СОБ_СКРОЛЛВИН_НИЗ,
     СОБ_СКРОЛЛВИН_СТРОКАВВЕРХ,
     СОБ_СКРОЛЛВИН_СТРОКАВНИЗ,
     СОБ_СКРОЛЛВИН_СТРАНИЦАВВЕРХ,
     СОБ_СКРОЛЛВИН_СТРАНИЦАВНИЗ,
     СОБ_СКРОЛЛВИН_ТУМБТРЭК,
     СОБ_СКРОЛЛВИН_ТУМБРЕЛИЗ,
     СОБ_РАЗМЕР,
     СОБ_ДВИГАЙ,
     СОБ_ЗАКРОЙ_ОКНО,
     СОБ_КОНЕЦ_СЕССИИ,
     СОБ_ЗАПРОС_КОНЕЦ_СЕССИИ,
     СОБ_АКТИВИРУЙ_ПРИЛОЖЕНИЕ,
     СОБ_ПИТАНИЕ,
     СОБ_АКТИВИРУЙ,
     СОБ_СОЗДАЙ,
     СОБ_РАЗРУШЬ,
     СОБ_ПОКАЖИ,
     СОБ_ИКОНИРУЙ,
     СОБ_МАКСИМИРУЙ,
     СОБ_ЗАХВАТ_МЫШИ_ИЗМЕНЁН,
     СОБ_РИСОВАНИЕ,
     СОБ_СОТРИ_ФОН,
     СОБ_НК_РИСОВАНИЕ,
     СОБ_РИСУЙ_ИКОНКУ,
     СОБ_МЕНЮ_ОТКРОЙ,
     СОБ_МЕНЮ_ЗАКРОЙ,
     СОБ_МЕНЮ_ПОДСВЕТИ,
     СОБ_КОНТЕКСТ_МЕНЮ,
     СОБ_СИС_ЦВЕТ_ИЗМЕНЁН,
     СОБ_ДИСПЛЕЙ_ИЗМЕНЁН,
     СОБ_УСТАНОВКА_ИЗМЕНЕНА,
     СОБ_ЗАПРОС_НОВОЙ_ПАЛИТРЫ,
     СОБ_ПАЛИТРА_ИЗМЕНЕНА,
     СОБ_ДЖОЙ_КНОПКА_ВНИЗУ,
     СОБ_ДЖОЙ_КНОПКА_ВВЕРХУ,
     СОБ_ДЖОЙ_ДВИГАЙ,
     СОБ_ДЖОЙ_ЗЕТДВИГАЙ,
     СОБ_ЗАБРОС_ФАЙЛОВ,
     СОБ_РИСУЙ_ЭЛТ,
     СОБ_МЕРЯЙ_ЭЛТ,
     СОБ_СРАВНИ_ЭЛТ,
     СОБ_ИНИЦ_ДИАЛОГ,
     СОБ_БЕЗДЕЙСТВИЕ,
     СОБ_ОБНОВИ_ИП,
     СОБ_ПЕРЕМЕР,
     СОБ_ПЕРЕМЕЩЕНИЕ,
     СОБ_КОМАНДА_ЛЕВАЯ_НАЖАТА,
     СОБ_КОМАНДА_ЛЕВАЯ_ДНАЖАТА,
     СОБ_КОМАНДА_ПРАВАЯ_НАЖАТА,
     СОБ_КОМАНДА_ПРАВАЯ_ДНАЖАТА,
     СОБ_КОМАНДА_УСТАНОВИ_ФОКУС,
     СОБ_КОМАНДА_ПОДАВИ_ФОКУС,
     СОБ_КОМАНДА_ВХОД,
     СОБ_СПРАВКА,
     СОБ_ПОДРОБНАЯ_СПРАВКА,
     СОБ_КОМАНДА_ПЕРЕКЛЮЧАТЕЛЬ_НАЖАТ,
     СОБ_ОБЪЕКТ_УДАЛЁН,

     СОБ_КАЛЕНДАРЬ_ВЫД_ИЗМЕНЕНО,
     СОБ_КАЛЕНДАРЬ_ДЕНЬ_ИЗМЕНЁН,
     СОБ_КАЛЕНДАРЬ_МЕСЯЦ_ИЗМЕНЁН,
     СОБ_КАЛЕНДАРЬ_ГОД_ИЗМЕНЁН,
     СОБ_КАЛЕНДАРЬ_ДВАЖДЫ_НАЖАТ,
     СОБ_КАЛЕНДАРЬ_ДЕНЬНЕДЕЛИ_НАЖАТ,

     СОБ_КОМАНДА_НАЙДИ,
     СОБ_КОМАНДА_НАЙДИ_СЛЕДЩ,
     СОБ_КОМАНДА_НАЙДИ_ЗАМЕНИ,
     СОБ_КОМАНДА_НАЙДИ_ЗАМЕНИ_ВСЕ,
     СОБ_КОМАНДА_НАЙДИ_ЗАКРЫТЬ,

     СОБ_КОМАНДА_ДЕРЕВО_НАЧАЛО_ТЯГА,
     СОБ_КОМАНДА_ДЕРЕВО_НАЧАЛО_ПТЯГА,
     СОБ_КОМАНДА_ДЕРЕВО_НАЧАЛО_РЕДАКТИРОВАНИЯ_ЯРЛЫКА,
     СОБ_КОМАНДА_ДЕРЕВО_КОНЕЦ_РЕДАКТИРОВАНИЯ_ЯРЛЫКА,
     СОБ_КОМАНДА_ДЕРЕВО_УДАЛИТЬ_ЭЛЕМЕНТ,
     СОБ_КОМАНДА_ДЕРЕВО_ДАТЬ_ИНФО,
     СОБ_КОМАНДА_ДЕРЕВО_УСТ_ИНФО,
     СОБ_КОМАНДА_ДЕРЕВО_ЭЛТ_РАЗВЁРНУТ,
     СОБ_КОМАНДА_ДЕРЕВО_ЭЛТ_РАЗВОРАЧИВАЕТСЯ,
     СОБ_КОМАНДА_ДЕРЕВО_ЭЛТ_СВЁРНУТ,
     СОБ_КОМАНДА_ДЕРЕВО_ЭЛТ_СВОРАЧИВАЕТСЯ,
     СОБ_КОМАНДА_ДЕРЕВО_ВЫД_ИЗМЕНЕНО,
     СОБ_КОМАНДА_ДЕРЕВО_ВЫД_ИЗМЕНЯЕТСЯ,
     СОБ_КОМАНДА_ДЕРЕВО_КЛАВИША_ВНИЗУ,
     СОБ_КОМАНДА_ДЕРЕВО_ЭЛТ_АКТИВИРОВАН,
     СОБ_КОМАНДА_ДЕРЕВО_ПРАВАЯ_НАЖАТА,
     СОБ_КОМАНДА_ДЕРЕВО_СРЕДНЯЯ_НАЖАТА,
     СОБ_КОМАНДА_ДЕРЕВО_КОНЕЦ_ТЯГА,

     СОБ_КОМАНДА_СПИСОК_НАЧАЛО_ТЯГА,
     СОБ_КОМАНДА_СПИСОК_НАЧАЛО_ПТЯГА,
     СОБ_КОМАНДА_СПИСОК_НАЧАЛО_РЕДАКТИРОВАНИЯ_ЯРЛЫКА,
     СОБ_КОМАНДА_СПИСОК_КОНЕЦ_РЕДАКТИРОВАНИЯ_ЯРЛЫКА,
     СОБ_КОМАНДА_СПИСОК_УДАЛИТЬ_ЭЛТ,
     СОБ_КОМАНДА_СПИСОК_УДАЛИТЬ_ВСЕ_ЭЛТЫ,
     СОБ_КОМАНДА_СПИСОК_ДАТЬ_ИНФО,
     СОБ_КОМАНДА_СПИСОК_УСТ_ИНФО,
     СОБ_КОМАНДА_СПИСОК_ЭЛТ_ВЫДЕЛЕН,
     СОБ_КОМАНДА_СПИСОК_ЭЛТ_ДЕСЕЛЕКТИРОВАН,
     СОБ_КОМАНДА_СПИСОК_ЭЛТ_АКТИВИРОВАН,
     СОБ_КОМАНДА_СПИСОК_ЭЛТ_ФОКУСИРОВАН,
     СОБ_КОМАНДА_СПИСОК_ЭЛТ_СРЕДНЯЯ_НАЖАТА,
     СОБ_КОМАНДА_СПИСОК_ЭЛТ_ПРАВАЯ_НАЖАТА,
     СОБ_КОМАНДА_СПИСОК_КЛАВИША_ВНИЗУ,
     СОБ_КОМАНДА_СПИСОК_ВСТАВИТЬ_ЭЛТ,
     СОБ_КОМАНДА_СПИСОК_КОЛ_НАЖАТА,
     СОБ_КОМАНДА_СПИСОК_КОЛ_ПРАВАЯ_НАЖАТА,
     СОБ_КОМАНДА_СПИСОК_КОЛ_НАЧАЛО_ТЯГА,
     СОБ_КОМАНДА_СПИСОК_КОЛ_ТЯГ,
     СОБ_КОМАНДА_СПИСОК_КОЛ_КОНЕЦ_ТЯГА,
     СОБ_КОМАНДА_СПИСОК_КЭШ_ХИНТ,

     СОБ_КОМАНДА_НОУТБУК_СТРАНИЦА_ИЗМЕНЕНА,
     СОБ_КОМАНДА_НОУТБУК_СТРАНИЦА_ИЗМЕНЯЕТСЯ,

     СОБ_КОМАНДА_СТРАНИЦА_ЛИСТБУКА_ИЗМЕНЕНА,
     СОБ_КОМАНДА_СТРАНИЦА_ЛИСТБУКА_ИЗМЕНЯЕТСЯ,

    //version(__WXMSW__)
  //  {
      СОБ_КОМАНДА_ВКЛАДКА_ВЫД_ИЗМЕНЕНО,
      СОБ_КОМАНДА_ВКЛАДКА_ВЫД_ИЗМЕНЯЕТСЯ,
  //  }
     СОБ_СЕТКА_ЯЧЕЙКА_ЛЕВАЯ_НАЖАТА,
     СОБ_СЕТКА_ЯЧЕЙКА_ПРАВАЯ_НАЖАТА,
     СОБ_СЕТКА_ЯЧЕЙКА_ЛЕВАЯ_ДНАЖАТА,
     СОБ_СЕТКА_ЯЧЕЙКА_ПРАВАЯ_ДНАЖАТА,
     СОБ_СЕТКА_ЯРЛЫК_ЛЕВАЯ_НАЖАТА,
     СОБ_СЕТКА_ЯРЛЫК_ПРАВАЯ_НАЖАТА,
     СОБ_СЕТКА_ЯРЛЫК_ЛЕВАЯ_ДНАЖАТА,
     СОБ_СЕТКА_ЯРЛЫК_ПРАВАЯ_ДНАЖАТА,
     СОБ_СЕТКА_РЯД_РАЗМЕР,
     СОБ_СЕТКА_КОЛОНКА_РАЗМЕР,
     СОБ_СЕТКА_ДИАПАЗОН_ВЫДЕЛЕНИЕ,
     СОБ_СЕТКА_ЯЧЕЙКА_ИЗМЕНЕНИЕ,
     СОБ_СЕТКА_ВЫДЕЛИТЬ_ЯЧЕЙКУ,
     СОБ_СЕТКА_РЕДАКТОР_ПОКАЗАН,
     СОБ_СЕТКА_РЕДАКТОР_СКРЫТ,
     СОБ_СЕТКА_РЕДАКТОР_СОЗДАН,

     СОБ_САШ_ПЕРЕТЯНУТ,

     СОБ_ЗАПРОС_ИНФО_ВЫКЛАДКИ,
     СОБ_РАССЧЁТ_ВЫКЛАДКИ;

    static export Тип opCall()
    {
        Тип тип;

        тип.СОБ_НУЛЛ = wxEvent_EVT_NULL();

        тип.СОБ_КОМАНДА_КНОПКА_НАЖАТА = wxEvent_EVT_COMMAND_BUTTON_CLICKED();
        тип.СОБ_КОМАНДА_ЧЕКБОКС_НАЖАТ = wxEvent_EVT_COMMAND_CHECKBOX_CLICKED();
        тип.СОБ_КОМАНДА_ВЫБОР_ВЫБРАН = wxEvent_EVT_COMMAND_CHOICE_SELECTED();
        тип.СОБ_КОМАНДА_ЛИСТБОКС_ВЫБРАН = wxEvent_EVT_COMMAND_LISTBOX_SELECTED();
        тип.СОБ_КОМАНДА_ЛИСТБОКС_ДВАЖДЫ_НАЖАТ = wxEvent_EVT_COMMAND_LISTBOX_DOUBLECLICKED();
        тип.СОБ_КОМАНДА_ЛИСТБОКС_ТОГГЛ = wxEvent_EVT_COMMAND_CHECKLISTBOX_TOGGLED();
        тип.СОБ_КОМАНДА_МЕНЮ_ВЫБРАНО = wxEvent_EVT_COMMAND_MENU_SELECTED();
        тип.СОБ_КОМАНДА_ПОЛЗУНОК_ОБНОВЛЁН = wxEvent_EVT_COMMAND_SLIDER_UPDATED();
        тип.СОБ_КОМАНДА_РАДИОБОКС_ВЫБРАН = wxEvent_EVT_COMMAND_RADIOBOX_SELECTED();
        тип.СОБ_КОМАНДА_РАДИОКНОПКА_ВЫБРАНА = wxEvent_EVT_COMMAND_RADIOBUTTON_SELECTED();
        тип.СОБ_КОМАНДА_СКРОЛЛБАР_ОБНОВЛЁН = wxEvent_EVT_COMMAND_SCROLLBAR_UPDATED();
        тип.wxEVT_COMMAND_VLBOX_SELECTED = wxEvent_EVT_COMMAND_VLBOX_SELECTED();
        тип.СОБ_КОМАНДА_КОМБОБОКС_ВЫБРАН = wxEvent_EVT_COMMAND_COMBOBOX_SELECTED();
        тип.СОБ_КОМАНДА_ТУЛ_ПНАЖАТ = wxEvent_EVT_COMMAND_TOOL_RCLICKED();
        тип.СОБ_КОМАНДА_ТУЛ_ВВОД = wxEvent_EVT_COMMAND_TOOL_ENTER();
        тип.СОБ_КОМАНДА_СПИНКТРЛ_ОБНОВЛЁН = wxEvent_EVT_COMMAND_SPINCTRL_UPDATED();

        тип.СОБ_КОМАНДА_ТУЛ_НАЖАТ = тип.СОБ_КОМАНДА_МЕНЮ_ВЫБРАНО;

        тип.СОБ_КОМАНДА_ТЕКСТ_ОБНОВЛЁН = wxEvent_EVT_COMMAND_TEXT_UPDATED();
        тип.СОБ_КОМАНДА_ТЕКСТ_ВВОД = wxEvent_EVT_COMMAND_TEXT_ENTER();
        тип.СОБ_КОМАНДА_ТЕКСТ_УИР = wxEvent_EVT_COMMAND_TEXT_URL();
        тип.СОБ_КОМАНДА_ТЕКСТ_МАКСДЛИН = wxEvent_EVT_COMMAND_TEXT_MAXLEN();

        тип.СОБ_СОКЕТ = wxEvent_EVT_SOCKET();
        тип.СОБ_ТАЙМЕР  = wxEvent_EVT_TIMER ();

        тип.СОБ_ЛЕВАЯ_ВНИЗУ = wxEvent_EVT_LEFT_DOWN();
        тип.СОБ_ЛЕВАЯ_ВВЕРХУ = wxEvent_EVT_LEFT_UP();
        тип.СОБ_СРЕДНЯЯ_ВНИЗУ = wxEvent_EVT_MIDDLE_DOWN();
        тип.СОБ_СРЕДНЯЯ_ВВЕРХУ = wxEvent_EVT_MIDDLE_UP();
        тип.СОБ_ПРАВАЯ_ВНИЗУ = wxEvent_EVT_RIGHT_DOWN();
        тип.СОБ_ПРАВАЯ_ВВЕРХУ = wxEvent_EVT_RIGHT_UP();
        тип.СОБ_ДВИЖЕНИЕ = wxEvent_EVT_MOTION();
        тип.СОБ_ВХОД_ОКНО = wxEvent_EVT_ENTER_WINDOW();
        тип.СОБ_ВЫХОД_ОКНО = wxEvent_EVT_LEAVE_WINDOW();
        тип.СОБ_ЛЕВАЯ_ДНАЖАТА = wxEvent_EVT_LEFT_DCLICK();
        тип.СОБ_СРЕДНЯЯ_ДНАЖАТА = wxEvent_EVT_MIDDLE_DCLICK();
        тип.СОБ_ПРАВАЯ_ДНАЖАТА = wxEvent_EVT_RIGHT_DCLICK();
        тип.СОБ_УСТ_ФОКУС = wxEvent_EVT_SET_FOCUS();
        тип.СОБ_РАСФОКУС = wxEvent_EVT_KILL_FOCUS();
        тип.СОБ_ОТПРЫСК_ФОКУС = wxEvent_EVT_CHILD_FOCUS();
        тип.СОБ_КОЛЕСО_МЫШИ = wxEvent_EVT_MOUSEWHEEL();

        тип.СОБ_НК_ЛЕВАЯ_ВНИЗУ = wxEvent_EVT_NC_LEFT_DOWN();
        тип.СОБ_НК_ЛЕВАЯ_ВВЕРХУ = wxEvent_EVT_NC_LEFT_UP();
        тип.СОБ_НК_СРЕДНЯЯ_ВНИЗУ = wxEvent_EVT_NC_MIDDLE_DOWN();
        тип.СОБ_НК_СРЕДНЯЯ_ВВЕРХУ = wxEvent_EVT_NC_MIDDLE_UP();
        тип.СОБ_НК_ПРАВАЯ_ВНИЗУ = wxEvent_EVT_NC_RIGHT_DOWN();
        тип.СОБ_НК_ПРАВАЯ_ВВЕРХУ = wxEvent_EVT_NC_RIGHT_UP();
       тип.СОБ_НК_ДВИЖЕНИЕ = wxEvent_EVT_NC_MOTION();
        тип.СОБ_НК_ВХОД_ОКНО = wxEvent_EVT_NC_ENTER_WINDOW();
        тип.СОБ_НК_ВЫХОД_ОКНО = wxEvent_EVT_NC_LEAVE_WINDOW();
        тип.СОБ_НК_ЛЕВАЯ_ДНАЖАТА = wxEvent_EVT_NC_LEFT_DCLICK();
        тип.СОБ_НК_СРЕДНЯЯ_ДНАЖАТА = wxEvent_EVT_NC_MIDDLE_DCLICK();
        тип.СОБ_НК_ПРАВАЯ_ДНАЖАТА = wxEvent_EVT_NC_RIGHT_DCLICK();

        тип.СОБ_СИМВ = wxEvent_EVT_CHAR();
        тип.СОБ_СИМВ_ХУК = wxEvent_EVT_CHAR_HOOK();
        тип.СОБ_НАВИГАЦИЯ_КЛАВИША = wxEvent_EVT_NAVIGATION_KEY();
        тип.СОБ_КЛАВИША_ВНИЗУ = wxEvent_EVT_KEY_DOWN();
        тип.СОБ_КЛАВИША_ВВЕРХУ = wxEvent_EVT_KEY_UP();

        version(wxUSE_HOTKEY)
        {
            тип.СОБ_ГОРЯЧАЯ_КЛАВИША = wxEvent_HOTKEY();
        }

        тип.СОБ_УСТ_КУРСОР = wxEvent_EVT_SET_CURSOR();

        тип.СОБ_СКРОЛЛ_ВЕРХ = wxEvent_EVT_SCROLL_TOP();
        тип.СОБ_СКРОЛЛ_НИЗ = wxEvent_EVT_SCROLL_BOTTOM();
        тип.СОБ_СКРОЛЛ_СТРОКОЙ_ВЫШЕ = wxEvent_EVT_SCROLL_LINEUP();
        тип.СОБ_СКРОЛЛ_СТРОКОЙ_НИЖЕ = wxEvent_EVT_SCROLL_LINEDOWN();
        тип.СОБ_СКРОЛЛ_СТРАНИЦАВВЕРХ = wxEvent_EVT_SCROLL_PAGEUP();
        тип.СОБ_СКРОЛЛ_СТРАНИЦАВНИЗ = wxEvent_EVT_SCROLL_PAGEDOWN();
        тип.СОБ_СКРОЛЛ_ТУМБТРЭК = wxEvent_EVT_SCROLL_THUMBTRACK();
        тип.СОБ_СКРОЛЛ_ТУМБРЕЛИЗ = wxEvent_EVT_SCROLL_THUMBRELEASE();
        тип.СОБ_СКРОЛЛ_КОНЕЦПРОКР = wxEvent_EVT_SCROLL_ENDSCROLL();

        тип.СОБ_СКРОЛЛВИН_ВЕРХ = wxEvent_EVT_SCROLLWIN_TOP();
        тип.СОБ_СКРОЛЛВИН_НИЗ = wxEvent_EVT_SCROLLWIN_BOTTOM();
        тип.СОБ_СКРОЛЛВИН_СТРОКАВВЕРХ = wxEvent_EVT_SCROLLWIN_LINEUP();
        тип.СОБ_СКРОЛЛВИН_СТРОКАВНИЗ = wxEvent_EVT_SCROLLWIN_LINEDOWN();
        тип.СОБ_СКРОЛЛВИН_СТРАНИЦАВВЕРХ = wxEvent_EVT_SCROLLWIN_PAGEUP();
        тип.СОБ_СКРОЛЛВИН_СТРАНИЦАВНИЗ = wxEvent_EVT_SCROLLWIN_PAGEDOWN();
        тип.СОБ_СКРОЛЛВИН_ТУМБТРЭК = wxEvent_EVT_SCROLLWIN_THUMBTRACK();
        тип.СОБ_СКРОЛЛВИН_ТУМБРЕЛИЗ = wxEvent_EVT_SCROLLWIN_THUMBRELEASE();

        тип.СОБ_РАЗМЕР = wxEvent_EVT_SIZE();
        тип.СОБ_ПЕРЕМЕР = wxEvent_EVT_SIZING();
        тип.СОБ_ДВИГАЙ = wxEvent_EVT_MOVE();
        тип.СОБ_ПЕРЕМЕЩЕНИЕ = wxEvent_EVT_MOVING();
        тип.СОБ_ЗАКРОЙ_ОКНО = wxEvent_EVT_CLOSE_WINDOW();
        тип.СОБ_КОНЕЦ_СЕССИИ = wxEvent_EVT_END_SESSION();
        тип.СОБ_ЗАПРОС_КОНЕЦ_СЕССИИ = wxEvent_EVT_QUERY_END_SESSION();
        тип.СОБ_АКТИВИРУЙ_ПРИЛОЖЕНИЕ = wxEvent_EVT_ACTIVATE_APP();
        тип.СОБ_ПИТАНИЕ = wxEvent_EVT_POWER();
        тип.СОБ_АКТИВИРУЙ = wxEvent_EVT_ACTIVATE();
        тип.СОБ_СОЗДАЙ = wxEvent_EVT_CREATE();
        тип.СОБ_РАЗРУШЬ = wxEvent_EVT_DESTROY();
        тип.СОБ_ПОКАЖИ = wxEvent_EVT_SHOW();
        тип.СОБ_ИКОНИРУЙ = wxEvent_EVT_ICONIZE();
        тип.СОБ_МАКСИМИРУЙ = wxEvent_EVT_MAXIMIZE();
        тип.СОБ_ЗАХВАТ_МЫШИ_ИЗМЕНЁН = wxEvent_EVT_MOUSE_CAPTURE_CHANGED();
        тип.СОБ_РИСОВАНИЕ = wxEvent_EVT_PAINT();
        тип.СОБ_СОТРИ_ФОН = wxEvent_EVT_ERASE_BACKGROUND();
        тип.СОБ_НК_РИСОВАНИЕ = wxEvent_EVT_NC_PAINT();
        тип.СОБ_РИСУЙ_ИКОНКУ = wxEvent_EVT_PAINT_ICON();
        тип.СОБ_МЕНЮ_ОТКРОЙ = wxEvent_EVT_MENU_OPEN();
        тип.СОБ_МЕНЮ_ЗАКРОЙ = wxEvent_EVT_MENU_CLOSE();
        тип.СОБ_МЕНЮ_ПОДСВЕТИ = wxEvent_EVT_MENU_HIGHLIGHT();
        тип.СОБ_КОНТЕКСТ_МЕНЮ = wxEvent_EVT_CONTEXT_MENU();
        тип.СОБ_СИС_ЦВЕТ_ИЗМЕНЁН = wxEvent_EVT_SYS_COLOUR_CHANGED();
        тип.СОБ_ДИСПЛЕЙ_ИЗМЕНЁН = wxEvent_EVT_DISPLAY_CHANGED();
        тип.СОБ_УСТАНОВКА_ИЗМЕНЕНА = wxEvent_EVT_SETTING_CHANGED();
        тип.СОБ_ЗАПРОС_НОВОЙ_ПАЛИТРЫ = wxEvent_EVT_QUERY_NEW_PALETTE();
        тип.СОБ_ПАЛИТРА_ИЗМЕНЕНА = wxEvent_EVT_PALETTE_CHANGED();
        тип.СОБ_ДЖОЙ_КНОПКА_ВНИЗУ = wxEvent_EVT_JOY_BUTTON_DOWN();
        тип.СОБ_ДЖОЙ_КНОПКА_ВВЕРХУ = wxEvent_EVT_JOY_BUTTON_UP();
        тип.СОБ_ДЖОЙ_ДВИГАЙ = wxEvent_EVT_JOY_MOVE();
        тип.СОБ_ДЖОЙ_ЗЕТДВИГАЙ = wxEvent_EVT_JOY_ZMOVE();
        тип.СОБ_ЗАБРОС_ФАЙЛОВ = wxEvent_EVT_DROP_FILES();
        тип.СОБ_РИСУЙ_ЭЛТ = wxEvent_EVT_DRAW_ITEM();
        тип.СОБ_МЕРЯЙ_ЭЛТ = wxEvent_EVT_MEASURE_ITEM();
        тип.СОБ_СРАВНИ_ЭЛТ = wxEvent_EVT_COMPARE_ITEM();
        тип.СОБ_ИНИЦ_ДИАЛОГ = wxEvent_EVT_INIT_DIALOG();
        тип.СОБ_БЕЗДЕЙСТВИЕ = wxEvent_EVT_IDLE();
        тип.СОБ_ОБНОВИ_ИП = wxEvent_EVT_UPDATE_UI();

        тип.СОБ_КОМАНДА_ЛЕВАЯ_НАЖАТА = wxEvent_EVT_COMMAND_LEFT_CLICK();
        тип.СОБ_КОМАНДА_ЛЕВАЯ_ДНАЖАТА = wxEvent_EVT_COMMAND_LEFT_DCLICK();
        тип.СОБ_КОМАНДА_ПРАВАЯ_НАЖАТА = wxEvent_EVT_COMMAND_RIGHT_CLICK();
        тип.СОБ_КОМАНДА_ПРАВАЯ_ДНАЖАТА = wxEvent_EVT_COMMAND_RIGHT_DCLICK();
        тип.СОБ_КОМАНДА_УСТАНОВИ_ФОКУС = wxEvent_EVT_COMMAND_SET_FOCUS();
        тип.СОБ_КОМАНДА_ПОДАВИ_ФОКУС = wxEvent_EVT_COMMAND_KILL_FOCUS();
        тип.СОБ_КОМАНДА_ВХОД = wxEvent_EVT_COMMAND_ENTER();

        тип.СОБ_СПРАВКА = wxEvent_EVT_HELP();
        тип.СОБ_ПОДРОБНАЯ_СПРАВКА = wxEvent_EVT_DETAILED_HELP();

        тип.СОБ_КОМАНДА_ПЕРЕКЛЮЧАТЕЛЬ_НАЖАТ = wxEvent_EVT_COMMAND_TOGGLEBUTTON_CLICKED();

        тип.СОБ_ОБЪЕКТ_УДАЛЁН = wxEvent_EVT_OBJECTDELETED();
        return тип;
    }
}

    //---------------------------------------------------------------------

    alias static Событие function(ЦелУкз вхобъ) новфункц;

    protected static новфункц[ТипСобытия] мапфункц;

    //---------------------------------------------------------------------
    private static Событие Нов(ЦелУкз объ);

    //---------------------------------------------------------------------

    export static проц добавьТипСоб(ТипСобытия событие, новфункц функц)
    {
        мапфункц[событие]= функц;
    }

    //---------------------------------------------------------------------

    export this(ЦелУкз объ)
    {
        super(объ);
    }

    //---------------------------------------------------------------------

    export static Событие создайИз(ЦелУкз событие)
    {
        // Проверим, есть ли этот тип события в карте типов

        ТипСобытия типСоб = wxEvent_GetEventType(событие);
        новфункц* функц = типСоб in мапфункц;

        // Если это так, создаём экземплячр указанного типа

        Событие e;
        if (функц)
            e = (*функц)(событие);
        else
            e = new Событие(событие);

        return e;
    }

    //---------------------------------------------------------------------

    export ТипСобытия типСобытия()
    {
        return wxEvent_GetEventType(м_вхобъ);
    }

    //---------------------------------------------------------------------

    export цел ид()
    {
        return wxEvent_GetId(м_вхобъ);
    }

    //---------------------------------------------------------------------

    export проц пропусти()
    {
        пропусти(да);
    }

    export проц пропусти(бул skip)
    {
        wxEvent_Skip(м_вхобъ, skip);
    }

    //---------------------------------------------------------------------

    export бул пропущен()
    {
        return wxEvent_GetSkipped(м_вхобъ);
    }

    //---------------------------------------------------------------------

    export цел штампВремени()
    {
        return wxEvent_GetTimestamp(м_вхобъ);
    }

    //---------------------------------------------------------------------

    export ВизОбъект объектСобытия()
    {
        return найдиОбъект(wxEvent_GetEventObject(м_вхобъ));
    }

    export проц объектСобытия(ВизОбъект объ)
    {
        wxEvent_SetEventObject(м_вхобъ, объ.вхобъ);
    }

    //---------------------------------------------------------------------

    export ЦелУкз целУкзСобытия()
    {
        return wxEvent_GetEventObject(м_вхобъ);
    }

    export проц целУкзСобытия(ЦелУкз ptr)
    {
        return wxEvent_SetEventObject(м_вхобъ, ptr);
    }
	
///////////////////////////////////////////////////
///////////////////////////////////////////////////
	/+
export extern(C):

    void SetEventType(wxEventType typ) { m_eventType = typ; }
    wxEventType GetEventType() const { return m_eventType; }
    wxObject *GetEventObject() const { return m_eventObject; }
    void SetEventObject(wxObject *obj) { m_eventObject = obj; }
    long GetTimestamp() const { return m_timeStamp; }
    void SetTimestamp(long ts = 0) { m_timeStamp = ts; }
    int GetId() const { return m_id; }
    void SetId(int Id) { m_id = Id; }

    // Can instruct event processor that we wish to ignore this event
    // (treat as if the event table entry had not been found): this must be done
    // to allow the event processing by the base classes (calling event.Skip()
    // is the analog of calling the base class version of a virtual function)
    void Skip(bool skip = true) { m_skipped = skip; }
    bool GetSkipped() const { return m_skipped; }

    // this function is used to create a copy of the event polymorphically and
    // all derived classes must implement it because otherwise wxPostEvent()
    // for them wouldn't work (it needs to do a copy of the event)
    virtual wxEvent *Clone() const = 0;

    // Implementation only: this test is explicitly anti OO and this function
    // exists only for optimization purposes.
    bool IsCommandEvent() const { return m_isCommandEvent; }

    // Determine if this event should be propagating to the parent window.
    bool ShouldPropagate() const
        { return m_propagationLevel != wxEVENT_PROPAGATE_NONE; }

    // Stop an event from propagating to its parent window, returns the old
    // propagation level value
    int StopPropagation()
    {
        int propagationLevel = m_propagationLevel;
        m_propagationLevel = wxEVENT_PROPAGATE_NONE;
        return propagationLevel;
    }

    // Resume the event propagation by restoring the propagation level
    // (returned by StopPropagation())
    void ResumePropagation(int propagationLevel)
    {
        m_propagationLevel = propagationLevel;
    }
+/

}
