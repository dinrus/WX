module wx.TextCtrl;
public import wx.common;
public import wx.Control;
public import wx.CommandEvent;
public import wx.KeyEvent;

public enum ПраскладкаТекстАтра
{
    Дефолт,
    Левая,
    ПоЦентру,
    Центр = ПоЦентру,
    Правая,
    Выровненная
}

//---------------------------------------------------------------------

public enum ПРезТестаНажатияТекстКтрл
{
    Неизвестен = -2,
    Перед,
    НаТексте,
    Ниже,
    Позади
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxTextAttr_ctor(ЦелУкз цвТекст, ЦелУкз цвФон, ЦелУкз шрифт, цел раскладка);
extern (C) ЦелУкз wxTextAttr_ctor2();
extern (C) проц   wxTextAttr_dtor(ЦелУкз сам);
extern (C) проц   wxTextAttr_Init(ЦелУкз сам);
extern (C) проц   wxTextAttr_SetTextColour(ЦелУкз сам, ЦелУкз цвТекст);
extern (C) ЦелУкз wxTextAttr_GetTextColour(ЦелУкз сам);
extern (C) проц   wxTextAttr_SetBackgroundColour(ЦелУкз сам, ЦелУкз цвФон);
extern (C) ЦелУкз wxTextAttr_GetBackgroundColour(ЦелУкз сам);
extern (C) проц   wxTextAttr_SetFont(ЦелУкз сам, ЦелУкз шрифт);
extern (C) ЦелУкз wxTextAttr_GetFont(ЦелУкз сам);
extern (C) бул   wxTextAttr_HasTextColour(ЦелУкз сам);
extern (C) бул   wxTextAttr_HasBackgroundColour(ЦелУкз сам);
extern (C) бул   wxTextAttr_HasFont(ЦелУкз сам);
extern (C) бул   wxTextAttr_IsDefault(ЦелУкз сам);

extern (C) проц   wxTextAttr_SetAlignment(ЦелУкз сам, цел раскладка);
extern (C) цел    wxTextAttr_GetAlignment(ЦелУкз сам);
extern (C) проц   wxTextAttr_SetTabs(ЦелУкз сам, ЦелУкз tabs);
extern (C) ЦелУкз wxTextAttr_GetTabs(ЦелУкз сам);
extern (C) проц   wxTextAttr_SetLeftIndent(ЦелУкз сам, цел indent, цел subIndent);
extern (C) цел    wxTextAttr_GetLeftIndent(ЦелУкз сам);
extern (C) цел    wxTextAttr_GetLeftSubIndent(ЦелУкз сам);
extern (C) проц   wxTextAttr_SetRightIndent(ЦелУкз сам, цел indent);
extern (C) цел    wxTextAttr_GetRightIndent(ЦелУкз сам);
extern (C) проц   wxTextAttr_SetFlags(ЦелУкз сам, бцел флаги);
extern (C) бцел   wxTextAttr_GetFlags(ЦелУкз сам);
extern (C) бул   wxTextAttr_HasAlignment(ЦелУкз сам);
extern (C) бул   wxTextAttr_HasTabs(ЦелУкз сам);
extern (C) бул   wxTextAttr_HasLeftIndent(ЦелУкз сам);
extern (C) бул   wxTextAttr_HasRightIndent(ЦелУкз сам);
extern (C) бул   wxTextAttr_HasFlag(ЦелУкз сам, бцел флаг);
//! \endcond

//---------------------------------------------------------------------

export class ТекстАтр : ВизОбъект
{
    public const цел ЦВЕТ_ТЕКСТА =		0x0001;
    public const цел ЦВЕТ_ФОНА =	0x0002;
    public const цел ФАС_ШРИФТА =		0x0004;
    public const цел РАЗМЕР_ШРИФТА = 		0x0008;
    public const цел ШРИФТ_ВЕС =		0x0010;
    public const цел ШРИФТ_КУРСИВ =		0x0020;
    public const цел ШРИФТ_ПОДЧЕРК =		0x0040;
    public const цел ШРИФТ = ФАС_ШРИФТА | РАЗМЕР_ШРИФТА |
                                        ШРИФТ_ВЕС | ШРИФТ_КУРСИВ |
                                        ШРИФТ_ПОДЧЕРК;
    public const цел РАСКЛАДКА =		0x0080;
    public const цел ЛЕВЫЙ_ОТСТУП =		0x0100;
    public const цел ПРАВЫЙ_ОТСТУП =		0x0200;
    public const цел ТАБЫ =			0x0400;


