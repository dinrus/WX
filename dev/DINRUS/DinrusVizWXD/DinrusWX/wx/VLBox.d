module wx.VLBox;
public import wx.common;
public import wx.VScroll;

		//! \cond EXTERN
		extern (C) {
		alias цел function(БоксВСписка объ, цел ч) Virtual_IntInt;
		alias проц function(БоксВСписка объ, ЦелУкз ку, Прямоугольник прям, цел ч) Virtual_VoidDcRectSizeT;
		}

		extern (C) ЦелУкз wxVListBox_ctor(ЦелУкз родитель, цел ид, inout Точка поз, inout Размер размер, бцел стиль, ткст имя);
		extern (C) проц wxVListBox_RegisterVirtual(ЦелУкз сам, БоксВСписка объ,
			Virtual_VoidDcRectSizeT onDrawItem,
			Virtual_IntInt onMeasureItem,
			Virtual_VoidDcRectSizeT onDrawSeparator,
			Virtual_VoidDcRectSizeT onDrawBackground,
			Virtual_IntInt onGetLineHeight);
		extern (C) бул wxVListBox_Create(ЦелУкз сам,ЦелУкз родитель, цел ид, inout Точка поз, inout Размер размер, цел стиль, ткст имя);
		extern (C) проц wxVListBox_OnDrawSeparator(ЦелУкз сам, ЦелУкз ку, inout Прямоугольник прям, цел ч);
		extern (C) проц wxVListBox_OnDrawBackground(ЦелУкз сам, ЦелУкз ку, inout Прямоугольник прям, цел ч);
		extern (C) цел wxVListBox_OnGetLineHeight(ЦелУкз сам, цел строка);
		extern (C) цел wxVListBox_GetItemCount(ЦелУкз сам);
		extern (C) бул wxVListBox_HasMultipleSelection(ЦелУкз сам);
		extern (C) цел wxVListBox_GetSelection(ЦелУкз сам);
		extern (C) бул wxVListBox_IsCurrent(ЦелУкз сам, цел элт);
		extern (C) бул wxVListBox_IsSelected(ЦелУкз сам, цел элт);
		extern (C) цел wxVListBox_GetSelectedCount(ЦелУкз сам);
		extern (C) цел wxVListBox_GetFirstSelected(ЦелУкз сам, out бцел куки);
		extern (C) цел wxVListBox_GetNextSelected(ЦелУкз сам, inout бцел куки);
		extern (C) проц wxVListBox_GetMargins(ЦелУкз сам, out Точка тчк);
		extern (C) ЦелУкз wxVListBox_GetSelectionBackground(ЦелУкз сам);
		extern (C) проц wxVListBox_SetItemCount(ЦелУкз сам, цел счёт);
		extern (C) проц wxVListBox_Clear(ЦелУкз сам);
		extern (C) проц wxVListBox_SetSelection(ЦелУкз сам, цел selection);
		extern (C) бул wxVListBox_Select(ЦелУкз сам, цел элт, бул селект);
		extern (C) бул wxVListBox_SelectRange(ЦелУкз сам, цел от, цел до);
		extern (C) проц wxVListBox_Toggle(ЦелУкз сам, цел элт);
		extern (C) бул wxVListBox_SelectAll(ЦелУкз сам);
		extern (C) бул wxVListBox_DeselectAll(ЦелУкз сам);
		extern (C) проц wxVListBox_SetMargins(ЦелУкз сам, inout Точка тчк);
		extern (C) проц wxVListBox_SetMargins2(ЦелУкз сам, цел x, цел y);
		extern (C) проц wxVListBox_SetSelectionBackground(ЦелУкз сам, ЦелУкз кол);
		//! \endcond

	export abstract class БоксВСписка : ОкноСВПрокруткой
	{
		const ткст СтрИмениБоксаВСписка = "wxVListBox";

		export this(ЦелУкз вхобъ)
			{ super(вхобъ);}

		export this()
			{ this(пусто, Окно.уникИд, ДЕФПОЗ, ДЕФРАЗМ, 0, "");}

		export this(Окно родитель, цел ид /*= ЛЮБОЙ*/, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = 0, ткст имя = СтрИмениБоксаВСписка)
		{
			this(wxVListBox_ctor(ВизОбъект.безопУк(родитель), ид, поз, размер, стиль, имя));
			wxVListBox_RegisterVirtual(вхобъ, this,
				&staticDoOnDrawItem,
				&staticOnMeasureItem,
				&staticDoOnDrawSeparator,
				&staticDoOnDrawBackground,
				&staticOnGetLineHeight);
		}

		//---------------------------------------------------------------------
		// ctors with сам created ид

		export this(Окно родитель, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = 0, ткст имя = СтрИмениБоксаВСписка)
			{ this(родитель, Окно.уникИд, поз, размер, стиль, имя);}

		//-----------------------------------------------------------------------------

		export override бул создай(Окно родитель, цел ид, inout Точка поз, inout Размер размер, цел стиль, ткст имя)
		{
			return wxVListBox_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, поз, размер, стиль, имя);
		}

		//-----------------------------------------------------------------------------

		protected abstract проц приОтрисовкеЭлта(КонтекстУстройства ку, Прямоугольник прям, цел ч);

		static export extern(C) проц staticDoOnDrawItem(БоксВСписка объ, ЦелУкз ку, Прямоугольник прям, цел ч)
		{
			объ.приОтрисовкеЭлта(cast(КонтекстУстройства)найдиОбъект(ку, &КонтекстУстройства.Нов), прям, ч);
		}

		//-----------------------------------------------------------------------------

		protected abstract цел приОбмереЭлта(цел ч);

		static export extern(C)  цел staticOnMeasureItem(БоксВСписка объ, цел ч)
		{
			return объ.приОбмереЭлта(ч);
		}

		//-----------------------------------------------------------------------------

		export  проц приОтрисовкеРазделителя(КонтекстУстройства ку, Прямоугольник прям, цел ч)
		{
			wxVListBox_OnDrawSeparator(вхобъ, ВизОбъект.безопУк(ку), прям, ч);
		}

		static export extern(C) проц staticDoOnDrawSeparator(БоксВСписка объ, ЦелУкз ку, Прямоугольник прям, цел ч)
		{
			объ.приОтрисовкеРазделителя(cast(КонтекстУстройства)найдиОбъект(ку, &КонтекстУстройства.Нов), прям, ч);
		}

		//-----------------------------------------------------------------------------

		export  проц приОтрисовкеФона(КонтекстУстройства ку, Прямоугольник прям, цел ч)
		{
			wxVListBox_OnDrawBackground(вхобъ, ВизОбъект.безопУк(ку), прям, ч);
		}

		static export extern(C) проц staticDoOnDrawBackground(БоксВСписка объ, ЦелУкз ку, Прямоугольник прям, цел ч)
		{
			объ.приОтрисовкеФона(cast(КонтекстУстройства)найдиОбъект(ку, &КонтекстУстройства.Нов), прям, ч);
		}

		//-----------------------------------------------------------------------------

		export override цел приПолученииВысотыСтроки(цел строка)
		{
			return wxVListBox_OnGetLineHeight(вхобъ, строка);
		}

		static export extern(C) override цел staticOnGetLineHeight(БоксВСписка объ, цел строка)
		{
			return объ.приПолученииВысотыСтроки(строка);
		}

		//-----------------------------------------------------------------------------

		export цел счётЭлтов() { return wxVListBox_GetItemCount(вхобъ); }
		export проц счётЭлтов(цел значение) { wxVListBox_SetItemCount(вхобъ, значение); }

		//-----------------------------------------------------------------------------

		export бул соМножественнымВыделением() { return wxVListBox_HasMultipleSelection(вхобъ); }

		//-----------------------------------------------------------------------------

		export цел выделение() { return wxVListBox_GetSelection(вхобъ); }
		export проц выделение(цел значение) { wxVListBox_SetSelection(вхобъ, значение); }

		//-----------------------------------------------------------------------------

		export бул текущий_ли(цел элт)
		{
			return wxVListBox_IsCurrent(вхобъ, элт);
		}

		//-----------------------------------------------------------------------------

		export бул выделен(цел элт)
		{
			return wxVListBox_IsSelected(вхобъ, элт);
		}

		//-----------------------------------------------------------------------------

		export цел чисВыд() { return wxVListBox_GetSelectedCount(вхобъ); }

		//-----------------------------------------------------------------------------

		export цел дайПервВыд(out бцел куки)
		{
			return wxVListBox_GetFirstSelected(вхобъ, куки);
		}

		//-----------------------------------------------------------------------------

		export цел дайСледщВыд(inout бцел куки)
		{
			return wxVListBox_GetNextSelected(вхобъ, куки);
		}

		//-----------------------------------------------------------------------------

		export Точка маржины() {
				Точка тчк;
				wxVListBox_GetMargins(вхобъ, тчк);
				return тчк;
			}

		export проц маржины(Точка значение) { wxVListBox_SetMargins(вхобъ, значение); }

		export проц устМаржины(цел x, цел y)
		{
			wxVListBox_SetMargins2(вхобъ, x, y);
		}

		//-----------------------------------------------------------------------------

		export Цвет фонВыделения() { return new Цвет(wxVListBox_GetSelectionBackground(вхобъ), да); }
		export проц фонВыделения(Цвет значение) { wxVListBox_SetSelectionBackground(вхобъ, ВизОбъект.безопУк(значение)); }

		//-----------------------------------------------------------------------------

		export проц очисть()
		{
			wxVListBox_Clear(вхобъ);
		}

		//-----------------------------------------------------------------------------

		export бул выдели(цел элт)
		{
			return выдели(элт, да);
		}

		export бул выдели(цел элт, бул селект)
		{
			return wxVListBox_Select(вхобъ, элт, селект);
		}

		//-----------------------------------------------------------------------------

		export бул выделиДиапазон(цел от, цел до)
		{
			return wxVListBox_SelectRange(вхобъ, от, до);
		}

		//-----------------------------------------------------------------------------

		export проц переключи(цел элт)
		{
			wxVListBox_Toggle(вхобъ, элт);
		}

		//-----------------------------------------------------------------------------

		export бул выделиВсе()
		{
			return wxVListBox_SelectAll(вхобъ);
		}

		//-----------------------------------------------------------------------------

		export бул деселектируйВсе()
		{
			return wxVListBox_DeselectAll(вхобъ);
		}
	}
