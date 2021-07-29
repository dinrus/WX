//-----------------------------------------------------------------------------
// wxD/Samples - StyledText.d
//
// A wxD version of the wxWidgets "contrib/stc/stctest" sample.
//
// (C) 2003 Otto Wyss
// (C) 2006 afb <afb.sourceforge.net>
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $ид: StyledText.d,v 1.5 2008/09/26 11:37:06 afb Exp $
//-----------------------------------------------------------------------------

module StyledText;

version (Tango)
static assert(0);
else // Phobos
import std.c : fmin; // for DeterminePrintSize


import wx.wx;
import wx.Display;     // to calculate print Размер

import defsext;	       // Additional definitions
import Edit;	       // Edit module
import Prefs;	       // Prefs
import FileNameFunc;   // Normalize file path.

ткст mondrian = "../Samples/StyledText/mondrian.png";

//============================================================================
// declarations
//============================================================================

ткст APP_NAME = "STC-Test";
ткст APP_DESCR = "See http://wxguide.sourceforge.net/";

ткст APP_MAINT = "Otto Wyss";
ткст APP_VENDOR = "wxWidgets";
ткст APP_COPYRIGHT = "(C) 2003 Otto Wyss";
ткст APP_LICENCE = "wxWidgets";

ткст APP_VERSION = "0.1.альфа";
ткст APP_BUILD = __DATE__;

ткст APP_WEBSITE = "http://www.wxWidgets.org";
ткст APP_MAIL = "mailto://???";

ткст NONAME = "<untitled>";

//----------------------------------------------------------------------------
// global application имя
ткст g_appname = null;

// global print data, to remember settings during the session
PrintData g_printData = null;
PageУстupDialogData g_pageУстupData = null;

//============================================================================
// implementations
//============================================================================

проц main()
{
	StyledTextApp app = new StyledTextApp();
	app.пуск();
}


//----------------------------------------------------------------------------
// StyledTextApp
//----------------------------------------------------------------------------

public class StyledTextApp : Приложение {

	private AppFrame рамка;

	// the main function called durning application start
	public override бул поИниц () {

		Рисунок.InitAllHandlers();

		// set application and vendor имя
		имяПриложения = (APP_NAME);
		ИмяВендора = (APP_VENDOR);
		g_appname = APP_VENDOR ~ "-" ~ APP_NAME;

		// initialize print data and setup
		g_printData = new PrintData;
		g_pageУстupData = new PageУстupDialogData;

		// create application рамка
		рамка = new AppFrame (assumeUnique(g_appname));

		// open application рамка
		рамка.раскладка ();
		рамка.показ (да);
		ТопОкно = (рамка);

		return да;
	}
}

//----------------------------------------------------------------------------
// AppFrame
//----------------------------------------------------------------------------

public class AppFrame : Рамка
{

	private Edit edit;
	private MenuBar m_menuBar;