    //---------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    private this(ЦелУкз вхобъ, бул памСобств)
    {
        super(вхобъ);
        this.памСобств = памСобств;
    }

    export this(Цвет цвТекст, Цвет цвФон=пусто, Шрифт шрифт=пусто, ПраскладкаТекстАтра раскладка = ПраскладкаТекстАтра.Дефолт)
    {
        this(wxTextAttr_ctor(ВизОбъект.безопУк(цвТекст), ВизОбъект.безопУк(цвФон), ВизОбъект.безопУк(шрифт), cast(цел)раскладка), да);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxTextAttr_dtor(вхобъ);
    }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
    //---------------------------------------------------------------------

    export проц цветТекста(Цвет значение)
    {
        wxTextAttr_SetTextColour(вхобъ, ВизОбъект.безопУк(значение));
    }
    export Цвет цветТекста()
    {
        return new Цвет(wxTextAttr_GetTextColour(вхобъ), да);
    }

    //---------------------------------------------------------------------

    export проц цветФона(Цвет значение)
    {
        wxTextAttr_SetBackgroundColour(вхобъ, ВизОбъект.безопУк(значение));
    }
    export Цвет цветФона()
    {
        return new Цвет(wxTextAttr_GetBackgroundColour(вхобъ), да);
    }

    //---------------------------------------------------------------------

    export проц шрифт(Шрифт значение)
    {
        wxTextAttr_SetFont(вхобъ, ВизОбъект.безопУк(значение));
    }
    export Шрифт шрифт()
    {
        return new Шрифт(wxTextAttr_GetFont(вхобъ));
    }

    //---------------------------------------------------------------------

    export проц раскладка(ПраскладкаТекстАтра значение)
    {
        wxTextAttr_SetAlignment(вхобъ, cast(цел)значение);
    }
    export ПраскладкаТекстАтра раскладка()
    {
        return cast(ПраскладкаТекстАтра)wxTextAttr_GetAlignment(вхобъ);
    }

    //---------------------------------------------------------------------

    export проц табы(цел[] значение)
    {
        ЦелМассив ai = new ЦелМассив();

        for(цел i = 0; i < значение.length; ++i)
            ai.добавь(значение[i]);

        wxTextAttr_SetTabs(вхобъ, ЦелМассив.безопУк(ai));
    }
    export цел[] табы()
    {
        return (new ЦелМассив(wxTextAttr_GetTabs(вхобъ), да)).вМассив();
    }

    //---------------------------------------------------------------------

    export проц устЛевыйОтступ(цел indent)
    {
        устЛевыйОтступ(indent, 0);
    }

    export проц устЛевыйОтступ(цел indent, цел subIndent)
    {
        wxTextAttr_SetLeftIndent(вхобъ, indent, subIndent);
    }

    export цел левыйОтступ()
    {
        return wxTextAttr_GetLeftIndent(вхобъ);
    }

    export цел левыйСубОтступ()
    {
        return wxTextAttr_GetLeftSubIndent(вхобъ);
    }

    //---------------------------------------------------------------------

    export проц правыйОтступ(цел значение)
    {
        wxTextAttr_SetRightIndent(вхобъ, значение);
    }
    export цел правыйОтступ()
    {
        return wxTextAttr_GetRightIndent(вхобъ);
    }

    //---------------------------------------------------------------------

    export проц флаги(цел значение)
    {
        wxTextAttr_SetFlags(вхобъ, cast(бцел)значение);
    }
    export цел флаги()
    {
        return cast(цел)wxTextAttr_GetFlags(вхобъ);
    }

    //---------------------------------------------------------------------

    export бул естьЦветТекста()
    {
        return wxTextAttr_HasTextColour(вхобъ);
    }

    //---------------------------------------------------------------------

