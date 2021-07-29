//-----------------------------------------------------------------------------
// wxD/Samples - Notebook.d
//
// wxD "Notebook" sample.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2003 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $ид: Notebook.d,v 1.10 2008/03/03 19:50:10 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;
private import stdrus;
alias stdrus.найди indexOf;

	public class MyFrame : Рамка
	{
		enum ID_CONTROLS 
		{
			ID_RADIO_ORIENT = 5999,
			ID_CHK_SHOWIMAGES,
			ID_BTN_ADD_PAGE,
			ID_BTN_INSERT_PAGE,
			ID_BTN_DELETE_CUR_PAGE,
			ID_BTN_DELETE_LAST_PAGE,
			ID_BTN_NEXT_PAGE,
			ID_NOTEBOOK
		}
		
		public const цел ORIENT_TOP = 0;
		public const цел ORIENT_BOTTOM = 1;
		public const цел ORIENT_LEFT = 2;
		public const цел ORIENT_RIGHT = 3;
		public const цел ORIENT_MAX = 4;		
		
		private Panel m_panel;
		private RadioBox m_radioOrient;
		private CheckBox m_chkShowImages;
		
		private Кнопка m_btnAddPage;
		private Кнопка m_btnInsertPage;
		private Кнопка m_btnDeleteCurPage;
		private Кнопка m_btnDeleteLastPage;
		private Кнопка m_btnNextPage;
		private Кнопка m_btnExit;
		
		private MyNotebook m_notebook;
		private TextCtrl m_text;
		
		private ПеремерщикБокса m_sizerFrame;
		private ПеремерщикБокса m_sizerTop;
		private NotebookSizer m_sizerNotebook;
		private ImageList m_imageList;
		
		public static цел s_pageAdded = 0;
		public static цел s_pageIns = 0;
		public static цел s_numNotebookEvents = 0;
		public static цел s_nPages = -1;
		public static цел s_nSel = -1;
		
		//---------------------------------------------------------------------

		public this( ткст титул, Точка поз, Размер Размер )
		{
			super( титул, поз, Размер );
			Размер imageSize = Размер( 32, 32 );
			
			m_imageList = new ImageList( imageSize.Ширь, imageSize.Высь );
			
			m_imageList.Добавь( АртПровайдер.ДайПиктограмму( ПАртИД.wxART_INFORMATION, ПАртКлиент.wxART_OTHER, imageSize ) );
			
			m_imageList.Добавь( АртПровайдер.ДайПиктограмму( ПАртИД.wxART_QUESTION, ПАртКлиент.wxART_OTHER, imageSize ) );
			
			m_imageList.Добавь( АртПровайдер.ДайПиктограмму( ПАртИД.wxART_WARNING, ПАртКлиент.wxART_OTHER, imageSize ) );
			
			m_imageList.Добавь( АртПровайдер.ДайПиктограмму( ПАртИД.wxART_ERROR, ПАртКлиент.wxART_OTHER, imageSize ) );
			
			m_panel = new Panel( this, -1, ДЕФПОЗ, вхДефРазм,
				ТАБ_ТРАВЕРЗА | wxCLIP_CHILDREN | wxNO_BORDER );
			
			ткст[] strOrientations =
			[
				"&Верх",
				"&Низ",
				"&Лево",
				"&Право"
			];
			
			m_radioOrient = new RadioBox(
				m_panel, ID_CONTROLS.ID_RADIO_ORIENT,
				"&Tab orientation",
				ДЕФПОЗ, вхДефРазм,
				strOrientations,
				1, RadioBox.wxRA_SPECIFY_COLS );
			
			m_chkShowImages = new CheckBox( m_panel, ID_CONTROLS.ID_CHK_SHOWIMAGES, "&показ images" );
			
			m_btnAddPage = new Кнопка( m_panel, ID_CONTROLS.ID_BTN_ADD_PAGE, "&Добавь page" );
			
			m_btnInsertPage = new Кнопка( m_panel, ID_CONTROLS.ID_BTN_INSERT_PAGE, "&Insert page" );
			
			m_btnDeleteCurPage = new Кнопка( m_panel, ID_CONTROLS.ID_BTN_DELETE_CUR_PAGE, "&Delete current page" );
			
			m_btnDeleteLastPage = new Кнопка( m_panel, ID_CONTROLS.ID_BTN_DELETE_LAST_PAGE, "Delete las&t page" );
			
			m_btnNextPage = new Кнопка( m_panel, ID_CONTROLS.ID_BTN_NEXT_PAGE, "&Next page" );
			
			m_btnExit = new Кнопка( m_panel, wxID_OK, "&Exit" );
			m_btnExit.УстДеф();
			
			m_notebook = new MyNotebook( m_panel, ID_CONTROLS.ID_NOTEBOOK );
			
			m_text = new TextCtrl( m_panel, -1, "", ДЕФПОЗ, вхДефРазм, TextCtrl.МНОГОСТРОК | TextCtrl.ТОЛЬКО_ЧТЕНИЕ );
			
			Log.УстActiveTarget( m_text );
			Log.AddTraceMask( "focus" );			
			
			m_notebook.CreateInitialPages();
			
			m_sizerFrame = new ПеремерщикБокса( Ориентация.wxVERTICAL );
			
			m_sizerTop = new ПеремерщикБокса( Ориентация.wxHORIZONTAL );
			
			ПеремерщикБокса sizerLeft = new ПеремерщикБокса( Ориентация.wxVERTICAL );
			
			sizerLeft.Добавь( m_radioOrient, 0, Stretch.wxEXPAND );
			sizerLeft.Добавь( m_chkShowImages, 0, Stretch.wxEXPAND | Direction.wxTOP, 4 );
			
			//sizerLeft.Добавь( 0, 0, 1 );
			
			sizerLeft.Добавь( m_btnAddPage, 0, Stretch.wxEXPAND | ( Direction.wxTOP | Direction.wxBOTTOM ), 4 );
			sizerLeft.Добавь( m_btnInsertPage, 0, Stretch.wxEXPAND | ( Direction.wxTOP | Direction.wxBOTTOM ), 4 );
			sizerLeft.Добавь( m_btnDeleteCurPage, 0, Stretch.wxEXPAND | ( Direction.wxTOP | Direction.wxBOTTOM ), 4 );
			sizerLeft.Добавь( m_btnDeleteLastPage, 0, Stretch.wxEXPAND | ( Direction.wxTOP | Direction.wxBOTTOM ), 4 );
			sizerLeft.Добавь( m_btnNextPage, 0, Stretch.wxEXPAND | ( Direction.wxTOP | Direction.wxBOTTOM ), 4 );
			
			//sizerLeft.Добавь( 0, 0, 1 );
			
			sizerLeft.Добавь( m_btnExit, 0, Stretch.wxEXPAND );
			
			m_sizerTop.Добавь( sizerLeft, 0, Stretch.wxEXPAND | Direction.wxALL, 4 );
			
			m_sizerFrame.Добавь( m_sizerTop, 1, Stretch.wxEXPAND );
			m_sizerFrame.Добавь( m_text, 0, Stretch.wxEXPAND );
			
			ReInitNotebook();
			
			m_panel.сайзер = m_sizerFrame;
			
			m_panel.Автораскладка = да;
			
			m_sizerFrame.Встрой( this );
			
			Центр( Ориентация.wxBOTH );
			
			собРадиобокс( ID_CONTROLS.ID_RADIO_ORIENT, & OnCheckOrRadioBox) ;
			собЧекбокс( ID_CONTROLS.ID_CHK_SHOWIMAGES, & OnCheckOrRadioBox ) ;

			собКнопка( ID_CONTROLS.ID_BTN_ADD_PAGE, & OnButtonAddPage ) ;
			собКнопка( ID_CONTROLS.ID_BTN_INSERT_PAGE, & OnButtonInsertPage ) ;
			собКнопка( ID_CONTROLS.ID_BTN_DELETE_CUR_PAGE, & OnButtonDeleteCurPage ) ;
			собКнопка( ID_CONTROLS.ID_BTN_DELETE_LAST_PAGE, & OnButtonDeleteLastPage ) ;
			собКнопка( ID_CONTROLS.ID_BTN_NEXT_PAGE, & OnButtonNextPage ) ;
			собКнопка( wxID_OK, & OnButtonExit ) ;

			собОбновиИП( ID_CONTROLS.ID_BTN_DELETE_CUR_PAGE, & OnUpdateUIBtnDeleteCurPage ) ;
			собОбновиИП( ID_CONTROLS.ID_BTN_DELETE_LAST_PAGE, & OnUpdateUIBtnDeleteLastPage ) ;

			собНоутбукСтраницаИзменена( ID_CONTROLS.ID_NOTEBOOK, & OnNotebook ) ;
			собНоутбукСтраницаИзменяется( ID_CONTROLS.ID_NOTEBOOK, & OnNotebook ) ;

			собБездействие( & OnIdle ) ;
		}
		
		public проц ReInitNotebook()
		{
			long флаги = 0;
			
			switch ( m_radioOrient.Selection )
			{
				default: Log.LogError( "unknown notebook orientation" ); break;
				case ORIENT_TOP :
					флаги = Notebook.ВЕРХ;
					break;
				case ORIENT_BOTTOM :
					флаги = Notebook.НИЗ;
					break;
				case ORIENT_LEFT :
					флаги = Notebook.ЛЕВО;
					break;
				case ORIENT_RIGHT :
					флаги = Notebook.ПРАВО;
					break;
			}
			
			MyNotebook notebook = m_notebook;
			
			m_notebook = new MyNotebook( m_panel, ID_CONTROLS.ID_NOTEBOOK,
				ДЕФПОЗ, вхДефРазм, флаги );
			
			if ( m_chkShowImages.IsChecked )
			{
				m_notebook.Images = m_imageList;
			}
			
			if ( notebook )
			{
				цел sel = notebook.Selection;
				
				цел count = notebook.PageCount;
				
				for ( цел n = 0; n < count; n++ )
				{
					ткст стр = notebook.GetPageText( n );
					
					Окно page = m_notebook.CreatePage( стр );
					m_notebook.AddPage( page, стр, false, m_notebook.IconIndex );
				}
				
				if ( m_sizerNotebook )
				{
					m_sizerTop.Remove( m_sizerNotebook );
				}
				
				notebook.вымести();
				notebook = null;
				
				if ( sel != -1 )
				{
					m_notebook.Selection = sel;
				}
			}
			
			m_sizerNotebook = new NotebookSizer( m_notebook );
			m_sizerTop.Добавь( m_sizerNotebook, 1, Stretch.wxEXPAND | Direction.wxALL, 4 );
			m_sizerTop.раскладка();
		}
		
		public проц OnCheckOrRadioBox( Объект отправитель, Событие e )
		{
			ReInitNotebook();
		}
		
		public проц OnButtonAddPage( Объект отправитель, Событие e )
		{
			Panel панель = new Panel( m_notebook, -1 );
			new Кнопка( панель, -1, "First button", Точка( 10, 10 ), Размер( -1, -1 ) );
			new Кнопка( панель, -1, "секунда button", Точка( 50, 100 ), Размер( -1, -1 ) );
			
			m_notebook.AddPage( панель, "Added " ~ .вТкст( ++s_pageAdded), да, m_notebook.IconIndex );
		}
		
		public проц OnButtonInsertPage( Объект отправитель, Событие e )
		{
			Panel панель = m_notebook.CreateUserCreatedPage();
			
			m_notebook.InsertPage( 0, панель, "Inserted " ~ .вТкст( ++s_pageIns), false, m_notebook.IconIndex );
			
			m_notebook.Selection = 0;
		}
		
		public проц OnButtonDeleteCurPage( Объект отправитель, Событие e )
		{
			цел sel = m_notebook.Selection;
			
			if ( sel != -1 )
			{
				m_notebook.DeletePage( sel );
			}
		}
		
		public проц OnButtonDeleteLastPage( Объект отправитель, Событие e )
		{
			цел page = m_notebook.PageCount;
			
			if ( page != 0 )
			{
				m_notebook.DeletePage( page -1 );
			}
		}
		
		public проц OnButtonNextPage( Объект отправитель, Событие e )
		{
			m_notebook.AdvanceSelection( да );
		}
		
		public проц OnButtonExit( Объект отправитель, Событие e )
		{
			Закрой();
		}
		
		public проц OnNotebook( Объект отправитель, Событие e )
		{
			ткст стр = "Unknown notebook event";
			
			NotebookEvent ne = cast(NotebookEvent) e;
			
			цел eventType = ne.eventType;
			
			if ( eventType == Событие.wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGED )
			{
				стр = "Notebook changed";
			}
			else if ( eventType == Событие.wxEVT_COMMAND_NOTEBOOK_PAGE_CHANGING )
			{
				цел idx = ne.OldSelection;
				
				if ( idx != -1 && m_notebook.GetPageText( idx ) == "Veto" )
				{
					MessageDialog md = new MessageDialog( this, "Are you sure you want to leave this notebook page?\n(This demonstrates вето-ing)",
							"Notebook sample", Dialog.wxICON_QUESTION | Dialog.wxYES_NO );
						
					if ( md.ShowModal() != wxID_YES )
					{
						ne.Veto();
						
						return;
					}		
				}
				
				стр = "Notebook changing";
			}
			
			Log.LogMessage( "Notebook event #{0}: {1} ({2})", s_numNotebookEvents++, стр, eventType );
			
			m_text.УстInsertionPointEnd();
			
			ne.Skip();
		}
		
		public проц OnUpdateUIBtnDeleteCurPage( Объект отправитель, Событие e )
		{
			UpdateUIEvent ue = cast(UpdateUIEvent) e;
			ue.Активен = m_notebook.Selection != -1;
		}
		
		public проц OnUpdateUIBtnDeleteLastPage( Объект отправитель, Событие e )
		{
			UpdateUIEvent ue = cast(UpdateUIEvent) e;
			ue.Активен = m_notebook.PageCount != 0;
		}
		
		public проц OnIdle( Объект отправитель, Событие e )
		{
			цел nPages = m_notebook.PageCount;
			цел nSel = m_notebook.Selection;
			if ( nPages != s_nPages || nSel != s_nSel )
			{
				s_nPages = nPages;
				s_nSel = nSel;
				
				ткст титул = "Notebook (" ~ .вТкст(nPages) ~ " страницы, selection: " ~ .вТкст(nSel) ~ ")";
				
				Титул = титул;
			}
		}
	}
	
	//---------------------------------------------------------------------
	
	public class MyNotebook : Notebook
	{
		public this( Окно родитель, цел ид )
			{ this( родитель, ид, ДЕФПОЗ, вхДефРазм, 0 ); }
		
		public this( Окно родитель, цел ид, Точка поз, Размер Размер, long стиль )
		{
			super ( родитель, ид, поз, Размер, стиль );
		}
		
		public проц CreateInitialPages()
		{
			Panel панель = null;
			
			панель = CreateRadioButtonsPage();
			AddPage( панель, "Radiobuttons", false, IconIndex );
			
			панель = CreateVetoPage();
			AddPage( панель, "Veto", false, IconIndex );
			
			панель = CreateBigButtonPage();
			AddPage( панель, "Maximized button", false, IconIndex );
			
			панель = CreateInsertPage();
			InsertPage( 0, панель, "Inserted", false, IconIndex );
			
			Selection = 1;
		}
		
		public Panel CreatePage( ткст pageName )
		{
			if ( pageName.indexOf( "Inserted " ) != -1 || pageName.indexOf( "Added " ) != -1 )
			{
				return CreateUserCreatedPage();
			}
			
			if ( pageName == "Inserted" )
			{
				return CreateInsertPage();
			}
			
			if ( pageName == "Veto" )
			{
				return CreateVetoPage();
			}
			
			if ( pageName == "Radiobuttons" )
			{
				return CreateRadioButtonsPage();
			}
			
			if ( pageName == "Maximized button" )
			{
				return CreateBigButtonPage();
			}
			
			return CreateBigButtonPage();
		}
		
		public Panel CreateUserCreatedPage()
		{
			Panel панель = new Panel( this );
			
			new Кнопка( панель, -1, "Кнопка", Точка( 10, 10 ), Размер( -1, -1 ) );
			
			return панель;
		}
		
		public цел IconIndex()
		{
				if ( Images )
				{
					цел nImages = Images.ImageCount;
					if ( nImages > 0 )
					{
						return PageCount % nImages;
					}
				}
				return -1; 
		}
		
		private Panel CreateInsertPage()
		{
			Panel панель = new Panel( this );
			
			панель.ЦветФона = new Цвет( "MAROON" );
			
			new StaticText( панель, -1, "This page есть been inserted, not added.", Точка( 10, 10 ) );
			
			return панель;
		}
		
		private Panel CreateRadioButtonsPage()
		{
			Panel панель = new Panel( this );
			
			ткст[] animals = [ "Fox", "Hare", "Rabbit", "Sabre-toothed tiger", "Rex" ];
			
			RadioBox radiobox1 = new RadioBox( панель, -1, "Choose one", 
				ДЕФПОЗ, вхДефРазм, animals, 2, RadioBox.wxRA_SPECIFY_ROWS );
			
			ткст[] computers = [ "Amiga", "Commodore 64", "PET", "Another" ];
			
			RadioBox radiobox2 = new RadioBox( панель, -1, "Choose your favourite",
				ДЕФПОЗ, вхДефРазм, computers, 0, RadioBox.wxRA_SPECIFY_COLS );
			
			ПеремерщикБокса sizerPanel = new ПеремерщикБокса( Ориентация.wxVERTICAL );
			sizerPanel.Добавь( radiobox1, 2, Stretch.wxEXPAND );
			sizerPanel.Добавь( radiobox2, 1, Stretch.wxEXPAND );
			панель.сайзер = sizerPanel;
			
			return панель;
		}
		
		private Panel CreateVetoPage()
		{
			Panel панель = new Panel( this );
			
			new StaticText( панель, -1, "This page intentionally left blank", Точка( 10, 10 ) );
			
			return панель;
		}
		
		private Panel CreateBigButtonPage()
		{
			Panel панель = new Panel( this );
			
			Кнопка buttonBig = new Кнопка( панель, -1, "Maximized button", Точка( 0, 0 ), Размер( 480, 360 ) );
			
			ПеремерщикБокса sizerPanel = new ПеремерщикБокса( Ориентация.wxVERTICAL );
			sizerPanel.Добавь( buttonBig, 1, Stretch.wxEXPAND );
			панель.сайзер = sizerPanel;
			
			return панель;
		}
	}
	
	//---------------------------------------------------------------------

	public class NOTEBOOK : Приложение
	{
		public override бул поИниц()
		{
			MyFrame рамка = new MyFrame( "Notebook sample", Окно.ДЕФПОЗ, Окно.вхДефРазм );
			рамка.показ( да );

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			NOTEBOOK app = new NOTEBOOK();
			app.пуск();
		}
	}


проц main()
{
	NOTEBOOK.Main();
}