	// constructor
	public this (ткст титул)
	{
		super(null, wxID_ANY, титул, ДЕФПОЗ, Размер(750,550),
					wxDEFAULT_FRAME_STYLE | ПОЛН_ПЕРЕРИС_ПРИ_ПЕРЕМЕРЕ);

		// about бокс shown for 1 seconds
		// Note: moved here, since otherwise it crashes on wxMac...
		AppAbout dlg = new AppAbout(this, 1000);

		// set пиктограмма and заднийПлан
		Титул = g_appname;
		пиктограмма = new Пиктограмма(mondrian);
		ЦветФона = new Цвет("WHITE");

		// create меню
		m_menuBar = new MenuBar;
		CreateMenu ();

		// open first page
		edit = new Edit (this, wxID_ANY);
		edit.УстФокус();

		FileOpen ("../Samples/StyledText/StyledText.d");

		// common
		собЗакрой (                         cast(ДатчикСобытий)&OnClose);
		// file
		собМеню (MenuIDs.wxID_OPEN,        &OnFileOpen);
		собМеню (MenuIDs.wxID_SAVE,        &OnFileSave);
		собМеню (MenuIDs.wxID_SAVEAS,      &OnFileSaveAs);
		собМеню (MenuIDs.wxID_CLOSE,       &OnFileClose);
		// properties
		собМеню (myID_PROPERTIES,          &OnProperties);
		// print and exit
		собМеню (MenuIDs.wxID_PRINT_SETUP, &OnPrintУстup);
		собМеню (MenuIDs.wxID_PREVIEW,     &OnPrintPreview);
		собМеню (MenuIDs.wxID_PRINT,       &OnPrint);
		собМеню (MenuIDs.wxID_EXIT,        &ПоВыходу);
		// edit
		собМеню (MenuIDs.wxID_CLEAR,       &OnEdit);
		собМеню (MenuIDs.wxID_CUT,         &OnEdit);
		собМеню (MenuIDs.wxID_COPY,        &OnEdit);
		собМеню (MenuIDs.wxID_PASTE,       &OnEdit);
		собМеню (myID_INDENTINC,           &OnEdit);
		собМеню (myID_INDENTRED,           &OnEdit);
		собМеню (MenuIDs.wxID_SELECTALL,   &OnEdit);
		собМеню (myID_SELECTLINE,          &OnEdit);
		собМеню (MenuIDs.wxID_REDO,        &OnEdit);
		собМеню (MenuIDs.wxID_UNDO,        &OnEdit);
		// find
		собМеню (MenuIDs.wxID_FIND,        &OnEdit);
		собМеню (myID_FINDNEXT,            &OnEdit);
		собМеню (myID_REPLACE,             &OnEdit);
		собМеню (myID_REPLACENEXT,         &OnEdit);
		собМеню (myID_BRACEMATCH,          &OnEdit);
		собМеню (myID_GOTO,                &OnEdit);
		// view
		собМенюДиапазон (myID_HILIGHTFIRST, myID_HILIGHTLAST,
		                                    &OnEdit);
		собМеню (myID_DISPLAYEOL,          &OnEdit);
		собМеню (myID_INDENTGUIDE,         &OnEdit);
		собМеню (myID_LINENUMBER,          &OnEdit);
		собМеню (myID_LONGLINEON,          &OnEdit);
		собМеню (myID_WHITESPACE,          &OnEdit);
		собМеню (myID_FOLDTOGGLE,          &OnEdit);
		собМеню (myID_OVERTYPE,            &OnEdit);
		собМеню (myID_READONLY,            &OnEdit);
		собМеню (myID_WRAPMODEON,          &OnEdit);
		// extra
		собМеню (myID_CHANGELOWER,         &OnEdit);
		собМеню (myID_CHANGEUPPER,         &OnEdit);
		собМеню (myID_CONVERTCR,           &OnEdit);
		собМеню (myID_CONVERTCRLF,         &OnEdit);
		собМеню (myID_CONVERTLF,           &OnEdit);
		собМеню (myID_CHARSETANSI,         &OnEdit);
		собМеню (myID_CHARSETMAC,          &OnEdit);
		// help
		собМеню (MenuIDs.wxID_ABOUT,       &OnAbout);
	}

	// common event handlers
	public проц OnClose (Объект отправитель, CloseEvent event)
	{
		СобытиеКоманда evt;
		OnFileClose (this, evt);

		if (edit && edit.Modified()) {
			if (event.CanVeto())
				event.Veto (да);
			return;
		}
		Разрушь();
	}

	public проц OnAbout (Объект отправитель, Событие event)
	{
		scope AppAbout dlg = new AppAbout(this);
	}

	public проц ПоВыходу (Объект отправитель, Событие event)
	{
		Закрой (да);
	}

	// file event handlers
	public проц OnFileOpen (Объект отправитель, Событие event)
	{
		if (!edit) return;
		
		ткст fname;
		scope FileDialog dlg = new FileDialog(this, "Open file", "", "", "Any file (*)|*",
			FileDialog.ОТКРЫТЬ | FileDialog.ДОЛЖЕН_СУЩЕСТВОВАТЬ | FileDialog.СМЕНИТЬ_ПАПКУ);
		
		if (dlg.ShowModal() != wxID_OK) return;

		fname = dlg.Path;
		FileOpen (fname);
	}