    export бул естьЦветФона()
    {
        return wxTextAttr_HasBackgroundColour(вхобъ);
    }

    //---------------------------------------------------------------------

    export бул естьШрифт()
    {
        return wxTextAttr_HasFont(вхобъ);
    }

    //---------------------------------------------------------------------

    export бул естьраскладка()
    {
        return wxTextAttr_HasAlignment(вхобъ);
    }

    //---------------------------------------------------------------------

    export бул естьТабы()
    {
        return wxTextAttr_HasTabs(вхобъ);
    }

    //---------------------------------------------------------------------

    export бул естьЛевыйОтступ()
    {
        return wxTextAttr_HasLeftIndent(вхобъ);
    }

    //---------------------------------------------------------------------

    export бул естьПравыйОтступ()
    {
        return wxTextAttr_HasRightIndent(вхобъ);
    }

    //---------------------------------------------------------------------

    export бул естьФлаг(цел флаг)
    {
        return wxTextAttr_HasFlag(вхобъ, cast(бцел)флаг);
    }

    //---------------------------------------------------------------------

    export бул дефолт_ли()
    {
        return wxTextAttr_IsDefault(вхобъ);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxTextCtrl_GetValue(ЦелУкз сам);
extern (C) проц   wxTextCtrl_SetValue(ЦелУкз сам, ткст значение);
extern (C) ЦелУкз wxTextCtrl_GetRange(ЦелУкз сам, бцел от, бцел до);
extern (C) цел    wxTextCtrl_GetLineLength(ЦелУкз сам, бцел номстр);
extern (C) ЦелУкз wxTextCtrl_GetLineText(ЦелУкз сам, бцел номстр);
extern (C) цел    wxTextCtrl_GetNumberOfLines(ЦелУкз сам);
extern (C) бул   wxTextCtrl_IsModified(ЦелУкз сам);
extern (C) бул   wxTextCtrl_IsEditable(ЦелУкз сам);
extern (C) бул   wxTextCtrl_IsSingleLine(ЦелУкз сам);
extern (C) бул   wxTextCtrl_IsMultiLine(ЦелУкз сам);
extern (C) проц   wxTextCtrl_GetSelection(ЦелУкз сам, out цел от, out цел до);
extern (C) ЦелУкз wxTextCtrl_GetStringSelection(ЦелУкз сам);
extern (C) проц   wxTextCtrl_Clear(ЦелУкз сам);
extern (C) проц   wxTextCtrl_Replace(ЦелУкз сам, бцел от, бцел до, ткст значение);
extern (C) проц   wxTextCtrl_Remove(ЦелУкз сам, бцел от, бцел до);
extern (C) бул   wxTextCtrl_LoadFile(ЦелУкз сам, ткст файл);
extern (C) бул   wxTextCtrl_SaveFile(ЦелУкз сам, ткст файл);
extern (C) проц   wxTextCtrl_MarkDirty(ЦелУкз сам);
extern (C) проц   wxTextCtrl_DiscardEdits(ЦелУкз сам);
extern (C) проц   wxTextCtrl_SetMaxLength(ЦелУкз сам, бцел len);
extern (C) проц   wxTextCtrl_WriteText(ЦелУкз сам, ткст текст);
extern (C) проц   wxTextCtrl_AppendText(ЦелУкз сам, ткст текст);
extern (C) бул   wxTextCtrl_EmulateKeyPress(ЦелУкз сам, ЦелУкз соб);
extern (C) бул   wxTextCtrl_SetStyle(ЦелУкз сам, бцел старт, бцел конец, ЦелУкз стиль);
extern (C) бул   wxTextCtrl_GetStyle(ЦелУкз сам, бцел позиция, inout ЦелУкз стиль);
extern (C) бул   wxTextCtrl_SetDefaultStyle(ЦелУкз сам, ЦелУкз стиль);
extern (C) ЦелУкз wxTextCtrl_GetDefaultStyle(ЦелУкз сам);
extern (C) бцел   wxTextCtrl_XYToPosition(ЦелУкз сам, бцел x, бцел y);
extern (C) бул   wxTextCtrl_PositionToXY(ЦелУкз сам, бцел поз, out цел x, out цел y);
extern (C) проц   wxTextCtrl_ShowPosition(ЦелУкз сам, бцел поз);
extern (C) цел    wxTextCtrl_HitTest(ЦелУкз сам, inout Точка тчк, out цел поз);
extern (C) цел    wxTextCtrl_HitTest2(ЦелУкз сам, inout Точка тчк, out цел кол, out цел ряд);
extern (C) проц   wxTextCtrl_Copy(ЦелУкз сам);
extern (C) проц   wxTextCtrl_Cut(ЦелУкз сам);
extern (C) проц   wxTextCtrl_Paste(ЦелУкз сам);
extern (C) бул   wxTextCtrl_CanCopy(ЦелУкз сам);
extern (C) бул   wxTextCtrl_CanCut(ЦелУкз сам);
extern (C) бул   wxTextCtrl_CanPaste(ЦелУкз сам);
extern (C) проц   wxTextCtrl_Undo(ЦелУкз сам);
extern (C) проц   wxTextCtrl_Redo(ЦелУкз сам);
extern (C) бул   wxTextCtrl_CanUndo(ЦелУкз сам);
extern (C) бул   wxTextCtrl_CanRedo(ЦелУкз сам);
extern (C) проц   wxTextCtrl_SetInsertionPoint(ЦелУкз сам, бцел поз);
extern (C) проц   wxTextCtrl_SetInsertionPointEnd(ЦелУкз сам);
extern (C) бцел   wxTextCtrl_GetInsertionPoint(ЦелУкз сам);
extern (C) бцел   wxTextCtrl_GetLastPosition(ЦелУкз сам);
extern (C) проц   wxTextCtrl_SetSelection(ЦелУкз сам, бцел от, бцел до);
extern (C) проц   wxTextCtrl_SelectAll(ЦелУкз сам);
extern (C) проц   wxTextCtrl_SetEditable(ЦелУкз сам, бул редактируемый);
extern (C)        ЦелУкз wxTextCtrl_ctor();
extern (C) бул   wxTextCtrl_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ткст значение, inout Точка поз, inout Размер размер, бцел стиль, ЦелУкз оценщик, ткст имя);
extern (C) бул   wxTextCtrl_Enable(ЦелУкз сам, бул вкл);
extern (C) проц   wxTextCtrl_OnDropFiles(ЦелУкз сам, ЦелУкз соб);
extern (C) бул   wxTextCtrl_SetFont(ЦелУкз сам, ЦелУкз шрифт);
extern (C) бул   wxTextCtrl_SetForegroundColour(ЦелУкз сам, ЦелУкз цвет);
extern (C) бул   wxTextCtrl_SetBackgroundColour(ЦелУкз сам, ЦелУкз цвет);
extern (C) проц   wxTextCtrl_Freeze(ЦелУкз сам);
extern (C) проц   wxTextCtrl_Thaw(ЦелУкз сам);
extern (C) бул   wxTextCtrl_ScrollLines(ЦелУкз сам, цел строки);
extern (C) бул   wxTextCtrl_ScrollPages(ЦелУкз сам, цел страницы);
//! \endcond

//---------------------------------------------------------------------

export class ТекстКтрл : Контрол
{
    public const цел БЕЗ_ВСКРОЛЛА       = 0x0002;
    public const цел АВТОСКРОЛЛ      = 0x0008;

