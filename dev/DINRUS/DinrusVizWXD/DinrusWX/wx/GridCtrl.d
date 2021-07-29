module wx.GridCtrl;
public import wx.common;
public import wx.Grid;

		//! \cond EXTERN
		extern (C) ЦелУкз wxGridCellDateTimeRenderer_ctor(ткст выхфм, ткст вхофм);
		extern (C) проц wxGridCellDateTimeRenderer_dtor(ЦелУкз сам);
		extern (C) проц wxGridCellDateTimeRenderer_Draw(ЦелУкз сам, ЦелУкз сетка, ЦелУкз атр, ЦелУкз ку, inout Прямоугольник прям, цел ряд, цел кол, бул выделен);
		extern (C) проц wxGridCellDateTimeRenderer_GetBestSize(ЦелУкз сам, ЦелУкз сетка, ЦелУкз атр, ЦелУкз ку, цел ряд, цел кол, out Размер размер);
		extern (C) ЦелУкз wxGridCellDateTimeRenderer_Clone(ЦелУкз сам);
		extern (C) проц wxGridCellDateTimeRenderer_SetParameters(ЦелУкз сам, ткст параметр);
		//! \endcond

	export class ОтображательДатыВремениЯчейкиСетки : ОтображательТекстаЯчейкиСетки
	{
		export this()
			{ this("%c", "%c");}

		export this(ткст выхфм)
			{ this(выхфм, "%c");}

		export this(ткст выхфм, ткст вхофм)
			{ this(wxGridCellDateTimeRenderer_ctor(выхфм, вхофм), да);}

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

		override protected проц dtor() { wxGridCellDateTimeRenderer_dtor(вхобъ); }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
		export override проц устПараметры(ткст параметр)
		{
			wxGridCellDateTimeRenderer_SetParameters(вхобъ, параметр);
		}

		export override проц рисуй(Сетка сетка, АтрибутЯчейкиСетки атр, КонтекстУстройства ку, Прямоугольник прям, цел ряд, цел кол, бул выделен)
		{
			wxGridCellDateTimeRenderer_Draw(вхобъ, ВизОбъект.безопУк(сетка), ВизОбъект.безопУк(атр), ВизОбъект.безопУк(ку), прям, ряд, кол, выделен);
		}

		export override Размер дайЛучшийРазм(Сетка сетка, АтрибутЯчейкиСетки атр, КонтекстУстройства ку, цел ряд, цел кол)
		{
			Размер размер;
			wxGridCellDateTimeRenderer_GetBestSize(вхобъ, ВизОбъект.безопУк(сетка), ВизОбъект.безопУк(атр), ВизОбъект.безопУк(ку), ряд, кол, размер);
			return размер;
		}

		export override ОтображательЯчейкиСетки клонируй()
		{
//			return cast(ОтображательЯчейкиСетки)найдиОбъект(wxGridCellDateTimeRenderer_Clone(вхобъ), &GridCellRendererer.Нов);
			return new ОтображательДатыВремениЯчейкиСетки(wxGridCellDateTimeRenderer_Clone(вхобъ));
		}
	}

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		extern (C) ЦелУкз wxGridCellEnumRenderer_ctor(цел ч, ткст0 выборы);
		extern (C) проц wxGridCellEnumRenderer_dtor(ЦелУкз сам);
		extern (C) проц wxGridCellEnumRenderer_Draw(ЦелУкз сам, ЦелУкз сетка, ЦелУкз атр, ЦелУкз ку, inout Прямоугольник прям, цел ряд, цел кол, бул выделен);
		extern (C) проц wxGridCellEnumRenderer_GetBestSize(ЦелУкз сам, ЦелУкз сетка, ЦелУкз атр, ЦелУкз ку, цел ряд, цел кол, out Размер размер);
		extern (C) ЦелУкз wxGridCellEnumRenderer_Clone(ЦелУкз сам);
		extern (C) проц wxGridCellEnumRenderer_SetParameters(ЦелУкз сам, ткст параметр);
		//! \endcond

	export class ОтображательПеречняЯчейкиСетки : ОтображательТекстаЯчейкиСетки
	{
		export this()
			{ this(cast(ткст[])пусто);}

		export this(ткст[] выборы)
			{ this(wxGridCellEnumRenderer_ctor(выборы.length, cast(ткст0) выборы.ptr), да);}

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

		private override проц dtor() { wxGridCellEnumRenderer_dtor(вхобъ); }

		export override проц устПараметры(ткст параметр)
		{
			wxGridCellEnumRenderer_SetParameters(вхобъ, параметр);
		}

		export override проц рисуй(Сетка сетка, АтрибутЯчейкиСетки атр, КонтекстУстройства ку, Прямоугольник прям, цел ряд, цел кол, бул выделен)
		{
			wxGridCellEnumRenderer_Draw(вхобъ, ВизОбъект.безопУк(сетка), ВизОбъект.безопУк(атр), ВизОбъект.безопУк(ку), прям, ряд, кол, выделен);
		}

		export override Размер дайЛучшийРазм(Сетка сетка, АтрибутЯчейкиСетки атр, КонтекстУстройства ку, цел ряд, цел кол)
		{
			Размер размер;
			wxGridCellEnumRenderer_GetBestSize(вхобъ, ВизОбъект.безопУк(сетка), ВизОбъект.безопУк(атр), ВизОбъект.безопУк(ку), ряд, кол, размер);
			return размер;
		}

		export override ОтображательЯчейкиСетки клонируй()
		{
//			return cast(ОтображательЯчейкиСетки)найдиОбъект(wxGridCellEnumRenderer_Clone(вхобъ), &ОтображательЯчейкиСетки.Нов);
			return new ОтображательПеречняЯчейкиСетки(wxGridCellEnumRenderer_Clone(вхобъ));
		}
	}

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		extern (C) ЦелУкз wxGridCellEnumEditor_ctor(цел ч, ткст[] выборы);
		extern (C) проц wxGridCellEnumEditor_dtor(ЦелУкз сам);
		extern (C) проц wxGridCellEnumEditor_BeginEdit(ЦелУкз сам, цел ряд, цел кол, ЦелУкз сетка);
		extern (C) бул wxGridCellEnumEditor_EndEdit(ЦелУкз сам, цел ряд, цел кол, ЦелУкз сетка);
		extern (C) ЦелУкз wxGridCellEnumEditor_Clone(ЦелУкз сам);
		//! \endcond

	export class РедакторПеречняЯчейкиСетки : РедакторВыбораЯчейкиСетки
	{
		export this()
			{ this(cast(ткст[])пусто);}

		export this(ткст[] выборы)
			{ this(wxGridCellEnumEditor_ctor(выборы.length, выборы), да);}

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

		private override проц dtor() { wxGridCellEnumEditor_dtor(вхобъ); }

		export override проц начниРед(цел ряд, цел кол, Сетка сетка)
		{
			wxGridCellEnumEditor_BeginEdit(вхобъ, ряд, кол, ВизОбъект.безопУк(сетка));
		}

		export override бул завершиРед(цел ряд, цел кол, Сетка сетка)
		{
			return wxGridCellEnumEditor_EndEdit(вхобъ, ряд, кол, ВизОбъект.безопУк(сетка));
		}

		export override РедакторЯчейкиСетки клонируй()
		{
//			return cast(РедакторЯчейкиСетки)найдиОбъект(wxGridCellEnumEditor_Clone(вхобъ), &РедакторЯчейкиСетки.Нов);
			return new РедакторПеречняЯчейкиСетки(wxGridCellEnumEditor_Clone(вхобъ));
		}
	}

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		extern (C) ЦелУкз wxGridCellAutoWrapStringEditor_ctor();
		extern (C) проц wxGridCellAutoWrapStringEditor_dtor(ЦелУкз сам);
		extern (C) проц wxGridCellAutoWrapStringEditor_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
		extern (C) проц wxGridCellAutoWrapStringEditor_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, ЦелУкз собОбр);
		extern (C) ЦелУкз wxGridCellAutoWrapStringEditor_Clone(ЦелУкз сам);
		//! \endcond

	export class РедакторАвтоВыравниванияТекстаЯчейкиСетки : РедакторТекстаЯчейкиСетки
	{
		export this()
		{
			this(wxGridCellAutoWrapStringEditor_ctor(), да);
			wxGridCellAutoWrapStringEditor_RegisterDisposable(вхобъ, &VirtualDispose);
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

		override protected проц dtor() { wxGridCellAutoWrapStringEditor_dtor(вхобъ); }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
		export override проц создай(Окно родитель, цел ид, ОбработчикСоб собОбр)
		{
			wxGridCellAutoWrapStringEditor_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, ВизОбъект.безопУк(собОбр));
		}

		export override РедакторЯчейкиСетки клонируй()
		{
//			return cast(РедакторЯчейкиСетки)найдиОбъект(wxGridCellAutoWrapStringEditor_Clone(вхобъ), &РедакторЯчейкиСетки.Нов);
			return new РедакторАвтоВыравниванияТекстаЯчейкиСетки(wxGridCellAutoWrapStringEditor_Clone(вхобъ));

		}
	}

	//-----------------------------------------------------------------------------

		//! \cond EXTERN
		extern (C) ЦелУкз wxGridCellAutoWrapStringRenderer_ctor();
		extern (C) проц wxGridCellAutoWrapStringRenderer_dtor(ЦелУкз сам);
		extern (C) проц   wxGridCellAutoWrapStringRenderer_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
		extern (C) проц wxGridCellAutoWrapStringRenderer_Draw(ЦелУкз сам, ЦелУкз сетка, ЦелУкз атр, ЦелУкз ку, inout Прямоугольник прям, цел ряд, цел кол, бул выделен);
		extern (C) проц wxGridCellAutoWrapStringRenderer_GetBestSize(ЦелУкз сам, ЦелУкз сетка, ЦелУкз атр, ЦелУкз ку, цел ряд, цел кол, out Размер размер);
		extern (C) ЦелУкз wxGridCellAutoWrapStringRenderer_Clone(ЦелУкз сам);
		//! \endcond

	export class ОтображательАвтоВыравниванияТекстаЯчейкиСетки : ОтображательТекстаЯчейкиСетки
	{
		export this()
		{
			this(wxGridCellAutoWrapStringRenderer_ctor(), да);
			wxGridCellAutoWrapStringRenderer_RegisterDisposable(вхобъ, &VirtualDispose);
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

		override protected проц dtor() { wxGridCellAutoWrapStringRenderer_dtor(вхобъ); }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
		export override проц рисуй(Сетка сетка, АтрибутЯчейкиСетки атр, КонтекстУстройства ку, Прямоугольник прям, цел ряд, цел кол, бул выделен)
		{
			wxGridCellAutoWrapStringRenderer_Draw(вхобъ, ВизОбъект.безопУк(сетка), ВизОбъект.безопУк(атр), ВизОбъект.безопУк(ку), прям, ряд, кол, выделен);
		}

		export override Размер дайЛучшийРазм(Сетка сетка, АтрибутЯчейкиСетки атр, КонтекстУстройства ку, цел ряд, цел кол)
		{
			Размер размер;
			wxGridCellAutoWrapStringRenderer_GetBestSize(вхобъ, ВизОбъект.безопУк(сетка), ВизОбъект.безопУк(атр), ВизОбъект.безопУк(ку), ряд, кол, размер);
			return размер;
		}

		export override ОтображательЯчейкиСетки клонируй()
		{
		//	return cast(ОтображательЯчейкиСетки)найдиОбъект(wxGridCellAutoWrapStringRenderer_Clone(вхобъ), &ОтображательЯчейкиСетки.Нов);
			return new ОтображательАвтоВыравниванияТекстаЯчейкиСетки(wxGridCellAutoWrapStringRenderer_Clone(вхобъ));
		}
	}