	public проц OnFileSave (Объект отправитель, Событие event)
	{
		if (!edit) return;

		if (!edit.Modified()) {
			MessageBox("There is nothing to save!", "Save file", Dialog.wxOK | Dialog.wxICON_EXCLAMATION);
			return;
		}
		edit.СохраниФайл ();
	}

	public проц OnFileSaveAs (Объект отправитель, Событие event)
	{
		if (!edit) return;

		ткст filename;
		scope FileDialog dlg = new FileDialog(this, "Save file", "", "", "Any file (*)|*",
		
			FileDialog.СОХРАНИТЬ | FileDialog.ПРОМПТ_ПЕРЕПИСАТЬ);

		if (dlg.ShowModal() != wxID_OK) return;

		filename = dlg.Path;
		edit.СохраниФайл (filename);
	}

	public проц OnFileClose (Объект отправитель, Событие event)
	{
		if (!edit) return;

		if (edit.Modified()) {
			if (MessageBox("Text is not saved, save перед closing?", "Закрой",
					Dialog.wxYES_NO | Dialog.wxICON_QUESTION) == Dialog.wxYES) {
				edit.СохраниФайл();
				if (edit.Modified()) {
					MessageBox("Text could not be saved!", "Закрой abort",
							Dialog.wxOK | Dialog.wxICON_EXCLAMATION);
					return;
				}
			}
		}

		edit.УстFilename ("");
		edit.ClearAll();
		edit.УстSavePoint();
	}

	// properties event handlers
	public проц OnProperties (Объект отправитель, Событие event)
	{
		if (!edit) return;

		scope EditProperties dlg = new EditProperties(edit, 0);
	}

	// print event handlers
	public проц OnPrintУстup (Объект отправитель, Событие event)
	{
		g_pageУстupData.printData = g_printData;
		PageУстupDialog pageУстupDialog = new PageУстupDialog(this, g_pageУстupData);
		pageУстupDialog.ShowModal();
		g_printData = pageУстupDialog.PageУстupData.printData;
		g_pageУстupData = pageУстupDialog.PageУстupData;
	}

	public проц OnPrintPreview (Объект отправитель, Событие event)
	{
		PrintDialogData printDialogData = new PrintDialogData(g_printData);
		PrintPreview preview = new PrintPreview (new EditPrint (edit),
			new EditPrint (edit), printDialogData);
		
		if (!preview.Ок()) {
			MessageBox ("There was a problem with previewing.\n" ~
							 "Perhaps your current printer is not correctly?",
						  "Previewing", Dialog.wxOK);
			return;
		}

		Прямоугольник прям = DeterminePrintSize();
		PreviewFrame рамка = new PreviewFrame (preview, this, "Print Preview");
		рамка.УстРазм (прям);
		рамка.Центр(Ориентация.wxBOTH);
		рамка.Инициализируй();
		рамка.показ(да);
	}

	public проц OnPrint (Объект отправитель, Событие event)
	{
		PrintDialogData printDialogData = new PrintDialogData(g_printData);
		Printer printer = new Printer(printDialogData);
		EditPrint printout = new EditPrint(edit);
		if (!printer.Print (this, printout, да)) {
			if (printer.LastError() == PrinterError.wxPRINTER_ERROR) {
			MessageBox ("There was a problem with printing.\n" ~
						  "Perhaps your current printer is not correctly?",
						  "Previewing", Dialog.wxOK);
				return;
			}
		}
		g_printData = printer.printDialogData.printData;
	}

	// edit events
	public проц OnEdit (Объект отправитель, Событие event)
	{
		if (edit) edit.ProcessEvent (event);
	}

	// private functions

