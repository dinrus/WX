module wx.Event;
public import wx.common;

typedef цел ТипСобытия;


extern(D) class Событие : ВизОбъект
{
    struct События
    {
        ТипСобытия СОБ_НУЛЛ;

        ТипСобытия СОБ_КОМАНДА_КНОПКА_НАЖАТА;
        ТипСобытия СОБ_КОМАНДА_ЧЕКБОКС_НАЖАТ;
        ТипСобытия СОБ_КОМАНДА_ВЫБОР_ВЫБРАН;
        ТипСобытия СОБ_КОМАНДА_ЛИСТБОКС_ВЫБРАН;
        ТипСобытия СОБ_КОМАНДА_ЛИСТБОКС_ДВАЖДЫ_НАЖАТ;
        ТипСобытия СОБ_КОМАНДА_ЛИСТБОКС_ТОГГЛ;
        ТипСобытия СОБ_КОМАНДА_ТЕКСТ_ОБНОВЛЁН;
        ТипСобытия СОБ_КОМАНДА_ТЕКСТ_ВВОД;
        ТипСобытия СОБ_КОМАНДА_ТЕКСТ_УИР;
        ТипСобытия СОБ_КОМАНДА_ТЕКСТ_МАКСДЛИН;
        ТипСобытия СОБ_КОМАНДА_МЕНЮ_ВЫБРАНО;
        ТипСобытия СОБ_КОМАНДА_ТУЛ_НАЖАТ;
        ТипСобытия СОБ_КОМАНДА_ПОЛЗУНОК_ОБНОВЛЁН;
        ТипСобытия СОБ_КОМАНДА_РАДИОБОКС_ВЫБРАН;
        ТипСобытия СОБ_КОМАНДА_РАДИОКНОПКА_ВЫБРАНА;
        ТипСобытия СОБ_КОМАНДА_СКРОЛЛБАР_ОБНОВЛЁН;
        ТипСобытия wxEVT_COMMAND_VLBOX_SELECTED;
        ТипСобытия СОБ_КОМАНДА_КОМБОБОКС_ВЫБРАН;
        ТипСобытия СОБ_КОМАНДА_ТУЛ_ПНАЖАТ;
        ТипСобытия СОБ_КОМАНДА_ТУЛ_ВВОД;
        ТипСобытия СОБ_КОМАНДА_СПИНКТРЛ_ОБНОВЛЁН;

        ТипСобытия СОБ_СОКЕТ;
        ТипСобытия СОБ_ТАЙМЕР ;

        ТипСобытия СОБ_ЛЕВАЯ_ВНИЗУ;
        ТипСобытия СОБ_ЛЕВАЯ_ВВЕРХУ;
        ТипСобытия СОБ_СРЕДНЯЯ_ВНИЗУ;
        ТипСобытия СОБ_СРЕДНЯЯ_ВВЕРХУ;
        ТипСобытия СОБ_ПРАВАЯ_ВНИЗУ;
        ТипСобытия СОБ_ПРАВАЯ_ВВЕРХУ;
        ТипСобытия СОБ_ДВИЖЕНИЕ;
        ТипСобытия СОБ_ВХОД_ОКНО;
        ТипСобытия СОБ_ВЫХОД_ОКНО;
        ТипСобытия СОБ_ЛЕВАЯ_ДНАЖАТА;
        ТипСобытия СОБ_СРЕДНЯЯ_ДНАЖАТА;
        ТипСобытия СОБ_ПРАВАЯ_ДНАЖАТА;
        ТипСобытия СОБ_УСТ_ФОКУС;
        ТипСобытия СОБ_РАСФОКУС;
        ТипСобытия СОБ_ОТПРЫСК_ФОКУС;
        ТипСобытия СОБ_КОЛЕСО_МЫШИ;

        ТипСобытия СОБ_НК_ЛЕВАЯ_ВНИЗУ;
        ТипСобытия СОБ_НК_ЛЕВАЯ_ВВЕРХУ;
        ТипСобытия СОБ_НК_СРЕДНЯЯ_ВНИЗУ;
        ТипСобытия СОБ_НК_СРЕДНЯЯ_ВВЕРХУ;
        ТипСобытия СОБ_НК_ПРАВАЯ_ВНИЗУ;
        ТипСобытия СОБ_НК_ПРАВАЯ_ВВЕРХУ;
        ТипСобытия СОБ_НК_ДВИЖЕНИЕ;
        ТипСобытия СОБ_НК_ВХОД_ОКНО;
        ТипСобытия СОБ_НК_ВЫХОД_ОКНО;
        ТипСобытия СОБ_НК_ЛЕВАЯ_ДНАЖАТА;
        ТипСобытия СОБ_НК_СРЕДНЯЯ_ДНАЖАТА;
        ТипСобытия СОБ_НК_ПРАВАЯ_ДНАЖАТА;

        ТипСобытия СОБ_СИМВ;
        ТипСобытия СОБ_СИМВ_ХУК;
        ТипСобытия СОБ_НАВИГАЦИЯ_КЛАВИША;
        ТипСобытия СОБ_КЛАВИША_ВНИЗУ;
        ТипСобытия СОБ_КЛАВИША_ВВЕРХУ;
        version(wxUSE_HOTKEY)
        {
            ТипСобытия СОБ_ГОРЯЧАЯ_КЛАВИША;
        }

        ТипСобытия СОБ_УСТ_КУРСОР;

        ТипСобытия СОБ_СКРОЛЛ_ВЕРХ;
        ТипСобытия СОБ_СКРОЛЛ_НИЗ;
        ТипСобытия СОБ_СКРОЛЛ_СТРОКОЙ_ВЫШЕ;
        ТипСобытия СОБ_СКРОЛЛ_СТРОКОЙ_НИЖЕ;
        ТипСобытия СОБ_СКРОЛЛ_СТРАНИЦАВВЕРХ;
        ТипСобытия СОБ_СКРОЛЛ_СТРАНИЦАВНИЗ;
        ТипСобытия СОБ_СКРОЛЛ_ТУМБТРЭК;
        ТипСобытия СОБ_СКРОЛЛ_ТУМБРЕЛИЗ;
        ТипСобытия СОБ_СКРОЛЛ_КОНЕЦПРОКР;
        ТипСобытия СОБ_СКРОЛЛВИН_ВЕРХ;
        ТипСобытия СОБ_СКРОЛЛВИН_НИЗ;
        ТипСобытия СОБ_СКРОЛЛВИН_СТРОКАВВЕРХ;
        ТипСобытия СОБ_СКРОЛЛВИН_СТРОКАВНИЗ;
        ТипСобытия СОБ_СКРОЛЛВИН_СТРАНИЦАВВЕРХ;
        ТипСобытия СОБ_СКРОЛЛВИН_СТРАНИЦАВНИЗ;
        ТипСобытия СОБ_СКРОЛЛВИН_ТУМБТРЭК;
        ТипСобытия СОБ_СКРОЛЛВИН_ТУМБРЕЛИЗ;
        ТипСобытия СОБ_РАЗМЕР;
        ТипСобытия СОБ_ДВИГАЙ;
        ТипСобытия СОБ_ЗАКРОЙ_ОКНО;
        ТипСобытия СОБ_КОНЕЦ_СЕССИИ;
        ТипСобытия СОБ_ЗАПРОС_КОНЕЦ_СЕССИИ;
        ТипСобытия СОБ_АКТИВИРУЙ_ПРИЛОЖЕНИЕ;
        ТипСобытия СОБ_ПИТАНИЕ;
        ТипСобытия СОБ_АКТИВИРУЙ;
        ТипСобытия СОБ_СОЗДАЙ;
        ТипСобытия СОБ_РАЗРУШЬ;
        ТипСобытия СОБ_ПОКАЖИ;
        ТипСобытия СОБ_ИКОНИРУЙ;
        ТипСобытия СОБ_МАКСИМИРУЙ;
        ТипСобытия СОБ_ЗАХВАТ_МЫШИ_ИЗМЕНЁН;
        ТипСобытия СОБ_РИСОВАНИЕ;
        ТипСобытия СОБ_СОТРИ_ФОН;
        ТипСобытия СОБ_НК_РИСОВАНИЕ;
        ТипСобытия СОБ_РИСУЙ_ИКОНКУ;
        ТипСобытия СОБ_МЕНЮ_ОТКРОЙ;
        ТипСобытия СОБ_МЕНЮ_ЗАКРОЙ;
        ТипСобытия СОБ_МЕНЮ_ПОДСВЕТИ;
        ТипСобытия СОБ_КОНТЕКСТ_МЕНЮ;
        ТипСобытия СОБ_СИС_ЦВЕТ_ИЗМЕНЁН;
        ТипСобытия СОБ_ДИСПЛЕЙ_ИЗМЕНЁН;
        ТипСобытия СОБ_УСТАНОВКА_ИЗМЕНЕНА;
        ТипСобытия СОБ_ЗАПРОС_НОВОЙ_ПАЛИТРЫ;
        ТипСобытия СОБ_ПАЛИТРА_ИЗМЕНЕНА;
        ТипСобытия СОБ_ДЖОЙ_КНОПКА_ВНИЗУ;
        ТипСобытия СОБ_ДЖОЙ_КНОПКА_ВВЕРХУ;
        ТипСобытия СОБ_ДЖОЙ_ДВИГАЙ;
        ТипСобытия СОБ_ДЖОЙ_ЗЕТДВИГАЙ;
        ТипСобытия СОБ_ЗАБРОС_ФАЙЛОВ;
        ТипСобытия СОБ_РИСУЙ_ЭЛТ;
        ТипСобытия СОБ_МЕРЯЙ_ЭЛТ;
        ТипСобытия СОБ_СРАВНИ_ЭЛТ;
        ТипСобытия СОБ_ИНИЦ_ДИАЛОГ;
        ТипСобытия СОБ_БЕЗДЕЙСТВИЕ;
        ТипСобытия СОБ_ОБНОВИ_ИП;
        ТипСобытия СОБ_ПЕРЕМЕР;
        ТипСобытия СОБ_ПЕРЕМЕЩЕНИЕ;
        ТипСобытия СОБ_КОМАНДА_ЛЕВАЯ_НАЖАТА;
        ТипСобытия СОБ_КОМАНДА_ЛЕВАЯ_ДНАЖАТА;
        ТипСобытия СОБ_КОМАНДА_ПРАВАЯ_НАЖАТА;
        ТипСобытия СОБ_КОМАНДА_ПРАВАЯ_ДНАЖАТА;
        ТипСобытия СОБ_КОМАНДА_УСТАНОВИ_ФОКУС;
        ТипСобытия СОБ_КОМАНДА_ПОДАВИ_ФОКУС;
        ТипСобытия СОБ_КОМАНДА_ВХОД;
        ТипСобытия СОБ_СПРАВКА;
        ТипСобытия СОБ_ПОДРОБНАЯ_СПРАВКА;
        ТипСобытия СОБ_КОМАНДА_ПЕРЕКЛЮЧАТЕЛЬ_НАЖАТ;
        ТипСобытия СОБ_ОБЪЕКТ_УДАЛЁН;

        ТипСобытия СОБ_КАЛЕНДАРЬ_ВЫД_ИЗМЕНЕНО;
        ТипСобытия СОБ_КАЛЕНДАРЬ_ДЕНЬ_ИЗМЕНЁН;
        ТипСобытия СОБ_КАЛЕНДАРЬ_МЕСЯЦ_ИЗМЕНЁН;
        ТипСобытия СОБ_КАЛЕНДАРЬ_ГОД_ИЗМЕНЁН;
        ТипСобытия СОБ_КАЛЕНДАРЬ_ДВАЖДЫ_НАЖАТ;
        ТипСобытия СОБ_КАЛЕНДАРЬ_ДЕНЬНЕДЕЛИ_НАЖАТ;

        ТипСобытия СОБ_КОМАНДА_НАЙДИ;
        ТипСобытия СОБ_КОМАНДА_НАЙДИ_СЛЕДЩ;
        ТипСобытия СОБ_КОМАНДА_НАЙДИ_ЗАМЕНИ;
        ТипСобытия СОБ_КОМАНДА_НАЙДИ_ЗАМЕНИ_ВСЕ;
        ТипСобытия СОБ_КОМАНДА_НАЙДИ_ЗАКРЫТЬ;

        ТипСобытия СОБ_КОМАНДА_ДЕРЕВО_НАЧАЛО_ТЯГА;
        ТипСобытия СОБ_КОМАНДА_ДЕРЕВО_НАЧАЛО_ПТЯГА;
        ТипСобытия СОБ_КОМАНДА_ДЕРЕВО_НАЧАЛО_РЕДАКТИРОВАНИЯ_ЯРЛЫКА;
        ТипСобытия СОБ_КОМАНДА_ДЕРЕВО_КОНЕЦ_РЕДАКТИРОВАНИЯ_ЯРЛЫКА;
        ТипСобытия СОБ_КОМАНДА_ДЕРЕВО_УДАЛИТЬ_ЭЛЕМЕНТ;
        ТипСобытия СОБ_КОМАНДА_ДЕРЕВО_ДАТЬ_ИНФО;
        ТипСобытия СОБ_КОМАНДА_ДЕРЕВО_УСТ_ИНФО;
        ТипСобытия СОБ_КОМАНДА_ДЕРЕВО_ЭЛТ_РАЗВЁРНУТ;
        ТипСобытия СОБ_КОМАНДА_ДЕРЕВО_ЭЛТ_РАЗВОРАЧИВАЕТСЯ;
        ТипСобытия СОБ_КОМАНДА_ДЕРЕВО_ЭЛТ_СВЁРНУТ;
        ТипСобытия СОБ_КОМАНДА_ДЕРЕВО_ЭЛТ_СВОРАЧИВАЕТСЯ;
        ТипСобытия СОБ_КОМАНДА_ДЕРЕВО_ВЫД_ИЗМЕНЕНО;
        ТипСобытия СОБ_КОМАНДА_ДЕРЕВО_ВЫД_ИЗМЕНЯЕТСЯ;
        ТипСобытия СОБ_КОМАНДА_ДЕРЕВО_КЛАВИША_ВНИЗУ;
        ТипСобытия СОБ_КОМАНДА_ДЕРЕВО_ЭЛТ_АКТИВИРОВАН;
        ТипСобытия СОБ_КОМАНДА_ДЕРЕВО_ПРАВАЯ_НАЖАТА;
        ТипСобытия СОБ_КОМАНДА_ДЕРЕВО_СРЕДНЯЯ_НАЖАТА;
        ТипСобытия СОБ_КОМАНДА_ДЕРЕВО_КОНЕЦ_ТЯГА;

        ТипСобытия СОБ_КОМАНДА_СПИСОК_НАЧАЛО_ТЯГА;
        ТипСобытия СОБ_КОМАНДА_СПИСОК_НАЧАЛО_ПТЯГА;
        ТипСобытия СОБ_КОМАНДА_СПИСОК_НАЧАЛО_РЕДАКТИРОВАНИЯ_ЯРЛЫКА;
        ТипСобытия СОБ_КОМАНДА_СПИСОК_КОНЕЦ_РЕДАКТИРОВАНИЯ_ЯРЛЫКА;
        ТипСобытия СОБ_КОМАНДА_СПИСОК_УДАЛИТЬ_ЭЛТ;
        ТипСобытия СОБ_КОМАНДА_СПИСОК_УДАЛИТЬ_ВСЕ_ЭЛТЫ;
        ТипСобытия СОБ_КОМАНДА_СПИСОК_ДАТЬ_ИНФО;
        ТипСобытия СОБ_КОМАНДА_СПИСОК_УСТ_ИНФО;
        ТипСобытия СОБ_КОМАНДА_СПИСОК_ЭЛТ_ВЫДЕЛЕН;
        ТипСобытия СОБ_КОМАНДА_СПИСОК_ЭЛТ_ДЕСЕЛЕКТИРОВАН;
        ТипСобытия СОБ_КОМАНДА_СПИСОК_ЭЛТ_АКТИВИРОВАН;
        ТипСобытия СОБ_КОМАНДА_СПИСОК_ЭЛТ_ФОКУСИРОВАН;
        ТипСобытия СОБ_КОМАНДА_СПИСОК_ЭЛТ_СРЕДНЯЯ_НАЖАТА;
        ТипСобытия СОБ_КОМАНДА_СПИСОК_ЭЛТ_ПРАВАЯ_НАЖАТА;
        ТипСобытия СОБ_КОМАНДА_СПИСОК_КЛАВИША_ВНИЗУ;
        ТипСобытия СОБ_КОМАНДА_СПИСОК_ВСТАВИТЬ_ЭЛТ;
        ТипСобытия СОБ_КОМАНДА_СПИСОК_КОЛ_НАЖАТА;
        ТипСобытия СОБ_КОМАНДА_СПИСОК_КОЛ_ПРАВАЯ_НАЖАТА;
        ТипСобытия СОБ_КОМАНДА_СПИСОК_КОЛ_НАЧАЛО_ТЯГА;
        ТипСобытия СОБ_КОМАНДА_СПИСОК_КОЛ_ТЯГ;
        ТипСобытия СОБ_КОМАНДА_СПИСОК_КОЛ_КОНЕЦ_ТЯГА;
        ТипСобытия СОБ_КОМАНДА_СПИСОК_КЭШ_ХИНТ;

        ТипСобытия СОБ_КОМАНДА_НОУТБУК_СТРАНИЦА_ИЗМЕНЕНА;
        ТипСобытия СОБ_КОМАНДА_НОУТБУК_СТРАНИЦА_ИЗМЕНЯЕТСЯ;

        ТипСобытия СОБ_КОМАНДА_СТРАНИЦА_ЛИСТБУКА_ИЗМЕНЕНА;
        ТипСобытия СОБ_КОМАНДА_СТРАНИЦА_ЛИСТБУКА_ИЗМЕНЯЕТСЯ;

        version(__WXMSW__)
        {
            ТипСобытия СОБ_КОМАНДА_ВКЛАДКА_ВЫД_ИЗМЕНЕНО;
            ТипСобытия СОБ_КОМАНДА_ВКЛАДКА_ВЫД_ИЗМЕНЯЕТСЯ;
        }
        ТипСобытия СОБ_СЕТКА_ЯЧЕЙКА_ЛЕВАЯ_НАЖАТА;
        ТипСобытия СОБ_СЕТКА_ЯЧЕЙКА_ПРАВАЯ_НАЖАТА;
        ТипСобытия СОБ_СЕТКА_ЯЧЕЙКА_ЛЕВАЯ_ДНАЖАТА;
        ТипСобытия СОБ_СЕТКА_ЯЧЕЙКА_ПРАВАЯ_ДНАЖАТА;
        ТипСобытия СОБ_СЕТКА_ЯРЛЫК_ЛЕВАЯ_НАЖАТА;
        ТипСобытия СОБ_СЕТКА_ЯРЛЫК_ПРАВАЯ_НАЖАТА;
        ТипСобытия СОБ_СЕТКА_ЯРЛЫК_ЛЕВАЯ_ДНАЖАТА;
        ТипСобытия СОБ_СЕТКА_ЯРЛЫК_ПРАВАЯ_ДНАЖАТА;
        ТипСобытия СОБ_СЕТКА_РЯД_РАЗМЕР;
        ТипСобытия СОБ_СЕТКА_КОЛОНКА_РАЗМЕР;
        ТипСобытия СОБ_СЕТКА_ДИАПАЗОН_ВЫДЕЛЕНИЕ;
        ТипСобытия СОБ_СЕТКА_ЯЧЕЙКА_ИЗМЕНЕНИЕ;
        ТипСобытия СОБ_СЕТКА_ВЫДЕЛИТЬ_ЯЧЕЙКУ;
        ТипСобытия СОБ_СЕТКА_РЕДАКТОР_ПОКАЗАН;
        ТипСобытия СОБ_СЕТКА_РЕДАКТОР_СКРЫТ;
        ТипСобытия СОБ_СЕТКА_РЕДАКТОР_СОЗДАН;

        ТипСобытия СОБ_САШ_ПЕРЕТЯНУТ;

        ТипСобытия СОБ_ЗАПРОС_ИНФО_ВЫКЛАДКИ;
        ТипСобытия СОБ_РАССЧЁТ_ВЫКЛАДКИ;
    }

    public static События соб;

    static События дайВсеСобытия();

    static this()
    {
        соб = дайВсеСобытия();
    }

    alias static Событие function(ЦелУкз вхобъ) новфункц;

    public static проц добавьТипСоб(ТипСобытия соб, новфункц функц);
    public this(ЦелУкз вхобъ);
    public static Событие создайИз(ЦелУкз Событие);
    public ТипСобытия типСобытия();
    public цел ид();
    public проц пропусти();
    public проц пропусти(бул skip);
    public бул пропущен();
    public цел штампВремени();
    public ВизОбъект объектСобытия();
    public проц объектСобытия(ВизОбъект объ);
    public ЦелУкз целУкзСобытия();
    public проц целУкзСобытия(ЦелУкз укз);

}