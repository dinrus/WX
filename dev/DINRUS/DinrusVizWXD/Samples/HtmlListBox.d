//-----------------------------------------------------------------------------
// wxD/Samples - БоксСпискаГЯР.d
//
// wxD "БоксСпискаГЯР" sample.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $ид: БоксСпискаГЯР.d,v 1.10 2008/04/24 07:18:58 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;
private import stdrus;


	public class MyHtmlListBox : БоксСпискаГЯР
	{
		//---------------------------------------------------------------------
		
		protected бул m_change;
		
		//---------------------------------------------------------------------
		
		public this( Окно родитель )
			{ this( родитель, false ); }
			
		public this( Окно родитель, бул multi )
		{
			super( родитель, -1, ДЕФПОЗ, вхДефРазм, multi ? ListBox.МНОЖЕСТВЕННЫЙ : 0 );
			m_change = да;
			
			УстMargins( 5, 5 );
			
			ItemCount = 1000;
			
			Selection = 3;			
		}
		
		//---------------------------------------------------------------------
		
		public проц ChangeSelFg(бул значение)
		{
			m_change = значение;
		}
		
		//---------------------------------------------------------------------
		
		private static ткст tohex(ubyte значение) {
			char buf[2];
			buf[0] = ЦИФРЫ16[значение/16];
			buf[1] = ЦИФРЫ16[значение%16];
			return buf.dup;
		}
		
		private static бцел abs(цел значение) { return значение<0?-значение:значение; }
		
		protected override ткст приПолученииЭлта( цел n )
		{
			цел level = ( n % 6 ) + 1;
		
			return фм("<h%d><шрифт color=#%02x%02x%02x>Элемент</шрифт> <b>%d</b></h%d>",
				level,
				abs(n - 192) % 256,
				abs(n - 256) % 256,
				abs(n - 128) % 256,
				n,level
			);
		}
		
		//---------------------------------------------------------------------
		
		protected override проц OnDrawSeparator( DC dc, Прямоугольник прям, цел n )   
		{	
			MyFrame mp = cast(MyFrame)родитель;
			
			if ( mp.menuBar.IsChecked( MyFrame.Cmd.HtmlLbox_DrawSeparator ) )
			{
				dc.pen = Pen.wxBLACK_DASHED_PEN;
				dc.DrawLine( прям.X, прям.Y, прям.Право - 1, прям.Y );
				dc.DrawLine( прям.X, прям.Низ - 1, прям.Право - 1, прям.Низ - 1 );
			}
			
		}
		
		//---------------------------------------------------------------------
		
		protected override Цвет дайЦветВыделенногоТекста( Цвет цветПП )
		{
			return m_change ? super.дайЦветВыделенногоТекста( цветПП ) : цветПП;
		}
	}
	
	//---------------------------------------------------------------------
	
	public class MyFrame : Рамка
	{
		public enum Cmd { HtmlLbox_Quit,
			HtmlLbox_SetMargins,
			HtmlLbox_DrawSeparator,
			HtmlLbox_ToggleMulti,
			HtmlLbox_SelectAll,

			HtmlLbox_SetBgCol,
			HtmlLbox_SetSelBgCol,
			HtmlLbox_SetSelFgCol,

			HtmlLbox_About = wxID_ABOUT }
		
		//---------------------------------------------------------------------
		
		private MyHtmlListBox m_hlbox;
		
		//---------------------------------------------------------------------
		
		public this( Окно родитель, ткст титул, Точка поз, Размер Размер ) 
		{
			super( родитель, -1, титул, поз, Размер );
			пиктограмма = new Пиктограмма( "./data/mondrian.png" );
			
			Меню menuFile = new Меню();
			menuFile.Append( Cmd.HtmlLbox_Quit, "E&xit\tAlt-X", "Quit this program" );
			
			Меню menuHLbox = new Меню();
			menuHLbox.Append( Cmd.HtmlLbox_SetMargins, "Уст &margins...\tCtrl-G", "Change the margins around the элтs" );
			menuHLbox.добавьЧекЭлт( Cmd.HtmlLbox_DrawSeparator, "&Draw separators\tCtrl-D", "Toggle drawing separators between cells" );
			menuHLbox.добавьРазделитель();
			menuHLbox.добавьЧекЭлт( Cmd.HtmlLbox_ToggleMulti, "&Multiple selection\tCtrl-M", "Toggle multiple selection on/off" );
			menuHLbox.добавьРазделитель();
			menuHLbox.Append( Cmd.HtmlLbox_SelectAll, "Select &all элтs\tCtrl-A" );
			menuHLbox.добавьРазделитель();
			menuHLbox.Append( Cmd.HtmlLbox_SetBgCol, "Уст &заднийПлан...\tCtrl-B" );
			menuHLbox.Append( Cmd.HtmlLbox_SetSelBgCol, "Уст &selection заднийПлан...\tCtrl-S" );
			menuHLbox.добавьЧекЭлт( Cmd.HtmlLbox_SetSelFgCol, "Keep &переднийПлан in selection\tCtrl-F" );
			
			Меню менюСправки = new Меню();
			менюСправки.Append( Cmd.HtmlLbox_About, "&About...\tF1", "показ about dialog" );
			
			MenuBar menuBar = new MenuBar();
			menuBar.Append( menuFile, "&File" );
			menuBar.Append( menuHLbox, "&Listbox" );
			menuBar.Append( менюСправки, "&Help" );
			
			menuBar.Check( Cmd.HtmlLbox_DrawSeparator, да );
			
			this.menuBar = menuBar;
			
			CreateStatusBar( 2 );
			StatusText = "Welcome to wxWidgets!";
			
			m_hlbox = new MyHtmlListBox( this );
			TextCtrl текст = new TextCtrl( this, -1, "", ДЕФПОЗ, вхДефРазм, TextCtrl.МНОГОСТРОК );
			
			Log.УстActiveTarget( текст ); 
			
			ПеремерщикБокса сайзер = new ПеремерщикБокса( Ориентация.wxHORIZONTAL );
			сайзер.Добавь( m_hlbox, 1, Stretch.wxGROW );
			сайзер.Добавь( текст, 1, Stretch.wxGROW );
			
			this.сайзер = сайзер;
			
			собМеню( Cmd.HtmlLbox_Quit,  & OnQuit ) ;
			собМеню( Cmd.HtmlLbox_SetMargins,  & OnУстMargins ) ;
			собМеню( Cmd.HtmlLbox_DrawSeparator, & OnDrawSeparator ) ;
			собМеню( Cmd.HtmlLbox_ToggleMulti, & OnToggleMulti ) ;
			собМеню( Cmd.HtmlLbox_SelectAll, & OnSelectAll ) ;

			собМеню( Cmd.HtmlLbox_About, & OnAbout ) ;

			собМеню( Cmd.HtmlLbox_SetBgCol, & OnУстBgCol ) ;
			собМеню( Cmd.HtmlLbox_SetSelBgCol, & OnУстSelBgCol ) ;
			собМеню( Cmd.HtmlLbox_SetSelFgCol, & OnУстSelFgCol ) ;

			собОбновиИП( Cmd.HtmlLbox_SelectAll, & OnUpdateUISelectAll ) ;


			собЛистбокс( wxID_ANY, & OnLboxSelect ) ;
			собЛистбоксДНажат( wxID_ANY, & OnLboxDClick ) ;
		}
		
		//---------------------------------------------------------------------
		
		public проц OnQuit( Объект отправитель, Событие e )
		{
			Закрой();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnAbout( Объект отправитель, Событие e )
		{
			MessageBox( this, "This sample shows wxHtmlListBox class.\n" 
				"\n" 
				"(c) 2003 Vadim Zeitlin\n" 
				"Ported to wxD by BERO", "About HtmlLbox", Dialog.wxOK | Dialog.wxICON_INFORMATION );
		}
		
		//---------------------------------------------------------------------
		
		public проц OnУстMargins( Объект отправитель, Событие e )
		{
			long маржин = GetNumberFromUser(
				"Enter the margins to use for the listbox элтs.",
				"Margin: ",
				"HtmlLbox: Уст the margins",
				0, 0, 20,
				this
			);
			
			if ( маржин != -1 )
			{
				m_hlbox.УстMargins( маржин, маржин );
				m_hlbox.RefreshAll();
			}
		}
		
		//---------------------------------------------------------------------
		
		public проц OnDrawSeparator( Объект отправитель, Событие e )
		{
			m_hlbox.RefreshAll();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnToggleMulti( Объект отправитель, Событие e )
		{
			СобытиеКоманда evt = cast(СобытиеКоманда) e;
			
			Перемерщик сайзер = this.сайзер;
			сайзер.Detach( m_hlbox );
			
			m_hlbox = new MyHtmlListBox( this, evt.IsChecked );
			сайзер.Prepend( m_hlbox, 1, Stretch.wxGROW, 0, null );
			
			сайзер.раскладка();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnSelectAll( Объект отправитель, Событие e )
		{
			m_hlbox.выделиВсе();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnУстBgCol( Объект отправитель, Событие e )
		{
			ColourData data = new ColourData();

			data.цвет = m_hlbox.ЦветФона;
			data.ChooseFull = да;
			
			ColourDialog cd = new ColourDialog( this, data );
			cd.Титул = "Choose the заднийПлан цвет";
			
			if ( cd.ShowModal() == wxID_OK )
			{
				Цвет col = cd.colourData.цвет;
			
				if ( col.Ок() )
				{
					m_hlbox.ЦветФона = col;
					m_hlbox.Освежи();
				
					StatusText = "Background цвет changed.";
				}
			}
		}
		
		//---------------------------------------------------------------------
		
		public проц OnУстSelBgCol( Объект отправитель, Событие e )
		{
			ColourData data = new ColourData();

			data.цвет = m_hlbox.ЦветФона;
			data.ChooseFull = да;
			
			ColourDialog cd = new ColourDialog( this, data );
			cd.Титул = "Choose the selection заднийПлан цвет";
			
			if ( cd.ShowModal() == wxID_OK )
			{
				Цвет col = cd.colourData.цвет;
			
			
				if ( col.Ок() )
				{
					m_hlbox.SelectionBackground = col;
					m_hlbox.Освежи();
				
					StatusText = "Selection заднийПлан цвет changed.";
				}
			}
		}
		
		//---------------------------------------------------------------------
		
		public проц OnУстSelFgCol( Объект отправитель, Событие e )
		{
			СобытиеКоманда evt = cast(СобытиеКоманда) e;
			
			m_hlbox.ChangeSelFg = !evt.IsChecked;
			m_hlbox.Освежи();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnUpdateUISelectAll( Объект отправитель, Событие e )
		{
			UpdateUIEvent evt = cast(UpdateUIEvent) e;
			
			evt.Активен = m_hlbox && m_hlbox.HasMultipleSelection;
		}
		
		//---------------------------------------------------------------------
		
		public проц OnLboxSelect( Объект отправитель, Событие e )
		{
			СобытиеКоманда evt = cast(СобытиеКоманда) e;
			
			Log.LogMessage( "Listbox selection is now {0}.", evt.цел );
			
			if ( m_hlbox.HasMultipleSelection )
			{
				ткст s = "";
				бул first = да;
				бцел куки = 0;
				
				for ( цел элт = m_hlbox.GetFirstSelected( куки ); элт != -1/*wxNOT_FOUND*/; элт = m_hlbox.GetNextSelected( куки ) )
				{
					if ( first )
					{
						first = false;
					}
					else
					{
						s ~= ", ";
					}
					
					s ~= stdrus.вТкст(элт);
					
				}
				
				if ( s.length > 0 )
					Log.LogMessage( "Selected элтs: {0}", s );
			}
			
			StatusText = "# элтs selected = " ~ .вТкст(m_hlbox.SelectedCount);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnLboxDClick( Объект отправитель, Событие e )
		{
			СобытиеКоманда evt = cast(СобытиеКоманда) e;
			
			Log.LogMessage( "Listbox элт {0} double clicked.", evt.цел );
		}
	}
	
	//---------------------------------------------------------------------

	public class HTLBox : Приложение
	{
		public override бул поИниц()
		{
			MyFrame рамка = new MyFrame( null, "HtmListBox sample", Точка( -1, -1 ), Размер( 400, 500 ) );
			рамка.показ( да );

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			HTLBox app = new HTLBox();
			app.пуск();
		}
	}	


проц main()
{
	HTLBox.Main();
}