	// creates the application меню bar
	private проц CreateMenu ()
	{
		// File меню
		wxMenu menuFile = new wxMenu;
		menuFile.Append (MenuIDs.wxID_OPEN, "&Open ..\tCtrl+O");
		menuFile.Append (MenuIDs.wxID_SAVE, "&Save\tCtrl+S");
		menuFile.Append (MenuIDs.wxID_SAVEAS, "Save &as ..\tCtrl+Shift+S");
		menuFile.Append (MenuIDs.wxID_CLOSE, "&Закрой\tCtrl+W");
		menuFile.добавьРазделитель();
		menuFile.Append (myID_PROPERTIES, "Proper&ties ..\tCtrl+I");
		menuFile.добавьРазделитель();
		menuFile.Append (MenuIDs.wxID_PRINT_SETUP, "Print Уст&up ..");
		menuFile.Append (MenuIDs.wxID_PREVIEW, "Print Pre&view\tCtrl+Shift+P");
		menuFile.Append (MenuIDs.wxID_PRINT, "&Print ..\tCtrl+P");
		menuFile.добавьРазделитель();
		menuFile.Append (MenuIDs.wxID_EXIT, "&Quit\tCtrl+Q");

		// Edit меню
		Меню menuEdit = new Меню;
		menuEdit.Append (MenuIDs.wxID_UNDO, "&Undo\tCtrl+Z");
		menuEdit.Append (MenuIDs.wxID_REDO, "&Redo\tCtrl+Shift+Z");
		menuEdit.добавьРазделитель();
		menuEdit.Append (MenuIDs.wxID_CUT, "Cu&t\tCtrl+X");
		menuEdit.Append (MenuIDs.wxID_COPY, "&Copy\tCtrl+C");
		menuEdit.Append (MenuIDs.wxID_PASTE, "&Paste\tCtrl+V");
		menuEdit.Append (MenuIDs.wxID_CLEAR, "&Delete\tDel");
		menuEdit.добавьРазделитель();
		menuEdit.Append (MenuIDs.wxID_FIND, "&Find\tCtrl+F");
		menuEdit.Включи (MenuIDs.wxID_FIND, false);
		menuEdit.Append (myID_FINDNEXT, "Find &next\tF3");
		menuEdit.Включи (myID_FINDNEXT, false);
		menuEdit.Append (myID_REPLACE, "&Replace\tCtrl+H");
		menuEdit.Включи (myID_REPLACE, false);
		menuEdit.Append (myID_REPLACENEXT, "Replace &again\tShift+F4");
		menuEdit.Включи (myID_REPLACENEXT, false);
		menuEdit.добавьРазделитель();
		menuEdit.Append (myID_BRACEMATCH, "&Match brace\tCtrl+M");
		menuEdit.Append (myID_GOTO, "&Goto\tCtrl+G");
		menuEdit.Включи (myID_GOTO, false);
		menuEdit.добавьРазделитель();
		menuEdit.Append (myID_INDENTINC, "&отступ increase\tTab");
		menuEdit.Append (myID_INDENTRED, "I&ndent reduce\tBksp");
		menuEdit.добавьРазделитель();
		menuEdit.Append (MenuIDs.wxID_SELECTALL, "&Select all\tCtrl+A");
		menuEdit.Append (myID_SELECTLINE, "Select &строка\tCtrl+L");

		// hilight submenu
		Меню menuHilight = new Меню;
		цел Nr;
		for (Nr = 0; Nr < g_LanguagePrefs.length; Nr++) {
			menuHilight.Append (myID_HILIGHTFIRST + Nr,
								 g_LanguagePrefs [Nr].имя);
		}

		// гарнитура submenu
		Меню menuCharset = new Меню;
		menuCharset.Append (myID_CHARSETANSI, "&ANSI (Windows)");
		menuCharset.Append (myID_CHARSETMAC, "&MAC (Macintosh)");

		// View меню
		Меню menuView = new Меню;
		menuView.Append (myID_HILIGHTLANG, "&Hilight language ..", menuHilight);
		menuView.добавьРазделитель();
		menuView.добавьЧекЭлт (myID_FOLDTOGGLE, "&Toggle current fold\tCtrl+T");
		menuView.добавьЧекЭлт (myID_OVERTYPE, "&Overwrite mode\tIns");
		menuView.добавьЧекЭлт (myID_WRAPMODEON, "&Wrap mode\tCtrl+U");
		menuView.добавьРазделитель();
		menuView.добавьЧекЭлт (myID_DISPLAYEOL, "показ строка &endings");
		menuView.добавьЧекЭлт (myID_INDENTGUIDE, "показ &indent guides");
		menuView.добавьЧекЭлт (myID_LINENUMBER, "показ строка &numbers");
		menuView.добавьЧекЭлт (myID_LONGLINEON, "показ &long строка marker");
		menuView.добавьЧекЭлт (myID_WHITESPACE, "показ white&space");
		menuView.добавьРазделитель();
		menuView.Append (myID_USECHARSET, "Use &код page of ..", menuCharset);

		// change case submenu
		Меню menuChangeCase = new Меню;
		menuChangeCase.Append (myID_CHANGEUPPER, "&Upper case");
		menuChangeCase.Append (myID_CHANGELOWER, "&Понизь case");

		// convert EOL submenu
		Меню menuConvertEOL = new Меню;
		menuConvertEOL.Append (myID_CONVERTCR, "CR (&Linux)");
		menuConvertEOL.Append (myID_CONVERTCRLF, "CR+LF (&Windows)");
		menuConvertEOL.Append (myID_CONVERTLF, "LF (&Macintosh)");

		// Extra меню
		Меню menuExtra = new Меню;
		menuExtra.добавьЧекЭлт (myID_READONLY, "&Readonly mode");
		menuExtra.добавьРазделитель();
		menuExtra.Append (myID_CHANGECASE, "Change &case to ..", menuChangeCase);
		menuExtra.добавьРазделитель();
		menuExtra.Append (myID_CONVERTEOL, "Convert строка &endings to ..", menuConvertEOL);

		// Окно меню
		Меню menuWindow = new Меню;
		menuWindow.Append (myID_PAGEPREV, "&Previous\tCtrl+Shift+Tab");
		menuWindow.Append (myID_PAGENEXT, "&Next\tCtrl+Tab");

		// Help меню
		Меню menuHelp = new Меню;
		menuHelp.Append (MenuIDs.wxID_ABOUT, "&About ..\tShift+F1");

		// construct меню
		m_menuBar.Append (menuFile, "&File");
		m_menuBar.Append (menuEdit, "&Edit");
		m_menuBar.Append (menuView, "&View");
		m_menuBar.Append (menuExtra, "E&xtra");
		m_menuBar.Append (menuWindow, "&Окно");
		m_menuBar.Append (menuHelp, "&Help");
		this.menuBar = m_menuBar;
	}