    public const цел ТОЛЬКО_ЧТЕНИЕ         = 0x0010;
    public const цел МНОГОСТРОК        = 0x0020;
    public const цел ПРОЦЕСС_ТАБ      = 0x0040;

    public const цел ЛЕВЫЙ             = 0x0000;
    public const цел В_ЦЕНТРЕ           = ПРаскладка.Центр;
    public const цел ПРАВЫЙ            = ПРаскладка.Справа;

    public const цел РИЧ             = 0x0080;
    public const цел ПРОЦЕСС_ВВОД    = 0x0400;
    public const цел ПАРОЛЬ         = 0x0800;

    public const цел АВТОУЛР         = 0x1000;
    public const цел НЕСКРВЫД        = 0x2000;
    public const цел БЕЗ_ПОДГОНКИ         = Окно.ГПРОКРУТ;
    public const цел ПОДГОНКА_СТРОК         = 0x4000;
    public const цел ПОДГОНКА_СЛОВ         = 0x0000;
    public const цел РИЧ2            = 0x8000;


    public const ткст СтрИмениТекстКтрл = "text";
    //---------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(Окно родитель, цел ид, ткст значение="", Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = 0, Оценщик оценщик = пусто, ткст имя = СтрИмениТекстКтрл)
    {
        this(wxTextCtrl_ctor());
        if (!wxTextCtrl_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, значение, поз, размер, cast(бцел)стиль, ВизОбъект.безопУк(оценщик), имя))
        {
            throw new ИсклНевернОперации("Не удалось создать ТекстКтрл");
        }
    }

