//-----------------------------------------------------------------------------
// wxD/Samples - Dialogs.d
//
// A wxD version of the wxWidgets "dialogs" sample.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $ид: Dialogs.d,v 1.12 2009/01/16 14:38:22 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;

private import stdrus;

alias stdrus.найди indexOf;
alias stdrus.найдирек LastIndexOf;
alias stdrus.дайтекпап GETCWD;
alias stdrus.случ RAND;


	public class MyFrame : Рамка
	{
		enum Cmd 
		{
			ChooseColour = 1, ChooseFont,
			MessageBox, SingleChoice, MultiChoice,
			TextEntry, PasswordEntry,
			FileOpen, FileOpen2, FilesOpen, FileSave,
			DirChoose, DirNewChoose,
			Tip, NumEntry, LogDialog,
			Modal, Modeless, ModelessBtn,
			Progress, Busyinfo,
			Find, Replace,
			Exit
		}

		// for FileOpen2
		public static ткст s_extDef="";

		// for Find and Replace
		public FindReplaceData m_findData;
		public FindReplaceDialog m_dlgFind;
		public FindReplaceDialog m_dlgReplace;

		public MyModelessDialog m_dialog;

		private MyCanvas canvas;

		//---------------------------------------------------------------------

		public this(ткст титул, Точка поз, Размер размер)
		{
			super(титул, поз, размер);
			// Уст the окно пиктограмма
			пиктограмма = new Пиктограмма("./data/mondrian.png");

			// Уст up a меню
			Меню файлМеню = new Меню();
			файлМеню.Append(Cmd.ChooseColour,	"&Выбрать цвет");
			файлМеню.добавьРазделитель();
			файлМеню.Append(Cmd.ChooseFont, 	"Выбрать &Шрифт");
			файлМеню.добавьРазделитель();
			файлМеню.Append(Cmd.LogDialog, 	"&Лог-диалог\tCtrl-L");
			файлМеню.Append(Cmd.MessageBox, 	"&Сообщение\tCtrl-M");
			файлМеню.Append(Cmd.TextEntry, 	"Текстовая &запись\tCtrl-E");
			файлМеню.Append(Cmd.PasswordEntry, 	"&Ввод пароля\tCtrl-P");
			файлМеню.Append(Cmd.NumEntry, 		"&Ввод числа\tCtrl-N");
			файлМеню.Append(Cmd.SingleChoice, 	"&Единичный выбор\tCtrl-C");
			файлМеню.Append(Cmd.MultiChoice, 	"М&ножественный выбор\tCtrl-U");
			файлМеню.добавьРазделитель();
			файлМеню.Append(Cmd.Tip,		"&Подсказка дня\tCtrl-T");
			файлМеню.добавьРазделитель();
			файлМеню.Append(Cmd.FileOpen, 		"&Открыть файл\tCtrl-O");
			файлМеню.Append(Cmd.FileOpen2, 	"&Второй файлооткрыватель\tCtrl-2");
			файлМеню.Append(Cmd.FilesOpen, 	"Открыть &файлы\tCtrl-3");
			файлМеню.Append(Cmd.FileSave, 		"Со&хранить файл\tCtrl-S");
			файлМеню.Append(Cmd.DirChoose, 	"Выбрать &Папку\tCtrl-D");
			файлМеню.Append(Cmd.Progress, 		"Диал&ог с прогрессом\tCtrl-G");
			файлМеню.Append(Cmd.Busyinfo, 		"&Инфо занят диалог\tCtrl-B");
			файлМеню.добавьЧекЭлт(Cmd.Find,	"&Найти\tCtrl-F", "");
			файлМеню.добавьЧекЭлт(Cmd.Replace,	"Найти и &заменить\tShift-Ctrl-F", "");
			файлМеню.добавьРазделитель();
			файлМеню.Append(Cmd.Modal,	"Мо&дальный диалог\tCtrl-W");
			файлМеню.добавьЧекЭлт(Cmd.Modeless,	"Безрежимный &диалог\tCtrl-Z", "");

			файлМеню.добавьРазделитель();

			файлМеню.Append(Cmd.Exit, "Вы&ход\tAlt-X");

			MenuBar menuBar = new MenuBar();
			menuBar.Append(файлМеню, "&Файл");

			this.menuBar = menuBar;

			// Уст up a status bar
			CreateStatusBar();

			// Создай the canvas for drawing
			canvas = new MyCanvas(this);

			// Уст up the event table
			собМеню(Cmd.ChooseColour,     &OnChooseColour);
			собМеню(Cmd.ChooseFont,       &OnChooseFont);

			собМеню(Cmd.DirChoose,        &OnDirChoose);

			собМеню(Cmd.LogDialog,	&OnLogDialog);
			собМеню(Cmd.MessageBox,	&OnMessageBox);
			собМеню(Cmd.TextEntry,	&OnTextEntry);
			собМеню(Cmd.PasswordEntry,	&OnPasswordEntry);
			собМеню(Cmd.NumEntry,		&OnNumericEntry);
			собМеню(Cmd.SingleChoice,	&OnSingleChoice);
			собМеню(Cmd.MultiChoice,	&OnMultiChoice);

			собМеню(Cmd.Tip,		&OnTip);

			собМеню(Cmd.FileOpen,		&OnFileOpen);
			собМеню(Cmd.FileOpen2,	&OnFileOpen2);
			собМеню(Cmd.FilesOpen,	&OnFilesOpen);
			собМеню(Cmd.FileSave,		&OnFileSave);
			собМеню(Cmd.Progress,		&OnProgress);
			собМеню(Cmd.Busyinfo,		&OnBusyinfo);
			собМеню(Cmd.Find,		&OnFind);
			собМеню(Cmd.Replace,		&OnReplace);
			собМеню(Cmd.Modal,		&OnModal);
			собМеню(Cmd.Modeless,		&OnModeless);

			собНайди(-1,			&OnFindEvent);
			собНайдиСледщ(-1,			&OnFindEvent);
			собНайдиЗамени(-1,		&OnFindEvent);
			собНайдиЗамениВсе(-1,		&OnFindEvent);
			собНайдиЗакрой(-1,			&OnFindEvent);

			собМеню(Cmd.Exit,             &ПоВыходу);

			m_findData = new FindReplaceData();
		}

		//---------------------------------------------------------------------

		public проц OnChooseColour(Объект отправитель, Событие e)
		{
			ColourData data = new ColourData();

			data.цвет = canvas.ЦветФона;
			data.ChooseFull = да;

			for(цел i = 0; i < 16; i++) 
			{
				ubyte rgb = cast(ubyte)(i * 16);
				Цвет col = new Цвет(rgb, rgb, rgb);
				data.УстCustomColour(i, col);
			}

			ColourDialog cd = new ColourDialog(this, data);
			cd.Титул = "Выберите фоновый цвет";

			if (cd.ShowModal() == wxID_OK) 
			{
				canvas.ЦветФона = cd.colourData.цвет;
				//canvas.Clear();
				canvas.Освежи();
			}
		}

		public проц OnChooseFont(Объект отправитель, Событие e)
		{
			FontData data = new FontData();
			data.начальныйШрифт = canvas.шрифт;
			data.цвет = canvas.textColour;

			FontDialog fd = new FontDialog(this, data);

			if (fd.ShowModal() == wxID_OK) 
			{
				canvas.шрифт = fd.fontData.выбранныйШрифт;
				canvas.textColour = fd.fontData.цвет;
				canvas.Освежи();
			}
		}

		public проц OnDirChoose(Объект отправитель, Событие e)
		{
			ткст dirHome = GETCWD();
			DirDialog dlg = new DirDialog(this, "Testing directory picker",
				dirHome);

			if (dlg.ShowModal() == Dialog.wxID_OK) 
			{
				Log.LogMessage("Selected path: " ~ dlg.Path);
			}
		}

		public проц OnLogDialog(Объект отправитель, Событие e)
		{
		{
			BusyCursor bc = new BusyCursor();
			Log.LogMessage("This is some message - everything is ok so far.");
			Log.LogMessage("Another message...\n... this one is on multiple строки");
			Log.LogWarning("And then something went wrong!");

			//wxYield();
			bc.вымести();
		}

			Log.LogError("Intermediary error обработчик decided to abort.");
			Log.LogError("The top level caller detected an unrecoverable error.");

			Log.FlushActive();

			Log.LogMessage("And this is the same dialog кноп with only one message.");
		}

		public проц OnMessageBox(Объект отправитель, Событие e)
		{
			MessageDialog md = new MessageDialog(this, "This is a message бокс\nA long, long ткст to test out the message бокс properly",
				"Message бокс текст", Dialog.wxNO_DEFAULT|Dialog.wxYES_NO|Dialog.wxCANCEL|Dialog.wxICON_INFORMATION);

			switch (md.ShowModal())
			{
				case Dialog.wxID_YES:		Log.LogStatus("Вами нажато \"Yes\"");
					break;
				case Dialog.wxID_NO:		Log.LogStatus("Вами нажато \"No\"");
					break;
				case Dialog.wxID_CANCEL:	Log.LogStatus("Вами нажато \"Cancel\"");
					break;
				default:			Log.LogStatus("Unexpected wxMessageDialog return код!");
					break;
			}
		}

		public проц OnTextEntry(Объект отправитель, Событие e)
		{
			TextEntryDialog ted = new TextEntryDialog(this,
				"This is a small sample\n" ~
				"A long, long ткст to test out the текст entrybox",
				"Please enter a ткст",
				"Default значение",
				Dialog.wxOK | Dialog.wxCANCEL);

			if (ted.ShowModal() == Dialog.wxID_OK)
			{
				MessageDialog md = new MessageDialog(this, ted.Value, "Got ткст");
				md.ShowModal();
			}
		}

		public проц OnPasswordEntry(Объект отправитель, Событие e)
		{
			ткст pwd = GetPasswordFromUser("Enter password:",
				"Password entry dialog",
				"",
				this);

			if (pwd.length > 0)
			{
				MessageDialog md = new MessageDialog(this, "Your password is " ~ pwd, "Got password");
				md.ShowModal();
			}
		}

		public проц OnNumericEntry(Объект отправитель, Событие e)
		{
			цел res = GetNumberFromUser( "This is some текст, actually a lot of текст.\n" ~
				"Even two rows of текст.",
				"Enter a число:",
				"Numeric ввод test",
				50, 0, 100, this );

			ткст msg;
			цел пиктограмма;
			if ( res == -1 )
			{
				msg = "Invalid число entered or dialog cancelled.";
				пиктограмма = Dialog.wxICON_HAND;
			}
			else
			{
				msg = "You've entered " ~ .вТкст(res);
				пиктограмма = Dialog.wxICON_INFORMATION;
			}

			MessageDialog md = new MessageDialog(this, msg, "Numeric test result", Dialog.wxOK | пиктограмма);
			md.ShowModal();
		}

		public проц OnSingleChoice(Объект отправитель, Событие e)
		{
			ткст[] choices = [ "One", "Two", "Three", "Four", "Five"];

			SingleChoiceDialog scd = new SingleChoiceDialog(this,"This is a small sample\n" ~
				"A single-choice dialog",
				"Please селект a значение",
				choices);
			scd.Selection = 2;

			if (scd.ShowModal() == wxID_OK)
			{
				MessageDialog md = new MessageDialog(this, scd.StringSelection(), "Got ткст");
				md.ShowModal();
			}
		}

		public проц OnMultiChoice(Объект отправитель, Событие e)
		{
			// OnMultiChoice uses MultiChoiceDialog instead of GetMultipleChoices which isn't implemented yet
			ткст[] choices = [
														  "One", "Two", "Three", "Four", "Five",
														  "Six", "Seven", "Eight", "Nine", "Ten",
														  "Eleven", "Twelve", "Seventeen" ];

			MultiChoiceDialog mcd = new MultiChoiceDialog(this, "This is a small sample\n" ~
				"A multi-choice convenience dialog",
				"Please селект a значение",
				choices);
			if (mcd.ShowModal() == wxID_OK)
			{
				цел[] selections = mcd.GetSelections();
				цел count = selections.length;
				ткст msg;
				msg = "You selected " ~ .вТкст(count) ~ " элтs:\n";
				for (цел n = 0; n < count; n++)
				{
					msg ~= "\t" ~ .вТкст(n) ~ ": " ~ .вТкст(selections[n]) ~ " (" ~ choices[selections[n]] ~ ")\n";
				}

				MessageDialog md = new MessageDialog(this, msg, "Information");
				md.ShowModal();
			}

		}

		public проц OnTip(Объект отправитель, Событие e)
		{
			// we have to use a IntPtr, class wxTipProvider is abstract and wxFileTipProvider private
			IntPtr tp = TipProvider.CreateFileTipProvider("./data/tips.txt", RAND());

			бул показыватьПриЗапуске = TipProvider.ShowTip(this, tp);

			if ( показыватьПриЗапуске )
			{
				MessageBox(this, "Будут показываться советы при запуске", "Диалог Советов",
					Dialog.wxOK | Dialog.wxICON_INFORMATION);
			}

			// does nothing, only for example
			цел s_index = TipProvider.CurrentTip;
		}

		public проц OnFileOpen(Объект отправитель, Событие e)
		{
			FileDialog fd = new FileDialog(this,
				"Testing open file dialog",
				"",
				"",
				"cs files (*.cs)|*.cs");

			fd.Directory = GetHomeDir();

			if (fd.ShowModal() == wxID_OK)
			{
				ткст info = "Full file имя: " ~ fd.Path ~ "\n" ~
					"Path: " ~ fd.Directory ~ "\n" ~
					"Имя: " ~ fd.Filename;
				MessageDialog md = new MessageDialog(this, info, "Selected file");
				md.ShowModal();
			}
		}

		public проц OnFileOpen2(Объект отправитель, Событие e)
		{
			ткст path = FileSelector( "Select the file to load",
				"", "", s_extDef,
				"Waveform (*.wav)|*.wav|Plain текст (*.txt)|*.txt|All files (*.*)|*.*",
				FileDialog.СМЕНИТЬ_ПАПКУ,
				this );
			if (path.length == 0) return;

			s_extDef = path[path.LastIndexOf(".") + 1..path.length];

			MessageDialog md = new MessageDialog(this,
				"You selected the file '" ~ path ~
				"', remembered расширение '" ~ s_extDef ~ "'",
				"FileOpen2");
			md.ShowModal();
		}

		public проц OnFilesOpen(Объект отправитель, Событие e)
		{
			FileDialog fd = new FileDialog(this,
				"Testing open multiple file dialog",
				"", "", "*",
				FileDialog.НЕСКОЛЬКО);

			if (fd.ShowModal() == wxID_OK)
			{
				ткст[] paths, именаФ;
				paths = fd.Paths;
				именаФ = fd.Filenames;

				ткст msg = "";
				for (цел n = 0; n < paths.length; n++)
				{
					msg ~= "File " ~ .вТкст(n) ~ ": " ~ paths[n] ~ " " ~
						" (" ~ именаФ[n] ~ ")\n";
				}

				MessageDialog md = new MessageDialog(this, msg, "Selected files");
				md.ShowModal();
			}
		}

		public проц OnFileSave(Объект отправитель, Событие e)
		{
			FileDialog fd = new FileDialog(this,
				"Testing save file dialog",
				"",
				"myletter.doc",
				"Text files (*.txt)|*.txt|Document files (*.doc)|*.doc",
				FileDialog.СОХРАНИТЬ | FileDialog.ПРОМПТ_ПЕРЕПИСАТЬ);

			fd.FilterIndex = 1;

			if (fd.ShowModal() == wxID_OK)
			{
				MessageDialog md = new MessageDialog(this, fd.Path ~ ", фильтр " ~ .вТкст(fd.FilterIndex()), "FileSave");
				md.ShowModal();
			}
		}

		public проц OnProgress(Объект отправитель, Событие e)
		{
			цел max = 10;

			ProgressDialog pd = new ProgressDialog(
				"Progress dialog example",
				"An informative message",
				max,
				this,
				ProgressDialog.wxPD_CAN_ABORT |
				ProgressDialog.wxPD_APP_MODAL |
				// ProgressDialog.wxPD_AUTO_HIDE | -- try cast(well)this
				ProgressDialog.wxPD_ELAPSED_TIME |
				ProgressDialog.wxPD_ESTIMATED_TIME |
				ProgressDialog.wxPD_REMAINING_TIME);

			бул конт = да;
			for ( цел i = 0; i <= max; i++)
			{
				wxSleep(1);
				if ( i == max )
				{
					конт = pd.Обнови(i, "That's all, folks!");
				}
				else if ( i == max / 2 )
				{
					конт = pd.Обнови(i, "Only a half left (very long message)!");
				}
				else
				{
					конт = pd.Обнови(i);
				}
				if ( !конт )
				{
					MessageDialog md = new MessageDialog(this,
						"Do you really want to cancel?",
						"Progress dialog question",
						Dialog.wxYES_NO | Dialog.wxICON_QUESTION);
					if (md.ShowModal() == wxID_YES)
					{
						// use вымести() or показ(false) to close the ProgressDialog
						// otherwise the dialog won't get closed and the app hangs
						//pd.вымести();
						pd.показ(false);					
						break;
					}
					pd.Resume();
				}
			}
		
			pd.вымести();
		}

		public проц OnBusyinfo(Объект отправитель, Событие e)
		{
			scope WindowDisabler disableAll = new WindowDisabler();

			scope BusyInfo info = new BusyInfo("Working, please wait...", this);

			for ( цел i = 0; i < 18; i++ )
			{
				Приложение.ДайАпп().Йилд();
				// or wxYield();
			}

			wxSleep(1);

		}

		public проц OnFind(Объект отправитель, Событие e)
		{
			m_dlgFind = new FindReplaceDialog(
				this,
				m_findData,
				"Find Dialog",
				FindReplaceDialog.wxFR_NOWHOLEWORD);
			m_dlgFind.показ(да);
		}

		public проц OnReplace(Объект отправитель, Событие e)
		{
			m_dlgReplace = new FindReplaceDialog(
				this,
				m_findData,
				"Find and replace dialog",
				FindReplaceDialog.wxFR_REPLACEDIALOG);
			m_dlgReplace.показ(да);
		}

		public ткст DecodeFindDialogEventФлаги(цел флаги)
		{
			ткст 	стр = (((флаги & FindReplaceDialog.wxFR_DOWN) != 0) ? "down" : "up") ~ ", " ~
				(((флаги & FindReplaceDialog.wxFR_WHOLEWORD) != 0) ? "whole words only, " : "") ~
				(((флаги & FindReplaceDialog.wxFR_MATCHCASE) != 0) ? "" : "not ") ~
				"case sensitive";

			return стр;
		}

		public проц OnFindEvent(Объект отправитель, Событие e)
		{
			FindDialogEvent fre= cast(FindDialogEvent)e;
			цел etype = fre.eventType;

			if ( etype == Событие.wxEVT_COMMAND_FIND   || etype == Событие.wxEVT_COMMAND_FIND_NEXT )
			{
				Log.LogMessage("Find %s'%s' (флаги: {%s})",
					etype == Событие.wxEVT_COMMAND_FIND_NEXT ? "next " : "",
					fre.FindString,
					DecodeFindDialogEventФлаги(fre.Флаги));
			}
			else if ( etype == Событие.wxEVT_COMMAND_FIND_REPLACE ||
				etype == Событие.wxEVT_COMMAND_FIND_REPLACE_ALL )
			{
				Log.LogMessage("Replace %s'%s' with '%s' (флаги: %s)",
					etype == Событие.wxEVT_COMMAND_FIND_REPLACE_ALL ? "all " : "",
					fre.FindString,
					fre.ReplaceString,
					DecodeFindDialogEventФлаги(fre.Флаги));
			}
			else if ( etype == Событие.wxEVT_COMMAND_FIND_CLOSE )
			{
				FindReplaceDialog dlg = fre.Dialog;

				цел idMenu;
				ткст txt;
				if ( dlg == m_dlgFind )
				{
					txt = "Find";
					idMenu = Cmd.Find;
					m_dlgFind = null;
				}
				else if ( dlg == m_dlgReplace )
				{
					txt = "Replace";
					idMenu = Cmd.Replace;
					m_dlgReplace = null;
				}
				else
				{
					txt = "Unknown";
					idMenu = -1;

					// wxFAIL_MSG...
					Log.LogError("unexpected event");
				}

				Log.LogMessage("%s dialog is being closed.", txt);

				if ( idMenu != -1 )
				{
					menuBar.Check(idMenu, false);
				}

				dlg.Разрушь();
			}
			else
			{
				Log.LogError("Unknown find dialog event!");
			}
		}

		public проц OnModal(Объект отправитель, Событие e)
		{
			MyModalDialog dlg = new MyModalDialog(this);
			dlg.ShowModal();
		}

		public проц OnModeless(Объект отправитель, Событие e)
		{
			СобытиеКоманда ce = cast(СобытиеКоманда) e;
			бул покажи = menuBar.IsChecked(ce.ИД);

			if ( покажи )
			{
				m_dialog = new MyModelessDialog(this);
				m_dialog.показ(да);
			}
			else
			{
				m_dialog.Спрячь();
			}
		}

		//---------------------------------------------------------------------

		public проц ПоВыходу(Объект отправитель, Событие e)
		{
			Закрой(да);
		}

		//---------------------------------------------------------------------
	}

	public class MyCanvas : ScrolledWindow
	{
		public Шрифт шрифт;
		public Цвет textColour;

		public this(Окно родитель)
		{
			super(родитель);
			шрифт = Шрифт.Нормальный;
			textColour = new Цвет(0, 0, 0);
			
			собРисование(&OnPaint);
		}

		public проц OnPaint(Объект отправитель, Событие e)
		{
			PaintDC dc = new PaintDC(this);
			dc.шрифт = шрифт;
			dc.TextForeground = textColour;
			dc.BackgroundMode = FillStyle.wxTRANSPARENT;
			dc.DrawText("wxWidgets common dialogs test application", 10, 10);
			dc.вымести(); //needed
		}
	}

	//---------------------------------------------------------------------

	public class MyModelessDialog : Dialog
	{
		enum ид 
		{
			DIALOG_MODELESS_BTN = 1
		}

		public this(Окно родитель)
		{
			super(родитель, -1, "Modeless dialog");
			ПеремерщикБокса sizerTop = new ПеремерщикБокса(Ориентация.wxVERTICAL);

			Кнопка btn = new Кнопка(this, ид.DIALOG_MODELESS_BTN, "Press me");
			CheckBox check = new CheckBox(this, -1, "Should be disabled");
			check.Отключи();

			sizerTop.Добавь(btn, 1, Stretch.wxEXPAND | Direction.wxALL, 5);
			sizerTop.Добавь(check, 1, Stretch.wxEXPAND | Direction.wxALL, 5);

			Автораскладка = да;
			УстПеремерщик(sizerTop);

			sizerTop.УстРазмПодсказ(this);
			sizerTop.Встрой(this);

			собКнопка(ид.DIALOG_MODELESS_BTN, &OnButton);
			собЗакрой(&OnClose);
		}

		public проц OnButton(Объект отправитель, Событие e)
		{
			MessageBox(this, "Кнопка pressed in modeless dialog", "Info",
				Dialog.wxOK | Dialog.wxICON_INFORMATION);
		}

		public проц OnClose(Объект отправитель, Событие e)
		{
			// must добавить CloseEvent...
			// must добавить Событие.Veto
		}
	}

	//---------------------------------------------------------------------

	public class MyModalDialog : Dialog
	{
		public Кнопка m_btnFocused;
		public Кнопка m_btnDelete;

		public this(Окно родитель)
		{
			super(родитель, -1, "Modal dialog");
			ПеремерщикБокса sizerTop = new ПеремерщикБокса(Ориентация.wxHORIZONTAL);

			m_btnFocused = new Кнопка(this, -1, "Default button");
			m_btnDelete = new Кнопка(this, -1, "&Delete button");
			Кнопка btnOk = new Кнопка(this, wxID_CANCEL, "&Закрой");
			sizerTop.Добавь(m_btnFocused, 0, Alignment.wxALIGN_CENTER | Direction.wxALL, 5);
			sizerTop.Добавь(m_btnDelete, 0, Alignment.wxALIGN_CENTER | Direction.wxALL, 5);
			sizerTop.Добавь(btnOk, 0, Alignment.wxALIGN_CENTER | Direction.wxALL, 5);

			Автораскладка = да;
			УстПеремерщик(sizerTop);

			sizerTop.УстРазмПодсказ(this);
			sizerTop.Встрой(this);

			m_btnFocused.УстФокус();
			m_btnFocused.УстДеф();

			собКнопка(-1, &OnButton);
		}

		public проц OnButton(Объект отправитель, Событие e)
		{
			СобытиеКоманда ce = cast(СобытиеКоманда) e;

			if ( ce.EventObject == m_btnDelete )
			{
				//m_btnFocused = null;
				m_btnDelete.Отключи();
				m_btnFocused.Спрячь();
			}
			else if (ce.EventObject == m_btnFocused )
			{
				GetTextFromUser("Dummy prompt",
					"Modal dialog called from dialog",
					"", this);
			}
			else
			{
				e.Skip();
			}
		}
	}

	public class Dialogs : Приложение
	{
		//---------------------------------------------------------------------

		public override бул поИниц()
		{
			MyFrame рамка = new MyFrame("wxWidgets Dialogs Example",
				Точка(50,50), Размер(450,340));
			рамка.показ(да);

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			Dialogs app = new Dialogs();
			app.пуск();
		}

		//---------------------------------------------------------------------
	}

проц main()
{
	Dialogs.Main();
}