	private проц FileOpen (ткст fname)
	{
		fname = absPath(fname);
		edit.ЗагрузиФайл (fname);
	}

	// print preview position and Размер
	private Прямоугольник DeterminePrintSize ()
	{
		Display display = new Display(Display.GetFromPoint(this.Позиция));
		Прямоугольник scr = display.Geometry();

		// determine position and Размер (shifting 16 left and down)
		Прямоугольник прям = Прям();
		прям.X += 16;
		прям.Y += 16;
		прям.Ширь = cast(цел)fmin (прям.Ширь, (scr.X - прям.X));
		прям.Высь = cast(цел)fmin (прям.Высь, (scr.X - прям.Y));

		return прям;
	}
}

//----------------------------------------------------------------------------
// AppAbout
//----------------------------------------------------------------------------

public class AppAbout : Dialog
{
	private Timer timer;

	// constructor
	public this (Окно родитель,	цел milliseconds = 0,
					long стиль = wxDEFAULT_DIALOG_STYLE)
	{
		super(родитель, wxID_ANY, "",	ДЕФПОЗ, вхДефРазм,
					стиль | wxDEFAULT_DIALOG_STYLE | wxRESIZE_BORDER);

		// set timer if any
		if (milliseconds > 0) {
			timer = new Timer (this, myID_ABOUTTIMER);
			
			timer.УстOwner(this);
			
			timer.Start (milliseconds, ТАЙМЕР_ОДНОРАЗОВЫЙ);
		}

		// sets the application титул
		Титул ("About ..");

		// about info
		GridSizer aboutinfo = new GridSizer (2, 0, 2);
		aboutinfo.Добавь (new StaticText(this, wxID_ANY, "Written by: "),
						0, Alignment.wxALIGN_LEFT);
		aboutinfo.Добавь (new StaticText(this, wxID_ANY, APP_MAINT),
						1, Stretch.wxEXPAND | Alignment.wxALIGN_LEFT);
		aboutinfo.Добавь (new StaticText(this, wxID_ANY, "Version: "),
						0, Alignment.wxALIGN_LEFT);
		aboutinfo.Добавь (new StaticText(this, wxID_ANY, APP_VERSION),
						1, Stretch.wxEXPAND | Alignment.wxALIGN_LEFT);
		aboutinfo.Добавь (new StaticText(this, wxID_ANY, "Licence тип: "),
						0, Alignment.wxALIGN_LEFT);
		aboutinfo.Добавь (new StaticText(this, wxID_ANY, APP_LICENCE),
						1, Stretch.wxEXPAND | Alignment.wxALIGN_LEFT);
		aboutinfo.Добавь (new StaticText(this, wxID_ANY, "Copyright: "),
						0, Alignment.wxALIGN_LEFT);
		aboutinfo.Добавь (new StaticText(this, wxID_ANY, APP_COPYRIGHT),
						1, Stretch.wxEXPAND | Alignment.wxALIGN_LEFT);

		// about icontitle//info
		ПеремерщикБокса aboutpane = new ПеремерщикБокса (Ориентация.wxHORIZONTAL);
		Битмап битмап = new Битмап(new Пиктограмма(mondrian));
		aboutpane.Добавь (new StaticBitmap (this, wxID_ANY, битмап),
						0, Alignment.wxALIGN_LEFT|Alignment.wxALIGN_CENTER_VERTICAL|Direction.wxLEFT|Direction.wxRIGHT, 20);
		aboutpane.Добавь (aboutinfo, 1, Stretch.wxEXPAND);
		aboutpane.Добавь (60, 0);

		// about complete
		ПеремерщикБокса totalpane = new ПеремерщикБокса (Ориентация.wxVERTICAL);
		totalpane.Добавь (0, 20);
		StaticText appname = new StaticText(this, wxID_ANY, g_appname);
		appname.УстFont (new Шрифт (24, СемействоШрифтов.wxDEFAULT, СтильШрифта.wxNORMAL, ВесШрифта.wxBOLD));
		totalpane.Добавь (appname, 0, Alignment.wxALIGN_CENTER | Direction.wxLEFT | Direction.wxRIGHT, 40);
		totalpane.Добавь (0, 10);
		totalpane.Добавь (aboutpane, 0, Stretch.wxEXPAND | Direction.wxALL, 4);
		totalpane.Добавь (new StaticText(this, wxID_ANY, APP_DESCR),
						0, Alignment.wxALIGN_CENTER | Direction.wxALL, 10);
		Кнопка okButton = new Кнопка (this, wxID_OK, "OK");
		okButton.УстДеф();
		totalpane.Добавь (okButton, 0, Alignment.wxALIGN_CENTER | Direction.wxLEFT | Direction.wxRIGHT | Direction.wxBOTTOM, 10);

		УстПеремерщикИВстрой (totalpane, да);

		//Добавь event перед ShowModal
		собТаймер (myID_ABOUTTIMER, &OnTimerEvent);

		ЦентрируйНаЭкране();
		ShowModal();
	}

	// event handlers
	public проц OnTimerEvent (Объект отправитель, Событие event)
	{
	
		timer = null;
		EndModal (wxID_OK);
	}
}
