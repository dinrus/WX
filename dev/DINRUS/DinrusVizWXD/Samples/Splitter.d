//-----------------------------------------------------------------------------
// wxD/Samples - Splitter.d
//
// A wxD version of the wxWidgets "splitter" sample.
//
// Written by Jason Perkins (jason@379.com)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $ид: Splitter.d,v 1.9 2006/11/17 15:20:58 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;

	enum Cmd
	{
		Quit,
		SplitHorizontal,
		SplitVertical,
		Unsplit,
		SplitLive,
		УстPosition,
		УстMinSize
	}


	public class SplitterApp : Приложение
	{
		//---------------------------------------------------------------------

		public override бул поИниц()
		{
			MyFrame рамка = new MyFrame();
			рамка.показ(да);
			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			SplitterApp app = new SplitterApp();
			app.пуск();
		}

		//---------------------------------------------------------------------
	}


	public class MyFrame : Рамка
	{
		private MySplitterWindow splitter;
		private MyCanvas         left, right;

		//---------------------------------------------------------------------

		public this()
		{
			super("wxSplitterWindow Sample",
			       ДЕФПОЗ, Размер(420,300),
			       wxDEFAULT_FRAME | ПОЛН_ПЕРЕРИС_ПРИ_ПЕРЕМЕРЕ);
			Меню splitMenu = new Меню();
			splitMenu.Append(Cmd.SplitVertical, "Split &Vertically\tCtrl-V", "Split vertically");
			splitMenu.Append(Cmd.SplitHorizontal, "Split &Horizontally\tCtrl-H", "Split горизонтально");
			splitMenu.Append(Cmd.Unsplit, "&Unsplit\tCtrl-U", "Unsplit");
			splitMenu.добавьРазделитель();
			splitMenu.добавьЧекЭлт(Cmd.SplitLive, "&Live Обнови\tCtrl-L", "Toggle live обновить mode");
			splitMenu.Append(Cmd.УстPosition, "Уст &Позиция\tCtrl-P", "Уст the splitter position");
			splitMenu.Append(Cmd.УстMinSize, "Уст &Minimum Размер\tCtrl-M", "Уст the minimum pane Размер");
			splitMenu.добавьРазделитель();
			splitMenu.Append(Cmd.Quit, "E&xit\tAlt-X", "Exit");

			MenuBar menuBar = new MenuBar();
			menuBar.Append(splitMenu, "&Splitter");
			this.menuBar = menuBar;

			menuBar.Check(Cmd.SplitLive, да);

			CreateStatusBar(2);
			УстStatusText("Min pane Размер = 0", 1);

			splitter = new MySplitterWindow(this);

			left = new MyCanvas(splitter);
			left.ЦветФона = new Цвет("RED");
			left.УстScrollbars(20, 20, 50, 50);
			left.курсор = new Курсор(StockCursor.wxCURSOR_MAGNIFIER);

			right = new MyCanvas(splitter);
			right.ЦветФона = new Цвет("CYAN");
			right.УстScrollbars(20, 20, 50, 50);

			splitter.SplitVertically(left, right, 100);

			// Уст up the event table

			собМеню(Cmd.SplitVertical,    &SplitVertical);
			собМеню(Cmd.SplitHorizontal,  &SplitHorizontal);
			собМеню(Cmd.Unsplit,          &Unsplit);
			собМеню(Cmd.SplitLive,        &ToggleLive);
			собМеню(Cmd.УстPosition,      &УстPosition);
			собМеню(Cmd.УстMinSize,       &УстMinSize);

			собМеню(Cmd.Quit,             &OnQuit);

			собОбновиИП(Cmd.SplitVertical,   &UpdateUIVertical);
			собОбновиИП(Cmd.SplitHorizontal, &UpdateUIHorizontal);
			собОбновиИП(Cmd.Unsplit,         &UpdateUIUnsplit);
		}

		//---------------------------------------------------------------------

		public проц SplitHorizontal(Объект отправитель, Событие e)
		{
			if (splitter.IsSplit)
				splitter.Unsplit();

			left.показ(да);
			right.показ(да);

			splitter.SplitHorizontally(left, right);

			УстStatusText("Splitter split горизонтально", 1);
		}

		public проц SplitVertical(Объект отправитель, Событие e)
		{
			if (splitter.IsSplit)
				splitter.Unsplit();

			left.показ(да);
			right.показ(да);

			splitter.SplitVertically(left, right);

			УстStatusText("Splitter split vertically", 1);
		}

		public проц Unsplit(Объект отправитель, Событие e)
		{
			if (splitter.IsSplit)
				splitter.Unsplit();
			УстStatusText("No splitter", 1);
		}

		public проц ToggleLive(Объект отправитель, Событие e)
		{
			СобытиеКоманда ce = cast(СобытиеКоманда)e;
			if (ce.IsChecked)
				splitter.ФлагиСтиля = splitter.ФлагиСтиля | SplitterWindow.wxSP_LIVE_UPDATE;
			else
				splitter.ФлагиСтиля = splitter.ФлагиСтиля & ~SplitterWindow.wxSP_LIVE_UPDATE;
		}

		public проц УстPosition(Объект отправитель, Событие e)
		{
		}

		public проц УстMinSize(Объект отправитель, Событие e)
		{
		}

		//---------------------------------------------------------------------

		public проц OnQuit(Объект отправитель, Событие e)
		{
			Закрой(да);
		}

		public проц UpdateUIHorizontal(Объект отправитель, Событие e)
		{
			UpdateUIEvent ue = cast(UpdateUIEvent)e;
			ue.Активен = (!splitter.IsSplit || splitter.splitMode != SplitMode.wxSPLIT_HORIZONTAL);
		}

		public проц UpdateUIVertical(Объект отправитель, Событие e)
		{
			UpdateUIEvent ue = cast(UpdateUIEvent)e;
			ue.Активен = (!splitter.IsSplit || splitter.splitMode != SplitMode.wxSPLIT_VERTICAL);
		}

		public проц UpdateUIUnsplit(Объект отправитель, Событие e)
		{
			UpdateUIEvent ue = cast(UpdateUIEvent)e;
			ue.Активен = splitter.IsSplit;
		}

		//---------------------------------------------------------------------
	}



	public class MySplitterWindow : SplitterWindow
	{
		private Рамка родитель;

		//---------------------------------------------------------------------

		public this(Рамка родитель)
		{
			super(родитель, -1,
			       ДЕФПОЗ, вхДефРазм,
			       wxSP_3D | wxSP_LIVE_UPDATE | wxCLIP_CHILDREN);
			this.родитель = родитель;
		}

		//---------------------------------------------------------------------

		public проц OnPositionChanged(Объект отправитель, Событие e)
		{
		}

		public проц OnPositionChanging(Объект отправитель, Событие e)
		{
		}

		public проц OnDoubleClick(Объект отправитель, Событие e)
		{
		}

		public проц OnUnsplit(Объект отправитель, Событие e)
		{
		}

		//---------------------------------------------------------------------
	}


	public class MyCanvas : ScrolledWindow
	{
		//---------------------------------------------------------------------

		public this(Окно родитель)
		{
			super(родитель);
		}

		//---------------------------------------------------------------------

		public override проц OnDraw(DC dc)
		{
			dc.pen = new Pen("BLACK", 1, FillStyle.wxSOLID);
			dc.DrawLine(0, 0, 100, 100);

			dc.BackgroundMode = FillStyle.wxTRANSPARENT;
			dc.DrawText("Testing", 50, 50);

			dc.pen = new Pen("RED", 1, FillStyle.wxSOLID);
			dc.brush = new Кисть("GREEN", FillStyle.wxSOLID);
			dc.DrawRectangle(120, 120, 100, 80);
		}

		//---------------------------------------------------------------------
	}


проц main()
{
	SplitterApp.Main();
}
