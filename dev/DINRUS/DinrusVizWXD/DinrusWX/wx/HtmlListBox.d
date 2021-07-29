module wx.HtmlListBox;
public import wx.common;
public import wx.VLBox;

		//-----------------------------------------------------------------------------

		//! \cond EXTERN
		extern (C) {
		alias проц function(БоксСпискаГЯР объ) Virtual_VoidNoParams;
		alias проц function(БоксСпискаГЯР объ, цел ч) Virtual_VoidSizeT;
		alias ткст function(БоксСпискаГЯР объ, цел ч) Virtual_wxStringSizeT;
		alias ЦелУкз function(БоксСпискаГЯР объ, ЦелУкз цвет) Virtual_ЦветЦвет;
		alias проц function(БоксСпискаГЯР объ, ЦелУкз ку, inout Прямоугольник прям, цел ч) Virtual_OnDrawItem;
		alias цел function(БоксСпискаГЯР объ, цел ч) Virtual_OnMeasureItem;
		}

		extern (C) ЦелУкз wxHtmlListBox_ctor2(ЦелУкз родитель, цел ид, inout Точка поз, inout Размер размер, бцел стиль, ткст имя);
		extern (C) проц wxHtmlListBox_RegisterVirtual(ЦелУкз сам,БоксСпискаГЯР объ,
			Virtual_VoidNoParams refreshAll,
			Virtual_VoidSizeT setItemCount,
			Virtual_wxStringSizeT onGetItem,
			Virtual_wxStringSizeT onGetItemMarkup,
			Virtual_ЦветЦвет getSelectedTextColour,
			Virtual_ЦветЦвет getSelectedTextBgColour,
			Virtual_OnDrawItem onDrawItem,
			Virtual_OnMeasureItem onMeasureItem,
			Virtual_OnDrawItem onDrawSeparator,
			Virtual_OnDrawItem onDrawBackground,
			Virtual_OnMeasureItem onGetLineHeight);
		extern (C) бул wxHtmlListBox_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер размер, цел стиль, ткст имя);
		extern (C) проц wxHtmlListBox_RefreshAll(ЦелУкз сам);
		extern (C) проц wxHtmlListBox_SetItemCount(ЦелУкз сам, цел счёт);
		extern (C) ЦелУкз wxHtmlListBox_OnGetItemMarkup(ЦелУкз сам, цел ч);
		extern (C) ЦелУкз wxHtmlListBox_GetSelectedTextColour(ЦелУкз сам, ЦелУкз цветПП);
		extern (C) ЦелУкз wxHtmlListBox_GetSelectedTextBgColour(ЦелУкз сам, ЦелУкз цветЗП);
		extern (C) проц wxHtmlListBox_OnDrawItem(ЦелУкз сам, ЦелУкз ку, inout Прямоугольник прям, цел ч);
		extern (C) цел wxHtmlListBox_OnMeasureItem(ЦелУкз сам, цел ч);
		extern (C) проц wxHtmlListBox_OnSize(ЦелУкз сам, ЦелУкз соб);
		extern (C) проц wxHtmlListBox_Init(ЦелУкз сам);
		extern (C) проц wxHtmlListBox_CacheItem(ЦелУкз сам, цел ч);

		extern (C) проц wxHtmlListBox_OnDrawSeparator(ЦелУкз сам, ЦелУкз ку, inout Прямоугольник прям, цел ч);
		extern (C) проц wxHtmlListBox_OnDrawBackground(ЦелУкз сам, ЦелУкз ку, inout Прямоугольник прям, цел ч);
		extern (C) цел wxHtmlListBox_OnGetLineHeight(ЦелУкз сам, цел строка);
		//! \endcond

		//-----------------------------------------------------------------------------

	export abstract class БоксСпискаГЯР : БоксВСписка
	{
		export this(ЦелУкз вхобъ)
			{ super(вхобъ); }

		export this()
			{ this(пусто, Окно.уникИд, ДЕФПОЗ, ДЕФРАЗМ, 0, "");}

		export this(Окно родитель, цел ид /*= ЛЮБОЙ*/, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = 0, ткст имя=СтрИмениБоксаВСписка)
		{
			this(wxHtmlListBox_ctor2(ВизОбъект.безопУк(родитель), ид, поз, размер, стиль, имя));

			wxHtmlListBox_RegisterVirtual(вхобъ, this,
				&staticRefreshAll,
				&staticУстItemCount,
				&staticOnGetItem,
				&staticOnGetItemMarkup,
				&staticDoGetSelectedTextColour,
				&staticDoGetSelectedTextBgColour,
				&staticDoOnDrawItem,
				&staticOnMeasureItem,
				&staticDoOnDrawSeparator,
				&staticDoOnDrawBackground,
				&staticOnGetLineHeight);
		}

		//---------------------------------------------------------------------
		// ctors with сам created ид

		export this(Окно родитель, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = 0, ткст имя=СтрИмениБоксаВСписка)
			{ this(родитель, Окно.уникИд, поз, размер, стиль, имя);}

		//-----------------------------------------------------------------------------

		export override бул создай(Окно родитель, цел ид, inout Точка поз, inout Размер размер, цел стиль, ткст имя)
		{
			return wxHtmlListBox_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, поз, размер, стиль, имя);
		}

		//-----------------------------------------------------------------------------

		static export extern(C) проц staticRefreshAll(БоксСпискаГЯР объ)
		{
			return объ.освежиВсе();
		}
		export override проц освежиВсе()
		{
			wxHtmlListBox_RefreshAll(вхобъ);
		}

		//-----------------------------------------------------------------------------

		static export extern(C) проц staticУстItemCount(БоксСпискаГЯР объ,цел счёт)
		{
			объ.устСчётЭлтов(счёт);
		}
		export  проц устСчётЭлтов(цел счёт)
		{
			wxHtmlListBox_SetItemCount(вхобъ, счёт);
		}

		//-----------------------------------------------------------------------------

		static export extern(C) ткст staticOnGetItem(БоксСпискаГЯР объ,цел ч)
		{
			return объ.приПолученииЭлта(ч);
		}
		protected abstract ткст приПолученииЭлта(цел ч);

		//-----------------------------------------------------------------------------

		static export extern(C)  ткст staticOnGetItemMarkup(БоксСпискаГЯР объ,цел ч)
		{
			return объ.приПолученииЭлта(ч);
		}
		export  ткст приПолученииМаркапаЭлта(цел ч)
		{
			return cast(ткст) new ВизТкст(wxHtmlListBox_OnGetItemMarkup(вхобъ, ч), да);
		}

		//-----------------------------------------------------------------------------

		static export extern(C)  ЦелУкз staticDoGetSelectedTextColour(БоксСпискаГЯР объ,ЦелУкз цветПП)
		{
			return ВизОбъект.безопУк(объ.дайЦветВыделенногоТекста(cast(Цвет)найдиОбъект(цветПП, &Цвет.Нов)));
		}

		export  Цвет дайЦветВыделенногоТекста(Цвет цветПП)
		{
			return new Цвет(wxHtmlListBox_GetSelectedTextColour(вхобъ, ВизОбъект.безопУк(цветПП)), да);
		}

		//-----------------------------------------------------------------------------

		static export extern(C)  ЦелУкз staticDoGetSelectedTextBgColour(БоксСпискаГЯР объ, ЦелУкз цветЗП)
		{
			return ВизОбъект.безопУк(объ.дайЦветФонаВыделенногоТекста(cast(Цвет)найдиОбъект(цветЗП, &Цвет.Нов)));
		}

		export  Цвет дайЦветФонаВыделенногоТекста(Цвет цветЗП)
		{
			return new Цвет(wxHtmlListBox_GetSelectedTextBgColour(вхобъ, ВизОбъект.безопУк(цветЗП)), да);
		}

		//-----------------------------------------------------------------------------

		static export extern(C)  проц staticDoOnDrawItem(БоксСпискаГЯР объ, ЦелУкз ку, inout Прямоугольник прям, цел ч)
		{
			объ.приОтрисовкеЭлта(cast(КонтекстУстройства)найдиОбъект(ку, &КонтекстУстройства.Нов), прям, ч);
		}

		export override проц приОтрисовкеЭлта(КонтекстУстройства ку, Прямоугольник прям, цел ч)
		{
			wxHtmlListBox_OnDrawItem(вхобъ, ВизОбъект.безопУк(ку), прям, ч);
		}

		//-----------------------------------------------------------------------------

		static export extern(C)  цел staticOnMeasureItem(БоксСпискаГЯР объ, цел ч)
		{
			return объ.приОбмереЭлта(ч);
		}
		export override цел приОбмереЭлта(цел ч)
		{
			return wxHtmlListBox_OnMeasureItem(вхобъ, ч);
		}

		//-----------------------------------------------------------------------------

		export проц приПеремере(СобытиеРазмера соб)
		{
			wxHtmlListBox_OnSize(вхобъ, ВизОбъект.безопУк(соб));
		}

		//-----------------------------------------------------------------------------

		export проц иниц()
		{
			wxHtmlListBox_Init(вхобъ);
		}

		//-----------------------------------------------------------------------------

		export проц кэшируйЭлт(цел ч)
		{
			wxHtmlListBox_CacheItem(вхобъ, ч);
		}

		//-----------------------------------------------------------------------------

		export override проц приОтрисовкеРазделителя(КонтекстУстройства ку, Прямоугольник прям, цел ч)
		{
			wxHtmlListBox_OnDrawSeparator(вхобъ, ВизОбъект.безопУк(ку), прям, ч);
		}

		static export extern(C)  проц staticDoOnDrawSeparator(БоксСпискаГЯР объ,ЦелУкз ку, inout Прямоугольник прям, цел ч)
		{
			объ.приОтрисовкеРазделителя(cast(КонтекстУстройства)найдиОбъект(ку, &КонтекстУстройства.Нов), прям, ч);
		}

		//-----------------------------------------------------------------------------

		export override проц приОтрисовкеФона(КонтекстУстройства ку, Прямоугольник прям, цел ч)
		{
			wxHtmlListBox_OnDrawBackground(вхобъ, ВизОбъект.безопУк(ку), прям, ч);
		}

		static export extern(C)  проц staticDoOnDrawBackground(БоксСпискаГЯР объ,ЦелУкз ку, inout Прямоугольник прям, цел ч)
		{
			объ.приОтрисовкеФона(cast(КонтекстУстройства)найдиОбъект(ку, &КонтекстУстройства.Нов), прям, ч);
		}

		//-----------------------------------------------------------------------------

		export override цел приПолученииВысотыСтроки(цел строка)
		{
			return wxHtmlListBox_OnGetLineHeight(вхобъ, строка);
		}
		static export extern(C)  цел staticOnGetLineHeight(БоксСпискаГЯР объ, цел строка)
		{
			return объ.приПолученииВысотыСтроки(строка);
		}

	}
