//-----------------------------------------------------------------------------
// wxD/Samples - Dnd.d
//
// wxD "Dnd" sample.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2003 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $ид: Dnd.d,v 1.10 2008/03/03 20:11:15 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;
private import stdrus;

    public class DNDText : ЦельБросаТекста
    {
        private ЛистБокс myOwner;
		
	//---------------------------------------------------------------------

        public this(ЛистБокс myOwner)
        {
            super();
            this.myOwner = myOwner;
        } 
		 
	//---------------------------------------------------------------------

        public override бул приБросеТекста(цел x, цел y, ткст текст)
        {
            myOwner.Append(текст);
            return да;
        }
    }

	//---------------------------------------------------------------------

    public class DNDFile : ЦельБросаФайла
    {
        private ЛистБокс myOwner;
		
		//---------------------------------------------------------------------

        public this(ЛистБокс myOwner)
        {
            super();
            this.myOwner = myOwner;
        } 
		
		//---------------------------------------------------------------------

        public override бул OnDropFiles(цел x, цел y, ткст[] именаФ)
        {
	    	ткст стр = stdrus.вТкст(именаФ.length) ~ " файлов сброшено";
		myOwner.Append(стр);

	    	for ( цел i = 0; i < именаФ.length; i++ )
	    	{
	    		myOwner.Append(именаФ[i]);
	    	}
   
		return да;
        }
    }
	
	//---------------------------------------------------------------------	
		
    public class DndFrame : Рамка
    {
        enum Cmd { Menu_Drag, Menu_DragMoveDef, Menu_DragMoveAllow, Menu_About, Menu_Quit,
			Menu_Clear, Menu_Help, Menu_Copy, Menu_Paste}

        private ЛистБокс m_ctrlText = null;
	private ЛистБокс m_ctrlFile = null;
		
	private TextCtrl m_ctrlLog = null;
		
	private Log m_pLog = null;
	private Log m_pLogPrev = null;
		
	private бул m_moveByDefault = false;
	private бул m_moveAllow = да;
	
	public ткст m_strText;
	
        //---------------------------------------------------------------------

        public this(ткст титул, Точка поз, Размер Размер)
        {
            super(титул, поз, Размер);
            // Уст the окно пиктограмма and status bar

            пиктограмма = new Пиктограмма("./data/mondrian.png");

            CreateStatusBar();
            StatusText = "Welcome to the Dnd Sample!";						
			
            // Уст up a меню

            Меню файлМеню = new Меню();
	    файлМеню.Append(Cmd.Menu_Drag, "&Test drag...");
	    файлМеню.добавьЧекЭлт(Cmd.Menu_DragMoveDef, "&Сдвинь by default", "");
	    файлМеню.добавьЧекЭлт(Cmd.Menu_DragMoveAllow, "&Allow moving", "");
	    файлМеню.добавьРазделитель();
	    файлМеню.Append(Cmd.Menu_Quit, "E&xit\tCtrl-Q");
			
	    Меню logMenu = new Меню();
	    logMenu.Append(Cmd.Menu_Clear, "Clear\tCtrl-L");

            Меню менюСправки = new Меню();
	    менюСправки.Append(Cmd.Menu_Help, "&Help");
	    менюСправки.добавьРазделитель();
            менюСправки.Append(Cmd.Menu_About, "&About"); 
			
	    Меню clipMenu = new Меню();
	    clipMenu.Append(Cmd.Menu_Copy, "&Copy текст\tCtrl-C");
	    clipMenu.Append(Cmd.Menu_Paste, "&Paste текст\tCtrl-V");

            MenuBar menuBar = new MenuBar();
            menuBar.Append(файлМеню, "&File");
	    menuBar.Append(logMenu, "&Log");
	    menuBar.Append(clipMenu, "&Clipboard");
            menuBar.Append(менюСправки, "&Help");

            this.menuBar = menuBar;
			
	    Точка apos = Точка(0, 0);
	    Размер asize = Размер(300, 200); 
	    Размер bsize = Размер(600,100);
	    
	    ткст[]  strFile = ["Drop files here!"];
	    ткст[]  стрТекст = ["Drop текст on me"];
			
	    m_ctrlFile = new ЛистБокс(this, -1, ДЕФПОЗ, asize, strFile, ЛистБокс.ГПРОКРУТКА | ЛистБокс.wxLB_ALWAYS_SB);
			
	    m_ctrlText = new ЛистБокс(this, -1, ДЕФПОЗ, asize, стрТекст, ЛистБокс.ГПРОКРУТКА | ЛистБокс.wxLB_ALWAYS_SB);
			
	    m_ctrlLog = new TextCtrl(this, -1, "", ДЕФПОЗ, bsize, TextCtrl.МНОГОСТРОК | TextCtrl.ТОЛЬКО_ЧТЕНИЕ | TextCtrl.УТОПЛЕННЫЙ_БОРДЮР );
			
	    Log.УстActiveTarget(m_ctrlLog);  
	    Log.AddTraceMask("focus");
	    
	    m_ctrlFile.мишеньСброса = new DNDFile(m_ctrlFile);
	    m_ctrlText.мишеньСброса = new DNDText(m_ctrlText);	

	    ПеремерщикБокса main_sizer = new ПеремерщикБокса( Ориентация.wxVERTICAL );
	    ПеремерщикБокса h_sizer = new ПеремерщикБокса( Ориентация.wxHORIZONTAL );									
			
	    h_sizer.Добавь(m_ctrlFile, 1, Direction.wxALL, 5 );			
	    h_sizer.Добавь(m_ctrlText, 1, Direction.wxALL, 5 );
	    main_sizer.Добавь(h_sizer,  0, Direction.wxALL, 0);
	    main_sizer.Добавь(m_ctrlLog, 1, Direction.wxALL, 5);		
	    main_sizer.Добавь(new ПеремерщикБокса(Ориентация.wxHORIZONTAL), 1, Direction.wxALL, 5);
	    
	    Автораскладка = да;
	    УстПеремерщик( main_sizer, да );
			
            main_sizer.Встрой( this );
            main_sizer.УстРазмПодсказ( this );		
			
	    menuBar.Check( Cmd.Menu_DragMoveAllow, да );
			
            // Уст up the event table

            собМеню(Cmd.Menu_Quit,    &OnQuit);
            собМеню(Cmd.Menu_About,   &OnAbout);
	    собМеню(Cmd.Menu_Drag, &OnDrag);		
	    собМеню(Cmd.Menu_DragMoveDef, &OnDragMoveByDefault);	
	    собМеню(Cmd.Menu_DragMoveAllow, &OnDragMoveAllow);	
	    собМеню(Cmd.Menu_Help, &OnHelp);		
	    собМеню(Cmd.Menu_Clear, &OnLogClear);	
	    собМеню(Cmd.Menu_Copy, &OnCopy);			
	    собМеню(Cmd.Menu_Paste, &OnPaste);
	    
	    собРазмер(&приПеремере);
			
	    собРисование(&OnPaint);
	    
	    собОбновиИП(Cmd.Menu_DragMoveDef, &OnUpdateUIMoveByDefault);
	    собОбновиИП(Cmd.Menu_Paste, &OnUpdateUIPasteText);
			
	    собЛеваяВнизу(&OnLeftDown);
	    собПраваяВнизу(&OnRightDown);
			
	    Log.LogMessage("DnD sample started..");
			
	    m_strText = "wxD drag & drop works :-)";
        }

        //---------------------------------------------------------------------

        public проц OnQuit(Объект отправитель, Событие e)
        {
            Закрой();
        }

        //---------------------------------------------------------------------


        public проц OnAbout(Объект отправитель, Событие e)
        {
            ткст msg = "This is the About dialog of the dnd sample.";
            MessageBox(this, msg, "About Dnd", Dialog.wxOK | Dialog.wxICON_INFORMATION);
        }

        //---------------------------------------------------------------------
		
	public проц приПеремере(Объект отправитель, Событие e)
	{
		Освежи();
			
		e.Skip();
	}
		
	//---------------------------------------------------------------------
		
	public проц OnPaint(Объект отправитель, Событие e)
	{
		Размер cs = РазмерКлиента;
		
		PaintDC dc = new PaintDC(this);
			
		dc.шрифт = new Шрифт( 24, СемействоШрифтов.wxDECORATIVE, СтильШрифта.wxNORMAL, ВесШрифта.wxNORMAL, false, "charter");
		dc.DrawText("ПТяг текст from here!", 100, cs.Высь - 50);
            
		dc.вымести();
	}
		
	//---------------------------------------------------------------------
		
	public проц OnUpdateUIMoveByDefault(Объект отправитель, Событие e)
	{
		UpdateUIEvent ue = cast(UpdateUIEvent) e;
		ue.Активен = m_moveAllow;
	}
		
	//---------------------------------------------------------------------
	
	public проц OnUpdateUIPasteText(Объект отправитель, Событие e)
	{
		UpdateUIEvent ue = cast(UpdateUIEvent) e;
		ue.Активен = Clipboard.TheClipboard.IsSupported(new ФорматДаты(ПИдФорматаДаты.wxDF_TEXT));
	}
		
	//---------------------------------------------------------------------
		
	public проц OnDrag(Объект отправитель, Событие e)
	{
		ткст стрТекст = GetTextFromUser(
			"After you enter текст in this dialog, press any mouse\n" 
			"button in the bottom (empty) part of the рамка and \n" 
			"drag it anywhere - you will be in fact dragging the\n" 
			"текст Объект containing this текст",
         		"Please enter some текст", m_strText, this);		

		if ( стрТекст.length > 0) 
		{
			m_strText = null;
			m_strText = стрТекст;
		}
	}
		
	//---------------------------------------------------------------------
		
	public проц OnDragMoveByDefault(Объект отправитель, Событие e)
	{
		СобытиеКоманда ce = cast(СобытиеКоманда) e;
		m_moveByDefault = ce.IsChecked;
	}
		
	//---------------------------------------------------------------------
		
	public проц OnDragMoveAllow(Объект отправитель, Событие e)
	{
		СобытиеКоманда ce = cast(СобытиеКоманда) e;
		m_moveAllow = ce.IsChecked;		
	}
		
	//---------------------------------------------------------------------
		
	public проц OnHelp(Объект отправитель, Событие e)
	{
		MessageDialog md = new MessageDialog(this, 
			"This small program demonstrates drag & drop support in wxD. The program окно\n" 
			"consists of 3 parts: the bottom pane is for debug messages, so that you can see what's\n" 
                        "going on inside. The top part is split into 2 listboxes, the left one accepts files\n" 
                        "and the right one accepts текст.\n" 
                        "\n" 
                        "To test wxDropTarget: open wordpad (write.exe), селект some текст in it and drag it to\n" 
                        "the right listbox (you'll notice the usual visual feedback, i.e. the курсор will change).\n" 
                        "Also, try dragging some files (you can селект several at once) from Windows Explorer (or \n" 
                        "File Manager) to the left pane. Hold down Ctrl/Shift keys when you drop текст (doesn't \n" 
                        "work with files) and see what changes.\n" 
                        "\n" 
                        "To test ИстокБроса: just press any mouse button on the empty zone of the окно and drag\n"
                        "it to wordpad or any other droptarget accepting текст (and of course you can just drag it\n" 
                        "to the right pane). Due to a lot of trace messages, the курсор might take some time to \n" 
                        "change, don't release the mouse button until it does. You can change the ткст being\n" 
                        "dragged in in \"File|Test drag...\" dialog.\n",
                        "wxDnD Help");			
			
		md.ShowModal();
	}
		
	//---------------------------------------------------------------------
		
	public проц OnLogClear(Объект отправитель, Событие e)
	{
		m_ctrlLog.Clear();
		m_ctrlText.Clear();
		m_ctrlFile.Clear();
	}
		
	//---------------------------------------------------------------------
		
	public проц OnLeftDown(Объект отправитель, Событие e)
	{
		if (m_strText.length > 0)
			{
				TextDataObject textData = new TextDataObject( m_strText );
				
				if (textData is null) 
				{
					return;
				}
				
				ИстокБроса source = new ИстокБроса(textData, this);
																
				цел флаги = ПТяг.ТолькоКопировать;
				if ( m_moveByDefault )
					флаги |= ПТяг.ДефПеремещение;
				else if ( m_moveAllow )
					флаги |= ПТяг.ПеремещениеВозможно;
					
				ткст result = "";
				
				switch ( source.делайТягБрос(флаги) )
				{
					case ПРезультатТяга.Ошибка:	result = "Error!";  break;
					case ПРезультатТяга.Никакой:     result = "Nothing"; break;
					case ПРезультатТяга.Копирование:   	result = "Copied";  break;
					case ПРезультатТяга.Перемещение:     result = "Moved";   break;
					case ПРезультатТяга.Отмена:	result = "Cancelled"; break;
					default:                        result = "Huh?";     break;					
				}
				
				StatusText = "ПТяг result: " ~ result;	
			}		
		}
		
		//---------------------------------------------------------------------
		
		public проц OnRightDown(Объект отправитель, Событие e)
		{
			MouseEvent me = cast(MouseEvent) e;
		
			Меню меню = new Меню("Dnd sample меню");
			
			меню.Append(Cmd.Menu_Drag, "&Test drag");
			меню.добавьРазделитель();
			меню.Append(Cmd.Menu_About, "&About");
			
			Точка поз = me.Позиция;
			ВсплывающееМеню( меню, поз);
		}
		
		//---------------------------------------------------------------------		
		
		public проц OnCopy(Объект отправитель, Событие e)
		{
			if ( !Clipboard.TheClipboard.Open() )
			{
				Log.LogError("Can't open clipboard.");
				return;
			}
			
			if ( !Clipboard.TheClipboard.AddData(new TextDataObject(m_strText)) )
			{
				Log.LogError("Can't copy data to the clipboard");
			}
			else
			{
				Log.LogMessage("Text '%s' put on the clipboard", m_strText);
			}
			
			Clipboard.TheClipboard.Закрой();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnPaste(Объект отправитель, Событие e)
		{
			if ( !Clipboard.TheClipboard.Open() )
			{
				Log.LogError("Can't open clipboard.");
				return;
			}
			
			if ( !Clipboard.TheClipboard.IsSupported(new ФорматДаты(ПИдФорматаДаты.wxDF_TEXT)) )
			{
				Log.LogWarning("No текст data on clipboard");
				Clipboard.TheClipboard.Закрой();
				return;
			}
			
			TextDataObject текст = new TextDataObject();
			if ( !Clipboard.TheClipboard.GetData(текст) )
			{
				Log.LogError("Can't paste data from the clipboard");
			}
			else
			{
				Log.LogMessage("Text '%s' pasted from the clipboard", текст.Text);
			}
			
			Clipboard.TheClipboard.Закрой();
		}
    }   
	
	//---------------------------------------------------------------------	

    public class Dnd : Приложение
    {
        //---------------------------------------------------------------------

        public override бул поИниц()
        {
            DndFrame рамка = new DndFrame("Dnd wxWidgets Приложение", Точка(10, 100), Размер(650,340));
            рамка.показ(да);

            return да;
        }

        //---------------------------------------------------------------------

        
            static проц Main()
            {
                Dnd app = new Dnd();
                app.пуск();
            }

        //---------------------------------------------------------------------
    }


проц main()
{
	Dnd.Main();
}
