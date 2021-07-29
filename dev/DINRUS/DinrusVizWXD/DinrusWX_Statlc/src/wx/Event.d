module wx.Event;
public import wx.common;

typedef цел ТипСобытия;


extern(D) class Событие : ВизОбъект
{
    struct Тип
    {
         ТипСобытия СОБ_НУЛЛ,
		 
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
      //  {
             СОБ_ГОРЯЧАЯ_КЛАВИША,
      //  }

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

     //   version(__WXMSW__)
     //   {
             СОБ_КОМАНДА_ВКЛАДКА_ВЫД_ИЗМЕНЕНО,
             СОБ_КОМАНДА_ВКЛАДКА_ВЫД_ИЗМЕНЯЕТСЯ,
     //   }
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
		 
		static Тип opCall();
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
