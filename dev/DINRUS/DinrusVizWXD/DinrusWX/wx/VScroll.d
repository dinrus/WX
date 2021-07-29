module wx.VScroll;
public import wx.common;
public import wx.Panel;
public import wx.SizeEvent;

		//-----------------------------------------------------------------------------

		//! \cond EXTERN
		extern (C) {
		alias цел function(ОкноСВПрокруткой объ, цел ч) Virtual_IntInt;
		}

		extern (C) ЦелУкз wxVScrolledWindow_ctor();
		extern (C) ЦелУкз wxVScrolledWindow_ctor2(ЦелУкз родитель, цел ид, inout Точка поз, inout Размер размер, бцел стиль, ткст имя);
		extern (C) проц wxVScrolledWindow_RegisterVirtual(ЦелУкз сам, ОкноСВПрокруткой объ, Virtual_IntInt onGetLineHeight);
		extern (C) бул wxVScrolledWindow_Create(ЦелУкз сам,ЦелУкз родитель, цел ид, inout Точка поз, inout Размер размер, цел стиль, ткст имя);
		extern (C) проц wxVScrolledWindow_SetLineCount(ЦелУкз сам, цел счёт);
		extern (C) бул wxVScrolledWindow_ScrollToLine(ЦелУкз сам, цел строка);
		extern (C) бул wxVScrolledWindow_ScrollLines(ЦелУкз сам, цел строки);
		extern (C) бул wxVScrolledWindow_ScrollPages(ЦелУкз сам, цел страницы);
		extern (C) проц wxVScrolledWindow_RefreshLine(ЦелУкз сам, цел строка);
		extern (C) проц wxVScrolledWindow_RefreshLines(ЦелУкз сам, цел от, цел до);
		extern (C) цел wxVScrolledWindow_HitTest(ЦелУкз сам, цел x, цел y);
		extern (C) цел wxVScrolledWindow_HitTest2(ЦелУкз сам, inout Точка тчк);
		extern (C) проц wxVScrolledWindow_RefreshAll(ЦелУкз сам);
		extern (C) цел wxVScrolledWindow_GetLineCount(ЦелУкз сам);
		extern (C) цел wxVScrolledWindow_GetFirstVisibleLine(ЦелУкз сам);
		extern (C) цел wxVScrolledWindow_GetLastVisibleLine(ЦелУкз сам);
		extern (C) бул wxVScrolledWindow_IsVisible(ЦелУкз сам, цел строка);
		//! \endcond

		//-----------------------------------------------------------------------------

	export abstract class ОкноСВПрокруткой : Панель
	{
		export this(ЦелУкз вхобъ)
			{ super(вхобъ); }

		export this() {
			this(wxVScrolledWindow_ctor());
			wxVScrolledWindow_RegisterVirtual(вхобъ, this, &staticOnGetLineHeight);
		}

		export this(Окно родитель, цел ид /*= ЛЮБОЙ*/, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль=0, ткст имя = СтрИмениПанели)
		{
			this(wxVScrolledWindow_ctor2(ВизОбъект.безопУк(родитель), ид, поз, размер, стиль, имя));
			wxVScrolledWindow_RegisterVirtual(вхобъ, this, &staticOnGetLineHeight);
		}

		//---------------------------------------------------------------------
		// ctors with сам created ид

		export this(Окно родитель, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль=0, ткст имя = СтрИмениПанели)
			{ this(родитель, Окно.уникИд, поз, размер, стиль, имя);}

		//-----------------------------------------------------------------------------

		export override бул создай(Окно родитель, цел ид, inout Точка поз, inout Размер размер, цел стиль, ткст имя)
		{
			return wxVScrolledWindow_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, поз, размер, стиль, имя);
		//	return super.создай(родитель, ид, поз, размер, стиль | ВПРОКРУТ, имя);
		}

		//-----------------------------------------------------------------------------

		static export extern(C) цел staticOnGetLineHeight(ОкноСВПрокруткой объ, цел ч)
		{
			return объ.приПолученииВысотыСтроки(ч);
		}
		protected abstract цел приПолученииВысотыСтроки(цел ч);

		export проц счётСтрок(цел значение) { wxVScrolledWindow_SetLineCount(вхобъ, значение); }
		export цел счётСтрок() { return wxVScrolledWindow_GetLineCount(вхобъ); }

		export проц прокрутиДоСтроки(цел строка)
		{
			wxVScrolledWindow_ScrollToLine(вхобъ, строка);
		}

		export override бул прокрутиСтроки(цел строки)
		{
			return wxVScrolledWindow_ScrollLines(вхобъ, строки);
		}

		export override бул прокрутиСтраницы(цел страницы)
		{
			return wxVScrolledWindow_ScrollPages(вхобъ, страницы);
		}

		export проц освежиСтроку(цел строка)
		{
			wxVScrolledWindow_RefreshLine(вхобъ, строка);
		}

		export проц освежиСтроки(цел от, цел до)
		{
			wxVScrolledWindow_RefreshLines(вхобъ, от, до);
		}

		export цел тестНажатия(цел x, цел y)
		{
			return wxVScrolledWindow_HitTest(вхобъ, x, y);
		}

		export цел тестНажатия(Точка тчк)
		{
			return wxVScrolledWindow_HitTest2(вхобъ, тчк);
		}

		export  проц освежиВсе()
		{
			wxVScrolledWindow_RefreshAll(вхобъ);
		}

		export цел дайПервВидимуюСтроку()
		{
			return wxVScrolledWindow_GetFirstVisibleLine(вхобъ);
		}

		export цел дайПоследнВидимуюСтроку()
		{
			return wxVScrolledWindow_GetLastVisibleLine(вхобъ);
		}

		export бул виден(цел строка)
		{
			return wxVScrolledWindow_IsVisible(вхобъ, строка);
		}
	}
