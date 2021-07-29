import wx.wx;

private import stdrus;


    //-------------------------------------------------------------------------
    // Application entry class

    public class Controls : Приложение
    {
        public override бул поИниц()
        {
            // TODO: Добавь command строка processing for окно position

            MyFrame рамка = new MyFrame("Controls wxWidgets Приложение",
                                        Точка(50,50), Размер(500,430));
            рамка.показ(да);
            return да;
        }

        //---------------------------------------------------------------------

        
        static проц Main()
        {
            Controls app = new Controls();
            app.пуск();
        }
    }

    //-------------------------------------------------------------------------
    // Main application рамка

    public class MyFrame : Рамка
    {
        public const цел ID_ABOUT       = 100;
        public const цел ID_EXIT        = 101;
        public const цел ID_CLEAR_LOG   = 102;
        public const цел ID_SET_DELAY   = 103;
        public const цел ID_TOGGLE_TIPS = 104;
        public const цел ID_DISABLE_ALL = 105;

        //---------------------------------------------------------------------

        private MyPanel панель;
        private static бул tipsEnabled = да;
        private static цел tipDelay = 5000;
                private static бул panelEnabled = да;

        //---------------------------------------------------------------------

        public this(ткст титул, Точка поз, Размер Размер)
        {
            super(титул, поз, Размер);
            // Уст the окно пиктограмма
            пиктограмма = new Пиктограмма("./data/mondrian.png");

            // Создай the main панель
            панель = new MyPanel(this, 10, 10, 300, 100);

            // Уст up a меню
            Меню файлМеню = new Меню();
            файлМеню.Append(ID_CLEAR_LOG, "&Clear Log\tCtrl+L",
                            "Clear the log окно");
            файлМеню.добавьРазделитель();
            файлМеню.Append(ID_ABOUT, "&About\tF1", "About this application");
            файлМеню.добавьРазделитель();
            файлМеню.Append(ID_EXIT, "E&xit\tAlt+X", "Exit this program");

            Меню tooltipMenu = new Меню();
            tooltipMenu.Append(ID_SET_DELAY, "&Уст Delay..\tCtrl+D",
                               "Уст тултип delay");
            tooltipMenu.добавьРазделитель();
            tooltipMenu.Append(ID_TOGGLE_TIPS, "&Toggle Tooltips\tCtrl+T",
                               "Включи/Отключи tooltips",
                               ItemKind.wxITEM_CHECK);
            tooltipMenu.Check(ID_TOGGLE_TIPS, tipsEnabled);

            Меню panelMenu = new Меню();
            panelMenu.Append(ID_DISABLE_ALL,
                             "&Отключи All\tCtrl+E",
                             "Включи/Отключи all панель controls",
                             ItemKind.wxITEM_CHECK);

            MenuBar menuBar = new MenuBar();
            menuBar.Append(файлМеню, "&File");
            menuBar.Append(tooltipMenu, "&Tooltips");
            menuBar.Append(panelMenu, "&Panel");

            this.menuBar = menuBar;

            // Уст up the event table for the меню
            собМеню(ID_CLEAR_LOG,      &OnClearLog);
            собМеню(ID_ABOUT,          &OnAbout);
            собМеню(ID_EXIT,           &OnQuit);
            собМеню(ID_SET_DELAY,      &OnУстTooltipDelay);
            собМеню(ID_TOGGLE_TIPS,    &OnToggleTooltips);
            собМеню(ID_DISABLE_ALL,    &OnDisableAll);

            // Уст up a status bar
            CreateStatusBar(2);
            StatusText = "";
        }

        //---------------------------------------------------------------------

        public проц OnClearLog(Объект отправитель, Событие e)
        {
            панель.текст.Clear();
        }

        //---------------------------------------------------------------------

        public проц OnAbout(Объект отправитель, Событие e)
        {
            ткст msg = "This is the wxWidgets controls sample written in D.";
            MessageBox(this, msg, "About Controls",
                                       Dialog.wxOK);
        }

        //---------------------------------------------------------------------

        public проц OnQuit(Объект отправитель, Событие e)
        {
	            Закрой(да);

        }

        //---------------------------------------------------------------------

        public проц OnУстTooltipDelay(Объект отправитель, Событие e)
        {
            цел ввод;
            ввод = GetNumberFromUser("Enter delay (in milliseconds)",
                                      "Уст тултип delay", "ToolTip Delay",
                                      tipDelay, 0, 10000, this);

            if (ввод != -1) {
                tipDelay = ввод;
                ToolTip.Delay = tipDelay;
            }

            Log.LogStatus("Tooltip delay set to %d milliseconds", ввод);
        }

        //---------------------------------------------------------------------

        public проц OnToggleTooltips(Объект отправитель, Событие e)
        {
            tipsEnabled = !tipsEnabled;
            ToolTip.Активен = tipsEnabled;

            Log.LogStatus("Tooltips {0}abled", tipsEnabled ? "en" : "dis" );
        }

        //---------------------------------------------------------------------

        public проц OnDisableAll(Объект отправитель, Событие e)
        {
            panelEnabled = !panelEnabled;
            панель.Активен = panelEnabled;
        }
    }

    //-------------------------------------------------------------------------
    // Main content панель

    public class MyPanel : Panel
    {
        private const цел ID_NOTEBOOK         = 1;

        private const цел ID_LISTBOX          = 2;
        private const цел ID_LISTBOX_SORTED   = 3;
        private const цел ID_LISTBOX_SEL_NUM  = 4;
        private const цел ID_LISTBOX_SEL_STR  = 5;
        private const цел ID_LISTBOX_APPEND   = 6;
        private const цел ID_LISTBOX_DELETE   = 7;
        private const цел ID_LISTBOX_FONT     = 8;
        private const цел ID_LISTBOX_ENABLE   = 9;
        private const цел ID_LISTBOX_CLEAR    = 10;
        private const цел ID_LISTBOX_COLOUR   = 11;

        private const цел ID_CHOICE           = 20;
        private const цел ID_CHOICE_SORTED    = 21;
        private const цел ID_CHOICE_SEL_NUM   = 22;
        private const цел ID_CHOICE_SEL_STR   = 23;
        private const цел ID_CHOICE_APPEND    = 24;
        private const цел ID_CHOICE_DELETE    = 25;
        private const цел ID_CHOICE_FONT      = 26;
        private const цел ID_CHOICE_ENABLE    = 27;
        private const цел ID_CHOICE_CLEAR     = 28;

        private const цел ID_COMBO            = 40;
        private const цел ID_COMBO_SEL_NUM    = 41;
        private const цел ID_COMBO_SEL_STR    = 42;
        private const цел ID_COMBO_APPEND     = 43;
        private const цел ID_COMBO_DELETE     = 44;
        private const цел ID_COMBO_FONT       = 45;
        private const цел ID_COMBO_ENABLE     = 46;
        private const цел ID_COMBO_CLEAR      = 47;

        private const цел ID_RADIO            = 60;
        private const цел ID_RADIO_SEL_NUM    = 61;
        private const цел ID_RADIO_SEL_STR    = 62;
        private const цел ID_RADIO_FONT       = 63;
        private const цел ID_RADIO_ENABLE     = 64;
        private const цел ID_RADIO_BUTTON1    = 65;
        private const цел ID_RADIO_BUTTON2    = 66;

        private const цел ID_SLIDER           = 80;
        private const цел ID_SPINCTRL         = 81;
        private const цел ID_SPIN             = 82;
        private const цел ID_BTNPROGRESS      = 83;
		
		private const цел ID_BITMAP_BTN = 84;
		private const цел ID_BUTTON_LABEL = 85;
		
		private const цел ID_SIZER_CHECK1 = 90;
		private const цел ID_SIZER_CHECK2 = 91;
		private const цел ID_SIZER_CHECK3 = 92;
		private const цел ID_SIZER_CHECK4 = 93;
		private const цел ID_SIZER_CHECK14 = 94;
		private const цел ID_SIZER_CHECKBIG = 95;

        private const цел ID_SETFONT          = 100;

        enum Images { List = 0, Choice, Combo, Text, Radio, Gauge, Max }

        //---------------------------------------------------------------------

        private Notebook notebook;
        public  TextCtrl текст;

        // ListBox sample members
        private ListBox     listbox, listboxSorted;
        private Кнопка      selectNum, selectStr;
        private CheckBox    checkbox;
        private бул        oldColour;
        private RadioBox    radiobox;

        // Choice sample members
        private Choice choice, choiceSorted;

        // Combo sample members
        private ComboBox combo;

        // Gauge/Slider sample members
        private Gauge gauge, gaugeVert;
        private Slider slider;
        private SpinCtrl spinctrl;
        private SpinButton spinbutton;
        private TextCtrl spintext;
        private цел initialSpinValue;
        private Кнопка btnProgress;
		
		private Кнопка fontButton;
		
		private StaticText m_label;
		
		private ПеремерщикБокса m_buttonSizer;
		private Кнопка m_sizerBtn1;
		private Кнопка m_sizerBtn2;
		private Кнопка m_sizerBtn3;
		private Кнопка m_sizerBtn4;
		private ПеремерщикБокса m_hsizer;
		private Кнопка m_bigBtn;

        //---------------------------------------------------------------------

        public this(Рамка рамка, цел x, цел y, цел w, цел h)
        {
            super(рамка, -1, Точка(x, y), Размер(w, h));
            ткст[] choices = [
                "This", "is", "one of my", "wonderful", "examples"
            ];

            ткст[] choices2 = [
                    "First", "секунда"
            ];

            oldColour = false;

            // Создай the log текст view
            текст = new TextCtrl(this, -1, "This is the log окно.\n",
                                Точка(0, 250), Размер(100, 50),
                                TextCtrl.МНОГОСТРОК);
            текст.ЦветФона = new Цвет("wheat");

            Log.AddTraceMask("focus");
            Log.УстActiveTarget( текст ); 

            // Создай the notebook
            notebook = new Notebook(this, ID_NOTEBOOK);

            // Создай the рисунок list for the notebook
            ткст imgPath = "./data/Icons/";
            ImageList imagelist = new ImageList(16, 16, false,
                                                Images.Max);

            imagelist.Добавь(new Битмап(imgPath ~ "list.xpm"));
            imagelist.Добавь(new Битмап(imgPath ~ "choice.xpm"));
            imagelist.Добавь(new Битмап(imgPath ~ "combo.xpm"));
            imagelist.Добавь(new Битмап(imgPath ~ "текст.xpm"));
            imagelist.Добавь(new Битмап(imgPath ~ "radio.xpm"));
            imagelist.Добавь(new Битмап(imgPath ~ "gauge.xpm"));

            notebook.Images = imagelist;

            // Добавь some panels

            // wxListBox sample панель
            Panel панель = new Panel(notebook);
            notebook.AddPage(панель, "wxListBox", да, Images.List);

            listbox = new ListBox(панель, ID_LISTBOX,
                                  Точка(10, 10), Размер(120, 70),
                                  choices, ListBox.wxLB_ALWAYS_SB);
            listboxSorted = new ListBox(панель, ID_LISTBOX_SORTED,
                                        Точка(10, 90), Размер(120, 70),
                                        choices, ListBox.СОРТИРУЕМЫЙ);

            // TODO: Добавь in ClientData

            listbox.тултип = "This is a List Box.";
            listboxSorted.тултип = "This is a sorted List Box.";

            selectNum = new Кнопка(панель, -1,
                                   "Select #&2", Точка(180, 30),
                                   Размер(150, -1));
            selectStr = new Кнопка(панель, ID_LISTBOX_SEL_STR,
                                   "&Select 'This'", Точка(340, 30),
                                   Размер(150, -1));

            new Кнопка(панель, ID_LISTBOX_CLEAR, "&Clear",
                       Точка(180, 80), Размер(150, -1));
            new Кнопка(панель, ID_LISTBOX_APPEND, "&Append 'Hi!'",
                       Точка(340, 80), Размер(150, -1));
            new Кнопка(панель, ID_LISTBOX_DELETE,
                       "Delete selected элт",
                       Точка(180, 130), Размер(150, -1));

            Кнопка button = new Кнопка(панель, ID_LISTBOX_FONT,
                                       "Уст &Italic шрифт",
                                       Точка(340, 130),
                                       Размер(150, -1));
            button.УстДеф();
            button.цветПП = new Цвет("blue");
            button.тултип = "Click here to set Italic шрифт";

            checkbox = new CheckBox(панель, ID_LISTBOX_ENABLE,
                                    "&Отключи", Точка(20, 170));
            checkbox.Value = false;
            checkbox.тултип = "Click to disable listbox";

            new CheckBox(панель, ID_LISTBOX_COLOUR,
                         "&Toggle цвет", Точка(110, 170));

            панель.курсор = new Курсор(StockCursor.wxCURSOR_HAND);

            // wxChoice sample панель
            панель = new Panel(notebook);
            notebook.AddPage(панель, "wxChoice", false, Images.Choice);

            choice = new Choice(панель, ID_CHOICE, Точка(10, 10),
                                Размер(120, -1), choices);
            choiceSorted = new Choice(панель, ID_CHOICE_SORTED,
                                      Точка(10, 70), Размер(120, -1),
                                      choices, ComboBox.wxCB_SORT);

            // TODO: Добавь in клиент data

            choice.Selection = 2;
            choice.ЦветФона = new Цвет("red");

            new Кнопка(панель, ID_CHOICE_SEL_NUM, "Select #&2",
                       Точка(180, 30), Размер(150, -1));
            new Кнопка(панель, ID_CHOICE_SEL_STR, "&Select 'This'",
                       Точка(340, 30), Размер(150, -1));
            new Кнопка(панель, ID_CHOICE_CLEAR, "&Clear",
                       Точка(180, 80), Размер(150, -1));
            new Кнопка(панель, ID_CHOICE_APPEND, "&Append 'Hi!'",
                       Точка(340, 80), Размер(150, -1));
            new Кнопка(панель, ID_CHOICE_DELETE, "D&elete selected элт",
                       Точка(180, 130), Размер(150, -1));
            new Кнопка(панель, ID_CHOICE_FONT, "Уст &Italic шрифт",
                       Точка(340, 130), Размер(150, -1));
            new CheckBox(панель, ID_CHOICE_ENABLE, "&Отключи",
                         Точка(20, 130));

            // wxComboBox sample панель
            панель = new Panel(notebook);
            notebook.AddPage(панель, "wxComboBox", false, Images.Combo);

            new StaticBox(панель, -1, "&Box around combobox",
                          Точка(5, 5), Размер(150, 100));
            combo = new ComboBox(панель, ID_COMBO, "This",
                                 Точка(20, 25), Размер(120, -1),
                                 choices);
            combo.тултип = "This is a natural\ncombobox - unbelievable";

            new Кнопка(панель, ID_COMBO_SEL_NUM, "Select #&2",
                       Точка(180, 30), Размер(150, -1));
            new Кнопка(панель, ID_COMBO_SEL_STR, "&Select 'This'",
                       Точка(340, 30), Размер(150, -1));
            new Кнопка(панель, ID_COMBO_CLEAR, "&Clear",
                       Точка(180, 80), Размер(150, -1));
            new Кнопка(панель, ID_COMBO_APPEND, "&Append 'Hi!'",
                       Точка(340, 80), Размер(150, -1));
            new Кнопка(панель, ID_COMBO_DELETE, "D&elete selected элт",
                       Точка(180, 130), Размер(150, -1));
            new Кнопка(панель, ID_COMBO_FONT, "Уст &Italic шрифт",
                       Точка(340, 130), Размер(150, -1));
            new CheckBox(панель, ID_COMBO_ENABLE, "&Отключи",
                         Точка(20, 130));

            // wxRadioBox sample панель
            панель = new Panel(notebook);
            notebook.AddPage(панель, "wxRadioBox", false, Images.Radio);

                        new RadioBox(панель, ID_RADIO, "&That",
                         Точка(10, 160), вхДефРазм, choices2, 1,
                         RadioBox.wxRA_SPECIFY_ROWS);
            radiobox = new RadioBox(панель, ID_RADIO,
                                    "T&his", Точка(10, 10),
                                    вхДефРазм, choices, 1,
                                    RadioBox.wxRA_SPECIFY_COLS);
            radiobox.тултип = "Ever seen a radiobox?";
            radiobox.цветПП = new Цвет("Red");

            new Кнопка(панель, ID_RADIO_SEL_NUM, "Select #&2",
                       Точка(180, 30), Размер(150, -1));
            fontButton = new Кнопка(панель, ID_SETFONT, "Уст &more Italic шрифт",
                       Точка(340, 30), Размер(150, -1));
            new Кнопка(панель, ID_RADIO_SEL_STR, "&Select 'This'",
                       Точка(180, 80), Размер(150, -1));
            new Кнопка(панель, ID_RADIO_FONT, "Уст &Italic Шрифт",
                       Точка(340, 80), Размер(150, -1));
            new CheckBox(панель, ID_RADIO_ENABLE, "&Отключи",
                         Точка(340, 130));

                        (new RadioButton(панель, ID_RADIO_BUTTON1, "Radiobutton1",
                                                        Точка(210, 170), вхДефРазм,
                                                        RadioButton.wxRB_GROUP)).Value = false;
                        new RadioButton(панель, ID_RADIO_BUTTON2, "Radiobutton2",
                                                        Точка(340, 170));

            // wxGauge sample панель
            панель = new Panel(notebook);
            notebook.AddPage(панель, "wxGauge", false, Images.Gauge);

            new StaticBox(панель, -1, "&wxGauge and wxSlider", 
                          Точка(10, 10), Размер(222, 130));
            gauge = new Gauge(панель, -1, 200, 
                              Точка(18, 50), Размер(155, 30), 
                              Gauge.ГОРИЗОНТАЛЬНЫЙ | /*ПБордюр.*/wxNO_BORDER);
            gauge.ЦветФона = new Цвет("Green");
            gauge.цветПП = new Цвет("Red");

            gaugeVert = new Gauge(панель, -1, 200, 
                                  Точка(195, 35), Размер(30, 90),
                                  Gauge.ВЕРТИКАЛЬНЫЙ | Gauge.ГЛАДКИЙ |
                                  /*ПБордюр.*/wxNO_BORDER);

            slider = new Slider(панель, ID_SLIDER, 0, 0, 200, 
                                Точка(18, 90), Размер(155, -1),
                                Slider.wxSL_AUTOTICKS | Slider.wxSL_LABELS);
            slider.УстTickFreq(40, 0);
            slider.тултип = "This is a sliding slider!";

            new StaticBox(панель, -1, "&Explanation", Точка(230, 10),
                          Размер(270, 130), Alignment.wxALIGN_CENTER);
            new StaticText(панель, -1, 
                           "In order to see the gauge (aka progress \n" ~
                           "bar) control do something, drag the \n" ~
                           "handle of the slider to the right\n" ~
                           "\n" ~
                           "This is also supposed to demonstrate\n" ~
                           "how to use static controls.",
                           Точка(250, 25), Размер(240, 110));

            spinctrl = new SpinCtrl(панель, ID_SPINCTRL, "",
                                    Точка(200, 160), Размер(80, -1));
            spinctrl.УстRange(10, 30);
            spinctrl.Value = 15;

            initialSpinValue = -5;
            spintext = new TextCtrl(панель, -1, "" ~ .вТкст(initialSpinValue),
                                    Точка(20, 160), Размер(80, -1));
            spinbutton = new SpinButton(панель, ID_SPIN, 
                                        Точка(103, 160), Размер(80, -1));
            spinbutton.УстRange(-40, 30);
            spinbutton.Value = initialSpinValue;

            btnProgress = new Кнопка(панель, ID_BTNPROGRESS, 
                                     "&показ progress dialog",
                                     Точка(300, 160)); 
									 
			// wxBitmapXXX sampel панель
			панель = new Panel(notebook);
			notebook.AddPage(панель, "wxBitmapXXX", false );
			
			Пиктограмма пиктограмма = АртПровайдер.ДайПиктограмму( ПАртИД.wxART_INFORMATION );
			new StaticBitmap( панель, -1, пиктограмма, Точка(10, 10) );
			
			Битмап битмап = new Битмап( 100, 100 );
			MemoryDC dc = new MemoryDC();
			dc.SelectObject( битмап );
			dc.pen = Pen.wxGREEN_PEN;
			dc.Clear();
			dc.DrawEllipse( 5, 5, 90, 90 );
			dc.DrawText( "Битмап", 30, 40 );
			dc.SelectObject( Битмап.wxNullBitmap );
			
			new КнопкаБитмап( панель, ID_BITMAP_BTN, битмап, Точка( 100, 20 ) );
			
			Битмап bmp1 = АртПровайдер.ДайБитмап( ПАртИД.wxART_INFORMATION );
			Битмап bmp2 = АртПровайдер.ДайБитмап( ПАртИД.wxART_WARNING );
			Битмап bmp3 = АртПровайдер.ДайБитмап( ПАртИД.wxART_QUESTION );
			
//			КнопкаБитмап bmpBtn = new КнопкаБитмап( панель, -1, bmp1, Точка( 30, 70 ) );
			
//			bmpBtn.БитмапВыбран = bmp2;
//			bmpBtn.БитмапФокус = bmp3;
			
			new ToggleButton( панель, ID_BUTTON_LABEL, "&Toggle ярлык", Точка( 250, 20 ) );
			
			m_label = new StaticText( панель, -1, "ярлык with some long текст", 
									Точка ( 250, 60 ), вхДефРазм, Alignment.wxALIGN_RIGHT );
			m_label.цветПП = Цвет.wxBLUE;
			
			// wxSizer sampel панель
            панель = new Panel(notebook);
            notebook.AddPage(панель, "wxSizer", false );
			панель.Автораскладка = да;	

			ПеремерщикБокса сайзер = new ПеремерщикБокса( Ориентация.wxVERTICAL );
			StaticBoxSizer csizer = new StaticBoxSizer( new StaticBox( панель, -1, "показ Buttons" ), 
															Ориентация.wxHORIZONTAL );
														
			CheckBox check1 = new CheckBox( панель, ID_SIZER_CHECK1, "1" );
			check1.Value = да;
			csizer.Добавь( check1 );
			
			CheckBox check2 = new CheckBox( панель, ID_SIZER_CHECK2, "2" );
			check2.Value = да;
			csizer.Добавь( check2 );
			
			CheckBox check3 = new CheckBox( панель, ID_SIZER_CHECK3, "3" );
			check3.Value = да;
			csizer.Добавь( check3 );
			
			CheckBox check4 = new CheckBox( панель, ID_SIZER_CHECK4, "4" );
			check4.Value = да;
			csizer.Добавь( check4 );
			
			CheckBox check14 = new CheckBox( панель, ID_SIZER_CHECK14, "14" );
			check14.Value = да;
			csizer.Добавь( check14 );
			
			CheckBox checkBig = new CheckBox( панель, ID_SIZER_CHECKBIG, "Big" );
			checkBig.Value = да;
			csizer.Добавь( checkBig );
			
			сайзер.Добавь( csizer );
			
			m_hsizer = new ПеремерщикБокса( Ориентация.wxHORIZONTAL );
			
			m_buttonSizer = new ПеремерщикБокса( Ориентация.wxVERTICAL );
			
			m_sizerBtn1 = new Кнопка( панель, -1, "Test Кнопка &1" );
			m_buttonSizer.Добавь( m_sizerBtn1, 0, Direction.wxALL, 10 );
			m_sizerBtn2 = new Кнопка( панель, -1, "Test Кнопка &2" );
			m_buttonSizer.Добавь( m_sizerBtn2, 0, Direction.wxALL, 10 );
			m_sizerBtn3 = new Кнопка( панель, -1, "Test Кнопка &3" );
			m_buttonSizer.Добавь( m_sizerBtn3, 0, Direction.wxALL, 10 );			
			m_sizerBtn4 = new Кнопка( панель, -1, "Test Кнопка &4" );
			m_buttonSizer.Добавь( m_sizerBtn4, 0, Direction.wxALL, 10 );	

			m_hsizer.Добавь( m_buttonSizer );
			m_hsizer.Добавь( new ПеремерщикБокса( Ориентация.wxHORIZONTAL ), 1, Stretch.wxEXPAND, 0 );
			
			m_bigBtn = new Кнопка( панель, -1, "Multiline\nbutton" );
			m_hsizer.Добавь( m_bigBtn, 3, Stretch.wxEXPAND | Direction.wxALL, 10 );
			
			сайзер.Добавь( m_hsizer, 1, Stretch.wxEXPAND );
			
			панель.сайзер = сайзер;

            // Уст event listeners

            собРазмер(&приПеремере);

            собЛистбокс     (ID_LISTBOX,            &OnListBox);
            собЛистбокс     (ID_LISTBOX_SORTED,     &OnListBox);
            собЛистбоксДНажат(-1,                  &OnListBoxDoubleClick);
	    selectNum.добавьНажатие(& OnListBoxButtons );
	    selectNum.добавьНажатие(& OnClicked2 );
	    собКнопка      (-1,/*ID_LISTBOX_SEL_NUM,*/    &OnListBoxButtons);
            //собКнопка      (ID_LISTBOX_SEL_STR,    &OnListBoxButtons);
	    selectStr.добавьНажатие(& OnListBoxButtons );
            собКнопка      (ID_LISTBOX_CLEAR,      &OnListBoxButtons);
            собКнопка      (ID_LISTBOX_APPEND,     &OnListBoxButtons);
            собКнопка      (ID_LISTBOX_DELETE,     &OnListBoxButtons);
            //собКнопка      (ID_LISTBOX_FONT,       &OnListBoxButtons);
	    button.добавьНажатие(& OnListBoxButtons );
            собЧекбокс    (ID_LISTBOX_ENABLE,     &OnListBoxButtons);
            собЧекбокс    (ID_LISTBOX_COLOUR,     &OnChangeColour);

            собВыбор      (ID_CHOICE,             &OnChoice);
            собВыбор      (ID_CHOICE_SORTED,      &OnChoice);
            собКнопка      (ID_CHOICE_SEL_NUM,     &OnChoiceButtons);
            собКнопка      (ID_CHOICE_SEL_STR,     &OnChoiceButtons);
            собКнопка      (ID_CHOICE_FONT,        &OnChoiceButtons);
            собКнопка      (ID_CHOICE_DELETE,      &OnChoiceButtons);
            собКнопка      (ID_CHOICE_APPEND,      &OnChoiceButtons);
            собКнопка      (ID_CHOICE_CLEAR,       &OnChoiceButtons);
            собЧекбокс    (ID_CHOICE_ENABLE,      &OnChoiceButtons);

            собКомбобокс    (ID_COMBO,              &OnCombo);
            собТекст        (ID_COMBO,              &OnComboTextChanged);
            собТекстВвод  (ID_COMBO,              &OnComboTextEnter);
            собКнопка      (ID_COMBO_SEL_NUM,      &OnComboButtons);
            собКнопка      (ID_COMBO_SEL_STR,      &OnComboButtons);
            собКнопка      (ID_COMBO_FONT,         &OnComboButtons);
            собКнопка      (ID_COMBO_DELETE,       &OnComboButtons);
            собКнопка      (ID_COMBO_APPEND,       &OnComboButtons);
            собКнопка      (ID_COMBO_CLEAR,        &OnComboButtons);
            собЧекбокс    (ID_COMBO_ENABLE,       &OnComboButtons);

            собРадиобокс    (ID_RADIO,              &OnRadio);
            собКнопка      (ID_RADIO_SEL_NUM,      &OnRadioButtons);
            собКнопка      (ID_RADIO_SEL_STR,      &OnRadioButtons);
            собКнопка      (ID_RADIO_FONT,         &OnRadioButtons);
            собЧекбокс    (ID_RADIO_ENABLE,       &OnRadioButtons);
            собКнопка      (ID_SETFONT,            &OnУстFont);

            собСлайдер      (ID_SLIDER,             &OnSliderUpdate);
            собСпинктрл    (ID_SPINCTRL,           &OnSpinCtrl);
            собСпинВверху     (ID_SPINCTRL,           &OnSpinCtrlUp);
            собСпинВнизу   (ID_SPINCTRL,           &OnSpinCtrlDown);
            собТекст        (ID_SPINCTRL,           &OnSpinCtrlText);
            собСпин        (ID_SPIN,               &OnSpinUpdate);
            собСпинВверху     (ID_SPIN,               &OnSpinUp);
            собСпинВнизу   (ID_SPIN,               &OnSpinDown);
            собОбновиИП   (ID_BTNPROGRESS,        &OnUpdateShowProgress);
            собКнопка      (ID_BTNPROGRESS,        &OnShowProgress);
			
			собПереключатель(ID_BUTTON_LABEL,       &OnUpdateLabel);
			собКнопка(ID_BITMAP_BTN,               &OnBmpButton);
			
			собЧекбокс(ID_SIZER_CHECK1,           &OnSizerCheck);
			собЧекбокс(ID_SIZER_CHECK2,           &OnSizerCheck);
			собЧекбокс(ID_SIZER_CHECK3,           &OnSizerCheck);
			собЧекбокс(ID_SIZER_CHECK4,           &OnSizerCheck);
			собЧекбокс(ID_SIZER_CHECK14,          &OnSizerCheck);
			собЧекбокс(ID_SIZER_CHECKBIG,         &OnSizerCheck);
			
			собНоутбукСтраницаИзменяется(ID_NOTEBOOK, &OnPageChanging);
			собНоутбукСтраницаИзменена(ID_NOTEBOOK,  &OnPageChanged);
        }
	
	public проц OnClicked2( Объект отправитель, Событие e )
	{
		скажифнс( "OnClicked2");
	}

        //---------------------------------------------------------------------

        public проц приПеремере(Объект отправитель, Событие e)
        {
            notebook.УстРазм(2, 2, РазмерКлиента.Ширь - 4,
                             РазмерКлиента.Высь * 2 / 3 - 4);
            текст.УстРазм(2, РазмерКлиента.Высь * 2 / 3 + 2,
                         РазмерКлиента.Ширь - 4, РазмерКлиента.Высь / 3 - 4);
        }

        //---------------------------------------------------------------------

        public проц OnListBox(Объект отправитель, Событие e)
        {
            СобытиеКоманда ce = cast(СобытиеКоманда)e;

            if (ce.ИД == -1)
            {
                текст.AppendText("ListBox есть no selections anymore.\n");
                return;
            }

            ListBox lb =
                ce.ИД == ID_LISTBOX ? listbox : listboxSorted;
            текст.AppendText("ListBox event selection ткст is: '" ~
                            ce.String ~ "'\n" ~
                            "ListBox control selection ткст is: '" ~
                            lb.StringSelection ~ "'\n");
        }

        public проц OnListBoxDoubleClick(Объект отправитель, Событие e)
        {
            СобытиеКоманда ce = cast(СобытиеКоманда)e;
            текст.AppendText("ListBox event selection ткст is: '" ~
                            ce.String ~ "'\n");
        }

        public проц OnListBoxButtons(Объект отправитель, Событие e)
        {
            switch(e.ИД)
            {
            case ID_LISTBOX_SEL_NUM:
	    	скажифнс( "OnListBoxButtons");
                listbox.Selection = 2;
                listboxSorted.Selection = 2;
                break;

            case ID_LISTBOX_SEL_STR:
		if ( listbox.Счёт > 0 )
		{
			for ( цел i = 0; i < listbox.Счёт; i++ )
			{
				if ( listbox.GetString( i ) == "This" )
				{
					listbox.StringSelection = "This";
					listboxSorted.StringSelection = "This";
				}
			}
		}
                break;

            case ID_LISTBOX_DELETE:
                if (listbox.Selection != -1)
                    listbox.Delete(listbox.Selection);
                if (listboxSorted.Selection != -1)
                    listboxSorted.Delete(listboxSorted.Selection);
                break;

            case ID_LISTBOX_ENABLE:
                текст.AppendText("CheckBox clicked.\n");

                СобытиеКоманда ce = cast(СобытиеКоманда)e;

                CheckBox cb = cast(CheckBox)e.EventObject;

                if (ce.цел == 1)
                    cb.тултип = "Click to вкл listbox";
                else
                    cb.тултип = "Click to disable listbox";

                listbox.Активен = (ce.цел == 0);
                listboxSorted.Активен = (ce.цел == 0);
                selectStr.Активен = (ce.цел == 0);
                selectNum.Активен = (ce.цел == 0);
                break;

            case ID_LISTBOX_CLEAR:
                listbox.Clear();
                listboxSorted.Clear();
                break; 

            case ID_LISTBOX_APPEND:
                listbox.Append("Hi!");
                listboxSorted.Append("Hi!");
                break;

            case ID_LISTBOX_FONT:
                listbox.шрифт = Шрифт.Курсивный;
                listboxSorted.шрифт = Шрифт.Курсивный;
                break;
            }
        }

        //---------------------------------------------------------------------

        public проц OnChangeColour(Объект отправитель, Событие e)
        {
            if(oldColour)
            {
                ЦветФона = new Цвет("red");
                selectStr.цветПП = new Цвет("red");
                selectStr.ЦветФона = new Цвет("white");
                oldColour = false;
            }
            else
            {
                ЦветФона = new Цвет("white");
                selectStr.цветПП = new Цвет("white");
                selectStr.ЦветФона = new Цвет("red");
                oldColour = да;
            }
        }

        //---------------------------------------------------------------------

        public проц OnChoiceButtons(Объект отправитель, Событие e)
        {
            СобытиеКоманда ce = cast(СобытиеКоманда)e;

            switch(ce.ИД)
            {
            case ID_CHOICE_SEL_NUM:
                choice.Selection = 2;
                choiceSorted.Selection = 2;
                break;

            case ID_CHOICE_SEL_STR:  
                choice.StringSelection = "This";
                choiceSorted.StringSelection = "This";
                break;

            case ID_CHOICE_CLEAR:
                choice.Clear();
                choiceSorted.Clear();
                break;

            case ID_CHOICE_APPEND:
                choice.Append("Hi!");
                choiceSorted.Append("Hi!");
                break;

            case ID_CHOICE_DELETE:
                if(choice.Selection != -1)
                    choice.Delete(choice.Selection);
                if(choiceSorted.Selection != -1)
                    choiceSorted.Delete(choiceSorted.Selection);
                break;

            case ID_CHOICE_FONT:
                choice.шрифт = Шрифт.Курсивный;
                choiceSorted.шрифт = Шрифт.Курсивный;
                break;

            case ID_CHOICE_ENABLE:
                choice.Активен = (ce.цел == 0);  
                choiceSorted.Активен = (ce.цел == 0);
                break;
            }
        }

        public проц OnChoice(Объект отправитель, Событие e)
        {
            СобытиеКоманда ce = cast(СобытиеКоманда)e;
            Choice c = e.ИД == ID_CHOICE ? choice : choiceSorted;

            текст.AppendText("Choice event selection is: '" ~
                            ce.String ~ "'\n" ~
                            "Choice control selection is: '" ~
                            c.StringSelection ~ "'\n");
        }

        //---------------------------------------------------------------------

        public проц OnComboButtons(Объект отправитель, Событие e)
        {
            СобытиеКоманда ce = cast(СобытиеКоманда)e;

            switch(ce.ИД)
            {
            case ID_COMBO_SEL_NUM:
                combo.Selection = 2;
                break;

            case ID_COMBO_SEL_STR:
                combo.StringSelection = "This";
                break;

            case ID_COMBO_CLEAR:
                combo.Clear();
                break;

            case ID_COMBO_APPEND:
                combo.Append("Hi!");
                break;

            case ID_COMBO_DELETE:
                if(combo.Selection != -1)
                    combo.Delete(combo.Selection);
                break;

            case ID_COMBO_FONT:
                combo.шрифт = Шрифт.Курсивный;
                combo.шрифт = Шрифт.Курсивный;
                break;

            case ID_COMBO_ENABLE:
                combo.Активен = (ce.цел == 0);
                break;
            }
        }

        public проц OnCombo(Объект отправитель, Событие e)
        {
            СобытиеКоманда ce = cast(СобытиеКоманда)e;

            текст.AppendText("Combo event selection is: '" ~
                            ce.String ~ "'\n" ~
                            "Combo control selection is: '" ~
                            combo.StringSelection ~ "'\n");
        }

        public проц OnComboTextChanged(Объект отправитель, Событие e)
        {
            СобытиеКоманда ce = cast(СобытиеКоманда)e;

	    	скажифнс( ce.String );

            Log.LogMessage( "Text in the combobox changed: now is '{0}'", ce.String);
        }

        public проц OnComboTextEnter(Объект отправитель, Событие e)
        {
            Log.LogMessage("Enter pressed in the combobox: значение is: '{0}'", combo.Value);
        }

        //---------------------------------------------------------------------

        public проц OnRadio(Объект отправитель, Событие e)
        {
            СобытиеКоманда ce = cast(СобытиеКоманда)e;
            текст.AppendText("Radio selection ткст is: '" ~
                            ce.String ~ "'.\n");
        }

        public проц OnRadioButtons(Объект отправитель, Событие e)
        {
            СобытиеКоманда ce = cast(СобытиеКоманда)e;

            switch(ce.ИД)
            {
            case ID_RADIO_ENABLE:
                radiobox.Активен = (ce.цел == 0);
                break;

            case ID_RADIO_SEL_NUM:
                radiobox.Selection = 2;
                break;

            case ID_RADIO_SEL_STR:
                radiobox.StringSelection = "This";
                break;

            case ID_RADIO_FONT:
                radiobox.цветПП = new Цвет("Green");
                radiobox.шрифт = Шрифт.Курсивный;
                break;
            }
        }

        //---------------------------------------------------------------------

        public проц OnУстFont(Объект отправитель, Событие e)
        {
			fontButton.шрифт = Шрифт.Курсивный;
			текст.шрифт = Шрифт.Курсивный;
        }
		
		public проц OnUpdateLabel(Объект отправитель, Событие e)
		{
			СобытиеКоманда ce = cast(СобытиеКоманда) e;
			m_label.ярлык = ce.цел == 0 ? "Very very very very very long текст." : "Shorter текст.";
		}
		
		public проц OnBmpButton(Объект отправитель, Событие e)
		{
			Log.LogMessage("Битмап button clicked.");
		}
		
		public проц OnSizerCheck(Объект отправитель, Событие e)
		{
			СобытиеКоманда ce = cast(СобытиеКоманда) e;
			switch( e.ИД )
			{
				case ID_SIZER_CHECK1:
					m_buttonSizer.показ( m_sizerBtn1, ce.IsChecked );
					m_buttonSizer.раскладка();
				break;
				case ID_SIZER_CHECK2:
    				m_buttonSizer.показ ( m_sizerBtn2, ce.IsChecked );
    				m_buttonSizer.раскладка ();
    			break;		
 				case ID_SIZER_CHECK3:
    				m_buttonSizer.показ ( m_sizerBtn3, ce.IsChecked );
    				m_buttonSizer.раскладка();
    			break;	
  				case ID_SIZER_CHECK4:
    				m_buttonSizer.показ ( m_sizerBtn4, ce.IsChecked );
    				m_buttonSizer.раскладка();
    			break;	
				case ID_SIZER_CHECK14:
    				m_hsizer.показ ( m_buttonSizer, ce.IsChecked );
    				m_hsizer.раскладка();
    			break;
  				case ID_SIZER_CHECKBIG:
    				m_hsizer.показ ( m_bigBtn, ce.IsChecked );
    				m_hsizer.раскладка ();
    			break;				
			}
		}

        //---------------------------------------------------------------------
        
        public проц OnSliderUpdate(Объект отправитель, Событие e)
        {
            gauge.Value = slider.Value;
            gaugeVert.Value = slider.Value;
        }

        public проц OnSpinCtrl(Объект отправитель, Событие e)
        {
            СобытиеКоманда ce = cast(СобытиеКоманда)e;
            текст.AppendText("SpinCtrl changed: now " ~ .вТкст(spinctrl.Value) ~ 
                            " (from event: " ~ .вТкст(ce.цел) ~ ")\n");
        }

        public проц OnSpinCtrlUp(Объект отправитель, Событие e)
        {
            СобытиеКоманда ce = cast(СобытиеКоманда)e;
            текст.AppendText("SpinCtrl up: now " ~ .вТкст(spinctrl.Value) ~ 
                            " (from event: " ~ .вТкст(ce.цел) ~ ")\n");
        }

        public проц OnSpinCtrlDown(Объект отправитель, Событие e)
        {
            СобытиеКоманда ce = cast(СобытиеКоманда)e;
            текст.AppendText("SpinCtrl down: now " ~ .вТкст(spinctrl.Value) ~ 
                            " (from event: " ~ .вТкст(ce.цел) ~ ")\n");
        }

        public проц OnSpinCtrlText(Объект отправитель, Событие e)
        {
            СобытиеКоманда ce = cast(СобытиеКоманда)e;
            текст.AppendText("SpinCtrl текст changed: now " ~ .вТкст(spinctrl.Value) ~ 
                            " (from event: " ~ ce.String ~ ")\n");
        } 

        public проц OnSpinUpdate(Объект отправитель, Событие e) 
        {
			SpinEvent se = cast(SpinEvent) e;
            spintext.Value = "" ~ .вТкст(se.Позиция);

            текст.AppendText("Spin conntrol диапазон: (" ~ .вТкст(spinbutton.Min) ~ ", " ~ 
					.вТкст(spinbutton.Max) ~ "), current = " ~ .вТкст(spinbutton.Value) ~ "\n");

        }

        public проц OnSpinUp(Объект отправитель, Событие e)
        {
			SpinEvent se = cast(SpinEvent) e;
            ткст стр = "Spin button up: current = " ~ .вТкст(spinbutton.Value) ~ "\n";

            if (se.Позиция > 17) {
                стр ~= "Preventing spin button from going above 17.\n";

				se.Veto();
			}

			Log.LogMessage(стр);
        }
        
        public проц OnSpinDown(Объект отправитель, Событие e)
        {
            SpinEvent se = cast(SpinEvent) e;
            ткст стр = "Spin button down: current = " ~ .вТкст(spinbutton.Value) ~ "\n";

            if (se.Позиция < -17) {
                стр ~= "Preventing spin button from going below -17.\n";

				se.Veto();
            }

			Log.LogMessage(стр);
        }

        public проц OnUpdateShowProgress(Объект отправитель, Событие e)
        {
            btnProgress.Активен = spinbutton.Value > 0;
        }

        public проц OnShowProgress(Объект отправитель, Событие e)
        {
			цел max = spinbutton.Value;
			
			if ( max <= 0 )
			{
				Log.LogError("You must set positive диапазон!");
				return;
			}
			
			ProgressDialog pd = new ProgressDialog("Progress dialog example",
													"An informative message",
													max,
													this,
													ProgressDialog.wxPD_CAN_ABORT |
													ProgressDialog.wxPD_AUTO_HIDE |
													ProgressDialog.wxPD_APP_MODAL |
													ProgressDialog.wxPD_ELAPSED_TIME |
													ProgressDialog.wxPD_ESTIMATED_TIME |
													ProgressDialog.wxPD_REMAINING_TIME );
													
			бул конт = да;
			for ( цел i = 0; i <= max; i++ )
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
				if ( !конт ) break;
			}
			
			if ( !конт )
			{
				текст.AppendText("Progress dialog aborted!\n");
				
				// use вымести() or показ(false) to close the ProgressDialog
				// otherwise the dialog won't get closed and the app hangs
				//pd.вымести();
				pd.показ(false);
			}
			else
			{
				текст.AppendText("Countdown from " ~ .вТкст(max) ~ " finished.\n");
			}
        }
		
		public проц OnPageChanging(Объект отправитель, Событие e)
		{
			NotebookEvent ne = cast(NotebookEvent) e;
			цел selOld = ne.OldSelection;
			if ( selOld == 2 )
			{
				MessageDialog md = new MessageDialog(this, "This demonstrates how a program may prevent the\n" ~
									"page change from taking place - if you селект\n" ~
									"[No] the current page will stay the third one\n",
									"Control sample", Dialog.wxNO_DEFAULT|Dialog.wxICON_QUESTION | Dialog.wxYES_NO);
				
				if ( md.ShowModal() != wxID_YES )
				{					
					ne.Veto();
					return;
				}	
			}
			
			текст.AppendText("Notebook selection is being changed from " ~ .вТкст(selOld) ~
							" to " ~  .вТкст(ne.Selection) ~
							" (current page from notebook is " ~
							.вТкст(notebook.Selection) ~ ")\n");
		}
		
		public проц OnPageChanged(Объект отправитель, Событие e)
		{
			NotebookEvent ne = cast(NotebookEvent) e;
			текст.AppendText("Notebook selection is now " ~ .вТкст(ne.Selection) ~
							" (from notebook: " ~ .вТкст(notebook.Selection) ~ ")\n");
		}

        //---------------------------------------------------------------------
    }


проц main()
{
	Controls.Main();
}