    export static ВизОбъект Нов(ЦелУкз вхобъ)
    {
        return new ТекстКтрл(вхобъ);
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    export this(Окно родитель, ткст значение="", Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = 0, Оценщик оценщик = пусто, ткст имя = СтрИмениТекстКтрл)
    {
        this(родитель, Окно.уникИд, значение, поз, размер, 0, оценщик, имя);
    }

    //---------------------------------------------------------------------

    export проц очисть()
    {
        wxTextCtrl_Clear(вхобъ);
    }

    //---------------------------------------------------------------------

    export override проц цветФона(Цвет значение)
    {
        wxTextCtrl_SetBackgroundColour(вхобъ, ВизОбъект.безопУк(значение));
    }

    export override проц цветПП(Цвет значение)
    {
        wxTextCtrl_SetForegroundColour(вхобъ, ВизОбъект.безопУк(значение));
    }

    //---------------------------------------------------------------------

    export ткст значение()
    {
        return cast(ткст) new ВизТкст(wxTextCtrl_GetValue(вхобъ), да);
    }
    export проц значение(ткст значение)
    {
        wxTextCtrl_SetValue(вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export ткст дайДиапазон(цел от, цел до)
    {
        return cast(ткст) new ВизТкст(wxTextCtrl_GetRange(вхобъ, cast(бцел)от, cast(бцел)до), да);
    }

    //---------------------------------------------------------------------

    export цел длинаСтроки(цел номстр)
    {
        return wxTextCtrl_GetLineLength(вхобъ, cast(бцел)номстр);
    }

    export ткст дайТекстСтроки(цел номстр)
    {
        return cast(ткст) new ВизТкст(wxTextCtrl_GetLineText(вхобъ, cast(бцел)номстр), да);
    }

    export цел дайЧлоСтрок()
    {
        return wxTextCtrl_GetNumberOfLines(вхобъ);
    }

    //---------------------------------------------------------------------

    export бул модифицирован()
    {
        return wxTextCtrl_IsModified(вхобъ);
    }

    export бул редактируемый()
    {
        return wxTextCtrl_IsEditable(вхобъ);
    }

    export бул однострочный()
    {
        return wxTextCtrl_IsSingleLine(вхобъ);
    }

    export бул многострочный()
    {
        return wxTextCtrl_IsMultiLine(вхобъ);
    }

    //---------------------------------------------------------------------

    export проц дайВыделение(out цел от, out цел до)
    {
        wxTextCtrl_GetSelection(вхобъ, от, до);
    }

    //---------------------------------------------------------------------

    export проц замени(цел от, цел до, ткст значение)
    {
        wxTextCtrl_Replace(вхобъ, cast(бцел)от, cast(бцел)до, значение);
    }

    export проц удали(цел от, цел до)
    {
        wxTextCtrl_Remove(вхобъ, cast(бцел)от, cast(бцел)до);
    }

    //---------------------------------------------------------------------

    export бул загрузиФайл(ткст файл)
    {
        return wxTextCtrl_LoadFile(вхобъ, файл);
    }

    // using wx.NET with wxGTK wxTextCtrl_LoadFile didn't work
    // LoadFileNET uses StreamReader
    // this should also handle кодировка problems...
    /+
    export бул LoadFileNET(ткст файл)
    {
        try
        {
            System.IO.StreamReader sr = new System.IO.StreamReader(файл);
            ткст т = sr.ReadToEnd();
            sr.закрой();
            приставьТекст(т);

            return да;

        }
        catch ( Исключение e )
        {
            return нет;
        }
    }
    +/

    export бул сохраниФайл(ткст файл)
    {
        return wxTextCtrl_SaveFile(вхобъ, файл);
    }

    // counterpart of LoadFileNET
    /+
    export бул SaveFileNET(ткст файл)
    {
        try
        {
            System.IO.StreamWriter sw = new System.IO.StreamWriter(файл);
            sw.пиши(значение);
            sw.закрой();

            return да;
        }
        catch ( Исключение e )
        {
            return нет;
        }
    }
    +/

    //---------------------------------------------------------------------

    export проц отмениРедактирования()
    {
        wxTextCtrl_DiscardEdits(вхобъ);
    }

    //---------------------------------------------------------------------

    export проц пометьГрязным()
    {
        wxTextCtrl_MarkDirty(вхобъ);
    }

    //---------------------------------------------------------------------

    export проц максДлина(цел значение)
    {
        wxTextCtrl_SetMaxLength(вхобъ, cast(бцел)значение);
    }

    //---------------------------------------------------------------------

    export проц пишиТекст(ткст текст)
    {
        wxTextCtrl_WriteText(вхобъ, текст);
    }

    //---------------------------------------------------------------------

    export проц приставьТекст(ткст текст)
    {
        wxTextCtrl_AppendText(вхобъ, текст);
    }

    //---------------------------------------------------------------------

    export бул эмулируйНажатиеКлавиши(СобытиеКлавиатуры соб)
    {
        return wxTextCtrl_EmulateKeyPress(вхобъ, ВизОбъект.безопУк(соб));
    }

    //---------------------------------------------------------------------

    export бул устСтиль(цел старт, цел конец, ТекстАтр стиль)
    {
        return wxTextCtrl_SetStyle(вхобъ, cast(бцел)старт, cast(бцел)конец, ВизОбъект.безопУк(стиль));
    }

    export бул дайСтиль(цел позиция, inout ТекстАтр стиль)
    {
        ЦелУкз tmp = ВизОбъект.безопУк(стиль);
        бул retval = wxTextCtrl_GetStyle(вхобъ, cast(бцел)позиция, tmp);
        стиль.вхобъ = tmp;
        return retval;
    }

    //---------------------------------------------------------------------

    export бул устДефСтиль(ТекстАтр стиль)
    {
        return wxTextCtrl_SetDefaultStyle(вхобъ, ВизОбъект.безопУк(стиль));
    }

    export ТекстАтр дайДефСтиль()
    {
        return cast(ТекстАтр)найдиОбъект(wxTextCtrl_GetDefaultStyle(вхобъ));
    }

    //---------------------------------------------------------------------

    export цел хуВПозицию(цел x, цел y)
    {
        return wxTextCtrl_XYToPosition(вхобъ, cast(бцел)x, cast(бцел)y);
    }

    export бул позициюВХУ(цел поз, out цел x, out цел y)
    {
        return wxTextCtrl_PositionToXY(вхобъ, cast(бцел)поз, x, y);
    }

    export проц покажиПозицию(цел поз)
    {
        wxTextCtrl_ShowPosition(вхобъ, cast(бцел)поз);
    }

    //---------------------------------------------------------------------

    export ПРезТестаНажатияТекстКтрл тестНажатия(Точка тчк, out цел поз)
    {
        return cast(ПРезТестаНажатияТекстКтрл)wxTextCtrl_HitTest(вхобъ, тчк, поз);
    }

    export ПРезТестаНажатияТекстКтрл тестНажатия(Точка тчк, out цел кол, out цел ряд)
    {
        return cast(ПРезТестаНажатияТекстКтрл)wxTextCtrl_HitTest2(вхобъ, тчк, кол, ряд);
    }

    //---------------------------------------------------------------------

    export проц копируй()
    {
        wxTextCtrl_Copy(вхобъ);
    }

    export проц вырежи()
    {
        wxTextCtrl_Cut(вхобъ);
    }

    export проц вставь()
    {
        wxTextCtrl_Paste(вхобъ);
    }

    //---------------------------------------------------------------------

    export бул можноКопировать()
    {
        return wxTextCtrl_CanCopy(вхобъ);
    }

    export бул можноВырезать()
    {
        return wxTextCtrl_CanCut(вхобъ);
    }

    export бул можноВставлять()
    {
        return wxTextCtrl_CanPaste(вхобъ);
    }

    //---------------------------------------------------------------------

    export проц отмениСделанное()
    {
        wxTextCtrl_Undo(вхобъ);
    }

    export проц верниСделанное()
    {
        wxTextCtrl_Redo(вхобъ);
    }

    //---------------------------------------------------------------------

    export бул можноОтменитьСделанное()
    {
        return wxTextCtrl_CanUndo(вхобъ);
    }

    export бул можноВернутьСделанное()
    {
        return wxTextCtrl_CanRedo(вхобъ);
    }

    //---------------------------------------------------------------------

    export проц точкаВставки(цел значение)
    {
        wxTextCtrl_SetInsertionPoint(вхобъ, cast(бцел)значение);
    }
    export цел точкаВставки()
    {
        return wxTextCtrl_GetInsertionPoint(вхобъ);
    }

    export проц устКонецТочкиВставки()
    {
        wxTextCtrl_SetInsertionPointEnd(вхобъ);
    }

    export цел дайПоследнПоз()
    {
        return cast(цел)wxTextCtrl_GetLastPosition(вхобъ);
    }

    //---------------------------------------------------------------------

    export проц устВыделение(цел от, цел до)
    {
        wxTextCtrl_SetSelection(вхобъ, cast(бцел)от, cast(бцел)до);
    }

    export проц выделиВсе()
    {
        wxTextCtrl_SelectAll(вхобъ);
    }

    //---------------------------------------------------------------------

    export проц устРедактируемый(бул редактируемый)
    {
        wxTextCtrl_SetEditable(вхобъ, редактируемый);
    }

    //---------------------------------------------------------------------

    export бул включи(бул вкл)
    {
        return wxTextCtrl_Enable(вхобъ, вкл);
    }

    //---------------------------------------------------------------------

    export  проц приЗабросеФайлов(Событие соб)
    {
        wxTextCtrl_OnDropFiles(вхобъ, ВизОбъект.безопУк(соб));
    }

    //---------------------------------------------------------------------

    export override проц заморозь()
    {
        wxTextCtrl_Freeze(вхобъ);
    }

    export override проц оттай()
    {
        wxTextCtrl_Thaw(вхобъ);
    }

    //---------------------------------------------------------------------

    export override бул прокрутиСтроки(цел строки)
    {
        return wxTextCtrl_ScrollLines(вхобъ, строки);
    }

    export override бул прокрутиСтраницы(цел страницы)
    {
        return wxTextCtrl_ScrollPages(вхобъ, страницы);
    }

    //---------------------------------------------------------------------

    export override проц UpdateUI_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_ТЕКСТ_ОБНОВЛЁН, ид, значение, this);
    }
    export override проц UpdateUI_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }

    export проц Enter_Add(ДатчикСобытий значение)
    {
        добавьДатчикКоманд(Событие.Тип.СОБ_КОМАНДА_ТЕКСТ_ВВОД, ид, значение, this);
    }
    export проц Enter_Remove(ДатчикСобытий значение)
    {
        удалиОбработчик(значение, this);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxTextUrlEvent_ctor(цел ид, ЦелУкз собМышь, бцел старт, бцел конец);
extern (C) бцел   wxTextUrlEvent_GetURLStart(ЦелУкз сам);
extern (C) бцел   wxTextUrlEvent_GetURLEnd(ЦелУкз сам);
//! \endcond

export class СобытиеУЛРТекста : СобытиеКоманды
{
    // TODO: замени Событие with EventMouse
    export this(цел ид, Событие собМышь, цел старт, цел конец)
    {
        super(wxTextUrlEvent_ctor(ид, ВизОбъект.безопУк(собМышь), cast(бцел)старт, cast(бцел)конец));
    }
}
