module wx.Grid;
public import wx.common;
public import wx.Event;
public import wx.KeyEvent;
public import wx.CommandEvent;
public import wx.Window;
public import wx.Control;
public import wx.ScrolledWindow;

    public enum ПРежимВыделенияСетки
    {
        ВыделитьЯчейки,
        ВыделитьРяды,
        ВыделитьКолонки
    }

		//! \cond EXTERN
        extern (C) ЦелУкз wxGridEvent_ctor(цел ид, цел тип, ЦелУкз объ, цел ряд, цел кол, цел x, цел y, бул выдл, бул контрол, бул шифт, бул альт, бул мета);
        extern (C) цел    wxGridEvent_GetRow(ЦелУкз сам);
        extern (C) цел    wxGridEvent_GetCol(ЦелУкз сам);
        extern (C) проц   wxGridEvent_GetPosition(ЦелУкз сам, inout Точка тчк);
        extern (C) бул   wxGridEvent_Selecting(ЦелУкз сам);
        extern (C) бул   wxGridEvent_ControlDown(ЦелУкз сам);
        extern (C) бул   wxGridEvent_MetaDown(ЦелУкз сам);
        extern (C) бул   wxGridEvent_ShiftDown(ЦелУкз сам);
        extern (C) бул   wxGridEvent_AltDown(ЦелУкз сам);
        extern (C) проц wxGridEvent_Veto(ЦелУкз сам);
        extern (C) проц wxGridEvent_Allow(ЦелУкз сам);
        extern (C) бул wxGridEvent_IsAllowed(ЦелУкз сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    export class СобытиеСетки : Событие
    {
        export this(ЦелУкз вхобъ)
            { super(вхобъ); }

        export this(цел ид, цел тип, ВизОбъект объ, цел ряд, цел кол, цел x, цел y, бул выдл, бул контрол, бул шифт, бул альт, бул мета)
            { this(wxGridEvent_ctor(ид, тип, ВизОбъект.безопУк(объ), ряд, кол, x, y, выдл, контрол, шифт, альт, мета)); }

        //-----------------------------------------------------------------------------

        export цел ряд() { return wxGridEvent_GetRow(вхобъ); }

        export цел кол() { return wxGridEvent_GetCol(вхобъ); }

        //-----------------------------------------------------------------------------

        export Точка позиция() {
                Точка тчк;
                wxGridEvent_GetPosition(вхобъ, тчк);
                return тчк;
            }

        //-----------------------------------------------------------------------------

        export бул выделяется() { return wxGridEvent_Selecting(вхобъ); }

        //-----------------------------------------------------------------------------

        export бул контролВнизу() { return wxGridEvent_ControlDown(вхобъ); }

        export бул метаВнизу() { return wxGridEvent_MetaDown(вхобъ); }

        export бул шифтВнизу() { return wxGridEvent_ShiftDown(вхобъ); }

            export бул альтВнизу() { return wxGridEvent_AltDown(вхобъ); }

        //-----------------------------------------------------------------------------

        export проц запрет()
        {
            wxGridEvent_Veto(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц позволить()
        {
            wxGridEvent_Allow(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export бул позволено() { return wxGridEvent_IsAllowed(вхобъ); }

	private static Событие Нов(ЦелУкз объ) { return new СобытиеСетки(объ); }

	static this()
	{
			 super.Тип.СОБ_СЕТКА_ЯЧЕЙКА_ЛЕВАЯ_НАЖАТА = wxEvent_EVT_GRID_CELL_LEFT_CLICK();
			 super.Тип.СОБ_СЕТКА_ЯЧЕЙКА_ПРАВАЯ_НАЖАТА = wxEvent_EVT_GRID_CELL_RIGHT_CLICK();
			 super.Тип.СОБ_СЕТКА_ЯЧЕЙКА_ЛЕВАЯ_ДНАЖАТА = wxEvent_EVT_GRID_CELL_LEFT_DCLICK();
			 super.Тип.СОБ_СЕТКА_ЯЧЕЙКА_ПРАВАЯ_ДНАЖАТА = wxEvent_EVT_GRID_CELL_RIGHT_DCLICK();
			 super.Тип.СОБ_СЕТКА_ЯРЛЫК_ЛЕВАЯ_НАЖАТА = wxEvent_EVT_GRID_LABEL_LEFT_CLICK();
			 super.Тип.СОБ_СЕТКА_ЯРЛЫК_ПРАВАЯ_НАЖАТА = wxEvent_EVT_GRID_LABEL_RIGHT_CLICK();
			 super.Тип.СОБ_СЕТКА_ЯРЛЫК_ЛЕВАЯ_ДНАЖАТА = wxEvent_EVT_GRID_LABEL_LEFT_DCLICK();
			 super.Тип.СОБ_СЕТКА_ЯРЛЫК_ПРАВАЯ_ДНАЖАТА = wxEvent_EVT_GRID_LABEL_RIGHT_DCLICK();
			 super.Тип.СОБ_СЕТКА_ЯЧЕЙКА_ИЗМЕНЕНИЕ = wxEvent_EVT_GRID_CELL_CHANGE();
			 super.Тип.СОБ_СЕТКА_ВЫДЕЛИТЬ_ЯЧЕЙКУ = wxEvent_EVT_GRID_SELECT_CELL();
			 super.Тип.СОБ_СЕТКА_РЕДАКТОР_ПОКАЗАН = wxEvent_EVT_GRID_EDITOR_SHOWN();
			 super.Тип.СОБ_СЕТКА_РЕДАКТОР_СКРЫТ = wxEvent_EVT_GRID_EDITOR_HIDDEN();
			 super.Тип.СОБ_СЕТКА_РЕДАКТОР_СОЗДАН = wxEvent_EVT_GRID_EDITOR_CREATED();

			добавьТипСоб( super.Тип.СОБ_СЕТКА_ЯЧЕЙКА_ЛЕВАЯ_НАЖАТА,            &СобытиеСетки.Нов);
			добавьТипСоб( super.Тип.СОБ_СЕТКА_ЯЧЕЙКА_ПРАВАЯ_НАЖАТА,           &СобытиеСетки.Нов);
			добавьТипСоб( super.Тип.СОБ_СЕТКА_ЯЧЕЙКА_ЛЕВАЯ_ДНАЖАТА,           &СобытиеСетки.Нов);
			добавьТипСоб( super.Тип.СОБ_СЕТКА_ЯЧЕЙКА_ПРАВАЯ_ДНАЖАТА,          &СобытиеСетки.Нов);
			добавьТипСоб( super.Тип.СОБ_СЕТКА_ЯРЛЫК_ЛЕВАЯ_НАЖАТА,           &СобытиеСетки.Нов);
			добавьТипСоб( super.Тип.СОБ_СЕТКА_ЯРЛЫК_ПРАВАЯ_НАЖАТА,          &СобытиеСетки.Нов);
			добавьТипСоб( super.Тип.СОБ_СЕТКА_ЯРЛЫК_ЛЕВАЯ_ДНАЖАТА,          &СобытиеСетки.Нов);
			добавьТипСоб( super.Тип.СОБ_СЕТКА_ЯРЛЫК_ПРАВАЯ_ДНАЖАТА,         &СобытиеСетки.Нов);
			добавьТипСоб( super.Тип.СОБ_СЕТКА_ЯЧЕЙКА_ИЗМЕНЕНИЕ,                &СобытиеСетки.Нов);
			добавьТипСоб( super.Тип.СОБ_СЕТКА_ВЫДЕЛИТЬ_ЯЧЕЙКУ,                &СобытиеСетки.Нов);
			добавьТипСоб( super.Тип.СОБ_СЕТКА_РЕДАКТОР_ПОКАЗАН,               &СобытиеСетки.Нов);
			добавьТипСоб( super.Тип.СОБ_СЕТКА_РЕДАКТОР_СКРЫТ,              &СобытиеСетки.Нов);
	}
    }

    //-----------------------------------------------------------------------------

		//! \cond EXTERN
	extern (C) {
        alias проц   function(РедакторЯчейкиСетки объ, ЦелУкз родитель, цел ид, ЦелУкз собОбр) Virtual_Create;
        alias проц   function(РедакторЯчейкиСетки объ, цел ряд, цел кол, ЦелУкз сетка) Virtual_BeginEdit;
        alias бул   function(РедакторЯчейкиСетки объ, цел ряд, цел кол, ЦелУкз сетка) Virtual_EndEdit;
        alias проц   function(РедакторЯчейкиСетки объ) Virtual_Reset;
        alias ЦелУкз function(РедакторЯчейкиСетки объ) Virtual_Clone;
        alias проц   function(РедакторЯчейкиСетки объ, Прямоугольник прям) Virtual_SetSize;
        alias проц   function(РедакторЯчейкиСетки объ, бул показ, ЦелУкз атр) Virtual_Show;
        alias проц   function(РедакторЯчейкиСетки объ, Прямоугольник прям, ЦелУкз атр) Virtual_PaintBackground;
        alias бул   function(РедакторЯчейкиСетки объ, ЦелУкз соб) Virtual_IsAcceptedKey;
        alias проц   function(РедакторЯчейкиСетки объ, ЦелУкз соб) Virtual_StartingKey;
        alias проц   function(РедакторЯчейкиСетки объ) Virtual_StartingClick;
        alias проц   function(РедакторЯчейкиСетки объ, ЦелУкз соб) Virtual_HandleReturn;
        alias проц   function(РедакторЯчейкиСетки объ) Virtual_Destroy;
        alias ткст function(РедакторЯчейкиСетки объ) Virtual_GetValue;
	}

        extern (C) ЦелУкз wxGridCellEditor_ctor();
	extern (C) проц wxGridCellEditor_dtor(ЦелУкз сам);
        extern (C) проц wxGridCellEditor_RegisterVirtual(ЦелУкз сам, РедакторЯчейкиСетки объ,
            Virtual_Create create,
            Virtual_BeginEdit beginEdit,
            Virtual_EndEdit endEdit,
            Virtual_Reset reset,
            Virtual_Clone clone,
            Virtual_SetSize setSize,
            Virtual_Show show,
            Virtual_PaintBackground paintBackground,
            Virtual_IsAcceptedKey isAcceptedKey,
            Virtual_StartingKey startingKey,
            Virtual_StartingClick startingClick,
            Virtual_HandleReturn handleReturn,
            Virtual_Destroy destroy,
            Virtual_GetValue getvalue);
        extern (C) бул   wxGridCellEditor_IsCreated(ЦелУкз сам);
        extern (C) проц   wxGridCellEditor_SetSize(ЦелУкз сам, inout Прямоугольник прям);
        extern (C) проц   wxGridCellEditor_Show(ЦелУкз сам, бул показ, ЦелУкз атр);
        extern (C) проц   wxGridCellEditor_PaintBackground(ЦелУкз сам, inout Прямоугольник прямЯч, ЦелУкз атр);
        extern (C) бул   wxGridCellEditor_IsAcceptedKey(ЦелУкз сам, ЦелУкз соб);
        extern (C) проц   wxGridCellEditor_StartingKey(ЦелУкз сам, ЦелУкз соб);
        extern (C) проц   wxGridCellEditor_StartingClick(ЦелУкз сам);
        extern (C) проц   wxGridCellEditor_HandleReturn(ЦелУкз сам, ЦелУкз соб);
        extern (C) проц   wxGridCellEditor_Destroy(ЦелУкз сам);
        extern (C) ЦелУкз wxGridCellEditor_GetValue(ЦелУкз сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    export abstract class РедакторЯчейкиСетки : ТрудягаЯчейкиСетки
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
        	this(wxGridCellEditor_ctor(), да);
            wxGridCellEditor_RegisterVirtual(вхобъ, this,
                    &staticDoCreate,
                    &staticDoBeginEdit,
                    &staticDoEndEdit,
                    &staticReset,
                    &staticDoClone,
                    &staticSetSize,
                    &staticDoShow,
                    &staticDoPaintBackground,
                    &staticDoIsAcceptedKey,
                    &staticDoStartingKey,
                    &staticStartingClick,
                    &staticDoHandleReturn,
                    &staticDestroy,
                    &staticGetValue);
        }

//	export static ВизОбъект Нов(ЦелУкз ptr) { return new РедакторЯчейкиСетки(ptr); }
	//---------------------------------------------------------------------

	override protected проц dtor() { wxGridCellEditor_dtor(вхобъ); }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
        //-----------------------------------------------------------------------------

        export бул создан() { return wxGridCellEditor_IsCreated(вхобъ); }

        //-----------------------------------------------------------------------------

        static export extern(C) проц staticDoCreate(РедакторЯчейкиСетки объ, ЦелУкз родитель, цел ид, ЦелУкз собОбр)
        {
            объ.создай(cast(Окно)ВизОбъект.найдиОбъект(родитель), ид, cast(ОбработчикСоб)найдиОбъект(собОбр, &ОбработчикСоб.Нов));
        }

        export abstract проц создай(Окно родитель, цел ид, ОбработчикСоб собОбр);

        //-----------------------------------------------------------------------------

        static export extern(C) проц staticSetSize(РедакторЯчейкиСетки объ, Прямоугольник прям)
        {
        	объ.устРазм(прям);
        }

        export  проц устРазм(Прямоугольник прям)
        {
            wxGridCellEditor_SetSize(вхобъ, прям);
        }

        //-----------------------------------------------------------------------------

        static export extern(C) проц staticDoShow(РедакторЯчейкиСетки объ, бул показ, ЦелУкз атр)
        {
            объ.показ(показ, cast(АтрибутЯчейкиСетки)найдиОбъект(атр, &АтрибутЯчейкиСетки.Нов));
        }

        export  проц показ(бул показ, АтрибутЯчейкиСетки атр)
        {
            wxGridCellEditor_Show(вхобъ, показ, ВизОбъект.безопУк(атр));
        }

        //-----------------------------------------------------------------------------

        static export extern(C) проц staticDoPaintBackground(РедакторЯчейкиСетки объ, Прямоугольник прямЯч, ЦелУкз атр)
        {
            объ.рисуйФон(прямЯч, cast(АтрибутЯчейкиСетки)найдиОбъект(атр, &АтрибутЯчейкиСетки.Нов));
        }

        export  проц рисуйФон(Прямоугольник прямЯч, АтрибутЯчейкиСетки атр)
        {
            wxGridCellEditor_PaintBackground(вхобъ, прямЯч, ВизОбъект.безопУк(атр));
        }

        //-----------------------------------------------------------------------------

        static export extern(C) проц staticDoBeginEdit(РедакторЯчейкиСетки объ, цел ряд, цел кол, ЦелУкз сетка)
        {
            объ.начниРед(ряд, кол, cast(Сетка)найдиОбъект(сетка, &Сетка.Нов));
        }

        export abstract проц начниРед(цел ряд, цел кол, Сетка сетка);

        static export extern(C) бул staticDoEndEdit(РедакторЯчейкиСетки объ, цел ряд, цел кол, ЦелУкз сетка)
        {
            return объ.завершиРед(ряд, кол, cast(Сетка)найдиОбъект(сетка, &Сетка.Нов));
        }

        export abstract бул завершиРед(цел ряд, цел кол, Сетка сетка);

        //-----------------------------------------------------------------------------

        static export extern(C) проц staticReset(РедакторЯчейкиСетки объ)
        {
            return объ.сбрось();
        }

        export abstract проц сбрось();

        //-----------------------------------------------------------------------------

        static export extern(C) бул staticDoIsAcceptedKey(РедакторЯчейкиСетки объ, ЦелУкз соб)
        {
            return объ.принятаКлавиша(cast(СобытиеКлавиатуры)ВизОбъект.найдиОбъект(соб, cast(ВизОбъект function(ЦелУкз))&СобытиеКлавиатуры.Нов));
        }

        export  бул принятаКлавиша(СобытиеКлавиатуры соб)
        {
            return wxGridCellEditor_IsAcceptedKey(вхобъ, ВизОбъект.безопУк(соб));
        }

        static export extern(C) проц staticDoStartingKey(РедакторЯчейкиСетки объ, ЦелУкз соб)
        {
            объ.началоКлавиши(cast(СобытиеКлавиатуры)ВизОбъект.найдиОбъект( соб, cast(ВизОбъект function(ЦелУкз))&СобытиеКлавиатуры.Нов));
        }

        export  проц началоКлавиши(СобытиеКлавиатуры соб)
        {
            wxGridCellEditor_StartingKey(вхобъ, ВизОбъект.безопУк(соб));
        }

	static export extern(C) проц staticStartingClick(РедакторЯчейкиСетки объ)
	{
	    объ.началоНажатия();
	}
        export  проц началоНажатия()
        {
            wxGridCellEditor_StartingClick(вхобъ);
        }

        //-----------------------------------------------------------------------------

        static export extern(C) проц staticDoHandleReturn(РедакторЯчейкиСетки объ, ЦелУкз соб)
        {
            объ.обработайВозврат(cast(СобытиеКлавиатуры)ВизОбъект.найдиОбъект(соб, cast(ВизОбъект function(ЦелУкз))&СобытиеКлавиатуры.Нов));
        }

        export  проц обработайВозврат(СобытиеКлавиатуры соб)
        {
            wxGridCellEditor_HandleReturn(вхобъ, ВизОбъект.безопУк(соб));
        }

        //-----------------------------------------------------------------------------

	static export extern(C) проц staticDestroy(РедакторЯчейкиСетки объ)
	{
		объ.разрушь();
	}

        export  проц разрушь()
        {
            wxGridCellEditor_Destroy(вхобъ);
        }

        //-----------------------------------------------------------------------------

        static export extern(C) ЦелУкз staticDoClone(РедакторЯчейкиСетки объ)
        {
            return ВизОбъект.безопУк(объ.клонируй());
        }

        export abstract РедакторЯчейкиСетки клонируй();

        //-----------------------------------------------------------------------------

        static export extern(C) ткст staticGetValue(РедакторЯчейкиСетки объ)
        {
            return объ.дайЗначение();
        }
        export abstract ткст дайЗначение();
//        {
//            return cast(ткст) new ВизТкст(wxGridCellEditor_GetValue(вхобъ), да);
//        }
    }

    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        extern (C) ЦелУкз wxGridCellTextEditor_ctor();
	extern (C) проц wxGridCellTextEditor_dtor(ЦелУкз сам);
        extern (C) проц wxGridCellTextEditor_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ЦелУкз собОбр);
        extern (C) проц wxGridCellTextEditor_SetSize(ЦелУкз сам, inout Прямоугольник прям);
        extern (C) проц wxGridCellTextEditor_PaintBackground(ЦелУкз сам, inout Прямоугольник прямЯч, ЦелУкз атр);
        extern (C) бул wxGridCellTextEditor_IsAcceptedKey(ЦелУкз сам, ЦелУкз соб);
        extern (C) проц wxGridCellTextEditor_BeginEdit(ЦелУкз сам, цел ряд, цел кол, ЦелУкз сетка);
        extern (C) бул wxGridCellTextEditor_EndEdit(ЦелУкз сам, цел ряд, цел кол, ЦелУкз сетка);
        extern (C) проц wxGridCellTextEditor_Reset(ЦелУкз сам);
        extern (C) проц wxGridCellTextEditor_StartingKey(ЦелУкз сам, ЦелУкз соб);
        extern (C) проц wxGridCellTextEditor_SetParameters(ЦелУкз сам, ткст параметр);
        extern (C) ЦелУкз wxGridCellTextEditor_Clone(ЦелУкз сам);
        extern (C) ЦелУкз wxGridCellTextEditor_GetValue(ЦелУкз сам);
		//! \endcond

    export class РедакторТекстаЯчейкиСетки : РедакторЯчейкиСетки
    {
        export this()
            { this(wxGridCellTextEditor_ctor(), да); }

        export this(ЦелУкз вхобъ)
	{
		super(вхобъ);
	}

	private this(ЦелУкз вхобъ, бул памСобств)
	{
		super(вхобъ);
		this.памСобств = памСобств;
	}

	//---------------------------------------------------------------------

	override protected проц dtor() { wxGridCellTextEditor_dtor(вхобъ); }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
        export override проц создай(Окно родитель, цел ид, ОбработчикСоб собОбр)
        {
            wxGridCellTextEditor_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, ВизОбъект.безопУк(собОбр));
        }

        export override проц устРазм(Прямоугольник прям)
        {
            wxGridCellTextEditor_SetSize(вхобъ, прям);
        }

        export override проц рисуйФон(Прямоугольник прямЯч, АтрибутЯчейкиСетки атр)
        {
            wxGridCellTextEditor_PaintBackground(вхобъ, прямЯч, ВизОбъект.безопУк(атр));
        }

        export override бул принятаКлавиша(СобытиеКлавиатуры соб)
        {
            return wxGridCellTextEditor_IsAcceptedKey(вхобъ, ВизОбъект.безопУк(соб));
        }

        export override проц начниРед(цел ряд, цел кол, Сетка сетка)
        {
            wxGridCellTextEditor_BeginEdit(вхобъ, ряд, кол, ВизОбъект.безопУк(сетка));
        }

        export override бул завершиРед(цел ряд, цел кол, Сетка сетка)
        {
            return wxGridCellTextEditor_EndEdit(вхобъ, ряд, кол, ВизОбъект.безопУк(сетка));
        }

        export override проц сбрось()
        {
            wxGridCellTextEditor_Reset(вхобъ);
        }

        export override проц началоКлавиши(СобытиеКлавиатуры соб)
        {
            wxGridCellTextEditor_StartingKey(вхобъ, ВизОбъект.безопУк(соб));
        }

        export override проц устПараметры(ткст параметр)
        {
            wxGridCellTextEditor_SetParameters(вхобъ, параметр);
        }

        export override РедакторЯчейкиСетки клонируй()
        {
//            return cast(РедакторЯчейкиСетки)найдиОбъект(wxGridCellTextEditor_Clone(вхобъ), &РедакторЯчейкиСетки.Нов);
              return new РедакторТекстаЯчейкиСетки(wxGridCellTextEditor_Clone(вхобъ));
        }
        export override ткст дайЗначение()
        {
            return cast(ткст) new ВизТкст(wxGridCellTextEditor_GetValue(вхобъ), да);
        }
    }

    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        extern (C) ЦелУкз wxGridCellNumberEditor_ctor(цел мин, цел макс);
	extern (C) проц wxGridCellNumberEditor_dtor(ЦелУкз сам);
	extern (C) проц wxGridCellNumberEditor_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
        extern (C) проц wxGridCellNumberEditor_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ЦелУкз собОбр);
        extern (C) бул wxGridCellNumberEditor_IsAcceptedKey(ЦелУкз сам, ЦелУкз соб);
        extern (C) проц wxGridCellNumberEditor_BeginEdit(ЦелУкз сам, цел ряд, цел кол, ЦелУкз сетка);
        extern (C) бул wxGridCellNumberEditor_EndEdit(ЦелУкз сам, цел ряд, цел кол, ЦелУкз сетка);
        extern (C) проц wxGridCellNumberEditor_Reset(ЦелУкз сам);
        extern (C) проц wxGridCellNumberEditor_StartingKey(ЦелУкз сам, ЦелУкз соб);
        extern (C) проц wxGridCellNumberEditor_SetParameters(ЦелУкз сам, ткст параметр);
        extern (C) ЦелУкз wxGridCellNumberEditor_Clone(ЦелУкз сам);
        extern (C) ЦелУкз wxGridCellNumberEditor_GetValue(ЦелУкз сам);
		//! \endcond

    export class РедакторЧиселЯчейкиСетки : РедакторТекстаЯчейкиСетки
    {
        export this()
            { this(-1, -1); }

        export this(цел мин)
            { this(мин, -1); }

        export this(цел мин, цел макс)
	{
		this(wxGridCellNumberEditor_ctor(мин, макс), да);
		wxGridCellNumberEditor_RegisterDisposable(вхобъ, &VirtualDispose);
	}

        export this(ЦелУкз вхобъ)
	{
		super(вхобъ);
	}

	private this(ЦелУкз вхобъ, бул памСобств)
	{
		super(вхобъ);
		this.памСобств = памСобств;
	}

	//---------------------------------------------------------------------

	override protected проц dtor() { wxGridCellNumberEditor_dtor(вхобъ); }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
        export override проц создай(Окно родитель, цел ид, ОбработчикСоб собОбр)
        {
            wxGridCellNumberEditor_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, ВизОбъект.безопУк(собОбр));
        }

        export override бул принятаКлавиша(СобытиеКлавиатуры соб)
        {
            return wxGridCellNumberEditor_IsAcceptedKey(вхобъ, ВизОбъект.безопУк(соб));
        }

        export override проц начниРед(цел ряд, цел кол, Сетка сетка)
        {
            wxGridCellNumberEditor_BeginEdit(вхобъ, ряд, кол, ВизОбъект.безопУк(сетка));
        }

        export override бул завершиРед(цел ряд, цел кол, Сетка сетка)
        {
            return wxGridCellNumberEditor_EndEdit(вхобъ, ряд, кол, ВизОбъект.безопУк(сетка));
        }

        export override проц сбрось()
        {
            wxGridCellNumberEditor_Reset(вхобъ);
        }

        export override проц началоКлавиши(СобытиеКлавиатуры соб)
        {
            wxGridCellNumberEditor_StartingKey(вхобъ, ВизОбъект.безопУк(соб));
        }

        export override проц устПараметры(ткст параметр)
        {
            wxGridCellNumberEditor_SetParameters(вхобъ, параметр);
        }

        export override РедакторЯчейкиСетки клонируй()
        {
//            return cast(РедакторЯчейкиСетки)найдиОбъект(wxGridCellNumberEditor_Clone(вхобъ), &РедакторЯчейкиСетки.Нов);
              return new РедакторЧиселЯчейкиСетки(wxGridCellNumberEditor_Clone(вхобъ));
        }

        export override ткст дайЗначение()
        {
            return cast(ткст) new ВизТкст(wxGridCellNumberEditor_GetValue(вхобъ), да);
        }
    }

    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        extern (C) ЦелУкз wxGridCellFloatEditor_ctor(цел ширь, цел точность);
	extern (C) проц wxGridCellFloatEditor_dtor(ЦелУкз сам);
        extern (C) проц wxGridCellFloatEditor_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ЦелУкз собОбр);
        extern (C) бул wxGridCellFloatEditor_IsAcceptedKey(ЦелУкз сам, ЦелУкз соб);
        extern (C) проц wxGridCellFloatEditor_BeginEdit(ЦелУкз сам, цел ряд, цел кол, ЦелУкз сетка);
        extern (C) бул wxGridCellFloatEditor_EndEdit(ЦелУкз сам, цел ряд, цел кол, ЦелУкз сетка);
        extern (C) проц wxGridCellFloatEditor_Reset(ЦелУкз сам);
        extern (C) проц wxGridCellFloatEditor_StartingKey(ЦелУкз сам, ЦелУкз соб);
        extern (C) проц wxGridCellFloatEditor_SetParameters(ЦелУкз сам, ткст параметр);
        extern (C) ЦелУкз wxGridCellFloatEditor_Clone(ЦелУкз сам);
        extern (C) ЦелУкз wxGridCellFloatEditor_GetValue(ЦелУкз сам);
		//! \endcond

    export class РедакторПлавЧиселЯчейкиСетки : РедакторТекстаЯчейкиСетки
    {
        export this()
            { this(-1, -1); }

        export this(цел ширь)
            { this(ширь, -1); }

        export this(цел ширь, цел точность)
            { this(wxGridCellFloatEditor_ctor(ширь, точность), да); }

        export this(ЦелУкз вхобъ)
	{
		super(вхобъ);
	}

	private this(ЦелУкз вхобъ, бул памСобств)
	{
		super(вхобъ);
		this.памСобств = памСобств;
	}

	//---------------------------------------------------------------------

	override protected проц dtor() { wxGridCellFloatEditor_dtor(вхобъ); }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
        export override проц создай(Окно родитель, цел ид, ОбработчикСоб собОбр)
        {
            wxGridCellFloatEditor_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, ВизОбъект.безопУк(собОбр));
        }

        export override бул принятаКлавиша(СобытиеКлавиатуры соб)
        {
            return wxGridCellFloatEditor_IsAcceptedKey(вхобъ, ВизОбъект.безопУк(соб));
        }

        export override проц начниРед(цел ряд, цел кол, Сетка сетка)
        {
            wxGridCellFloatEditor_BeginEdit(вхобъ, ряд, кол, ВизОбъект.безопУк(сетка));
        }

        export override бул завершиРед(цел ряд, цел кол, Сетка сетка)
        {
            return wxGridCellFloatEditor_EndEdit(вхобъ, ряд, кол, ВизОбъект.безопУк(сетка));
        }

        export override проц сбрось()
        {
            wxGridCellFloatEditor_Reset(вхобъ);
        }

        export override проц началоКлавиши(СобытиеКлавиатуры соб)
        {
            wxGridCellFloatEditor_StartingKey(вхобъ, ВизОбъект.безопУк(соб));
        }

        export override проц устПараметры(ткст параметр)
        {
            wxGridCellFloatEditor_SetParameters(вхобъ, параметр);
        }

        export override РедакторЯчейкиСетки клонируй()
        {
//            return cast(РедакторЯчейкиСетки)найдиОбъект(wxGridCellFloatEditor_Clone(вхобъ), &РедакторЯчейкиСетки.Нов);
              return new РедакторПлавЧиселЯчейкиСетки(wxGridCellFloatEditor_Clone(вхобъ));
        }

        export override ткст дайЗначение()
        {
            return cast(ткст) new ВизТкст(wxGridCellFloatEditor_GetValue(вхобъ), да);
        }
    }

    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        extern (C) ЦелУкз wxGridCellBoolEditor_ctor();
	extern (C) проц wxGridCellBoolEditor_dtor(ЦелУкз сам);
	extern (C) проц wxGridCellBoolEditor_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
        extern (C) проц wxGridCellBoolEditor_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ЦелУкз собОбр);
        extern (C) проц wxGridCellBoolEditor_SetSize(ЦелУкз сам, inout Прямоугольник прям);
        extern (C) бул wxGridCellBoolEditor_IsAcceptedKey(ЦелУкз сам, ЦелУкз соб);
        extern (C) проц wxGridCellBoolEditor_BeginEdit(ЦелУкз сам, цел ряд, цел кол, ЦелУкз сетка);
        extern (C) бул wxGridCellBoolEditor_EndEdit(ЦелУкз сам, цел ряд, цел кол, ЦелУкз сетка);
        extern (C) проц wxGridCellBoolEditor_Reset(ЦелУкз сам);
        extern (C) проц wxGridCellBoolEditor_StartingClick(ЦелУкз сам);
        extern (C) ЦелУкз wxGridCellBoolEditor_Clone(ЦелУкз сам);
        extern (C) ЦелУкз wxGridCellBoolEditor_GetValue(ЦелУкз сам);
		//! \endcond

    export class РедакторБулЯчейкиСетки : РедакторЯчейкиСетки
    {
        export this()
	{
		this(wxGridCellBoolEditor_ctor(), да);
		wxGridCellBoolEditor_RegisterDisposable(вхобъ, &VirtualDispose);
	}

        export this(ЦелУкз вхобъ)
	{
		super(вхобъ);
	}

	private this(ЦелУкз вхобъ, бул памСобств)
	{
		super(вхобъ);
		this.памСобств = памСобств;
	}

	//---------------------------------------------------------------------

	override protected проц dtor() { wxGridCellBoolEditor_dtor(вхобъ); }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
        export override проц создай(Окно родитель, цел ид, ОбработчикСоб собОбр)
        {
            wxGridCellBoolEditor_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, ВизОбъект.безопУк(собОбр));
        }

        export override проц устРазм(Прямоугольник прям)
        {
            wxGridCellBoolEditor_SetSize(вхобъ, прям);
        }

        export override бул принятаКлавиша(СобытиеКлавиатуры соб)
        {
            return wxGridCellBoolEditor_IsAcceptedKey(вхобъ, ВизОбъект.безопУк(соб));
        }

        export override проц начниРед(цел ряд, цел кол, Сетка сетка)
        {
            wxGridCellBoolEditor_BeginEdit(вхобъ, ряд, кол, ВизОбъект.безопУк(сетка));
        }

        export override бул завершиРед(цел ряд, цел кол, Сетка сетка)
        {
            return wxGridCellBoolEditor_EndEdit(вхобъ, ряд, кол, ВизОбъект.безопУк(сетка));
        }

        export override проц сбрось()
        {
            wxGridCellBoolEditor_Reset(вхобъ);
        }

        export override проц началоНажатия()
        {
            wxGridCellBoolEditor_StartingClick(вхобъ);
        }

        export override РедакторЯчейкиСетки клонируй()
        {
//            return cast(РедакторЯчейкиСетки)найдиОбъект(wxGridCellBoolEditor_Clone(вхобъ), &РедакторЯчейкиСетки.Нов);
              return new РедакторБулЯчейкиСетки(wxGridCellBoolEditor_Clone(вхобъ));
        }

        export override ткст дайЗначение()
        {
            return cast(ткст) new ВизТкст(wxGridCellBoolEditor_GetValue(вхобъ), да);
        }
    }

    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        extern (C) ЦелУкз wxGridCellChoiceEditor_ctor(цел ч, ткст0 выборы, бул позвольДругие);
	extern (C) проц wxGridCellChoiceEditor_dtor(ЦелУкз сам);
	extern (C) проц wxGridCellChoiceEditor_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
        extern (C) проц wxGridCellChoiceEditor_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ЦелУкз собОбр);
        extern (C) проц wxGridCellChoiceEditor_PaintBackground(ЦелУкз сам, inout Прямоугольник прямЯч, ЦелУкз атр);
        extern (C) проц wxGridCellChoiceEditor_BeginEdit(ЦелУкз сам, цел ряд, цел кол, ЦелУкз сетка);
        extern (C) бул wxGridCellChoiceEditor_EndEdit(ЦелУкз сам, цел ряд, цел кол, ЦелУкз сетка);
        extern (C) проц wxGridCellChoiceEditor_Reset(ЦелУкз сам);
        extern (C) проц wxGridCellChoiceEditor_SetParameters(ЦелУкз сам, ткст параметр);
        extern (C) ЦелУкз wxGridCellChoiceEditor_Clone(ЦелУкз сам);
        extern (C) ЦелУкз wxGridCellChoiceEditor_GetValue(ЦелУкз сам);
		//! \endcond

    export class РедакторВыбораЯчейкиСетки : РедакторЯчейкиСетки
    {
        export this()
            { this(cast(ткст[])пусто, нет); }

        export this(ткст[] выборы)
            { this(выборы, нет); }

        export this(ткст[] выборы, бул позвольДругие)
	{
		this(wxGridCellChoiceEditor_ctor(выборы.length, cast(ткст0) выборы.ptr, позвольДругие), да);
		wxGridCellChoiceEditor_RegisterDisposable(вхобъ, &VirtualDispose);
	}

        export this(ЦелУкз вхобъ)
	{
		super(вхобъ);
	}

	private this(ЦелУкз вхобъ, бул памСобств)
	{
		super(вхобъ);
		this.памСобств = памСобств;
	}

	//---------------------------------------------------------------------

	override protected проц dtor() { wxGridCellChoiceEditor_dtor(вхобъ); }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
        export override проц создай(Окно родитель, цел ид, ОбработчикСоб собОбр)
        {
            wxGridCellChoiceEditor_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, ВизОбъект.безопУк(собОбр));
        }

        export override проц рисуйФон(Прямоугольник прямЯч, АтрибутЯчейкиСетки атр)
        {
            wxGridCellChoiceEditor_PaintBackground(вхобъ, прямЯч, ВизОбъект.безопУк(атр));
        }

        export override проц начниРед(цел ряд, цел кол, Сетка сетка)
        {
            wxGridCellChoiceEditor_BeginEdit(вхобъ, ряд, кол, ВизОбъект.безопУк(сетка));
        }

        export override бул завершиРед(цел ряд, цел кол, Сетка сетка)
        {
            return wxGridCellChoiceEditor_EndEdit(вхобъ, ряд, кол, ВизОбъект.безопУк(сетка));
        }

        export override проц сбрось()
        {
            wxGridCellChoiceEditor_Reset(вхобъ);
        }

        export override проц устПараметры(ткст параметр)
        {
            wxGridCellChoiceEditor_SetParameters(вхобъ, параметр);
        }

        export override РедакторЯчейкиСетки клонируй()
        {
//            return cast(РедакторЯчейкиСетки)найдиОбъект(wxGridCellChoiceEditor_Clone(вхобъ), &РедакторЯчейкиСетки.Нов);
              return new РедакторВыбораЯчейкиСетки(wxGridCellChoiceEditor_Clone(вхобъ));
        }

        export override ткст дайЗначение()
        {
            return cast(ткст) new ВизТкст(wxGridCellChoiceEditor_GetValue(вхобъ), да);
        }
    }

    //-----------------------------------------------------------------------------

		//! \cond EXTERN
        extern (C) ЦелУкз wxGridRangeSelectEvent_ctor(цел ид, цел тип, ЦелУкз объ, ЦелУкз верхнЛев, ЦелУкз нижнПрав, бул выдл, бул контрол, бул шифт, бул альт, бул мета);
        extern (C) ЦелУкз wxGridRangeSelectEvent_GetTopLeftCoords(ЦелУкз сам);
        extern (C) ЦелУкз wxGridRangeSelectEvent_GetBottomRightCoords(ЦелУкз сам);
        extern (C) цел wxGridRangeSelectEvent_GetTopRow(ЦелУкз сам);
        extern (C) цел wxGridRangeSelectEvent_GetBottomRow(ЦелУкз сам);
        extern (C) цел wxGridRangeSelectEvent_GetLeftCol(ЦелУкз сам);
        extern (C) цел wxGridRangeSelectEvent_GetRightCol(ЦелУкз сам);
        extern (C) бул wxGridRangeSelectEvent_Selecting(ЦелУкз сам);
        extern (C) бул wxGridRangeSelectEvent_ControlDown(ЦелУкз сам);
        extern (C) бул wxGridRangeSelectEvent_MetaDown(ЦелУкз сам);
        extern (C) бул wxGridRangeSelectEvent_ShiftDown(ЦелУкз сам);
        extern (C) бул wxGridRangeSelectEvent_AltDown(ЦелУкз сам);
        extern (C) проц wxGridRangeSelectEvent_Veto(ЦелУкз сам);
        extern (C) проц wxGridRangeSelectEvent_Allow(ЦелУкз сам);
        extern (C) бул wxGridRangeSelectEvent_IsAllowed(ЦелУкз сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    export class СобытиеВыбораДиапазонаСетки : Событие
    {
        export this(ЦелУкз вхобъ)
            { super(вхобъ); }

        export this(цел ид, цел тип, ВизОбъект объ, КоординатыЯчейкиСетки верхнЛев, КоординатыЯчейкиСетки нижнПрав, бул выдл, бул контрол, бул шифт, бул альт, бул мета)
            { super(wxGridRangeSelectEvent_ctor(ид, тип, ВизОбъект.безопУк(объ), ВизОбъект.безопУк(верхнЛев), ВизОбъект.безопУк(нижнПрав), выдл, контрол, шифт, альт, мета)); }

            //-----------------------------------------------------------------------------

        export КоординатыЯчейкиСетки верхнЛевКоординаты() { return new КоординатыЯчейкиСетки(wxGridRangeSelectEvent_GetTopLeftCoords(вхобъ)); }

        export КоординатыЯчейкиСетки нижнПравКоординаты() { return new КоординатыЯчейкиСетки(wxGridRangeSelectEvent_GetBottomRightCoords(вхобъ)); }

        //-----------------------------------------------------------------------------

        export цел верхнийРяд() { return wxGridRangeSelectEvent_GetTopRow(вхобъ); }

        export цел нижнийРяд() { return wxGridRangeSelectEvent_GetBottomRow(вхобъ); }

        //-----------------------------------------------------------------------------

        export цел леваяКолонка() { return wxGridRangeSelectEvent_GetLeftCol(вхобъ); }

        export цел праваяКолонка() { return wxGridRangeSelectEvent_GetRightCol(вхобъ); }

        //-----------------------------------------------------------------------------

        export бул выделяется() { return wxGridRangeSelectEvent_Selecting(вхобъ); }

        //-----------------------------------------------------------------------------

        export бул контролВнизу() { return wxGridRangeSelectEvent_ControlDown(вхобъ); }

        export бул метаВнизу() { return wxGridRangeSelectEvent_MetaDown(вхобъ); }

        export бул шифтВнизу() { return wxGridRangeSelectEvent_ShiftDown(вхобъ); }

        export бул альтВнизу() { return wxGridRangeSelectEvent_AltDown(вхобъ); }

        //-----------------------------------------------------------------------------

        export проц запрет()
        {
            wxGridRangeSelectEvent_Veto(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц позволить()
        {
            wxGridRangeSelectEvent_Allow(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export бул позволено() { return wxGridRangeSelectEvent_IsAllowed(вхобъ); }

	private static Событие Нов(ЦелУкз объ) { return new СобытиеВыбораДиапазонаСетки(объ); }

	static this()
	{
			 super.Тип.СОБ_СЕТКА_ДИАПАЗОН_ВЫДЕЛЕНИЕ = wxEvent_EVT_GRID_RANGE_SELECT();

			добавьТипСоб( super.Тип.СОБ_СЕТКА_ДИАПАЗОН_ВЫДЕЛЕНИЕ,               &СобытиеВыбораДиапазонаСетки.Нов);
	}
    }

		//! \cond EXTERN
	extern (C) {
        alias проц function(ТрудягаЯчейкиСетки объ, ткст парам) Virtual_SetParameters;
	}

        extern (C) ЦелУкз wxGridCellWorker_ctor();
        extern (C) проц wxGridCellWorker_RegisterVirtual(ЦелУкз сам, ТрудягаЯчейкиСетки объ, Virtual_SetParameters устПарамы);
        extern (C) проц wxGridCellWorker_IncRef(ЦелУкз сам);
        extern (C) проц wxGridCellWorker_DecRef(ЦелУкз сам);
        extern (C) проц wxGridCellWorker_SetParameters(ЦелУкз сам, ткст парамы);
		//! \endcond

        //-----------------------------------------------------------------------------

    export class ТрудягаЯчейкиСетки : ВизОбъект //ДанныеКлиента
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
        	this(wxGridCellWorker_ctor(), да);
            wxGridCellWorker_RegisterVirtual(вхобъ, this, &staticDoSetParameters);
        }

	//---------------------------------------------------------------------

	override protected проц dtor() {}
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
        //-----------------------------------------------------------------------------

        export проц инкрементируйСсыл()
        {
            wxGridCellWorker_IncRef(вхобъ);
        }

        export проц декрементируйСсыл()
        {
            wxGridCellWorker_DecRef(вхобъ);
        }

        //-----------------------------------------------------------------------------

        static export extern (C) проц staticDoSetParameters(ТрудягаЯчейкиСетки объ, ткст парам)
        {
            объ.устПараметры(парам);
        }

        export  проц устПараметры(ткст парам)
        {
            wxGridCellWorker_SetParameters(вхобъ, парам);
        }
    }

    //-----------------------------------------------------------------------------

            //! \cond EXTERN
            extern (C) ЦелУкз wxGridEditorCreatedEvent_ctor(цел ид, цел тип, ЦелУкз объ, цел ряд, цел кол, ЦелУкз ктрл);
            extern (C) цел    wxGridEditorCreatedEvent_GetRow(ЦелУкз сам);
            extern (C) цел    wxGridEditorCreatedEvent_GetCol(ЦелУкз сам);
            extern (C) ЦелУкз wxGridEditorCreatedEvent_GetControl(ЦелУкз сам);
            extern (C) проц   wxGridEditorCreatedEvent_SetRow(ЦелУкз сам, цел ряд);
            extern (C) проц   wxGridEditorCreatedEvent_SetCol(ЦелУкз сам, цел кол);
            extern (C) проц   wxGridEditorCreatedEvent_SetControl(ЦелУкз сам, ЦелУкз ктрл);
            //! \endcond

            //-----------------------------------------------------------------------------

    export class СобытиеСозданРедакторСетки : СобытиеКоманды
    {
            export this(ЦелУкз вхобъ)
            { super(вхобъ); }

            export this(цел ид, цел тип, ВизОбъект объ, цел ряд, цел кол, Контрол ктрл)
            { this(wxGridEditorCreatedEvent_ctor(ид, тип, ВизОбъект.безопУк(объ), ряд, кол, ВизОбъект.безопУк(ктрл))); }

            //-----------------------------------------------------------------------------

            export цел ряд() { return wxGridEditorCreatedEvent_GetRow(вхобъ); }
            export проц ряд(цел значение) { wxGridEditorCreatedEvent_SetRow(вхобъ, значение); }

            //-----------------------------------------------------------------------------

            export цел кол() { return wxGridEditorCreatedEvent_GetCol(вхобъ); }
            export проц кол(цел значение) { wxGridEditorCreatedEvent_SetCol(вхобъ, значение); }

            //-----------------------------------------------------------------------------

            export Контрол контрол() { return cast(Контрол)найдиОбъект(wxGridEditorCreatedEvent_GetControl(вхобъ), &Контрол.Нов); }
            export проц контрол(Контрол значение) { wxGridEditorCreatedEvent_SetControl(вхобъ, ВизОбъект.безопУк(значение)); }

		private static Событие Нов(ЦелУкз объ) { return new СобытиеСозданРедакторСетки(объ); }

		static this()
		{
			добавьТипСоб( super.Тип.СОБ_СЕТКА_РЕДАКТОР_СОЗДАН,             &СобытиеСозданРедакторСетки.Нов);
		}
    }

    //-----------------------------------------------------------------------------

            //! \cond EXTERN
            extern (C) ЦелУкз wxGrid_ctor();
            extern (C) ЦелУкз wxGrid_ctorFull(ЦелУкз родитель, цел ид, inout Точка поз, inout Размер размер, бцел стиль, ткст имя);
            extern (C) бул   wxGrid_CreateGrid(ЦелУкз сам, цел члоРядов, цел члоКол,  цел режвыд);
            extern (C) проц   wxGrid_SetSelectionMode(ЦелУкз сам, цел режвыд);
            extern (C) цел    wxGrid_GetNumberRows(ЦелУкз сам);
            extern (C) цел    wxGrid_GetNumberCols(ЦелУкз сам);
            extern (C) ЦелУкз wxGrid_GetTable(ЦелУкз сам);
            extern (C) бул   wxGrid_SetTable(ЦелУкз сам, ЦелУкз таблица, бул взятьВоВладен, цел селект);
            extern (C) проц   wxGrid_ClearGrid(ЦелУкз сам);
            extern (C) бул   wxGrid_InsertRows(ЦелУкз сам, цел поз, цел члоРядов, бул обновитьЯрлыки);
            extern (C) бул   wxGrid_AppendRows(ЦелУкз сам, цел члоРядов, бул обновитьЯрлыки);
            extern (C) бул   wxGrid_DeleteRows(ЦелУкз сам, цел поз, цел члоРядов, бул обновитьЯрлыки);
            extern (C) бул   wxGrid_InsertCols(ЦелУкз сам, цел поз, цел члоКол, бул обновитьЯрлыки);
            extern (C) бул   wxGrid_AppendCols(ЦелУкз сам, цел члоКол, бул обновитьЯрлыки);
            extern (C) бул   wxGrid_DeleteCols(ЦелУкз сам, цел поз, цел члоКол, бул обновитьЯрлыки);
            extern (C) проц   wxGrid_BeginBatch(ЦелУкз сам);
            extern (C) проц   wxGrid_EndBatch(ЦелУкз сам);
            extern (C) цел    wxGrid_GetBatchCount(ЦелУкз сам);
            extern (C) проц   wxGrid_ForceRefresh(ЦелУкз сам);
            extern (C) бул   wxGrid_IsEditable(ЦелУкз сам);
            extern (C) проц   wxGrid_EnableEditing(ЦелУкз сам, бул edit);
            extern (C) проц   wxGrid_EnableCellEditControl(ЦелУкз сам, бул вкл);
            extern (C) проц   wxGrid_DisableCellEditControl(ЦелУкз сам);
            extern (C) бул   wxGrid_CanEnableCellControl(ЦелУкз сам);
            extern (C) бул   wxGrid_IsCellEditControlEnabled(ЦелУкз сам);
            extern (C) бул   wxGrid_IsCellEditControlShown(ЦелУкз сам);
            extern (C) бул   wxGrid_IsCurrentCellReadOnly(ЦелУкз сам);
            extern (C) проц   wxGrid_ShowCellEditControl(ЦелУкз сам);
            extern (C) проц   wxGrid_HideCellEditControl(ЦелУкз сам);
            extern (C) проц   wxGrid_SaveEditControlValue(ЦелУкз сам);
            extern (C) цел    wxGrid_YToRow(ЦелУкз сам, цел y);
            extern (C) цел    wxGrid_XToCol(ЦелУкз сам, цел x);
            extern (C) цел    wxGrid_YToEdgeOfRow(ЦелУкз сам, цел y);
            extern (C) цел    wxGrid_XToEdgeOfCol(ЦелУкз сам, цел x);
            extern (C) проц   wxGrid_CellToRect(ЦелУкз сам, цел ряд, цел кол, inout Прямоугольник прям);
            extern (C) цел    wxGrid_GetGridCursorRow(ЦелУкз сам);
            extern (C) цел    wxGrid_GetGridCursorCol(ЦелУкз сам);
            extern (C) бул   wxGrid_IsVisible(ЦелУкз сам, цел ряд, цел кол, бул всяЯчВидна);
            extern (C) проц   wxGrid_MakeCellVisible(ЦелУкз сам, цел ряд, цел кол);
            extern (C) проц   wxGrid_SetGridCursor(ЦелУкз сам, цел ряд, цел кол);
            extern (C) бул   wxGrid_MoveCursorUp(ЦелУкз сам, бул развернутьВыд);
            extern (C) бул   wxGrid_MoveCursorDown(ЦелУкз сам, бул развернутьВыд);
            extern (C) бул   wxGrid_MoveCursorLeft(ЦелУкз сам, бул развернутьВыд);
            extern (C) бул   wxGrid_MoveCursorRight(ЦелУкз сам, бул развернутьВыд);
            extern (C) бул   wxGrid_MovePageDown(ЦелУкз сам);
            extern (C) бул   wxGrid_MovePageUp(ЦелУкз сам);
            extern (C) бул   wxGrid_MoveCursorUpBlock(ЦелУкз сам, бул развернутьВыд);
            extern (C) бул   wxGrid_MoveCursorDownBlock(ЦелУкз сам, бул развернутьВыд);
            extern (C) бул   wxGrid_MoveCursorLeftBlock(ЦелУкз сам, бул развернутьВыд);
            extern (C) бул   wxGrid_MoveCursorRightBlock(ЦелУкз сам, бул развернутьВыд);
            extern (C) цел    wxGrid_GetDefaultRowLabelSize(ЦелУкз сам);
            extern (C) цел    wxGrid_GetRowLabelSize(ЦелУкз сам);
            extern (C) цел    wxGrid_GetDefaultColLabelSize(ЦелУкз сам);
            extern (C) цел    wxGrid_GetColLabelSize(ЦелУкз сам);
            extern (C) ЦелУкз wxGrid_GetLabelBackgroundColour(ЦелУкз сам);
            extern (C) ЦелУкз wxGrid_GetLabelTextColour(ЦелУкз сам);
            extern (C) ЦелУкз wxGrid_GetLabelFont(ЦелУкз сам);
            extern (C) проц   wxGrid_GetRowLabelAlignment(ЦелУкз сам, out цел гориз, out цел верт);
            extern (C) проц   wxGrid_GetColLabelAlignment(ЦелУкз сам, out цел гориз, out цел верт);
            extern (C) ЦелУкз wxGrid_GetRowLabelValue(ЦелУкз сам, цел ряд);
            extern (C) ЦелУкз wxGrid_GetColLabelValue(ЦелУкз сам, цел кол);
            extern (C) ЦелУкз wxGrid_GetGridLineColour(ЦелУкз сам);
            extern (C) ЦелУкз wxGrid_GetCellHighlightColour(ЦелУкз сам);
            extern (C) цел    wxGrid_GetCellHighlightPenWidth(ЦелУкз сам);
            extern (C) цел    wxGrid_GetCellHighlightROPenWidth(ЦелУкз сам);
            extern (C) проц   wxGrid_SetRowLabelSize(ЦелУкз сам, цел ширь);
            extern (C) проц   wxGrid_SetColLabelSize(ЦелУкз сам, цел высь);
            extern (C) проц   wxGrid_SetLabelBackgroundColour(ЦелУкз сам, ЦелУкз кол);
            extern (C) проц   wxGrid_SetLabelTextColour(ЦелУкз сам, ЦелУкз кол);
            extern (C) проц   wxGrid_SetLabelFont(ЦелУкз сам, ЦелУкз шрфт);
            extern (C) проц   wxGrid_SetRowLabelAlignment(ЦелУкз сам, цел гориз, цел верт);
            extern (C) проц   wxGrid_SetColLabelAlignment(ЦелУкз сам, цел гориз, цел верт);
            extern (C) проц   wxGrid_SetRowLabelValue(ЦелУкз сам, цел ряд, ткст знач);
            extern (C) проц   wxGrid_SetColLabelValue(ЦелУкз сам, цел кол, ткст знач);
            extern (C) проц   wxGrid_SetGridLineColour(ЦелУкз сам, ЦелУкз кол);
            extern (C) проц   wxGrid_SetCellHighlightColour(ЦелУкз сам, ЦелУкз кол);
            extern (C) проц   wxGrid_SetCellHighlightPenWidth(ЦелУкз сам, цел ширь);
            extern (C) проц   wxGrid_SetCellHighlightROPenWidth(ЦелУкз сам, цел ширь);
            extern (C) проц   wxGrid_EnableDragRowSize(ЦелУкз сам, бул вкл);
            extern (C) проц   wxGrid_DisableDragRowSize(ЦелУкз сам);
            extern (C) бул   wxGrid_CanDragRowSize(ЦелУкз сам);
            extern (C) проц   wxGrid_EnableDragColSize(ЦелУкз сам, бул вкл);
            extern (C) проц   wxGrid_DisableDragColSize(ЦелУкз сам);
            extern (C) бул   wxGrid_CanDragColSize(ЦелУкз сам);
            extern (C) проц   wxGrid_EnableDragGridSize(ЦелУкз сам, бул вкл);
            extern (C) проц   wxGrid_DisableDragGridSize(ЦелУкз сам);
            extern (C) бул   wxGrid_CanDragGridSize(ЦелУкз сам);
            extern (C) проц   wxGrid_SetAttr(ЦелУкз сам, цел ряд, цел кол, ЦелУкз атр);
            extern (C) проц   wxGrid_SetRowAttr(ЦелУкз сам, цел ряд, ЦелУкз атр);
            extern (C) проц   wxGrid_SetColAttr(ЦелУкз сам, цел кол, ЦелУкз атр);
            extern (C) проц   wxGrid_SetColFormatBool(ЦелУкз сам, цел кол);
            extern (C) проц   wxGrid_SetColFormatNumber(ЦелУкз сам, цел кол);
            extern (C) проц   wxGrid_SetColFormatFloat(ЦелУкз сам, цел кол, цел ширь, цел точность);
            extern (C) проц   wxGrid_SetColFormatCustom(ЦелУкз сам, цел кол, ткст имятипа);
            extern (C) проц   wxGrid_EnableGridLines(ЦелУкз сам, бул вкл);
            extern (C) бул   wxGrid_GridLinesEnabled(ЦелУкз сам);
            extern (C) цел    wxGrid_GetDefaultRowSize(ЦелУкз сам);
            extern (C) цел    wxGrid_GetRowSize(ЦелУкз сам, цел ряд);
            extern (C) цел    wxGrid_GetDefaultColSize(ЦелУкз сам);
            extern (C) цел    wxGrid_GetColSize(ЦелУкз сам, цел кол);
            extern (C) ЦелУкз wxGrid_GetDefaultCellBackgroundColour(ЦелУкз сам);
            extern (C) ЦелУкз wxGrid_GetCellBackgroundColour(ЦелУкз сам, цел ряд, цел кол);
            extern (C) ЦелУкз wxGrid_GetDefaultCellTextColour(ЦелУкз сам);
            extern (C) ЦелУкз wxGrid_GetCellTextColour(ЦелУкз сам, цел ряд, цел кол);
            extern (C) ЦелУкз wxGrid_GetDefaultCellFont(ЦелУкз сам);
            extern (C) ЦелУкз wxGrid_GetCellFont(ЦелУкз сам, цел ряд, цел кол);
            extern (C) проц   wxGrid_GetDefaultCellAlignment(ЦелУкз сам, inout цел гориз, inout цел верт);
            extern (C) проц   wxGrid_GetCellAlignment(ЦелУкз сам, цел ряд, цел кол, inout цел гориз, inout цел верт);
            extern (C) бул   wxGrid_GetDefaultCellOverflow(ЦелУкз сам);
            extern (C) бул   wxGrid_GetCellOverflow(ЦелУкз сам, цел ряд, цел кол);
            extern (C) проц   wxGrid_GetCellSize(ЦелУкз сам, цел ряд, цел кол, inout цел члоРяд, inout цел члоКол);
            extern (C) проц   wxGrid_SetDefaultRowSize(ЦелУкз сам, цел высь, бул перемерСущРядов);
            extern (C) проц   wxGrid_SetRowSize(ЦелУкз сам, цел ряд, цел высь);
            extern (C) проц   wxGrid_SetDefaultColSize(ЦелУкз сам, цел ширь, бул перемерСущКол);
            extern (C) проц   wxGrid_SetColSize(ЦелУкз сам, цел кол, цел ширь);
            extern (C) проц   wxGrid_AutoSizeColumn(ЦелУкз сам, цел кол, бул устКакМин);
            extern (C) проц   wxGrid_AutoSizeRow(ЦелУкз сам, цел ряд, бул устКакМин);
            extern (C) проц   wxGrid_AutoSizeColumns(ЦелУкз сам, бул устКакМин);
            extern (C) проц   wxGrid_AutoSizeRows(ЦелУкз сам, бул устКакМин);
            extern (C) проц   wxGrid_AutoSize(ЦелУкз сам);
            extern (C) проц   wxGrid_SetColMinimalWidth(ЦелУкз сам, цел кол, цел ширь);
            extern (C) проц   wxGrid_SetRowMinimalHeight(ЦелУкз сам, цел ряд, цел ширь);
            extern (C) проц   wxGrid_SetColMinimalAcceptableWidth(ЦелУкз сам, цел ширь);
            extern (C) проц   wxGrid_SetRowMinimalAcceptableHeight(ЦелУкз сам, цел ширь);
            extern (C) цел    wxGrid_GetColMinimalAcceptableWidth(ЦелУкз сам);
            extern (C) цел    wxGrid_GetRowMinimalAcceptableHeight(ЦелУкз сам);
            extern (C) проц   wxGrid_SetDefaultCellBackgroundColour(ЦелУкз сам, ЦелУкз Цвет);
            extern (C) проц   wxGrid_SetDefaultCellTextColour(ЦелУкз сам, ЦелУкз Цвет);
            extern (C) проц   wxGrid_SetDefaultCellFont(ЦелУкз сам, ЦелУкз Шрифт);
            extern (C) проц   wxGrid_SetCellFont(ЦелУкз сам, цел ряд, цел кол, ЦелУкз Шрифт );
            extern (C) проц   wxGrid_SetDefaultCellAlignment(ЦелУкз сам, цел гориз, цел верт);
            extern (C) проц   wxGrid_SetCellAlignmentHV(ЦелУкз сам, цел ряд, цел кол, цел гориз, цел верт);
            extern (C) проц   wxGrid_SetDefaultCellOverflow(ЦелУкз сам, бул разрешить);
            extern (C) проц   wxGrid_SetCellOverflow(ЦелУкз сам, цел ряд, цел кол, бул разрешить);
            extern (C) проц   wxGrid_SetCellSize(ЦелУкз сам, цел ряд, цел кол, цел члоРяд, цел члоКол);
            extern (C) проц   wxGrid_SetDefaultRenderer(ЦелУкз сам, ЦелУкз отображатель);
            extern (C) проц   wxGrid_SetCellRenderer(ЦелУкз сам, цел ряд, цел кол, ЦелУкз отображатель);
            extern (C) ЦелУкз wxGrid_GetDefaultRenderer(ЦелУкз сам);
            extern (C) ЦелУкз wxGrid_GetCellRenderer(ЦелУкз сам, цел ряд, цел кол);
            extern (C) проц   wxGrid_SetDefaultEditor(ЦелУкз сам, ЦелУкз редактор);
            extern (C) проц   wxGrid_SetCellEditor(ЦелУкз сам, цел ряд, цел кол, ЦелУкз редактор);
            extern (C) ЦелУкз wxGrid_GetDefaultEditor(ЦелУкз сам);
            extern (C) ЦелУкз wxGrid_GetCellEditor(ЦелУкз сам, цел ряд, цел кол);
            extern (C) ЦелУкз wxGrid_GetCellValue(ЦелУкз сам, цел ряд, цел кол);
            extern (C) проц   wxGrid_SetCellValue(ЦелУкз сам, цел ряд, цел кол, ткст т);
            extern (C) бул   wxGrid_IsReadOnly(ЦелУкз сам, цел ряд, цел кол);
            extern (C) проц   wxGrid_SetReadOnly(ЦелУкз сам, цел ряд, цел кол, бул толькоЧтен);
            extern (C) проц   wxGrid_SelectRow(ЦелУкз сам, цел ряд, бул добавитьКВыделенным);
            extern (C) проц   wxGrid_SelectCol(ЦелУкз сам, цел кол, бул добавитьКВыделенным);
            extern (C) проц   wxGrid_SelectBlock(ЦелУкз сам, цел верхнРяд, цел левКол, цел нижнРяд, цел правКол, бул добавитьКВыделенным);
            extern (C) проц   wxGrid_SelectAll(ЦелУкз сам);
            extern (C) бул   wxGrid_IsSelection(ЦелУкз сам);
            extern (C) проц   wxGrid_DeselectRow(ЦелУкз сам, цел ряд);
            extern (C) проц   wxGrid_DeselectCol(ЦелУкз сам, цел кол);
            extern (C) проц   wxGrid_DeselectCell(ЦелУкз сам, цел ряд, цел кол);
            extern (C) проц   wxGrid_ClearSelection(ЦелУкз сам);
            extern (C) бул   wxGrid_IsInSelection(ЦелУкз сам, цел ряд, цел кол);
            //extern (C) ЦелУкз wxGrid_GetSelectedCells(ЦелУкз сам);
            //extern (C) ЦелУкз wxGrid_GetSelectionBlockTopLeft(ЦелУкз сам);
            //extern (C) ЦелУкз wxGrid_GetSelectionBlockBottomRight(ЦелУкз сам);
            //extern (C) ЦелУкз wxGrid_GetSelectedRows(ЦелУкз сам);
            //extern (C) ЦелУкз wxGrid_GetSelectedCols(ЦелУкз сам);
            extern (C) проц   wxGrid_BlockToDeviceRect(ЦелУкз сам, ЦелУкз верхнЛев, ЦелУкз нижнПрав, inout Прямоугольник прям);
            extern (C) ЦелУкз wxGrid_GetSelectionBackground(ЦелУкз сам);
            extern (C) ЦелУкз wxGrid_GetSelectionForeground(ЦелУкз сам);
            extern (C) проц   wxGrid_SetSelectionBackground(ЦелУкз сам, ЦелУкз c);
            extern (C) проц   wxGrid_SetSelectionForeground(ЦелУкз сам, ЦелУкз c);
            extern (C) проц   wxGrid_RegisterDataType(ЦелУкз сам, ткст имятипа, ЦелУкз отображатель, ЦелУкз редактор);
            extern (C) ЦелУкз wxGrid_GetDefaultEditorForCell(ЦелУкз сам, цел ряд, цел кол);
            extern (C) ЦелУкз wxGrid_GetDefaultRendererForCell(ЦелУкз сам, цел ряд, цел кол);
            extern (C) ЦелУкз wxGrid_GetDefaultEditorForType(ЦелУкз сам, ткст имятипа);
            extern (C) ЦелУкз wxGrid_GetDefaultRendererForType(ЦелУкз сам, ткст имятипа);
            extern (C) проц   wxGrid_SetMargins(ЦелУкз сам, цел экстраШир, цел экстраВыс);
            extern (C) ЦелУкз wxGrid_GetGridWindow(ЦелУкз сам);
            extern (C) ЦелУкз wxGrid_GetGridRowLabelWindow(ЦелУкз сам);
            extern (C) ЦелУкз wxGrid_GetGridColLabelWindow(ЦелУкз сам);
            extern (C) ЦелУкз wxGrid_GetGridCornerLabelWindow(ЦелУкз сам);
            extern (C) проц   wxGrid_UpdateDimensions(ЦелУкз сам);
            extern (C) цел    wxGrid_GetRows(ЦелУкз сам);
            extern (C) цел    wxGrid_GetCols(ЦелУкз сам);
            extern (C) цел    wxGrid_GetCursorRow(ЦелУкз сам);
            extern (C) цел    wxGrid_GetCursorColumn(ЦелУкз сам);
            extern (C) цел    wxGrid_GetScrollPosX(ЦелУкз сам);
            extern (C) цел    wxGrid_GetScrollPosY(ЦелУкз сам);
            extern (C) проц   wxGrid_SetScrollX(ЦелУкз сам, цел x);
            extern (C) проц   wxGrid_SetScrollY(ЦелУкз сам, цел y);
            extern (C) проц   wxGrid_SetColumnWidth(ЦелУкз сам, цел кол, цел ширь);
            extern (C) цел    wxGrid_GetColumnWidth(ЦелУкз сам, цел кол);
            extern (C) проц   wxGrid_SetRowHeight(ЦелУкз сам, цел ряд, цел высь);
            extern (C) цел    wxGrid_GetViewHeight(ЦелУкз сам);
            extern (C) цел    wxGrid_GetViewWidth(ЦелУкз сам);
            extern (C) проц   wxGrid_SetLabelSize(ЦелУкз сам, цел ориентация, цел рм);
            extern (C) цел    wxGrid_GetLabelSize(ЦелУкз сам, цел ориентация);
            extern (C) проц   wxGrid_SetLabelAlignment(ЦелУкз сам, цел ориентация, цел раскладка);
            extern (C) цел    wxGrid_GetLabelAlignment(ЦелУкз сам, цел ориентация, цел раскладка);
            extern (C) проц   wxGrid_SetLabelValue(ЦелУкз сам, цел ориентация, ткст знач, цел поз);
            extern (C) ЦелУкз wxGrid_GetLabelValue(ЦелУкз сам, цел ориентация, цел поз);
            extern (C) ЦелУкз wxGrid_GetCellTextFontGrid(ЦелУкз сам);
            extern (C) ЦелУкз wxGrid_GetCellTextFont(ЦелУкз сам, цел ряд, цел кол);
            extern (C) проц   wxGrid_SetCellTextFontGrid(ЦелУкз сам, ЦелУкз шрфт);
            extern (C) проц   wxGrid_SetCellTextFont(ЦелУкз сам, ЦелУкз шрфт, цел ряд, цел кол);
            extern (C) проц   wxGrid_SetCellTextColour(ЦелУкз сам, цел ряд, цел кол, ЦелУкз знач);
            extern (C) проц   wxGrid_SetCellTextColourGrid(ЦелУкз сам, ЦелУкз кол);
            extern (C) проц   wxGrid_SetCellBackgroundColourGrid(ЦелУкз сам, ЦелУкз кол);
            extern (C) проц   wxGrid_SetCellBackgroundColour(ЦелУкз сам, цел ряд, цел кол, ЦелУкз цвет);
            extern (C) бул   wxGrid_GetEditable(ЦелУкз сам);
            extern (C) проц   wxGrid_SetEditable(ЦелУкз сам, бул edit);
            extern (C) бул   wxGrid_GetEditInPlace(ЦелУкз сам);
            extern (C) проц   wxGrid_SetCellAlignment(ЦелУкз сам, цел раскладка, цел ряд, цел кол);
            extern (C) проц   wxGrid_SetCellAlignmentGrid(ЦелУкз сам, цел раскладка);
            extern (C) проц   wxGrid_SetCellBitmap(ЦелУкз сам, ЦелУкз битмап, цел ряд, цел кол);
            extern (C) проц   wxGrid_SetDividerPen(ЦелУкз сам, ЦелУкз перо);
            extern (C) ЦелУкз wxGrid_GetDividerPen(ЦелУкз сам);
            extern (C) цел    wxGrid_GetRowHeight(ЦелУкз сам, цел ряд);
            //! \endcond

        //-----------------------------------------------------------------------------

    export class Сетка : ОкноСПрокруткой
    {
        export this(ЦелУкз вхобъ)
            { super(вхобъ); }

        export this()
            { this(wxGrid_ctor()); }

        export this(Окно родитель, цел ид)
            { this(родитель, ид, ДЕФПОЗ, ДЕФРАЗМ, НУЖНЫ_СИМВ, "сетка"); }

        export this(Окно родитель, цел ид, Точка поз)
            { this(родитель, ид, поз, ДЕФРАЗМ, НУЖНЫ_СИМВ, "сетка"); }

        export this(Окно родитель, цел ид, Точка поз, Размер размер)
            { this(родитель, ид, поз, размер, НУЖНЫ_СИМВ, "сетка"); }

        export this(Окно родитель, цел ид, Точка поз, Размер размер, цел стиль)
            { this(родитель, ид, поз, размер, стиль, "сетка"); }

        export this(Окно родитель, цел ид, Точка поз, Размер размер, цел стиль, ткст имя)
            { this(wxGrid_ctorFull(ВизОбъект.безопУк(родитель), ид, поз, размер, cast(бцел)стиль, имя)); }

        //export  this(Окно родитель, цел x, цел y, цел w, цел h, цел стиль, ткст имя)
        //    { super(wxGrid_ctor(ВизОбъект.безопУк(родитель), x, y, w, h, стиль, имя)); }

	//---------------------------------------------------------------------
	// ctors with сам created ид

	export this(Окно родитель)
            { this(родитель, Окно.уникИд, ДЕФПОЗ, ДЕФРАЗМ, НУЖНЫ_СИМВ, "сетка"); }

        export this(Окно родитель, Точка поз)
            { this(родитель, Окно.уникИд, поз, ДЕФРАЗМ, НУЖНЫ_СИМВ, "сетка"); }

        export this(Окно родитель, Точка поз, Размер размер)
            { this(родитель, Окно.уникИд, поз, размер, НУЖНЫ_СИМВ, "сетка"); }

        export this(Окно родитель, Точка поз, Размер размер, цел стиль)
            { this(родитель, Окно.уникИд, поз, размер, стиль, "сетка"); }

        export this(Окно родитель, Точка поз, Размер размер, цел стиль, ткст имя)
		{ this(родитель, Окно.уникИд, поз, размер, стиль, имя);}

        //-----------------------------------------------------------------------------

        export бул создайСетку(цел члоРядов, цел члоКол)
        { return создайСетку(члоРядов, члоКол, ПРежимВыделенияСетки.ВыделитьЯчейки); }

            export бул создайСетку(цел члоРядов, цел члоКол, ПРежимВыделенияСетки режвыд)
            {
            return wxGrid_CreateGrid(вхобъ, члоРядов, члоКол, cast(цел)режвыд);
            }

        //-----------------------------------------------------------------------------

            export проц режимВыделения(ПРежимВыделенияСетки значение) { wxGrid_SetSelectionMode(вхобъ, cast(цел)значение); }
            //get { return wxGrid_GetSelectionMode(вхобъ); }

            //-----------------------------------------------------------------------------

            export цел члоРядов() { return wxGrid_GetNumberRows(вхобъ); }

            export цел члоКолонок() { return wxGrid_GetNumberCols(вхобъ); }

        //-----------------------------------------------------------------------------

       //     export ОсноваТаблицыСетки Table() { return cast(ОсноваТаблицыСетки)найдиОбъект(wxGrid_GetTable(вхобъ), &ОсноваТаблицыСетки.Нов); }

        export бул устТаблицу(ОсноваТаблицыСетки таблица)
        {
            return устТаблицу(таблица, нет, ПРежимВыделенияСетки.ВыделитьЯчейки );
        }

        export бул устТаблицу(ОсноваТаблицыСетки таблица, бул взятьВоВладен)
        {
            return устТаблицу(таблица, взятьВоВладен, ПРежимВыделенияСетки.ВыделитьЯчейки);
        }

            export бул устТаблицу(ОсноваТаблицыСетки таблица, бул взятьВоВладен, ПРежимВыделенияСетки селект)
            {
            return wxGrid_SetTable(вхобъ, ВизОбъект.безопУк(таблица), взятьВоВладен, cast(цел)селект);
            }

            //-----------------------------------------------------------------------------

            export проц очистьСетку()
            {
            wxGrid_ClearGrid(вхобъ);
            }

            //-----------------------------------------------------------------------------

        export бул вставьРяды()
        {
            return вставьРяды(0, 1, да);
        }

        export бул вставьРяды(цел поз)
        {
            return вставьРяды(поз, 1, да);
        }

        export бул вставьРяды(цел поз, цел члоРядов)
        {
            return вставьРяды(поз, члоРядов, да);
        }

            export бул вставьРяды(цел поз, цел члоРядов, бул обновитьЯрлыки)
            {
            return wxGrid_InsertRows(вхобъ, поз, члоРядов, обновитьЯрлыки);
        }

        export бул добавьРяды()
        {
            return добавьРяды(1, да);
        }

        export бул добавьРяды(цел члоРядов)
        {
            return добавьРяды(члоРядов, да);
        }

            export бул добавьРяды(цел члоРядов, бул обновитьЯрлыки)
            {
            return wxGrid_AppendRows(вхобъ, члоРядов, обновитьЯрлыки);
            }

        export бул удалиРяды()
        {
            return удалиРяды(0, 1, да);
        }

        export бул удалиРяды(цел поз)
        {
            return удалиРяды(поз, 1, да);
        }

        export бул удалиРяды(цел поз, цел члоРядов)
        {
            return удалиРяды(поз, члоРядов, да);
        }

            export бул удалиРяды(цел поз, цел члоРядов, бул обновитьЯрлыки)
            {
            return wxGrid_DeleteRows(вхобъ, поз, члоРядов, обновитьЯрлыки);
            }

        //-----------------------------------------------------------------------------

        export бул вставьКолонки()
        {
            return вставьКолонки(0, 1, да);
        }

        export бул вставьКолонки(цел поз)
        {
            return вставьКолонки(поз, 1, да);
        }

        export бул вставьКолонки(цел поз, цел члоРядов)
        {
            return вставьКолонки(поз, члоРядов, да);
        }

            export бул вставьКолонки(цел поз, цел члоКол, бул обновитьЯрлыки)
            {
            return wxGrid_InsertCols(вхобъ, поз, члоКол, обновитьЯрлыки);
            }

        export бул добавьКолонки()
        {
            return добавьКолонки(1, да);
        }

        export бул добавьКолонки(цел члоКол)
        {
            return добавьКолонки(члоКол, да);
        }

            export бул добавьКолонки(цел члоКол, бул обновитьЯрлыки)
            {
            return wxGrid_AppendCols(вхобъ, члоКол, обновитьЯрлыки);
            }

        export бул удалиКолонки()
        {
            return удалиКолонки(0, 1, да);
        }

        export бул удалиКолонки(цел поз)
        {
            return удалиКолонки(поз, 1, да);
        }

        export бул удалиКолонки(цел поз, цел члоРядов)
        {
            return удалиКолонки(поз, члоРядов, да);
        }

            export бул удалиКолонки(цел поз, цел члоКол, бул обновитьЯрлыки)
            {
            return wxGrid_DeleteCols(вхобъ, поз, члоКол, обновитьЯрлыки);
            }

            //-----------------------------------------------------------------------------

            export проц батчНачни()
            {
            wxGrid_BeginBatch(вхобъ);
            }

            export проц батчЗаверши()
            {
            wxGrid_EndBatch(вхобъ);
            }

            export цел батчСчёт() { return wxGrid_GetBatchCount(вхобъ); }

            //-----------------------------------------------------------------------------

            export проц форсОсвежи()
            {
            wxGrid_ForceRefresh(вхобъ);
            }

            //-----------------------------------------------------------------------------

            export бул рисуйНевидимо() { return wxGrid_IsEditable(вхобъ); }
            export проц рисуйНевидимо(бул значение) { wxGrid_EnableEditing(вхобъ, значение); }

            //-----------------------------------------------------------------------------

            export проц активированКонтролРедактированияЯчейки(бул значение) { wxGrid_EnableCellEditControl(вхобъ, значение); }
            export бул активированКонтролРедактированияЯчейки() { return wxGrid_IsCellEditControlEnabled(вхобъ); }

            export проц отключиКонтролРедактированияЯчейки()
            {
            wxGrid_DisableCellEditControl(вхобъ);
            }

            export бул можноАктивироватьКонтролЯчейки() { return wxGrid_CanEnableCellControl(вхобъ); }

            //-----------------------------------------------------------------------------

            export бул показанКонтролРедактированияЯчейки() { return wxGrid_IsCellEditControlShown(вхобъ); }

            export бул текущЯсейкаТолькоДляЧтения() { return wxGrid_IsCurrentCellReadOnly(вхобъ); }

            //-----------------------------------------------------------------------------

            export проц покажиКонтролРедактированияЯчейки()
            {
            wxGrid_ShowCellEditControl(вхобъ);
            }

            export проц скройКонтролРедактированияЯчейки()
            {
            wxGrid_HideCellEditControl(вхобъ);
            }

            //-----------------------------------------------------------------------------

            export проц сохраниЗначениеКонтролаРедактирования()
            {
            wxGrid_SaveEditControlValue(вхобъ);
            }

            //-----------------------------------------------------------------------------

            /*export проц XYToCell(цел x, цел y,  КоординатыЯчейкиСетки )
            {
                    wxGrid_XYToCell(вхобъ, x, y, ВизОбъект.безопУк(КоординатыЯчейкиСетки ));
            }*/

            //-----------------------------------------------------------------------------

            export цел уВРяд(цел y)
            {
            return wxGrid_YToRow(вхобъ, y);
            }

            export цел хВРяд(цел x)
            {
            return wxGrid_XToCol(вхобъ, x);
            }

            export цел уДоКраяРяда(цел y)
            {
            return wxGrid_YToEdgeOfRow(вхобъ, y);
            }

            export цел хДоКраяРяда(цел x)
            {
            return wxGrid_XToEdgeOfCol(вхобъ, x);
            }

            //-----------------------------------------------------------------------------

            export Прямоугольник ячейкаВПрям(цел ряд, цел кол)
            {
            Прямоугольник прям;
            wxGrid_CellToRect(вхобъ, ряд, кол, прям);
            return прям;
            }

            //-----------------------------------------------------------------------------

            export цел рядКурсораСетки() { return wxGrid_GetGridCursorRow(вхобъ); }

            export цел колонкаКурсораСетки() { return wxGrid_GetGridCursorCol(вхобъ); }

            //-----------------------------------------------------------------------------

            export бул виден(цел ряд, цел кол, бул всяЯчВидна)
            {
            return wxGrid_IsVisible(вхобъ, ряд, кол, всяЯчВидна);
            }

            //-----------------------------------------------------------------------------

            export проц сделайЯчейкуВидимой(цел ряд, цел кол)
            {
            wxGrid_MakeCellVisible(вхобъ, ряд, кол);
            }

            //-----------------------------------------------------------------------------

            export проц устКурсорСетки(цел ряд, цел кол)
            {
            wxGrid_SetGridCursor(вхобъ, ряд, кол);
            }

            //-----------------------------------------------------------------------------

            export бул переместиКурсорВверх(бул развернутьВыд)
            {
            return wxGrid_MoveCursorUp(вхобъ, развернутьВыд);
            }

            export бул переместиКурсорВниз(бул развернутьВыд)
            {
            return wxGrid_MoveCursorDown(вхобъ, развернутьВыд);
            }

            export бул переместиКурсорВлево(бул развернутьВыд)
            {
            return wxGrid_MoveCursorLeft(вхобъ, развернутьВыд);
            }

            export бул переместиКурсорВправо(бул развернутьВыд)
            {
            return wxGrid_MoveCursorRight(вхобъ, развернутьВыд);
            }

            export бул переместиНаСтраницуВниз()
            {
            return wxGrid_MovePageDown(вхобъ);
            }

            export бул переместиНаСтраницуВверх()
            {
            return wxGrid_MovePageUp(вхобъ);
            }

            //-----------------------------------------------------------------------------

            export бул переместиКурсорНаБлокВверх(бул развернутьВыд)
            {
            return wxGrid_MoveCursorUpBlock(вхобъ, развернутьВыд);
            }

            export бул переместиКурсорНаБлокВниз(бул развернутьВыд)
            {
            return wxGrid_MoveCursorDownBlock(вхобъ, развернутьВыд);
            }

            export бул переместиКурсорНаБлокВлево(бул развернутьВыд)
            {
            return wxGrid_MoveCursorLeftBlock(вхобъ, развернутьВыд);
            }

            export бул переместиКурсорНаБлокВправо(бул развернутьВыд)
            {
            return wxGrid_MoveCursorRightBlock(вхобъ, развернутьВыд);
            }

            //-----------------------------------------------------------------------------

            export цел дефРазмЯрлыкаРяда() { return wxGrid_GetDefaultRowLabelSize(вхобъ); }

            export цел размЯрлыкаРяда() { return wxGrid_GetRowLabelSize(вхобъ); }
            export проц размЯрлыкаРяда(цел значение) { wxGrid_SetRowLabelSize(вхобъ, значение); }

            //-----------------------------------------------------------------------------

            export цел дефРазмЯрлыкаКолонки() { return wxGrid_GetDefaultColLabelSize(вхобъ); }

            export цел размЯрлыкаКолонки() { return wxGrid_GetColLabelSize(вхобъ); }
            export проц размЯрлыкаКолонки(цел значение) { wxGrid_SetColLabelSize(вхобъ, значение); }

            //-----------------------------------------------------------------------------

            export Цвет зпЦветЯрлыка() { return new Цвет(wxGrid_GetLabelBackgroundColour(вхобъ), да); }
            export проц зпЦветЯрлыка(Цвет значение) { wxGrid_SetLabelBackgroundColour(вхобъ, ВизОбъект.безопУк(значение)); }

            export Цвет цветТекстаЯрлыка() { return new Цвет(wxGrid_GetLabelTextColour(вхобъ), да); }
            export проц цветТекстаЯрлыка(Цвет значение) { wxGrid_SetLabelTextColour(вхобъ, ВизОбъект.безопУк(значение)); }

            //-----------------------------------------------------------------------------

            export Шрифт шрифтЯрлыка() { return new Шрифт(wxGrid_GetLabelFont(вхобъ)); }
            export проц шрифтЯрлыка(Шрифт значение) { wxGrid_SetLabelFont(вхобъ, ВизОбъект.безопУк(значение)); }

            //-----------------------------------------------------------------------------

            export проц дайРаскладкуЯрлыкаРяда(out цел гориз, out цел верт)
            {
            wxGrid_GetRowLabelAlignment(вхобъ, гориз, верт);
            }

            export проц дайРаскладкуЯрлыкаКолонки(out цел гориз, out цел верт)
            {
            wxGrid_GetColLabelAlignment(вхобъ, гориз, верт);
            }

            //-----------------------------------------------------------------------------

            export ткст дайЗначениеЯрлыкаРяда(цел ряд)
            {
            return cast(ткст) new ВизТкст(wxGrid_GetRowLabelValue(вхобъ, ряд), да);
            }

            export ткст дайЗначениеЯрлыкаКолонки(цел кол)
            {
            return cast(ткст) new ВизТкст(wxGrid_GetColLabelValue(вхобъ, кол), да);
            }

            //-----------------------------------------------------------------------------

            export Цвет цветСтрокиСетки() { return new Цвет(wxGrid_GetGridLineColour(вхобъ), да); }
            export проц цветСтрокиСетки(Цвет значение) { wxGrid_SetGridLineColour(вхобъ, ВизОбъект.безопУк(значение)); }

            //-----------------------------------------------------------------------------

            export Цвет цветПодсветкиЯчейки() { return new Цвет(wxGrid_GetCellHighlightColour(вхобъ), да); }
            export проц цветПодсветкиЯчейки(Цвет значение) { wxGrid_SetCellHighlightColour(вхобъ, ВизОбъект.безопУк(значение)); }

            //-----------------------------------------------------------------------------

            export цел ширинаПераПодсветкиЯчейки() { return wxGrid_GetCellHighlightPenWidth(вхобъ); }
            export проц ширинаПераПодсветкиЯчейки(цел значение) { wxGrid_SetCellHighlightPenWidth(вхобъ, значение); }

            //-----------------------------------------------------------------------------

            export цел ширинаПераПодсветкиЯчейкиРО() { return wxGrid_GetCellHighlightROPenWidth(вхобъ); }
            export проц ширинаПераПодсветкиЯчейкиРО(цел значение) { wxGrid_SetCellHighlightROPenWidth(вхобъ, значение); }

            //-----------------------------------------------------------------------------

            export проц устРаскладкуЯрлыкаРяда(цел гориз, цел верт)
            {
            wxGrid_SetRowLabelAlignment(вхобъ, гориз, верт);
            }

            export проц устРаскладкуЯрлыкаКолонки(цел гориз, цел верт)
            {
            wxGrid_SetColLabelAlignment(вхобъ, гориз, верт);
            }

            //-----------------------------------------------------------------------------

            export проц устЗначениеЯрлыкаРяда(цел ряд, ткст стр)
            {
            wxGrid_SetRowLabelValue(вхобъ, ряд, стр);
            }

            export проц устЗначениеЯрлыкаКолонки(цел кол, ткст стр)
            {
            wxGrid_SetColLabelValue(вхобъ, кол, стр);
            }

            //-----------------------------------------------------------------------------

            export проц активированПеретягРазмераРяда(бул значение) { wxGrid_EnableDragRowSize(вхобъ, значение); }
            export бул активированПеретягРазмераРяда() { return wxGrid_CanDragRowSize(вхобъ); }

            export проц отключиПеретягРазмераРяда()
            {
            wxGrid_DisableDragRowSize(вхобъ);
            }

            //-----------------------------------------------------------------------------

            export проц активированПеретягРазмераКолонки(бул значение) { wxGrid_EnableDragColSize(вхобъ, значение); }
            export бул активированПеретягРазмераКолонки() { return wxGrid_CanDragColSize(вхобъ); }

            export проц отключиПеретягРазмераКолонки()
            {
            wxGrid_DisableDragColSize(вхобъ);
            }

            //-----------------------------------------------------------------------------

            export проц активированПеретягРазмераЯчейки(бул значение) { wxGrid_EnableDragGridSize(вхобъ, значение); }
            export бул активированПеретягРазмераЯчейки() { return wxGrid_CanDragGridSize(вхобъ); }

            export проц отключиПеретягРазмераЯчейки()
            {
            wxGrid_DisableDragGridSize(вхобъ);
            }

            //-----------------------------------------------------------------------------

            export проц устАтр(цел ряд, цел кол, АтрибутЯчейкиСетки атр)
            {
            wxGrid_SetAttr(вхобъ, ряд, кол, ВизОбъект.безопУк(атр));
            }

            export проц устАтрРяда(цел ряд, АтрибутЯчейкиСетки атр)
            {
            wxGrid_SetRowAttr(вхобъ, ряд, ВизОбъект.безопУк(атр));
            }

            export проц устАтрКолонки(цел кол, АтрибутЯчейкиСетки атр)
            {
            wxGrid_SetColAttr(вхобъ, кол, ВизОбъект.безопУк(атр));
            }

            //-----------------------------------------------------------------------------

            export проц булФорматКолонки(цел значение) { wxGrid_SetColFormatBool(вхобъ, значение); }

            export проц числФорматКолонки(цел значение) { wxGrid_SetColFormatNumber(вхобъ, значение); }

        export проц устПлавФорматКолонки(цел кол)
        {
            устПлавФорматКолонки(кол, -1, -1);
        }

        export проц устПлавФорматКолонки(цел кол, цел ширь)
        {
            устПлавФорматКолонки(кол, ширь, -1);
        }

            export проц устПлавФорматКолонки(цел кол, цел ширь, цел точность)
            {
            wxGrid_SetColFormatFloat(вхобъ, кол, ширь, точность);
            }

            export проц устКастомнФорматКолонки(цел кол, ткст имятипа)
            {
            wxGrid_SetColFormatCustom(вхобъ, кол, имятипа);
            }

            //-----------------------------------------------------------------------------

            export проц активированыСтрокиСетки(бул значение) { wxGrid_EnableGridLines(вхобъ, значение); }
            export бул активированыСтрокиСетки() { return wxGrid_GridLinesEnabled(вхобъ); }

            //-----------------------------------------------------------------------------

            export цел дефРазмРяда() { return wxGrid_GetDefaultRowSize(вхобъ); }

            export цел дайРазмРяда(цел ряд)
            {
            return wxGrid_GetRowSize(вхобъ, ряд);
            }

            export цел дефРазмКолонки() { return wxGrid_GetDefaultColSize(вхобъ); }

            export цел дайРазмКолонки(цел кол)
            {
            return wxGrid_GetColSize(вхобъ, кол);
            }

            //-----------------------------------------------------------------------------

            export Цвет дефЦветФонаЯчейки() { return new Цвет(wxGrid_GetDefaultCellBackgroundColour(вхобъ), да); }
            export проц дефЦветФонаЯчейки(Цвет значение) { wxGrid_SetDefaultCellBackgroundColour(вхобъ, ВизОбъект.безопУк(значение)); }

            export Цвет дефЦветТекстаЯчейки() { return new Цвет(wxGrid_GetDefaultCellTextColour(вхобъ), да); }
            export проц дефЦветТекстаЯчейки(Цвет значение) { wxGrid_SetDefaultCellTextColour(вхобъ, ВизОбъект.безопУк(значение)); }

            //-----------------------------------------------------------------------------

            export Шрифт дефШрифтЯчейки() { return new Шрифт(wxGrid_GetDefaultCellFont(вхобъ)); }
            export проц дефШрифтЯчейки(Шрифт значение) { wxGrid_SetDefaultCellFont(вхобъ, ВизОбъект.безопУк(значение)); }

            export Шрифт дайШрифтЯчейки(цел ряд, цел кол)
            {
            return new Шрифт(wxGrid_GetCellFont(вхобъ, ряд, кол));
            }

            //-----------------------------------------------------------------------------

            export проц дайДефРаскладкуЯчейки(inout цел гориз, inout цел верт)
            {
            wxGrid_GetDefaultCellAlignment(вхобъ, гориз, верт);
            }

            //-----------------------------------------------------------------------------

            export проц дайРаскладкуЯчейки(цел ряд, цел кол, inout цел гориз, inout цел верт)
            {
            wxGrid_GetCellAlignment(вхобъ, ряд, кол, гориз, верт);
            }

            //-----------------------------------------------------------------------------

            export бул дефПереполнениеЯчейки() { return wxGrid_GetDefaultCellOverflow(вхобъ); }
            export проц дефПереполнениеЯчейки(бул значение) { wxGrid_SetDefaultCellOverflow(вхобъ, значение); }

            export бул дайПереполнениеЯчейки(цел ряд, цел кол)
            {
            return wxGrid_GetCellOverflow(вхобъ, ряд, кол);
            }

            //-----------------------------------------------------------------------------

            export проц дайРазмЯчейки(цел ряд, цел кол, inout цел члоРяд, inout цел члоКол)
            {
            wxGrid_GetCellSize(вхобъ, ряд, кол, члоРяд, члоКол);
            }

            //-----------------------------------------------------------------------------

            export проц устДефРазмРяда(цел высь, бул перемерСущРядов)
            {
            wxGrid_SetDefaultRowSize(вхобъ, высь, перемерСущРядов);
            }

            export проц устРазмРяда(цел ряд, цел высь)
            {
            wxGrid_SetRowSize(вхобъ, ряд, высь);
            }

            //-----------------------------------------------------------------------------

            export проц устДефРазмКолонки(цел ширь, бул перемерСущКол)
            {
            wxGrid_SetDefaultColSize(вхобъ, ширь, перемерСущКол);
            }

            export проц устРазмКолонки(цел кол, цел ширь)
            {
            wxGrid_SetColSize(вхобъ, кол, ширь);
            }

            //-----------------------------------------------------------------------------

            export проц автомерКолонки(цел кол, бул устКакМин)
            {
            wxGrid_AutoSizeColumn(вхобъ, кол, устКакМин);
            }

            export проц автомерРяда(цел ряд, бул устКакМин)
            {
            wxGrid_AutoSizeRow(вхобъ, ряд, устКакМин);
            }

            //-----------------------------------------------------------------------------

        export проц автомерКолонок()
        {
            автомерКолонок(да);
        }

            export проц автомерКолонок(бул устКакМин)
            {
            wxGrid_AutoSizeColumns(вхобъ, устКакМин);
            }

        export проц автомерРядов()
        {
            автомерРядов(да);
        }

            export проц автомерРядов(бул устКакМин)
            {
            wxGrid_AutoSizeRows(вхобъ, устКакМин);
            }

            //-----------------------------------------------------------------------------

            export проц автомер()
            {
            wxGrid_AutoSize(вхобъ);
            }

            //-----------------------------------------------------------------------------

            export проц устМинШиринуКолонки(цел кол, цел ширь)
            {
            wxGrid_SetColMinimalWidth(вхобъ, кол, ширь);
            }

            export проц устМинШиринуРяда(цел ряд, цел ширь)
            {
            wxGrid_SetRowMinimalHeight(вхобъ, ряд, ширь);
            }

            //-----------------------------------------------------------------------------

            export цел минДопустимШиринаКол() { return wxGrid_GetColMinimalAcceptableWidth(вхобъ); }

            export проц минДопустимВысотаРяда(цел значение) { wxGrid_SetRowMinimalAcceptableHeight(вхобъ, значение); }
            export цел минДопустимВысотаРяда() { return wxGrid_GetRowMinimalAcceptableHeight(вхобъ); }

            //-----------------------------------------------------------------------------

            export проц устШрифтЯчейки(цел ряд, цел кол, Шрифт шрфт)
            {
            wxGrid_SetCellFont(вхобъ, ряд, кол, ВизОбъект.безопУк(шрфт));
            }

            //-----------------------------------------------------------------------------

            export проц устДефРаскладкуЯчейки(цел гориз, цел верт)
            {
            wxGrid_SetDefaultCellAlignment(вхобъ, гориз, верт);
            }

            export проц устРаскладкуЯчейки(цел ряд, цел кол, цел гориз, цел верт)
            {
            wxGrid_SetCellAlignmentHV(вхобъ, ряд, кол, гориз, верт);
            }

            export проц устПереполнениеЯчейки(цел ряд, цел кол, бул разрешить)
            {
            wxGrid_SetCellOverflow(вхобъ, ряд, кол, разрешить);
            }

            export проц устРазмЯчейки(цел ряд, цел кол, цел члоРяд, цел члоКол)
            {
            wxGrid_SetCellSize(вхобъ, ряд, кол, члоРяд, члоКол);
            }

            //-----------------------------------------------------------------------------

            export проц дефОтображатель(ОтображательЯчейкиСетки значение) { wxGrid_SetDefaultRenderer(вхобъ, ВизОбъект.безопУк(значение)); }
            //get { return wxGrid_GetDefaultRenderer(вхобъ); }

            //-----------------------------------------------------------------------------

            export проц устОтображательЯчейки(цел ряд, цел кол, ОтображательЯчейкиСетки отображатель)
            {
            wxGrid_SetCellRenderer(вхобъ, ряд, кол, ВизОбъект.безопУк(отображатель));
            }

            //-----------------------------------------------------------------------------
    /+
            export ОтображательЯчейкиСетки GetCellRenderer(цел ряд, цел кол)
            {
                    return cast(ОтображательЯчейкиСетки)найдиОбъект(wxGrid_GetCellRenderer(вхобъ, ряд, кол), &ОтображательЯчейкиСетки.Нов);
            }
    +/
            //-----------------------------------------------------------------------------

            export проц дефРедактор(РедакторЯчейкиСетки значение) { wxGrid_SetDefaultEditor(вхобъ, ВизОбъект.безопУк(значение)); }/+
            export РедакторЯчейкиСетки DefaultEditor() { return cast(РедакторЯчейкиСетки)найдиОбъект(wxGrid_GetDefaultEditor(вхобъ), &РедакторЯчейкиСетки.Нов); }
    +/
            //-----------------------------------------------------------------------------

            export проц устРедакторЯчейки(цел ряд, цел кол, РедакторЯчейкиСетки редактор)
            {
                wxGrid_SetCellEditor(вхобъ, ряд, кол, ВизОбъект.безопУк(редактор));
            }

            //-----------------------------------------------------------------------------
    /+
            export РедакторЯчейкиСетки GetCellEditor(цел ряд, цел кол)
            {
                return cast(РедакторЯчейкиСетки)найдиОбъект(wxGrid_GetCellEditor(вхобъ, ряд, кол), &РедакторЯчейкиСетки.Нов);
            }
    +/
            //-----------------------------------------------------------------------------

            export ткст дайЗначениеЯчейки(цел ряд, цел кол)
            {
                return cast(ткст) new ВизТкст(wxGrid_GetCellValue(вхобъ, ряд, кол), да);
            }

            //-----------------------------------------------------------------------------

            export проц устЗначениеЯчейки(цел ряд, цел кол, ткст т)
            {
                wxGrid_SetCellValue(вхобъ, ряд, кол, т);
            }

            //-----------------------------------------------------------------------------

            export бул толькоДляЧтения_ли(цел ряд, цел кол)
            {
                return wxGrid_IsReadOnly(вхобъ, ряд, кол);
            }

        export проц устТолькоДляЧтения(цел ряд, цел кол)
        {
            устТолькоДляЧтения(ряд, кол, да);
        }

            export проц устТолькоДляЧтения(цел ряд, цел кол, бул толькоЧтен)
            {
            wxGrid_SetReadOnly(вхобъ, ряд, кол, толькоЧтен);
            }

            //-----------------------------------------------------------------------------

            export проц выделиРяд(цел ряд, бул добавитьКВыделенным)
            {
            wxGrid_SelectRow(вхобъ, ряд, добавитьКВыделенным);
            }

            export проц выделиКолонку(цел кол, бул добавитьКВыделенным)
            {
            wxGrid_SelectCol(вхобъ, кол, добавитьКВыделенным);
            }

            //-----------------------------------------------------------------------------

            export проц выделиБлок(цел верхнРяд, цел левКол, цел нижнРяд, цел правКол, бул добавитьКВыделенным)
            {
            wxGrid_SelectBlock(вхобъ, верхнРяд, левКол, нижнРяд, правКол, добавитьКВыделенным);
            }

            //-----------------------------------------------------------------------------

            export проц выделиВсе()
            {
            wxGrid_SelectAll(вхобъ);
            }

            //-----------------------------------------------------------------------------

            export бул выделение_ли() { return wxGrid_IsSelection(вхобъ); }

            //-----------------------------------------------------------------------------

            export проц деселектируйРяд(цел ряд)
            {
            wxGrid_DeselectRow(вхобъ, ряд);
            }

            export проц деселектируйКолонку(цел кол)
            {
            wxGrid_DeselectCol(вхобъ, кол);
            }

            export проц деселектируйЯчейку(цел ряд, цел кол)
            {
            wxGrid_DeselectCell(вхобъ, ряд, кол);
            }

            //-----------------------------------------------------------------------------

            export проц очистьВыделение()
            {
            wxGrid_ClearSelection(вхобъ);
            }

            //-----------------------------------------------------------------------------

            export бул вВыделении_ли(цел ряд, цел кол)
            {
            return wxGrid_IsInSelection(вхобъ, ряд, кол);
            }

            //-----------------------------------------------------------------------------

//! \cond VERSION
version(NOT_IMPLEMENTED){
            export GridCellCoordsArray дайВыделенныеЯчейки()
        {
            return wxGrid_GetSelectedCells(вхобъ);
            }

            //-----------------------------------------------------------------------------

            export GridCellCoordsArray дайВерхнЛевБлокВыделения()
            {
            return wxGrid_GetSelectionBlockTopLeft(вхобъ);
            }

            //-----------------------------------------------------------------------------

            export GridCellCoordsArray дайНижнПравБлокВыделения()
            {
            return wxGrid_GetSelectionBlockBottomRight(вхобъ);
            }

            //-----------------------------------------------------------------------------

            export ЦелМассив дайВыделенныеРяды()
            {
            return wxGrid_GetSelectedRows(вхобъ);
            }

            //-----------------------------------------------------------------------------

            export ЦелМассив дайВыделенныеКолонки()
            {
            return wxGrid_GetSelectedCols(вхобъ);
            }
} // version(NOT_IMPLEMENTED)
//! \endcond
            //-----------------------------------------------------------------------------

            export Прямоугольник блокВПрямУстройства(КоординатыЯчейкиСетки верхнЛев, КоординатыЯчейкиСетки нижнПрав)
            {
            Прямоугольник прям;
            wxGrid_BlockToDeviceRect(вхобъ, ВизОбъект.безопУк(верхнЛев), ВизОбъект.безопУк(нижнПрав), прям);
            return прям;
            }

            //-----------------------------------------------------------------------------

            export Цвет зпВыделения() { return new Цвет(wxGrid_GetSelectionBackground(вхобъ), да); }
            export проц зпВыделения(Цвет значение) { wxGrid_SetSelectionBackground(вхобъ, ВизОбъект.безопУк(значение)); }

            //-----------------------------------------------------------------------------

            export Цвет ппВыделения() { return new Цвет(wxGrid_GetSelectionForeground(вхобъ), да); }
            export проц ппВыделения(Цвет значение) { wxGrid_SetSelectionForeground(вхобъ, ВизОбъект.безопУк(значение)); }

            //-----------------------------------------------------------------------------

            export проц регистрируйтипДанных(ткст имятипа, ОтображательЯчейкиСетки отображатель, РедакторЯчейкиСетки редактор)
            {
            wxGrid_RegisterDataType(вхобъ, имятипа, ВизОбъект.безопУк(отображатель), ВизОбъект.безопУк(редактор));
            }

            //-----------------------------------------------------------------------------
    /+
            export РедакторЯчейкиСетки GetDefaultEditorForCell(цел ряд, цел кол)
            {
            return cast(РедакторЯчейкиСетки)найдиОбъект(wxGrid_GetDefaultEditorForCell(вхобъ, ряд, кол), &РедакторЯчейкиСетки.Нов);
            }
    +/
            //-----------------------------------------------------------------------------
    /+
            export ОтображательЯчейкиСетки GetDefaultRendererForCell(цел ряд, цел кол)
            {
                    return cast(ОтображательЯчейкиСетки)найдиОбъект(wxGrid_GetDefaultRendererForCell(вхобъ, ряд, кол), &ОтображательЯчейкиСетки.Нов);
            }
    +/
            //-----------------------------------------------------------------------------
    /+
            export РедакторЯчейкиСетки GetDefaultEditorForType(ткст имятипа)
            {
            return cast(РедакторЯчейкиСетки)найдиОбъект(wxGrid_GetDefaultEditorForType(вхобъ, имятипа), &РедакторЯчейкиСетки.Нов);
            }
    +/
            //-----------------------------------------------------------------------------
    /+
            export ОтображательЯчейкиСетки GetDefaultRendererForType(ткст имятипа)
            {
                    return cast(ОтображательЯчейкиСетки)найдиОбъект(wxGrid_GetDefaultRendererForType(вхобъ, имятипа), &ОтображательЯчейкиСетки.Нов);
            }
    +/
            //-----------------------------------------------------------------------------

            export проц устМаржи(цел экстраШир, цел экстраВыс)
            {
            wxGrid_SetMargins(вхобъ, экстраШир, экстраВыс);
            }

            //-----------------------------------------------------------------------------

            export Окно окноСетки() { return cast(Окно)найдиОбъект(wxGrid_GetGridWindow(вхобъ)); }

            export Окно окноЯрлыкаРядаСетки() { return cast(Окно)найдиОбъект(wxGrid_GetGridRowLabelWindow(вхобъ)); }

            export Окно окноЯрлыкаКолонкиСетки() { return cast(Окно)найдиОбъект(wxGrid_GetGridColLabelWindow(вхобъ)); }

            export Окно окноЯрлыкаУголкаСетки() { return cast(Окно)найдиОбъект(wxGrid_GetGridCornerLabelWindow(вхобъ)); }

            //-----------------------------------------------------------------------------

            export проц обновиМеры()
            {
            wxGrid_UpdateDimensions(вхобъ);
            }

            //-----------------------------------------------------------------------------

            export цел ряды() { return wxGrid_GetRows(вхобъ); }

            export цел колонки() { return wxGrid_GetCols(вхобъ); }

            //-----------------------------------------------------------------------------

            export цел рядКурсора() { return wxGrid_GetCursorRow(вхобъ); }

            export цел колонкаКурсора() { return wxGrid_GetCursorColumn(вхобъ); }

            //-----------------------------------------------------------------------------

            export цел промотайПозХ() { return wxGrid_GetScrollPosX(вхобъ); }
            export проц промотайПозХ(цел значение) { wxGrid_SetScrollX(вхобъ, значение); }

            export цел промотайПозУ() { return wxGrid_GetScrollPosY(вхобъ); }
            export проц промотайПозУ(цел значение) { wxGrid_SetScrollY(вхобъ, значение); }

            //-----------------------------------------------------------------------------

            export проц устШиринуКолонки(цел кол, цел ширь)
            {
            wxGrid_SetColumnWidth(вхобъ, кол, ширь);
            }

            export цел дайШиринуКолонки(цел кол)
            {
            return wxGrid_GetColumnWidth(вхобъ, кол);
            }

            //-----------------------------------------------------------------------------

            export проц устВысотуРяда(цел ряд, цел высь)
            {
            wxGrid_SetRowHeight(вхобъ, ряд, высь);
            }

            //-----------------------------------------------------------------------------

            export цел высотаОбзора() { return wxGrid_GetViewHeight(вхобъ); }

            export цел ширинаОбзора() { return wxGrid_GetViewWidth(вхобъ); }

            //-----------------------------------------------------------------------------

            export проц устРазмЯрлыка(цел ориентация, цел рм)
            {
            wxGrid_SetLabelSize(вхобъ, ориентация, рм);
            }

            export цел дайРазмЯрлыка(цел ориентация)
            {
            return wxGrid_GetLabelSize(вхобъ, ориентация);
            }

            //-----------------------------------------------------------------------------

            export проц устРаскладкуЯрлыка(цел ориентация, цел раскладка)
            {
            wxGrid_SetLabelAlignment(вхобъ, ориентация, раскладка);
            }

            export цел дайРаскладкуЯрлыка(цел ориентация, цел раскладка)
            {
            return wxGrid_GetLabelAlignment(вхобъ, ориентация, раскладка);
            }

            //-----------------------------------------------------------------------------

            export проц устЗначениеЯрлыка(цел ориентация, ткст знач, цел поз)
            {
            wxGrid_SetLabelValue(вхобъ, ориентация, знач, поз);
            }

            export ткст дайЗначениеЯрлыка(цел ориентация, цел поз)
            {
            return cast(ткст) new ВизТкст(wxGrid_GetLabelValue(вхобъ, ориентация, поз), да);
            }

            //-----------------------------------------------------------------------------

            export Шрифт шрифтТекстаЯчейки() { return new Шрифт(wxGrid_GetCellTextFontGrid(вхобъ)); }
            export проц шрифтТекстаЯчейки(Шрифт значение) { wxGrid_SetCellTextFontGrid(вхобъ, ВизОбъект.безопУк(значение)); }

            //-----------------------------------------------------------------------------

            export Шрифт дайШрифтТекстаЯчейки(цел ряд, цел кол)
            {
            return new Шрифт(wxGrid_GetCellTextFont(вхобъ, ряд, кол));
            }

            export проц устШрифтТекстаЯчейки(Шрифт шрфт, цел ряд, цел кол)
            {
            wxGrid_SetCellTextFont(вхобъ, ВизОбъект.безопУк(шрфт), ряд, кол);
            }

            //-----------------------------------------------------------------------------

            export проц устЦветТексаЯчейки(цел ряд, цел кол, Цвет знач)
            {
            wxGrid_SetCellTextColour(вхобъ, ряд, кол, ВизОбъект.безопУк(знач));
            }

            //-----------------------------------------------------------------------------

            export проц цветТекстаЯчейки(Цвет значение) { wxGrid_SetCellTextColourGrid(вхобъ, ВизОбъект.безопУк(значение)); }

            //-----------------------------------------------------------------------------

            export Цвет дайЦветТекстаЯчейки(цел ряд, цел кол)
            {
            return new Цвет(wxGrid_GetCellTextColour(вхобъ, ряд, кол), да);
            }

            //-----------------------------------------------------------------------------

            export проц цветФонаЯчейки(Цвет значение) { wxGrid_SetCellBackgroundColourGrid(вхобъ, ВизОбъект.безопУк(значение)); }

            //-----------------------------------------------------------------------------

            export проц устЦветФонаЯчейки(цел ряд, цел кол, Цвет цвет)
            {
            wxGrid_SetCellBackgroundColour(вхобъ, ряд, кол, ВизОбъект.безопУк(цвет));
            }

            export Цвет дайЦветФонаЯчейки(цел ряд, цел кол)
            {
            return new Цвет(wxGrid_GetCellBackgroundColour(вхобъ, ряд, кол), да);
            }

            //-----------------------------------------------------------------------------

            export бул редактируемый() { return wxGrid_GetEditable(вхобъ); }
            export проц редактируемый(бул значение) { wxGrid_SetEditable(вхобъ, значение); }

            //-----------------------------------------------------------------------------

            export бул редактируйНаМесте() { return wxGrid_GetEditInPlace(вхобъ); }

            //-----------------------------------------------------------------------------

            export проц устРаскладкуЯчейки(цел раскладка, цел ряд, цел кол)
            {
            wxGrid_SetCellAlignment(вхобъ, раскладка, ряд, кол);
            }

            export проц раскладкаЯчейки(цел значение) { wxGrid_SetCellAlignmentGrid(вхобъ, значение); }

            //-----------------------------------------------------------------------------

            export проц устБитмапЯчейки(Битмап битмап, цел ряд, цел кол)
            {
            wxGrid_SetCellBitmap(вхобъ, ВизОбъект.безопУк(битмап), ряд, кол);
            }

            //-----------------------------------------------------------------------------

            export проц пероДелителя(Перо значение) { wxGrid_SetDividerPen(вхобъ, ВизОбъект.безопУк(значение)); }
            export Перо пероДелителя() { return new Перо(wxGrid_GetDividerPen(вхобъ)); }

            //-----------------------------------------------------------------------------

            export цел дайВысотуРяда(цел ряд)
            {
            return wxGrid_GetRowHeight(вхобъ, ряд);
            }

        //-----------------------------------------------------------------------------

		export проц CellLeftClick_Add(ДатчикСобытий значение) { добавьДатчикКоманд(Событие.Тип.СОБ_СЕТКА_ЯЧЕЙКА_ЛЕВАЯ_НАЖАТА, ид, значение, this); }
		export проц CellLeftClick_Remove(ДатчикСобытий значение) { удалиОбработчик(значение, this); }

		export проц CellRightClick_Add(ДатчикСобытий значение) { добавьДатчикКоманд(Событие.Тип.СОБ_СЕТКА_ЯЧЕЙКА_ПРАВАЯ_НАЖАТА, ид, значение, this); }
		export проц CellRightClick_Remove(ДатчикСобытий значение) { удалиОбработчик(значение, this); }

		export проц CellLeftDoubleClick_Add(ДатчикСобытий значение) { добавьДатчикКоманд(Событие.Тип.СОБ_СЕТКА_ЯЧЕЙКА_ЛЕВАЯ_ДНАЖАТА, ид, значение, this); }
		export проц CellLeftDoubleClick_Remove(ДатчикСобытий значение) { удалиОбработчик(значение, this); }

		export проц CellRightDoubleClick_Add(ДатчикСобытий значение) { добавьДатчикКоманд(Событие.Тип.СОБ_СЕТКА_ЯЧЕЙКА_ПРАВАЯ_ДНАЖАТА, ид, значение, this); }
		export проц CellRightDoubleClick_Remove(ДатчикСобытий значение) { удалиОбработчик(значение, this); }

		export проц LabelLeftClick_Add(ДатчикСобытий значение) { добавьДатчикКоманд(Событие.Тип.СОБ_СЕТКА_ЯРЛЫК_ЛЕВАЯ_НАЖАТА, ид, значение, this); }
		export проц LabelLeftClick_Remove(ДатчикСобытий значение) { удалиОбработчик(значение, this); }

		export проц LabelRightClick_Add(ДатчикСобытий значение) { добавьДатчикКоманд(Событие.Тип.СОБ_СЕТКА_ЯРЛЫК_ПРАВАЯ_НАЖАТА, ид, значение, this); }
		export проц LabelRightClick_Remove(ДатчикСобытий значение) { удалиОбработчик(значение, this); }

		export проц LabelLeftDoubleClick_Add(ДатчикСобытий значение) { добавьДатчикКоманд(Событие.Тип.СОБ_СЕТКА_ЯРЛЫК_ЛЕВАЯ_ДНАЖАТА, ид, значение, this); }
		export проц LabelLeftDoubleClick_Remove(ДатчикСобытий значение) { удалиОбработчик(значение, this); }

		export проц LabelRightDoubleClick_Add(ДатчикСобытий значение) { добавьДатчикКоманд(Событие.Тип.СОБ_СЕТКА_ЯРЛЫК_ПРАВАЯ_ДНАЖАТА, ид, значение, this); }
		export проц LabelRightDoubleClick_Remove(ДатчикСобытий значение) { удалиОбработчик(значение, this); }

		export проц RowSize_Add(ДатчикСобытий значение) { добавьДатчикКоманд(Событие.Тип.СОБ_СЕТКА_РЯД_РАЗМЕР, ид, значение, this); }
		export проц RowSize_Remove(ДатчикСобытий значение) { удалиОбработчик(значение, this); }

		export проц ColumnSize_Add(ДатчикСобытий значение) { добавьДатчикКоманд(Событие.Тип.СОБ_СЕТКА_КОЛОНКА_РАЗМЕР, ид, значение, this); }
		export проц ColumnSize_Remove(ДатчикСобытий значение) { удалиОбработчик(значение, this); }

		export проц RangeSelect_Add(ДатчикСобытий значение) { добавьДатчикКоманд(Событие.Тип.СОБ_СЕТКА_ДИАПАЗОН_ВЫДЕЛЕНИЕ, ид, значение, this); }
		export проц RangeSelect_Remove(ДатчикСобытий значение) { удалиОбработчик(значение, this); }

		export проц CellChange_Add(ДатчикСобытий значение) { добавьДатчикКоманд(Событие.Тип.СОБ_СЕТКА_ЯЧЕЙКА_ИЗМЕНЕНИЕ, ид, значение, this); }
		export проц CellChange_Remove(ДатчикСобытий значение) { удалиОбработчик(значение, this); }

		export проц SelectCell_Add(ДатчикСобытий значение) { добавьДатчикКоманд(Событие.Тип.СОБ_СЕТКА_ВЫДЕЛИТЬ_ЯЧЕЙКУ, ид, значение, this); }
		export проц SelectCell_Remove(ДатчикСобытий значение) { удалиОбработчик(значение, this); }

		export проц EditorShown_Add(ДатчикСобытий значение) { добавьДатчикКоманд(Событие.Тип.СОБ_СЕТКА_РЕДАКТОР_ПОКАЗАН, ид, значение, this); }
		export проц EditorShown_Remove(ДатчикСобытий значение) { удалиОбработчик(значение, this); }

		export проц EditorHidden_Add(ДатчикСобытий значение) { добавьДатчикКоманд(Событие.Тип.СОБ_СЕТКА_РЕДАКТОР_СКРЫТ, ид, значение, this); }
		export проц EditorHidden_Remove(ДатчикСобытий значение) { удалиОбработчик(значение, this); }

		export проц EditorCreate_Add(ДатчикСобытий значение) { добавьДатчикКоманд(Событие.Тип.СОБ_СЕТКА_РЕДАКТОР_СОЗДАН, ид, значение, this); }
		export проц EditorCreate_Remove(ДатчикСобытий значение) { удалиОбработчик(значение, this); }

    }

        //! \cond EXTERN
        extern (C) ЦелУкз wxGridCellCoords_ctor();
	extern (C) проц   wxGridCellCoords_dtor(ЦелУкз сам);
        extern (C) цел    wxGridCellCoords_GetRow(ЦелУкз сам);
        extern (C) проц   wxGridCellCoords_SetRow(ЦелУкз сам, цел ч);
        extern (C) цел    wxGridCellCoords_GetCol(ЦелУкз сам);
        extern (C) проц   wxGridCellCoords_SetCol(ЦелУкз сам, цел ч);
        extern (C) проц   wxGridCellCoords_Set(ЦелУкз сам, цел ряд, цел кол);
        //! \endcond

        //-----------------------------------------------------------------------------

    export class КоординатыЯчейкиСетки : ВизОбъект
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
            { this(wxGridCellCoords_ctor(), да); }

        export this(цел к, цел c)
        {
        	this();
            установи(к, c);
        }

	//---------------------------------------------------------------------

	override protected проц dtor() { wxGridCellCoords_dtor(вхобъ); }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
        //-----------------------------------------------------------------------------

        export проц ряд(цел значение) { wxGridCellCoords_SetRow(вхобъ, значение); }
        export цел ряд() { return wxGridCellCoords_GetRow(вхобъ); }

        //-----------------------------------------------------------------------------

        export проц кол(цел значение) { wxGridCellCoords_SetCol(вхобъ, значение); }
        export цел кол() { return wxGridCellCoords_GetCol(вхобъ); }

        //-----------------------------------------------------------------------------

        export проц установи(цел ряд, цел кол)
        {
            wxGridCellCoords_Set(вхобъ, ряд, кол);
        }
    }

        //! \cond EXTERN
        extern (C) ЦелУкз wxGridCellAttr_ctor(ЦелУкз цвТекст, ЦелУкз цвФон, ЦелУкз шрифт, цел гРасклад, цел вРасклад);
        extern (C) ЦелУкз wxGridCellAttr_ctor2();
        extern (C) ЦелУкз wxGridCellAttr_ctor3(ЦелУкз атрДеф);
        extern (C) ЦелУкз wxGridCellAttr_Clone(ЦелУкз сам);
        extern (C) проц   wxGridCellAttr_MergeWith(ЦелУкз сам, ЦелУкз mergefrom);
        extern (C) проц   wxGridCellAttr_IncRef(ЦелУкз сам);
        extern (C) проц   wxGridCellAttr_DecRef(ЦелУкз сам);
        extern (C) проц   wxGridCellAttr_SetTextColour(ЦелУкз сам, ЦелУкз цвТекст);
        extern (C) проц   wxGridCellAttr_SetBackgroundColour(ЦелУкз сам, ЦелУкз цвФон);
        extern (C) проц   wxGridCellAttr_SetFont(ЦелУкз сам, ЦелУкз шрифт);
        extern (C) проц   wxGridCellAttr_SetAlignment(ЦелУкз сам, цел гРасклад, цел вРасклад);
        extern (C) проц   wxGridCellAttr_SetSize(ЦелУкз сам, цел члоРяд, цел члоКол);
        extern (C) проц   wxGridCellAttr_SetOverflow(ЦелУкз сам, бул разрешить);
        extern (C) проц   wxGridCellAttr_SetReadOnly(ЦелУкз сам, бул толькоЧтен);
        extern (C) проц   wxGridCellAttr_SetRenderer(ЦелУкз сам, ЦелУкз отображатель);
        extern (C) проц   wxGridCellAttr_SetEditor(ЦелУкз сам, ЦелУкз редактор);
        extern (C) бул   wxGridCellAttr_HasTextColour(ЦелУкз сам);
        extern (C) бул   wxGridCellAttr_HasBackgroundColour(ЦелУкз сам);
        extern (C) бул   wxGridCellAttr_HasFont(ЦелУкз сам);
        extern (C) бул   wxGridCellAttr_HasAlignment(ЦелУкз сам);
        extern (C) бул   wxGridCellAttr_HasRenderer(ЦелУкз сам);
        extern (C) бул   wxGridCellAttr_HasEditor(ЦелУкз сам);
        extern (C) бул   wxGridCellAttr_HasReadWriteMode(ЦелУкз сам);
        extern (C) ЦелУкз wxGridCellAttr_GetTextColour(ЦелУкз сам);
        extern (C) ЦелУкз wxGridCellAttr_GetBackgroundColour(ЦелУкз сам);
        extern (C) ЦелУкз wxGridCellAttr_GetFont(ЦелУкз сам);
        extern (C) проц   wxGridCellAttr_GetAlignment(ЦелУкз сам, inout цел гРасклад, inout цел вРасклад);
        extern (C) проц   wxGridCellAttr_GetSize(ЦелУкз сам, inout цел члоРяд, inout цел члоКол);
        extern (C) бул   wxGridCellAttr_GetOverflow(ЦелУкз сам);
        extern (C) ЦелУкз wxGridCellAttr_GetRenderer(ЦелУкз сам, ЦелУкз сетка, цел ряд, цел кол);
        extern (C) ЦелУкз wxGridCellAttr_GetEditor(ЦелУкз сам, ЦелУкз сетка, цел ряд, цел кол);
        extern (C) бул   wxGridCellAttr_IsReadOnly(ЦелУкз сам);
        extern (C) проц   wxGridCellAttr_SetDefAttr(ЦелУкз сам, ЦелУкз defAttr);
        //! \endcond

        //-----------------------------------------------------------------------------

    export class АтрибутЯчейкиСетки : ВизОбъект
    {
        export enum ПВидАтра
        {
            Любой, Дефолт, Ячейка, Ряд, Колонка, Маржа
        }

        //-----------------------------------------------------------------------------

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
            { this(wxGridCellAttr_ctor2(), да); }

        export this(АтрибутЯчейкиСетки атрДеф)
            { this(wxGridCellAttr_ctor3(ВизОбъект.безопУк(атрДеф)), да); }

        export this(Цвет цвТекст, Цвет цвФон, Шрифт шрифт, цел гРасклад, цел вРасклад)
            { this(wxGridCellAttr_ctor(ВизОбъект.безопУк(цвТекст), ВизОбъект.безопУк(цвФон), ВизОбъект.безопУк(шрифт), гРасклад, вРасклад), да); }

	export static ВизОбъект Нов(ЦелУкз ptr) { return new АтрибутЯчейкиСетки(ptr); }
	//---------------------------------------------------------------------

	override protected проц dtor() {}
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
        //-----------------------------------------------------------------------------

        export АтрибутЯчейкиСетки клонируй()
        {
            return new АтрибутЯчейкиСетки(wxGridCellAttr_Clone(вхобъ));
        }

        //-----------------------------------------------------------------------------

        export проц маржируйС(АтрибутЯчейкиСетки mergefrom)
        {
            wxGridCellAttr_MergeWith(вхобъ, ВизОбъект.безопУк(mergefrom));
        }

        //-----------------------------------------------------------------------------

        export проц инкрементируйСсыл()
        {
            wxGridCellAttr_IncRef(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц декрементируйСсыл()
        {
            wxGridCellAttr_DecRef(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц цветТекста(Цвет значение) { wxGridCellAttr_SetTextColour(вхобъ, ВизОбъект.безопУк(значение)); }
        export Цвет цветТекста() { return new Цвет(wxGridCellAttr_GetTextColour(вхобъ), да); }

        //-----------------------------------------------------------------------------

        export проц цветФона(Цвет значение) { wxGridCellAttr_SetBackgroundColour(вхобъ, ВизОбъект.безопУк(значение)); }
        export Цвет цветФона() { return new Цвет(wxGridCellAttr_GetBackgroundColour(вхобъ), да); }

        //-----------------------------------------------------------------------------

        export проц шрифт(Шрифт значение) { wxGridCellAttr_SetFont(вхобъ, ВизОбъект.безопУк(значение)); }
        export Шрифт шрифт() { return new Шрифт(wxGridCellAttr_GetFont(вхобъ)); }

        //-----------------------------------------------------------------------------

        export проц устРаскладку(цел гРасклад, цел вРасклад)
        {
            wxGridCellAttr_SetAlignment(вхобъ, гРасклад, вРасклад);
        }

        export проц дайРаскладку(inout цел гРасклад, inout цел вРасклад)
        {
            wxGridCellAttr_GetAlignment(вхобъ, гРасклад, вРасклад);
        }

        export проц устРазм(цел члоРяд, цел члоКол)
        {
            wxGridCellAttr_SetSize(вхобъ, члоРяд, члоКол);
        }

        export проц дайРазм(inout цел члоРяд, inout цел члоКол)
        {
            wxGridCellAttr_GetSize(вхобъ, члоРяд, члоКол);
        }

        //-----------------------------------------------------------------------------

        export проц переполнение(бул значение) { wxGridCellAttr_SetOverflow(вхобъ, значение); }
        export бул переполнение() { return wxGridCellAttr_GetOverflow(вхобъ); }

        //-----------------------------------------------------------------------------

        export проц толькоЧтение(бул значение) { wxGridCellAttr_SetReadOnly(вхобъ, значение); }
        export бул толькоЧтение() { return wxGridCellAttr_IsReadOnly(вхобъ); }

        //-----------------------------------------------------------------------------

        export проц УстОтображатель(ОтображательЯчейкиСетки отображатель)
        {
            wxGridCellAttr_SetRenderer(вхобъ, ВизОбъект.безопУк(отображатель));
        }

        //-----------------------------------------------------------------------------

        export проц редактор(РедакторЯчейкиСетки значение) { wxGridCellAttr_SetEditor(вхобъ, ВизОбъект.безопУк(значение)); }
        /+
        export РедакторЯчейкиСетки GetEditor(Сетка сетка, цел ряд, цел кол)
        {
            return cast(РедакторЯчейкиСетки)найдиОбъект(wxGridCellAttr_GetEditor(вхобъ, ВизОбъект.безопУк(сетка), ряд, кол), &РедакторЯчейкиСетки.Нов);
        }
        +/
        //-----------------------------------------------------------------------------

        export бул естьЦветТекста() { return wxGridCellAttr_HasTextColour(вхобъ); }

        export бул естьЦветФона() { return wxGridCellAttr_HasBackgroundColour(вхобъ); }

        export бул естьШрифт() { return wxGridCellAttr_HasFont(вхобъ); }

        export бул естьраскладка() { return wxGridCellAttr_HasAlignment(вхобъ); }

        export бул естьОтображатель() { return wxGridCellAttr_HasRenderer(вхобъ); }

        export бул естьРедактор() { return wxGridCellAttr_HasEditor(вхобъ); }

        export бул естьРежимЧтенЗап() { return wxGridCellAttr_HasReadWriteMode(вхобъ); }

        //-----------------------------------------------------------------------------
        /+
        export ОтображательЯчейкиСетки GetRenderer(Сетка сетка, цел ряд, цел кол)
        {
            return cast(ОтображательЯчейкиСетки)найдиОбъект(wxGridCellAttr_GetRenderer(вхобъ, ВизОбъект.безопУк(сетка), ряд, кол), &ОтображательЯчейкиСетки.Нов);
        }
        +/
        //-----------------------------------------------------------------------------

        export проц дефАтр(АтрибутЯчейкиСетки значение) { wxGridCellAttr_SetDefAttr(вхобъ, ВизОбъект.безопУк(значение)); }
    }

        //! \cond EXTERN
        extern (C) ЦелУкз wxGridSizeEvent_ctor();
        extern (C) ЦелУкз wxGridSizeEvent_ctorParam(цел ид, цел тип, ЦелУкз объ, цел рядИлиКол, цел x, цел y, бул контрол, бул шифт, бул альт, бул мета);
        extern (C) цел    wxGridSizeEvent_GetRowOrCol(ЦелУкз сам);
        extern (C) проц   wxGridSizeEvent_GetPosition(ЦелУкз сам, inout Точка тчк);
        extern (C) бул   wxGridSizeEvent_ControlDown(ЦелУкз сам);
        extern (C) бул   wxGridSizeEvent_MetaDown(ЦелУкз сам);
        extern (C) бул   wxGridSizeEvent_ShiftDown(ЦелУкз сам);
        extern (C) бул   wxGridSizeEvent_AltDown(ЦелУкз сам);
        extern (C) проц wxGridSizeEvent_Veto(ЦелУкз сам);
        extern (C) проц wxGridSizeEvent_Allow(ЦелУкз сам);
        extern (C) бул wxGridSizeEvent_IsAllowed(ЦелУкз сам);
        //! \endcond

        //-----------------------------------------------------------------------------

    export class СобытиеРазмераСетки : Событие
    {
        export this(ЦелУкз вхобъ)
            { super(вхобъ); }

        export this()
            { this(wxGridSizeEvent_ctor()); }

        export this(цел ид, цел тип, ВизОбъект объ, цел рядИлиКол, цел x, цел y, бул контрол, бул шифт, бул альт, бул мета)
            { this(wxGridSizeEvent_ctorParam(ид, тип, ВизОбъект.безопУк(объ), рядИлиКол, x, y, контрол, шифт, альт, мета)); }

        //-----------------------------------------------------------------------------

        export цел рядИлиКолонка() { return wxGridSizeEvent_GetRowOrCol(вхобъ); }

        //-----------------------------------------------------------------------------

        export Точка позиция() {
                Точка тчк;
                wxGridSizeEvent_GetPosition(вхобъ, тчк);
                return тчк;
            }

        //-----------------------------------------------------------------------------

        export бул контролВнизу() { return wxGridSizeEvent_ControlDown(вхобъ); }

        export бул метаВнизу() { return wxGridSizeEvent_MetaDown(вхобъ); }

        export бул шифтВнизу() { return wxGridSizeEvent_ShiftDown(вхобъ); }

        export бул альтВнизу() { return wxGridSizeEvent_AltDown(вхобъ); }

        //-----------------------------------------------------------------------------

        export проц запрет()
        {
            wxGridSizeEvent_Veto(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц позволить()
        {
            wxGridSizeEvent_Allow(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export бул позволено() { return wxGridSizeEvent_IsAllowed(вхобъ); }

	private static Событие Нов(ЦелУкз объ) { return new СобытиеРазмераСетки(объ); }

	static this()
	{
			 super.Тип.СОБ_СЕТКА_РЯД_РАЗМЕР = wxEvent_EVT_GRID_ROW_SIZE();
			 super.Тип.СОБ_СЕТКА_КОЛОНКА_РАЗМЕР = wxEvent_EVT_GRID_COL_SIZE();

			добавьТипСоб( super.Тип.СОБ_СЕТКА_РЯД_РАЗМЕР,                   &СобытиеРазмераСетки.Нов);
			добавьТипСоб( super.Тип.СОБ_СЕТКА_КОЛОНКА_РАЗМЕР,                   &СобытиеРазмераСетки.Нов);
	}
    }

    //-----------------------------------------------------------------------------

	extern (C) {
        alias проц function(ОтображательЯчейкиСетки объ, ЦелУкз сетка, ЦелУкз атр, ЦелУкз ку, Прямоугольник прям, цел ряд, цел кол, бул выделен) Virtual_Draw;
        alias Размер function(ОтображательЯчейкиСетки объ, ЦелУкз сетка, ЦелУкз атр, ЦелУкз ку, цел ряд, цел кол) Virtual_GetBestSize;
        alias ЦелУкз function(ОтображательЯчейкиСетки объ) Virtual_RendererClone;
	}

        //-----------------------------------------------------------------------------

        //! \cond EXTERN
        extern (C) ЦелУкз wxGridCellRenderer_ctor();
	extern (C) проц wxGridCellRenderer_dtor(ЦелУкз сам);
        extern (C) проц wxGridCellRenderer_RegisterVirtual(ЦелУкз сам, ОтображательЯчейкиСетки объ, Virtual_Draw draw, Virtual_GetBestSize getBestSize, Virtual_RendererClone clone);
        //! \endcond

	//-----------------------------------------------------------------------------

    export abstract class ОтображательЯчейкиСетки : ТрудягаЯчейкиСетки
    {
        export this()
        {
        	this(wxGridCellRenderer_ctor(), да);

            wxGridCellRenderer_RegisterVirtual(вхобъ, this,
                &staticDoDraw,
                &staticDoGetBestSize,
                &staticDoClone);
        }

        export this(ЦелУкз вхобъ)
	{
		super(вхобъ);
	}

	private this(ЦелУкз вхобъ, бул памСобств)
	{
		super(вхобъ);
		this.памСобств = памСобств;
	}

	//export static ВизОбъект Нов(ЦелУкз ptr) { return new ОтображательЯчейкиСетки(ptr);}

	//---------------------------------------------------------------------

	override protected проц dtor() { wxGridCellRenderer_dtor(вхобъ); }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
        //-----------------------------------------------------------------------------

        static export extern (C) проц staticDoDraw(ОтображательЯчейкиСетки объ, ЦелУкз сетка, ЦелУкз атр, ЦелУкз ку, Прямоугольник прям, цел ряд, цел кол, бул выделен)
        {
            //if ( найдиОбъект(сетка) === пусто ) Console.WriteLine("сетка == пусто"); else Console.WriteLine("сетка found");
            объ.рисуй(cast(Сетка)найдиОбъект(сетка, &Сетка.Нов), cast(АтрибутЯчейкиСетки)найдиОбъект(атр, &АтрибутЯчейкиСетки.Нов), cast(КонтекстУстройства)ВизОбъект.найдиОбъект(ку), прям, ряд, кол, выделен);
        }

        export abstract проц рисуй(Сетка сетка, АтрибутЯчейкиСетки атр, КонтекстУстройства ку, Прямоугольник прям, цел ряд, цел кол, бул выделен);

        //-----------------------------------------------------------------------------

        static export extern (C) Размер staticDoGetBestSize(ОтображательЯчейкиСетки объ, ЦелУкз сетка, ЦелУкз атр, ЦелУкз ку,  цел ряд, цел кол)
        {
            return объ.дайЛучшийРазм(cast(Сетка)найдиОбъект(сетка, &Сетка.Нов), cast(АтрибутЯчейкиСетки)найдиОбъект(атр, &АтрибутЯчейкиСетки.Нов), cast(КонтекстУстройства)ВизОбъект.найдиОбъект(ку, &КонтекстУстройства.Нов), ряд, кол);

        }

        export abstract Размер дайЛучшийРазм(Сетка сетка, АтрибутЯчейкиСетки атр, КонтекстУстройства ку, цел ряд, цел кол);

        //-----------------------------------------------------------------------------

        static export extern (C) ЦелУкз staticDoClone(ОтображательЯчейкиСетки объ)
        {
            return ВизОбъект.безопУк(объ.клонируй());
        }

        export abstract ОтображательЯчейкиСетки клонируй();
    }

    //-----------------------------------------------------------------------------

        //! \cond EXTERN
        extern (C) ЦелУкз wxGridCellStringRenderer_ctor();
	extern (C) проц wxGridCellStringRenderer_dtor(ЦелУкз сам);
	extern (C) проц wxGridCellStringRenderer_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
        extern (C) проц wxGridCellStringRenderer_Draw(ЦелУкз сам, ЦелУкз сетка, ЦелУкз атр, ЦелУкз ку, inout Прямоугольник прям, цел ряд, цел кол, бул выделен);
        extern (C) проц wxGridCellStringRenderer_GetBestSize(ЦелУкз сам, ЦелУкз сетка, ЦелУкз атр, ЦелУкз ку, цел ряд, цел кол, out Размер размер);
        extern (C) ЦелУкз wxGridCellStringRenderer_Clone(ЦелУкз сам);
        //! \endcond

    export class ОтображательТекстаЯчейкиСетки : ОтображательЯчейкиСетки
    {
        export this()
	{
		this(wxGridCellStringRenderer_ctor(), да);
		wxGridCellStringRenderer_RegisterDisposable(вхобъ, &VirtualDispose);
	}

        export this(ЦелУкз вхобъ)
	{
		super(вхобъ);
	}

	private this(ЦелУкз вхобъ, бул памСобств)
	{
		super(вхобъ);
		this.памСобств = памСобств;
	}

	//---------------------------------------------------------------------

	override protected проц dtor() { wxGridCellStringRenderer_dtor(вхобъ); }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
	//---------------------------------------------------------------------

        export override проц рисуй(Сетка сетка, АтрибутЯчейкиСетки атр, КонтекстУстройства ку, Прямоугольник прям, цел ряд, цел кол, бул выделен)
        {
            wxGridCellStringRenderer_Draw(вхобъ, ВизОбъект.безопУк(сетка), ВизОбъект.безопУк(атр), ВизОбъект.безопУк(ку), прям, ряд, кол, выделен);
        }

        export override Размер дайЛучшийРазм(Сетка сетка, АтрибутЯчейкиСетки атр, КонтекстУстройства ку, цел ряд, цел кол)
        {
            Размер размер;
            wxGridCellStringRenderer_GetBestSize(вхобъ, ВизОбъект.безопУк(сетка), ВизОбъект.безопУк(атр), ВизОбъект.безопУк(ку), ряд, кол, размер);
            return размер;
        }

        export override ОтображательЯчейкиСетки клонируй()
        {
//            return cast(ОтображательЯчейкиСетки)найдиОбъект(wxGridCellStringRenderer_Clone(вхобъ), &ОтображательЯчейкиСетки.Нов);
              return new ОтображательТекстаЯчейкиСетки(wxGridCellStringRenderer_Clone(вхобъ));
        }
    }

    //-----------------------------------------------------------------------------

        extern (C) ЦелУкз wxGridCellNumberRenderer_ctor();
	extern (C) проц wxGridCellNumberRenderer_dtor(ЦелУкз сам);
        extern (C) проц wxGridCellNumberRenderer_Draw(ЦелУкз сам, ЦелУкз сетка, ЦелУкз атр, ЦелУкз ку, inout Прямоугольник прям, цел ряд, цел кол, бул выделен);
        extern (C) проц wxGridCellNumberRenderer_GetBestSize(ЦелУкз сам, ЦелУкз сетка, ЦелУкз атр, ЦелУкз ку, цел ряд, цел кол, out Размер размер);
        extern (C) ЦелУкз wxGridCellNumberRenderer_Clone(ЦелУкз сам);

    export class ОтображательЧислаЯчейкиСетки : ОтображательТекстаЯчейкиСетки
    {
        export this()
            { this(wxGridCellNumberRenderer_ctor(), да); }

        export this(ЦелУкз вхобъ)
	{
		super(вхобъ);
	}

	private this(ЦелУкз вхобъ, бул памСобств)
	{
		super(вхобъ);
		this.памСобств = памСобств;
	}

	//---------------------------------------------------------------------

	override protected проц dtor() { wxGridCellNumberRenderer_dtor(вхобъ); }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
        export override проц рисуй(Сетка сетка, АтрибутЯчейкиСетки атр, КонтекстУстройства ку, Прямоугольник прям, цел ряд, цел кол, бул выделен)
        {
            wxGridCellNumberRenderer_Draw(вхобъ, ВизОбъект.безопУк(сетка), ВизОбъект.безопУк(атр), ВизОбъект.безопУк(ку), прям, ряд, кол, выделен);
        }

        export override Размер дайЛучшийРазм(Сетка сетка, АтрибутЯчейкиСетки атр, КонтекстУстройства ку, цел ряд, цел кол)
        {
            Размер размер;
            wxGridCellNumberRenderer_GetBestSize(вхобъ, ВизОбъект.безопУк(сетка), ВизОбъект.безопУк(атр), ВизОбъект.безопУк(ку), ряд, кол, размер);
            return размер;
        }

        export override ОтображательЯчейкиСетки клонируй()
        {
        //    return cast(ОтображательЯчейкиСетки)найдиОбъект(wxGridCellNumberRenderer_Clone(вхобъ), &ОтображательЯчейкиСетки.Нов);
            return new ОтображательЧислаЯчейкиСетки(wxGridCellNumberRenderer_Clone(вхобъ));
        }
    }

    //-----------------------------------------------------------------------------

        //! \cond EXTERN
        extern (C) ЦелУкз wxGridCellFloatRenderer_ctor(цел ширь, цел точность);
	extern (C) проц wxGridCellFloatRenderer_dtor(ЦелУкз сам);
        extern (C) проц wxGridCellFloatRenderer_Draw(ЦелУкз сам, ЦелУкз сетка, ЦелУкз атр, ЦелУкз ку, inout Прямоугольник прям, цел ряд, цел кол, бул выделен);
        extern (C) проц wxGridCellFloatRenderer_GetBestSize(ЦелУкз сам, ЦелУкз сетка, ЦелУкз атр, ЦелУкз ку, цел ряд, цел кол, out Размер размер);
        extern (C) ЦелУкз wxGridCellFloatRenderer_Clone(ЦелУкз сам);
        extern (C) цел wxGridCellFloatRenderer_GetWidth(ЦелУкз сам);
        extern (C) проц wxGridCellFloatRenderer_SetWidth(ЦелУкз сам, цел ширь);
        extern (C) цел wxGridCellFloatRenderer_GetPrecision(ЦелУкз сам);
        extern (C) проц wxGridCellFloatRenderer_SetPrecision(ЦелУкз сам, цел точность);
        extern (C) проц wxGridCellFloatRenderer_SetParameters(ЦелУкз сам, ткст параметр);
        //! \endcond

    export class ОтображательПлавЧислаЯчейкиСетки : ОтображательТекстаЯчейкиСетки
    {
        export this()
            { this(-1, -1); }

        export this(цел ширь)
            { this(ширь, -1); }

        export this(цел ширь, цел точность)
            { this(wxGridCellFloatRenderer_ctor(ширь, точность), да); }

        export this(ЦелУкз вхобъ)
	{
		super(вхобъ);
	}

	private this(ЦелУкз вхобъ, бул памСобств)
	{
		super(вхобъ);
		this.памСобств = памСобств;
	}

	//---------------------------------------------------------------------

	override protected проц dtor() { wxGridCellFloatRenderer_dtor(вхобъ); }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
        export override проц устПараметры(ткст параметр)
        {
            wxGridCellFloatRenderer_SetParameters(вхобъ, параметр);
        }

        export цел ширь() { return wxGridCellFloatRenderer_GetWidth(вхобъ); }
        export проц ширь(цел значение) { wxGridCellFloatRenderer_SetWidth(вхобъ,значение); }

        export цел прецизия() { return wxGridCellFloatRenderer_GetPrecision(вхобъ); }
        export проц прецизия(цел значение) { wxGridCellFloatRenderer_SetPrecision(вхобъ, значение); }

        export override проц рисуй(Сетка сетка, АтрибутЯчейкиСетки атр, КонтекстУстройства ку, Прямоугольник прям, цел ряд, цел кол, бул выделен)
        {
            wxGridCellFloatRenderer_Draw(вхобъ, ВизОбъект.безопУк(сетка), ВизОбъект.безопУк(атр), ВизОбъект.безопУк(ку), прям, ряд, кол, выделен);
        }

        export override Размер дайЛучшийРазм(Сетка сетка, АтрибутЯчейкиСетки атр, КонтекстУстройства ку, цел ряд, цел кол)
        {
            Размер размер;
            wxGridCellFloatRenderer_GetBestSize(вхобъ, ВизОбъект.безопУк(сетка), ВизОбъект.безопУк(атр), ВизОбъект.безопУк(ку), ряд, кол, размер);
            return размер;
        }

        export override ОтображательЯчейкиСетки клонируй()
        {
//            return cast(ОтображательЯчейкиСетки)найдиОбъект(wxGridCellFloatRenderer_Clone(вхобъ), &ОтображательЯчейкиСетки.Нов);
            return new ОтображательПлавЧислаЯчейкиСетки(wxGridCellFloatRenderer_Clone(вхобъ));
        }
    }

    //-----------------------------------------------------------------------------

        //! \cond EXTERN
        extern (C) ЦелУкз wxGridCellBoolRenderer_ctor();
	extern (C) проц wxGridCellBoolRenderer_dtor(ЦелУкз сам);
	extern (C) проц wxGridCellBoolRenderer_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
        extern (C) проц wxGridCellBoolRenderer_Draw(ЦелУкз сам, ЦелУкз сетка, ЦелУкз атр, ЦелУкз ку, inout Прямоугольник прям, цел ряд, цел кол, бул выделен);
        extern (C) проц wxGridCellBoolRenderer_GetBestSize(ЦелУкз сам, ЦелУкз сетка, ЦелУкз атр, ЦелУкз ку, цел ряд, цел кол, out Размер размер);
        extern (C) ЦелУкз wxGridCellBoolRenderer_Clone(ЦелУкз сам);
        //! \endcond

    export class ОтображательБулЯчейкиСетки : ОтображательЯчейкиСетки
    {
        export this()
	{
		this(wxGridCellBoolRenderer_ctor(), да);
		wxGridCellBoolRenderer_RegisterDisposable(вхобъ, &VirtualDispose);
	}

        export this(ЦелУкз вхобъ)
	{
		super(вхобъ);
	}

	private this(ЦелУкз вхобъ, бул памСобств)
	{
		super(вхобъ);
		this.памСобств = памСобств;
	}

	//---------------------------------------------------------------------

	override protected проц dtor() { wxGridCellBoolRenderer_dtor(вхобъ); }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
        export override проц рисуй(Сетка сетка, АтрибутЯчейкиСетки атр, КонтекстУстройства ку, Прямоугольник прям, цел ряд, цел кол, бул выделен)
        {
            wxGridCellBoolRenderer_Draw(вхобъ, ВизОбъект.безопУк(сетка), ВизОбъект.безопУк(атр), ВизОбъект.безопУк(ку), прям, ряд, кол, выделен);
        }

        export override Размер дайЛучшийРазм(Сетка сетка, АтрибутЯчейкиСетки атр, КонтекстУстройства ку, цел ряд, цел кол)
        {
            Размер размер;
            wxGridCellBoolRenderer_GetBestSize(вхобъ, ВизОбъект.безопУк(сетка), ВизОбъект.безопУк(атр), ВизОбъект.безопУк(ку), ряд, кол, размер);
            return размер;
        }

        export override ОтображательЯчейкиСетки клонируй()
        {
//            return cast(ОтображательЯчейкиСетки)найдиОбъект(wxGridCellBoolRenderer_Clone(вхобъ), &ОтображательЯчейкиСетки.Нов);
            return new ОтображательБулЯчейкиСетки(wxGridCellBoolRenderer_Clone(вхобъ));
        }
    }

    //-----------------------------------------------------------------------------

        extern (C) {
        alias цел  function(ОсноваТаблицыСетки объ) Virtual_GetNumberRows;
        alias цел  function(ОсноваТаблицыСетки объ) Virtual_GetNumberCols;
        alias бул function(ОсноваТаблицыСетки объ, цел ряд, цел кол) Virtual_IsEmptyCell;
        alias ткст function(ОсноваТаблицыСетки объ, цел ряд, цел кол) Virtual_GetValue_gt;
        alias проц function(ОсноваТаблицыСетки объ, цел ряд, цел кол, ЦелУкз знач) Virtual_SetValue;
        alias бул function(ОсноваТаблицыСетки объ, цел ряд, цел кол, ЦелУкз имятипа) Virtual_CanGetValueAs;
        alias цел  function(ОсноваТаблицыСетки объ, цел ряд, цел кол) Virtual_GetValueAsLong;
        alias дво function(ОсноваТаблицыСетки объ, цел ряд, цел кол) Virtual_GetValueAsDouble;
        alias проц function(ОсноваТаблицыСетки объ, цел ряд, цел кол, цел значение) Virtual_SetValueAsLong;
        alias проц function(ОсноваТаблицыСетки объ, цел ряд, цел кол, дво значение) Virtual_SetValueAsDouble;
        alias проц function(ОсноваТаблицыСетки объ, цел ряд, цел кол, бул значение) Virtual_SetValueAsBool;
        alias ЦелУкз function(ОсноваТаблицыСетки объ, цел ряд, цел кол, ЦелУкз имятипа) Virtual_GetValueAsCustom;
        alias проц function(ОсноваТаблицыСетки объ, цел ряд, цел кол, ЦелУкз имятипа, ЦелУкз значение) Virtual_SetValueAsCustom;
        alias ткст function(ОсноваТаблицыСетки объ, цел кол) Virtual_GetColLabelValue;
        alias проц function(ОсноваТаблицыСетки объ, ЦелУкз сетка) Virtual_SetView;
        alias ЦелУкз function(ОсноваТаблицыСетки объ) Virtual_GetView;
        alias проц function(ОсноваТаблицыСетки объ) Virtual_Clear;
        alias бул function(ОсноваТаблицыСетки объ, цел поз, цел члоРядов) Virtual_InsertRows;
        alias бул function(ОсноваТаблицыСетки объ, цел члоРядов) Virtual_AppendRows;
        alias проц function(ОсноваТаблицыСетки объ, цел ряд, ЦелУкз знач) Virtual_SetRowLabelValue;
        alias проц function(ОсноваТаблицыСетки объ, ЦелУкз атрПровайдер) Virtual_SetAttrProvider;
        alias ЦелУкз function(ОсноваТаблицыСетки объ) Virtual_GetAttrProvider;
        alias бул function(ОсноваТаблицыСетки объ) Virtual_CanHaveAttributes;
        alias ЦелУкз function(ОсноваТаблицыСетки объ, цел ряд, цел кол, цел вид) Virtual_GetAttr_gt;
        alias проц function(ОсноваТаблицыСетки объ, ЦелУкз атр, цел ряд, цел кол) Virtual_SetAttr_gt;
        alias проц function(ОсноваТаблицыСетки объ, ЦелУкз атр, цел ряд) Virtual_SetRowAttr_gt;
        }

        //! \cond EXTERN
        extern (C) ЦелУкз wxGridTableBase_ctor();
        extern (C) проц wxGridTableBase_RegisterVirtual(ЦелУкз сам, ОсноваТаблицыСетки объ,
            Virtual_GetNumberRows getNumberRows,
            Virtual_GetNumberCols getNumberCols,
            Virtual_IsEmptyCell isEmptyCell,
            Virtual_GetValue_gt getValue,
            Virtual_SetValue setValue,
            Virtual_GetValue_gt getTypeName,
            Virtual_CanGetValueAs canGetValueAs,
            Virtual_CanGetValueAs canSetValueAs,
            Virtual_GetValueAsLong getValueAsLong,
            Virtual_GetValueAsDouble getValueAsDouble,
            Virtual_IsEmptyCell getValueAsBool,
            Virtual_SetValueAsLong setValueAsLong,
            Virtual_SetValueAsDouble setValueAsDouble,
            Virtual_SetValueAsBool setValueAsBool,
            Virtual_GetValueAsCustom getValueAsCustom,
            Virtual_SetValueAsCustom setValueAsCustom,
            Virtual_SetView setView,
            Virtual_GetView getView,
            Virtual_Clear очистить,
            Virtual_InsertRows insertRows,
            Virtual_AppendRows appendRows,
            Virtual_InsertRows deleteRows,
            Virtual_InsertRows insertCols,
            Virtual_AppendRows appendCols,
            Virtual_InsertRows deleteCols,
            Virtual_GetColLabelValue getRowLabelValue,
            Virtual_GetColLabelValue getColLabelValue,
            Virtual_SetRowLabelValue setRowLabelValue,
            Virtual_SetRowLabelValue setColLabelValue,
            Virtual_SetAttrProvider setAttrProvider,
            Virtual_GetAttrProvider getAttrProvider,
            Virtual_CanHaveAttributes canHaveAttributes,
            Virtual_GetAttr_gt getAttr,
            Virtual_SetAttr_gt setAttr,
            Virtual_SetRowAttr_gt setRowAttr,
            Virtual_SetRowAttr_gt setColAttr);

        extern (C) цел    wxGridTableBase_GetNumberRows(ЦелУкз сам);
        extern (C) цел    wxGridTableBase_GetNumberCols(ЦелУкз сам);
        extern (C) бул   wxGridTableBase_IsEmptyCell(ЦелУкз сам, цел ряд, цел кол);
        extern (C) ЦелУкз wxGridTableBase_GetValue(ЦелУкз сам, цел ряд, цел кол);
        extern (C) проц   wxGridTableBase_SetValue(ЦелУкз сам, цел ряд, цел кол, ЦелУкз знач);
        extern (C) ЦелУкз wxGridTableBase_GetTypeName(ЦелУкз сам, цел ряд, цел кол);
        extern (C) бул   wxGridTableBase_CanGetValueAs(ЦелУкз сам, цел ряд, цел кол, ткст имятипа);
        extern (C) бул   wxGridTableBase_CanSetValueAs(ЦелУкз сам, цел ряд, цел кол, ткст имятипа);
        extern (C) цел   wxGridTableBase_GetValueAsLong(ЦелУкз сам, цел ряд, цел кол);
        extern (C) дво wxGridTableBase_GetValueAsDouble(ЦелУкз сам, цел ряд, цел кол);
        extern (C) бул   wxGridTableBase_GetValueAsBool(ЦелУкз сам, цел ряд, цел кол);
        extern (C) проц   wxGridTableBase_SetValueAsLong(ЦелУкз сам, цел ряд, цел кол, цел знач);
        extern (C) проц   wxGridTableBase_SetValueAsDouble(ЦелУкз сам, цел ряд, цел кол, дво знач);
        extern (C) проц   wxGridTableBase_SetValueAsBool(ЦелУкз сам, цел ряд, цел кол, бул знач);
        extern (C) ЦелУкз wxGridTableBase_GetValueAsCustom(ЦелУкз сам, цел ряд, цел кол, ткст имятипа);
        extern (C) проц   wxGridTableBase_SetValueAsCustom(ЦелУкз сам, цел ряд, цел кол, ткст имятипа, ЦелУкз знач);
        extern (C) проц   wxGridTableBase_SetView(ЦелУкз сам, ЦелУкз сетка);
        extern (C) ЦелУкз wxGridTableBase_GetView(ЦелУкз сам);
        extern (C) проц   wxGridTableBase_Clear(ЦелУкз сам);
        extern (C) бул   wxGridTableBase_InsertRows(ЦелУкз сам, цел поз, цел члоРядов);
        extern (C) бул   wxGridTableBase_AppendRows(ЦелУкз сам, цел члоРядов);
        extern (C) бул   wxGridTableBase_DeleteRows(ЦелУкз сам, цел поз, цел члоРядов);
        extern (C) бул   wxGridTableBase_InsertCols(ЦелУкз сам, цел поз, цел члоКол);
        extern (C) бул   wxGridTableBase_AppendCols(ЦелУкз сам, цел члоКол);
        extern (C) бул   wxGridTableBase_DeleteCols(ЦелУкз сам, цел поз, цел члоКол);
        extern (C) ЦелУкз wxGridTableBase_GetRowLabelValue(ЦелУкз сам, цел ряд);
        extern (C) ЦелУкз wxGridTableBase_GetColLabelValue(ЦелУкз сам, цел кол);
        extern (C) проц   wxGridTableBase_SetRowLabelValue(ЦелУкз сам, цел ряд, ткст знач);
        extern (C) проц   wxGridTableBase_SetColLabelValue(ЦелУкз сам, цел кол, ткст знач);
        extern (C) проц   wxGridTableBase_SetAttrProvider(ЦелУкз сам, ЦелУкз атрПровайдер);
        extern (C) ЦелУкз wxGridTableBase_GetAttrProvider(ЦелУкз сам);
        extern (C) бул   wxGridTableBase_CanHaveAttributes(ЦелУкз сам);
        extern (C) ЦелУкз wxGridTableBase_GetAttr(ЦелУкз сам, цел ряд, цел кол, цел вид);
        extern (C) проц   wxGridTableBase_SetAttr(ЦелУкз сам, ЦелУкз атр, цел ряд, цел кол);
        extern (C) проц   wxGridTableBase_SetRowAttr(ЦелУкз сам, ЦелУкз атр, цел ряд);
        extern (C) проц   wxGridTableBase_SetColAttr(ЦелУкз сам, ЦелУкз атр, цел кол);
        //! \endcond

        //-----------------------------------------------------------------------------

    export abstract class ОсноваТаблицыСетки : ВизОбъект//ДанныеКлиента
    {
        export this()
        {
        	this(wxGridTableBase_ctor());
            wxGridTableBase_RegisterVirtual(вхобъ, this,
                &staticGetNumberRows,
                &staticGetNumberCols,
                &staticIsEmptyCell,
                &staticGetValue,
                &staticDoSetValue,
                &staticGetTypeName,
                &staticDoCanGetValueAs,
                &staticDoCanSetValueAs,
                &staticGetValueAsLong,
                &staticGetValueAsDouble,
                &staticGetValueAsBool,
                &staticSetValueAsLong,
                &staticSetValueAsDouble,
                &staticSetValueAsBool,
                &staticDoGetValueAsCustom,
                &staticDoSetValueAsCustom,
                &staticDoSetView,
                &staticDoGetView,
                &staticClear,
                &staticInsertRows,
                &staticAppendRows,
                &staticDeleteRows,
                &staticInsertCols,
                &staticAppendCols,
                &staticDeleteCols,
                &staticGetRowLabelValue,
                &staticGetColLabelValue,
                &staticDoSetRowLabelValue,
                &staticDoSetColLabelValue,
                &staticDoSetAttrProvider,
                &staticDoGetAttrProvider,
                &staticCanHaveAttributes,
                &staticDoGetAttr,
                &staticDoSetAttr,
                &staticDoSetRowAttr,
                &staticDoSetColAttr
            );
        }

        export this(ЦелУкз вхобъ)
            { super(вхобъ); }

        //export static ВизОбъект Нов(ЦелУкз ptr) { return new ОсноваТаблицыСетки(ptr); }
        //-----------------------------------------------------------------------------

        static export extern (C) цел staticGetNumberRows(ОсноваТаблицыСетки объ)
        {
            return объ.дайЧлоРядов();
        }
        export abstract цел дайЧлоРядов();
//        {
//            return wxGridTableBase_GetNumberRows(вхобъ);
//        }

        static export extern (C) цел staticGetNumberCols(ОсноваТаблицыСетки объ)
        {
            return объ.дайЧлоКолонок();
        }
        export abstract цел дайЧлоКолонок();
//        {
//            return wxGridTableBase_GetNumberCols(вхобъ);
//        }

        //-----------------------------------------------------------------------------

        static export extern (C) бул staticIsEmptyCell(ОсноваТаблицыСетки объ, цел ряд, цел кол)
        {
            return объ.пустаяЯчейка_ли(ряд,кол);
        }
        export abstract бул пустаяЯчейка_ли(цел ряд, цел кол);
//        {
//            return wxGridTableBase_IsEmptyCell(вхобъ, ряд, кол);
//        }

        //-----------------------------------------------------------------------------

        static export extern (C) ткст staticGetValue(ОсноваТаблицыСетки объ, цел ряд, цел кол)
        {
            return объ.дайЗначение(ряд,кол);
        }
        export abstract ткст дайЗначение(цел ряд, цел кол);
//        {
//            return cast(ткст) new ВизТкст(wxGridTableBase_GetValue(вхобъ, ряд, кол), да);
//        }

        static export extern (C) проц staticDoSetValue(ОсноваТаблицыСетки объ, цел ряд, цел кол, ЦелУкз знач)
        {
            объ.устЗначение(ряд, кол, cast(ткст) new ВизТкст(знач));
        }

        export abstract проц устЗначение(цел ряд, цел кол, ткст знач);
//        {
//            wxGridTableBase_SetValue(вхобъ, ряд, кол, знач);
//        }

        //-----------------------------------------------------------------------------

        static export extern (C) ткст staticGetTypeName(ОсноваТаблицыСетки объ, цел ряд, цел кол)
        {
            return объ.дайИмяТипа(ряд,кол);
        }
        export  ткст дайИмяТипа(цел ряд, цел кол)
        {
            return cast(ткст) new ВизТкст(wxGridTableBase_GetTypeName(вхобъ, ряд, кол), да);
        }

        static export extern (C) бул staticDoCanGetValueAs(ОсноваТаблицыСетки объ, цел ряд, цел кол, ЦелУкз имятипа)
        {
            return объ.можноПолучитьЗначениеКак(ряд, кол, cast(ткст) new ВизТкст(имятипа));
        }

        export  бул можноПолучитьЗначениеКак(цел ряд, цел кол, ткст имятипа)
        {
            return wxGridTableBase_CanGetValueAs(вхобъ, ряд, кол, имятипа);
        }

        static export extern (C) бул staticDoCanSetValueAs(ОсноваТаблицыСетки объ, цел ряд, цел кол, ЦелУкз имятипа)
        {
            return объ.можноУстановитьЗначениеКак(ряд, кол, cast(ткст) new ВизТкст(имятипа));
        }

        export  бул можноУстановитьЗначениеКак(цел ряд, цел кол, ткст имятипа)
        {
            return wxGridTableBase_CanSetValueAs(вхобъ, ряд, кол, имятипа);
        }

        //-----------------------------------------------------------------------------

        static export extern (C) цел staticGetValueAsLong(ОсноваТаблицыСетки объ, цел ряд, цел кол)
	{
	    return объ.дайЗначениеКакДол(ряд,кол);
	}
        export  цел дайЗначениеКакДол(цел ряд, цел кол)
        {
            return wxGridTableBase_GetValueAsLong(вхобъ, ряд, кол);
        }

        static export extern (C) дво staticGetValueAsDouble(ОсноваТаблицыСетки объ, цел ряд, цел кол)
	{
	    return объ.дайЗначениеКакДво(ряд,кол);
	}
        export  дво дайЗначениеКакДво(цел ряд, цел кол)
        {
            return wxGridTableBase_GetValueAsDouble(вхобъ, ряд, кол);
        }

        static export extern (C) бул staticGetValueAsBool(ОсноваТаблицыСетки объ, цел ряд, цел кол)
	{
	    return объ.дайЗначениеКакБул(ряд,кол);
	}
        export  бул дайЗначениеКакБул(цел ряд, цел кол)
        {
            return wxGridTableBase_GetValueAsBool(вхобъ, ряд, кол);
        }

        //-----------------------------------------------------------------------------

        static export extern (C) проц staticSetValueAsLong(ОсноваТаблицыСетки объ, цел ряд, цел кол, цел знач)
	{
	    return объ.устЗначениеКакДол(ряд,кол,знач);
	}
        export  проц устЗначениеКакДол(цел ряд, цел кол, цел знач)
        {
            wxGridTableBase_SetValueAsLong(вхобъ, ряд, кол, знач);
        }

        static export extern (C) проц staticSetValueAsDouble(ОсноваТаблицыСетки объ, цел ряд, цел кол, дво знач)
	{
	    return объ.устЗначениеКакДво(ряд,кол,знач);
	}
        export  проц устЗначениеКакДво(цел ряд, цел кол, дво знач)
        {
            wxGridTableBase_SetValueAsDouble(вхобъ, ряд, кол, знач);
        }

        static export extern (C) проц staticSetValueAsBool(ОсноваТаблицыСетки объ, цел ряд, цел кол, бул знач)
	{
	    return объ.устЗначениеКакБул(ряд,кол,знач);
	}
        export  проц устЗначениеКакБул(цел ряд, цел кол, бул знач)
        {
            wxGridTableBase_SetValueAsBool(вхобъ, ряд, кол, знач);
        }

        //-----------------------------------------------------------------------------

        static export extern (C) ЦелУкз staticDoGetValueAsCustom(ОсноваТаблицыСетки объ, цел ряд, цел кол, ЦелУкз имятипа)
        {
            return ВизОбъект.безопУк(объ.дайЗначениеКакКастом(ряд, кол, cast(ткст) new ВизТкст(имятипа)));
        }

        export  ВизОбъект дайЗначениеКакКастом(цел ряд, цел кол, ткст имятипа)
        {
            return найдиОбъект(wxGridTableBase_GetValueAsCustom(вхобъ, ряд, кол, имятипа));
        }

        static export extern (C) проц staticDoSetValueAsCustom(ОсноваТаблицыСетки объ, цел ряд, цел кол, ЦелУкз имятипа, ЦелУкз знач)
        {
            объ.устЗначениеКакКастом(ряд, кол, cast(ткст) new ВизТкст(имятипа), найдиОбъект(знач));
        }

        export  проц устЗначениеКакКастом(цел ряд, цел кол, ткст имятипа, ВизОбъект знач)
        {
            wxGridTableBase_SetValueAsCustom(вхобъ, ряд, кол, имятипа, ВизОбъект.безопУк(знач));
        }

        //-----------------------------------------------------------------------------

        static export extern (C) проц staticDoSetView(ОсноваТаблицыСетки объ, ЦелУкз сетка)
        {
            объ.устОбзор(cast(Сетка)найдиОбъект(сетка, &Сетка.Нов));
        }

        export  проц устОбзор(Сетка сетка)
        {
            wxGridTableBase_SetView(вхобъ, ВизОбъект.безопУк(сетка));
        }

        static export extern (C) ЦелУкз staticDoGetView(ОсноваТаблицыСетки объ)
        {
            return ВизОбъект.безопУк(объ.дайОбзор());
        }

        export  Сетка дайОбзор()
        {
            return cast(Сетка)найдиОбъект(wxGridTableBase_GetView(вхобъ), &Сетка.Нов);
        }

        //-----------------------------------------------------------------------------

        static export extern (C) проц staticClear(ОсноваТаблицыСетки объ)
	{
	    объ.очисть();
	}
        export  проц очисть()
        {
            wxGridTableBase_Clear(вхобъ);
        }

        //-----------------------------------------------------------------------------

        static export extern (C) бул staticInsertRows(ОсноваТаблицыСетки объ, цел поз, цел члоРядов)
	{
	    return объ.вставьРяды(поз, члоРядов);
	}
        export  бул вставьРяды(цел поз, цел члоРядов)
        {
            return wxGridTableBase_InsertRows(вхобъ, поз, члоРядов);
        }

        static export extern (C) бул staticAppendRows(ОсноваТаблицыСетки объ, цел члоРядов)
        {
            return объ.добавьРяды(члоРядов);
        }
        export  бул добавьРяды(цел члоРядов)
        {
            return wxGridTableBase_AppendRows(вхобъ, члоРядов);
        }

        static export extern (C) бул staticDeleteRows(ОсноваТаблицыСетки объ, цел поз, цел члоРядов)
	{
	    return объ.удалиРяды(поз, члоРядов);
	}
        export  бул удалиРяды(цел поз, цел члоРядов)
        {
            return wxGridTableBase_DeleteRows(вхобъ, поз, члоРядов);
        }

        //-----------------------------------------------------------------------------

        static export extern (C) бул staticInsertCols(ОсноваТаблицыСетки объ, цел поз, цел члоКол)
	{
	    return объ.вставьКолонки(поз, члоКол);
	}
        export  бул вставьКолонки(цел поз, цел члоКол)
        {
            return wxGridTableBase_InsertCols(вхобъ, поз, члоКол);
        }

        static export extern (C) бул staticAppendCols(ОсноваТаблицыСетки объ, цел члоКол)
        {
            return объ.добавьКолонки(члоКол);
        }
        export  бул добавьКолонки(цел члоКол)
        {
            return wxGridTableBase_AppendCols(вхобъ, члоКол);
        }

        static export extern (C) бул staticDeleteCols(ОсноваТаблицыСетки объ, цел поз, цел члоКол)
	{
	    return объ.удалиКолонки(поз, члоКол);
	}
        export  бул удалиКолонки(цел поз, цел члоКол)
        {
            return wxGridTableBase_DeleteCols(вхобъ, поз, члоКол);
        }

        //-----------------------------------------------------------------------------

        static export extern (C) ткст staticGetRowLabelValue(ОсноваТаблицыСетки объ, цел ряд)
        {
            return объ.дайЗначениеЯрлыкаРяда(ряд);
        }
        export  ткст дайЗначениеЯрлыкаРяда(цел ряд)
        {
            return cast(ткст) new ВизТкст(wxGridTableBase_GetRowLabelValue(вхобъ, ряд), да);
        }

        static export extern (C) ткст staticGetColLabelValue(ОсноваТаблицыСетки объ, цел кол)
        {
            return объ.дайЗначениеЯрлыкаКолонки(кол);
        }
        export  ткст дайЗначениеЯрлыкаКолонки(цел кол)
        {
            return cast(ткст) new ВизТкст(wxGridTableBase_GetColLabelValue(вхобъ, кол), да);
        }

        static export extern (C) проц staticDoSetRowLabelValue(ОсноваТаблицыСетки объ, цел ряд, ЦелУкз знач)
        {
            объ.устЗначениеЯрлыкаРяда(ряд, cast(ткст) new ВизТкст(знач));
        }

        export  проц устЗначениеЯрлыкаРяда(цел ряд, ткст знач)
        {
            wxGridTableBase_SetRowLabelValue(вхобъ, ряд, знач);
        }

        static export extern (C) проц staticDoSetColLabelValue(ОсноваТаблицыСетки объ, цел кол, ЦелУкз знач)
        {
            объ.устЗначениеЯрлыкаКолонки(кол, cast(ткст) new ВизТкст(знач));
        }

        export  проц устЗначениеЯрлыкаКолонки(цел кол, ткст знач)
        {
            wxGridTableBase_SetColLabelValue(вхобъ, кол, знач);
        }

        //-----------------------------------------------------------------------------

        static export extern (C) проц staticDoSetAttrProvider(ОсноваТаблицыСетки объ, ЦелУкз атрПровайдер)
        {
            объ.устПровайдерАтра(cast(ПровайдерАтрибутаЯчейкиСетки)найдиОбъект(атрПровайдер, &ПровайдерАтрибутаЯчейкиСетки.Нов));
        }

        export проц устПровайдерАтра(ПровайдерАтрибутаЯчейкиСетки атрПровайдер)
        {
            wxGridTableBase_SetAttrProvider(вхобъ, ВизОбъект.безопУк(атрПровайдер));
        }

        static export extern (C) ЦелУкз staticDoGetAttrProvider(ОсноваТаблицыСетки объ)
        {
            return ВизОбъект.безопУк(объ.дайПровайдерАтра());
        }

        export ПровайдерАтрибутаЯчейкиСетки дайПровайдерАтра()
        {
            return new ПровайдерАтрибутаЯчейкиСетки(wxGridTableBase_GetAttrProvider(вхобъ));
        }

        static export extern (C) бул staticCanHaveAttributes(ОсноваТаблицыСетки объ)
        {
            return объ.можетИметьАтрибуты();
        }
        export  бул можетИметьАтрибуты()
        {
            return wxGridTableBase_CanHaveAttributes(вхобъ);
        }

        //-----------------------------------------------------------------------------

        static export extern (C) ЦелУкз staticDoGetAttr(ОсноваТаблицыСетки объ, цел ряд, цел кол, цел вид)
        {
            return ВизОбъект.безопУк(объ.дайАтр(ряд, кол, cast(АтрибутЯчейкиСетки.ПВидАтра) вид));
        }

        export  АтрибутЯчейкиСетки дайАтр(цел ряд, цел кол, АтрибутЯчейкиСетки.ПВидАтра вид)
        {
            return cast(АтрибутЯчейкиСетки)найдиОбъект(wxGridTableBase_GetAttr(вхобъ, ряд, кол, cast(цел)вид), &АтрибутЯчейкиСетки.Нов);
        }

        static export extern (C) проц staticDoSetAttr(ОсноваТаблицыСетки объ, ЦелУкз атр, цел ряд, цел кол)
        {
            объ.устАтр(cast(АтрибутЯчейкиСетки)найдиОбъект(атр, &АтрибутЯчейкиСетки.Нов), ряд, кол);
        }

        export  проц устАтр(АтрибутЯчейкиСетки атр, цел ряд, цел кол)
        {
            wxGridTableBase_SetAttr(вхобъ, ВизОбъект.безопУк(атр), ряд, кол);
        }

        //-----------------------------------------------------------------------------

        static export extern (C) проц staticDoSetRowAttr(ОсноваТаблицыСетки объ, ЦелУкз атр, цел ряд)
        {
            объ.устАтрРяда(cast(АтрибутЯчейкиСетки)найдиОбъект(атр, &АтрибутЯчейкиСетки.Нов), ряд);
        }

        export  проц устАтрРяда(АтрибутЯчейкиСетки атр, цел ряд)
        {
            wxGridTableBase_SetRowAttr(вхобъ, ВизОбъект.безопУк(атр), ряд);
        }

        static export extern (C) проц staticDoSetColAttr(ОсноваТаблицыСетки объ, ЦелУкз атр, цел кол)
        {
            объ.устАтрКолонки(cast(АтрибутЯчейкиСетки)найдиОбъект(атр, &АтрибутЯчейкиСетки.Нов), кол);
        }

        export  проц устАтрКолонки(АтрибутЯчейкиСетки атр, цел кол)
        {
            wxGridTableBase_SetColAttr(вхобъ, ВизОбъект.безопУк(атр), кол);
        }
    }

	extern (C) {
        alias ЦелУкз function(ПровайдерАтрибутаЯчейкиСетки объ, цел ряд, цел кол, цел вид) Virtual_GetAttr;
        alias проц function(ПровайдерАтрибутаЯчейкиСетки объ, ЦелУкз атр, цел ряд, цел кол) Virtual_SetAttr;
        alias проц function(ПровайдерАтрибутаЯчейкиСетки объ, ЦелУкз атр, цел ряд) Virtual_SetRowAttr;
	}

        //! \cond EXTERN
        extern (C) ЦелУкз wxGridCellAttrProvider_ctor();
	extern (C) проц wxGridCellAttrProvider_dtor(ЦелУкз сам);
        extern (C) проц wxGridCellAttrProvider_RegisterVirtual(ЦелУкз сам,ПровайдерАтрибутаЯчейкиСетки объ,
            Virtual_GetAttr getAttr,
            Virtual_SetAttr setAttr,
            Virtual_SetRowAttr setRowAttr,
            Virtual_SetRowAttr setColAttr);
	extern (C) проц wxGridCellAttrProvider_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
        extern (C) ЦелУкз wxGridCellAttrProvider_GetAttr(ЦелУкз сам, цел ряд, цел кол, цел вид);
        extern (C) проц wxGridCellAttrProvider_SetAttr(ЦелУкз сам, ЦелУкз атр, цел ряд, цел кол);
        extern (C) проц wxGridCellAttrProvider_SetRowAttr(ЦелУкз сам, ЦелУкз атр, цел ряд);
        extern (C) проц wxGridCellAttrProvider_SetColAttr(ЦелУкз сам, ЦелУкз атр, цел кол);
        extern (C) проц wxGridCellAttrProvider_UpdateAttrRows(ЦелУкз сам, цел поз, цел члоРядов);
        extern (C) проц wxGridCellAttrProvider_UpdateAttrCols(ЦелУкз сам, цел поз, цел члоКол);
        //! \endcond

        //-----------------------------------------------------------------------------

    export class ПровайдерАтрибутаЯчейкиСетки : ВизОбъект  // ДанныеКлиента
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
        	this(wxGridCellAttrProvider_ctor(), да);

            wxGridCellAttrProvider_RegisterVirtual(вхобъ,this,
                &staticDoGetAttr,
                &staticDoSetAttr,
                &staticDoSetRowAttr,
                &staticDoSetColAttr);

		wxGridCellAttrProvider_RegisterDisposable(вхобъ, &VirtualDispose);
        }

	export static ВизОбъект Нов(ЦелУкз ptr) { return new ПровайдерАтрибутаЯчейкиСетки(ptr); }
	//---------------------------------------------------------------------

	override protected проц dtor() { wxGridCellAttrProvider_dtor(вхобъ); }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
        //-----------------------------------------------------------------------------

        static export extern (C) ЦелУкз staticDoGetAttr(ПровайдерАтрибутаЯчейкиСетки объ, цел ряд, цел кол, цел вид)
        {
            return ВизОбъект.безопУк(объ.дайАтр(ряд, кол, cast(АтрибутЯчейкиСетки.ПВидАтра) вид));
        }

        export  АтрибутЯчейкиСетки дайАтр(цел ряд, цел кол, АтрибутЯчейкиСетки.ПВидАтра вид)
        {
            return cast(АтрибутЯчейкиСетки)найдиОбъект(wxGridCellAttrProvider_GetAttr(вхобъ, ряд, кол, cast(цел)вид), &АтрибутЯчейкиСетки.Нов);
        }

        static export extern (C) проц staticDoSetAttr(ПровайдерАтрибутаЯчейкиСетки объ, ЦелУкз атр, цел ряд, цел кол)
        {
            объ.устАтр(cast(АтрибутЯчейкиСетки)найдиОбъект(атр, &АтрибутЯчейкиСетки.Нов), ряд, кол);
        }

        export  проц устАтр(АтрибутЯчейкиСетки атр, цел ряд, цел кол)
        {
            wxGridCellAttrProvider_SetAttr(вхобъ, ВизОбъект.безопУк(атр), ряд, кол);
        }

        //-----------------------------------------------------------------------------

        static export extern (C) проц staticDoSetRowAttr(ПровайдерАтрибутаЯчейкиСетки объ, ЦелУкз атр, цел ряд)
        {
            объ.устАтрРяда(cast(АтрибутЯчейкиСетки)найдиОбъект(атр, &АтрибутЯчейкиСетки.Нов), ряд);
        }

        export  проц устАтрРяда(АтрибутЯчейкиСетки атр, цел ряд)
        {
            wxGridCellAttrProvider_SetRowAttr(вхобъ, ВизОбъект.безопУк(атр), ряд);
        }

        static export extern (C) проц staticDoSetColAttr(ПровайдерАтрибутаЯчейкиСетки объ, ЦелУкз атр, цел кол)
        {
            объ.устАтрКолонки(cast(АтрибутЯчейкиСетки)найдиОбъект(атр, &АтрибутЯчейкиСетки.Нов), кол);
        }

        export  проц устАтрКолонки(АтрибутЯчейкиСетки атр, цел кол)
        {
            wxGridCellAttrProvider_SetColAttr(вхобъ, ВизОбъект.безопУк(атр), кол);
        }

        //-----------------------------------------------------------------------------

        export проц обновиРядыАтра(цел поз, цел члоРядов)
        {
            wxGridCellAttrProvider_UpdateAttrRows(вхобъ, поз, члоРядов);
        }

        export проц оьновиКолонкиАтра(цел поз, цел члоКол)
        {
            wxGridCellAttrProvider_UpdateAttrCols(вхобъ, поз, члоКол);
        }
    }
