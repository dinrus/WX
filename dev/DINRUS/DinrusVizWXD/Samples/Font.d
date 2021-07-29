//-----------------------------------------------------------------------------
// wxD/Samples - Шрифт.d
//
// wxD "Шрифт" sample.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2003 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $ид: Шрифт.d,v 1.11 2008/03/03 20:04:19 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;
private import stdrus;
alias stdrus.найди indexOf;

	public class MyCanvas : Окно
	{
		private Цвет m_colour;
		private Шрифт m_font;
		
		//---------------------------------------------------------------------
		
		public this( Окно родитель )
		{
			super( родитель );
			m_colour = Цвет.wxRED;
			m_font = Шрифт.Нормальный;
			
			собРисование( & OnPaint ) ;
		}
		
		//---------------------------------------------------------------------
		
		public Шрифт TextFont() { return m_font; }
		public проц TextFont(Шрифт значение) { m_font = значение; }
		
		//---------------------------------------------------------------------
		
		public Цвет цвет() { return m_colour; }
		public проц   цвет(Цвет значение) { m_colour = значение; }
		
		//---------------------------------------------------------------------
		
		public проц OnPaint( Объект отправитель, Событие e )
		{
			PaintDC dc = new PaintDC( this );
			ПодготовьКР( dc );
			
			dc.Background = new Кисть( "white",FillStyle.wxSOLID );
			dc.Clear();
			
			цел hLine = dc.ВысьСим;
			
			цел x = 5;
			цел y = 5;
			
			ткст fontinfo = "Шрифт Размер is " ~ .вТкст(m_font.РазмТочки) ~ " points, семейство: " ~
				.вТкст(m_font.FamilyString.ptr) ~ ", кодировка: " ~ МапперШрифта.GetEncodingDescription( m_font.Кодировка );
				
			dc.DrawText( fontinfo, x, y );
			y += hLine;
			
			fontinfo = "Стиль: " ~ m_font.StyleString ~ ", weight: " ~ m_font.WeightString ~
				", fixed ширь: " ~ (m_font.IsFixedWidth ? "yes" : "no");
				
			dc.DrawText( fontinfo, x, y );
			y += hLine;
			
			if ( m_font.Ок )
			{
				IntPtr info = m_font.NativeFontInfo;
				if ( info != IntPtr.init )
				{
					ткст fontDesc = m_font.NativeFontInfoUserDesc;
					fontinfo = "Native шрифт info: " ~ fontDesc;
					
					dc.DrawText( fontinfo, x, y );
					y += hLine;
				}
			}
			
			y += hLine;
			
			dc.шрифт = m_font;
			dc.TextForeground = m_colour;
			
			цел maxCharWidth;
			цел maxCharHeight;
			
			dc.ДайПротяженностьТекста( "W", maxCharWidth, maxCharHeight );
			
			цел w = maxCharWidth + 5;
			цел h = maxCharHeight + 4;
			
			for ( цел i = 0; i < 7; i++)
			{
				for ( цел j = 0; j < 32; j++ )
				{
					char c = cast(char)( 32 * ( i + 1 ) + j );
					
					цел charWidth;
					цел charHeight;
					
					ткст s = .вТкст(cast(сим*) c);
					dc.ДайПротяженностьТекста( s, charWidth, charHeight );
					dc.DrawText( 
						s, 
						x + w * j + ( maxCharWidth - charWidth ) / 2 + 1, 
						y + h * i + ( maxCharHeight - charHeight ) / 2 
					);
				}
			}
			
			dc.pen = new Pen( new Цвет( "blue" ), 1, FillStyle.wxSOLID );
			
			цел l;
			
			for ( l = 0; l < 8; l++ )
			{
				цел yl = y + h * l - 2;
				dc.DrawLine( x - 2, yl, x + 32 * w - 1, yl );
			}
			
			for ( l = 0; l < 33; l++ )
			{
				цел xl = x + w * l - 2;
				dc.DrawLine( xl, y - 2, xl, y + 7 * h - 1 );
			}
			
			dc.вымести(); //needed
		}
	}
	
	//---------------------------------------------------------------------
	
	public class FontFrame : Рамка
	{
		enum Cmd { Font_Quit, Font_About, Font_ViewMsg, Font_IncSize, Font_DecSize, Font_Bold,
			Font_Italic, Font_Underlined, Font_Нормальный, Font_wxSMALL_FONT, Font_wxКурсивный_FONT,
			Font_wxSWISS_FONT, Font_Choose, Font_EnumFamiliesForEncoding, Font_EnumFamilies,
			Font_EnumFixedFamilies, Font_EnumEncodings, Font_CheckNativeToFromString, Font_Max }
		
		//---------------------------------------------------------------------
		
		protected цел m_fontSize;
		
		protected TextCtrl m_textctrl;
		protected MyCanvas m_canvas;
		
		public static ткст s_dir="";
		public static ткст s_file="";
		
		//---------------------------------------------------------------------
	
		public this( ткст титул, Точка поз, Размер Размер )
		{
			super( титул, поз, Размер );
			пиктограмма = new Пиктограмма( "./data/mondrian.png" );
			
			m_fontSize = 12;
			
			Меню menuFile = new Меню();
			menuFile.Append( Cmd.Font_ViewMsg, "&View...\tCtrl-V", "View an email message file" );
			menuFile.добавьРазделитель();
			menuFile.Append( Cmd.Font_About, "&About...\tCtrl-A", "показ about dialog" );
			menuFile.добавьРазделитель();
			menuFile.Append( Cmd.Font_Quit, "E&xit\tAlt-X", "Quit this program" );
			
			Меню menuFont = new Меню();
			menuFont.Append( Cmd.Font_IncSize, "&Increase шрифт Размер by 2 points\tCtrl-I" );
			menuFont.Append( Cmd.Font_DecSize, "&Decrease шрифт Размер by 2 points\tCtrl-D" );
			menuFont.добавьРазделитель();
			menuFont.добавьЧекЭлт( Cmd.Font_Bold, "&Bold\tCtrl-B", "Toggle полужирный state" );
			menuFont.добавьЧекЭлт( Cmd.Font_Italic, "&Oblique\tCtrl-O", "Toggle italic state" );
			menuFont.добавьЧекЭлт( Cmd.Font_Underlined, "&Underlined\tCtrl-U", "Toggle underlined state" );
			
			menuFont.добавьРазделитель();
			menuFont.Append( Cmd.Font_CheckNativeToFromString, "Check Native Шрифт Info To/From String" );
			
			Меню menuSelect = new Меню();
			menuSelect.Append( Cmd.Font_Choose, "&Select шрифт...\tCtrl-S", "Select a standard шрифт" );
			
			Меню menuStdFonts = new Меню();
			menuStdFonts.Append( Cmd.Font_Нормальный, "Нормальный", "Normal шрифт used by wxWidgets" );
			menuStdFonts.Append( Cmd.Font_wxSMALL_FONT,  "Маленький",  "Small шрифт used by wxWidgets" );
			menuStdFonts.Append( Cmd.Font_wxКурсивный_FONT, "Курсивный", "Italic шрифт used by wxWidgets" );
			menuStdFonts.Append( Cmd.Font_wxSWISS_FONT,  "Швейцарский",  "Swiss шрифт used by wxWidgets" );
			menuSelect.Append(-2, "Standar&d fonts", menuStdFonts, "" );

			menuSelect.добавьРазделитель();
			menuSelect.Append( Cmd.Font_EnumFamilies, "Enumerate шрифт &families\tCtrl-F" );
			menuSelect.Append( Cmd.Font_EnumFixedFamilies, "Enumerate fi&xed шрифт families\tCtrl-X" );
			menuSelect.Append( Cmd.Font_EnumEncodings, "Enumerate &encodings\tCtrl-E" );
			menuSelect.Append( Cmd.Font_EnumFamiliesForEncoding, "Find шрифт for en&coding...\tCtrl-C", "Find шрифт families for given кодировка" );
			
			MenuBar menuBar = new MenuBar();
			menuBar.Append( menuFile, "&File" );
			menuBar.Append( menuFont, "F&ont" );
			menuBar.Append( menuSelect, "&Select" );
			
			this.menuBar = menuBar;
			
			SplitterWindow splitter = new SplitterWindow( this );
			
			m_textctrl = new TextCtrl( splitter, -1, 
				"Paste текст here to see how it looks\nlike in the given шрифт",
				ДЕФПОЗ, вхДефРазм,
				TextCtrl.МНОГОСТРОК );
			
			m_canvas = new MyCanvas( splitter );
			
			splitter.SplitHorizontally( m_textctrl, m_canvas, 100 );
			
			CreateStatusBar();
			StatusText = "Welcome to wxWidgets шрифт demo!";	
			
			собМеню( Cmd.Font_Quit,  & OnQuit ) ;
			собМеню( Cmd.Font_ViewMsg, & OnViewMsg ) ;
			собМеню( Cmd.Font_About, & OnAbout ) ;

			собМеню( Cmd.Font_IncSize, & OnIncFont ) ;
			собМеню( Cmd.Font_DecSize, & OnDecFont ) ;
			собМеню( Cmd.Font_Bold, & OnBold ) ;
			собМеню( Cmd.Font_Italic, & OnItalic ) ;
			собМеню( Cmd.Font_Underlined, & OnUnderline ) ;

			собМеню( Cmd.Font_Нормальный, & OnwxPointerFont ) ;
			собМеню( Cmd.Font_wxSMALL_FONT, & OnwxPointerFont ) ;
			собМеню( Cmd.Font_wxКурсивный_FONT, & OnwxPointerFont ) ;
			собМеню( Cmd.Font_wxSWISS_FONT, & OnwxPointerFont ) ;

			собМеню( Cmd.Font_CheckNativeToFromString, & OnCheckNativeToFromString ) ;

			собМеню( Cmd.Font_Choose, & OnSelectFont ) ;
			собМеню( Cmd.Font_EnumFamiliesForEncoding, & OnEnumerateFamiliesForEncoding ) ;
			собМеню( Cmd.Font_EnumFamilies, & OnEnumerateFamilies ) ;
			собМеню( Cmd.Font_EnumFixedFamilies, & OnEnumerateFixedFamilies ) ;
			собМеню( Cmd.Font_EnumEncodings, & OnEnumerateEncodings ) ;
		}
		
		//---------------------------------------------------------------------
		
		public проц OnQuit( Объект отправитель, Событие e )
		{
			Закрой();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnViewMsg( Объект отправитель, Событие e )
		{
			FileDialog dialog = new FileDialog( this, "Open an email message file", s_dir, s_file, "*" );
			if ( dialog.ShowModal() != wxID_OK ) return;
			
			s_dir = dialog.Directory;
			s_file = dialog.Filename;
			
			ткст filename = dialog.Path;
			ткст message;

			try
			{
				message = cast(ткст)читайФайл(filename);
			}
			catch (Exception ex)
			{
				return;
			}
						
			ткст гарнитура;
			
			ткст prefix = "Content-тип: текст/plain; гарнитура=";
			
			цел поз = message.indexOf( prefix );
			
			if ( поз == -1 )
			{
				Log.LogError( "The file '%s' doesn't contain гарнитура information.", filename );
				return;
			}
			
			поз += prefix.length + 1; 
			
			цел pos2 = поз;
			
			while ( message[pos2] != '"' )
			{
				pos2++;
			}
						
			гарнитура = message[поз..pos2];
			
			FontEncoding fontenc = МапперШрифта.дай.гарнитураВКодировку( гарнитура );
			if ( fontenc == FontEncoding.wxFONTENCODING_SYSTEM )
			{
				Log.LogError( "Charset '{0}' is unsupported.", гарнитура );
				return;
			}
			
			m_textctrl.ЗагрузиФайл( filename );
			
			if ( fontenc == FontEncoding.wxFONTENCODING_UTF8 || 
				!МапперШрифта.дай.кодировкаДоступна(fontenc) )
			{
				FontEncoding encAlt;
				if ( МапперШрифта.дай.GetAltForEncoding( fontenc, encAlt ) )
				{
					EncodingConverter conv = new EncodingConverter();
					
					if ( conv.Init( fontenc, encAlt ) )
					{
						fontenc = encAlt;
						m_textctrl.Value = conv.Convert( m_textctrl.Value );
					}
					else
					{
						Log.LogWarning( "Cannot convert from '{0}' to '{1}'.",
							МапперШрифта.GetEncodingDescription( fontenc ),
							МапперШрифта.GetEncodingDescription( encAlt ) );
					}
				}
				else
				{
					Log.LogWarning( "No fonts for кодировка '{0}' on this system.",
						МапперШрифта.GetEncodingDescription( fontenc ) );
				}
			}
			
			if ( !DoEnumerateFamilies( false, fontenc, да ) )
			{
				Шрифт шрифт = new Шрифт( 12, СемействоШрифтов.wxDEFAULT, СтильШрифта.wxNORMAL,
					ВесШрифта.wxNORMAL, false, "", fontenc );
				
				if ( шрифт.Ок )
				{
					DoChangeFont( шрифт );
				}
				else
				{
					Log.LogWarning( "No fonts for кодировка '{0}' on this system.",
						МапперШрифта.GetEncodingDescription( fontenc ) );
				}
			}
		}		
		
		//---------------------------------------------------------------------
		
		public проц OnAbout( Объект отправитель, Событие e )
		{
			MessageBox( this, "wxWidgets шрифт demo\n(c) 1999 Vadim Zeitlin\nPorted to wxD by BERO",
				"About Шрифт", Dialog.wxOK | Dialog.wxICON_INFORMATION );
		}		
		
		//---------------------------------------------------------------------
		
		public проц OnIncFont( Объект отправитель, Событие e )
		{
			DoResizeFont( +2 ); 
		}		
		
		//---------------------------------------------------------------------
		
		public проц OnDecFont( Объект отправитель, Событие e )
		{
			DoResizeFont( -2 );
		}		
		
		//---------------------------------------------------------------------
		
		public проц OnBold( Объект отправитель, Событие e )
		{
			СобытиеКоманда ce = cast(СобытиеКоманда) e;
			Шрифт шрифт = m_canvas.TextFont;
			
			шрифт.Вес = ce.IsChecked ? ВесШрифта.wxBOLD : ВесШрифта.wxNORMAL ;
			DoChangeFont( шрифт );
		}		
		
		//---------------------------------------------------------------------
		
		public проц OnItalic( Объект отправитель, Событие e )
		{
			СобытиеКоманда ce = cast(СобытиеКоманда) e;
			Шрифт шрифт = m_canvas.TextFont;
			
			шрифт.Стиль = ce.IsChecked ? СтильШрифта.wxКурсивный : СтильШрифта.wxNORMAL ;
			DoChangeFont( шрифт );
		}
		
		//---------------------------------------------------------------------
		
		public проц OnUnderline( Объект отправитель, Событие e )
		{
			СобытиеКоманда ce = cast(СобытиеКоманда) e;
			Шрифт шрифт = m_canvas.TextFont;
			
			шрифт.Underlined = ce.IsChecked;
			DoChangeFont( шрифт );
		}		
		
		//---------------------------------------------------------------------
		
		public проц OnwxPointerFont( Объект отправитель, Событие e )
		{
			Шрифт шрифт;
			
			switch ( e.ИД )
			{
				case Cmd.Font_Нормальный : шрифт = Шрифт.Нормальный; break;
				case Cmd.Font_wxSMALL_FONT : шрифт = Шрифт.Маленький; break;
				case Cmd.Font_wxКурсивный_FONT : шрифт = Шрифт.Курсивный; break;
				case Cmd.Font_wxSWISS_FONT : шрифт = Шрифт.Швейцарский; break;
				default : шрифт = Шрифт.Нормальный; break;
			}
			
			menuBar.Check( Cmd.Font_Bold, false );
			menuBar.Check( Cmd.Font_Italic, false );
			menuBar.Check( Cmd.Font_Underlined, false );
			
			DoChangeFont( шрифт );
		}
		
		//---------------------------------------------------------------------
		
		public проц OnCheckNativeToFromString( Объект отправитель, Событие e )
		{
			ткст fontinfo = m_canvas.TextFont.NativeFontInfoDesc;
			
			if ( fontinfo.length == 0 )
			{
				Log.LogError( "Native шрифт info ткст is empty!" );
			}
			else
			{
				Шрифт шрифт = Шрифт.Нов( fontinfo );
				if ( fontinfo != шрифт.NativeFontInfoDesc )
					Log.LogError( "wxNativeFontInfo вТкст()/FromString() broken!" );
				else
					Log.LogMessage( "wxNativeFontInfo works: " ~ fontinfo );
			}
		}
		
		//---------------------------------------------------------------------
		
		public проц OnSelectFont( Объект отправитель, Событие e )
		{
			FontData data = new FontData();
			data.начальныйШрифт = m_canvas.TextFont;
			data.цвет = m_canvas.цвет;
			
			FontDialog dialog = new FontDialog( this, data );
			if ( dialog.ShowModal() == wxID_OK )
			{
				FontData refData = dialog.fontData;
				Шрифт шрифт = refData.выбранныйШрифт;
				Цвет цвет = refData.цвет;
				
				DoChangeFont( шрифт, цвет );
				
				menuBar.Check( Cmd.Font_Bold, шрифт.Вес == ВесШрифта.wxBOLD );
				menuBar.Check( Cmd.Font_Italic, шрифт.Стиль == СтильШрифта.wxКурсивный );
				menuBar.Check( Cmd.Font_Underlined, шрифт.Underlined );
			}
		}		
		
		//---------------------------------------------------------------------
		
		public проц OnEnumerateFamiliesForEncoding( Объект отправитель, Событие e )
		{
			 const FontEncoding[] encodings = 
			 [
				FontEncoding.wxFONTENCODING_ISO8859_1,
				FontEncoding.wxFONTENCODING_ISO8859_2,
				FontEncoding.wxFONTENCODING_ISO8859_5,
				FontEncoding.wxFONTENCODING_ISO8859_7,
				FontEncoding.wxFONTENCODING_ISO8859_15,
				FontEncoding.wxFONTENCODING_KOI8,
				FontEncoding.wxFONTENCODING_CP1250,
				FontEncoding.wxFONTENCODING_CP1251,
				FontEncoding.wxFONTENCODING_CP1252,
			];
			
			 ткст[] encodingNames =
			 [
				"Western European (ISO-8859-1)",
				"Central European (ISO-8859-2)",
				"Cyrillic (ISO-8859-5)",
				"Greek (ISO-8859-7)",
				"Western European with Euro (ISO-8859-15)",
				"KOI8-R",
				"Windows Central European (CP 1250)",
				"Windows Cyrillic (CP 1251)",
				"Windows Western European (CP 1252)",
			];
			
			ткст result = GetSingleChoice( "Choose an кодировка", "Шрифт demo", encodingNames );

			цел n = -1;
			for ( цел i = 0; i < encodingNames.length; i++ )
				if ( encodingNames[i] == result )
					{
						n = i;
						break;
					}
					
			if ( n != -1 )
			{
				DoEnumerateFamilies( false, encodings[n] );
			}
		}
		
		//---------------------------------------------------------------------
		
		public проц OnEnumerateFamilies( Объект отправитель, Событие e )
		{
			DoEnumerateFamilies( false );
		}
		
		//---------------------------------------------------------------------
		
		public проц OnEnumerateFixedFamilies( Объект отправитель, Событие e )
		{
			DoEnumerateFamilies( да );
		}
		
		//---------------------------------------------------------------------
		
		public проц OnEnumerateEncodings( Объект отправитель, Событие e )
		{
			MyEncodingEnumerator fontEnumerator = new MyEncodingEnumerator();
			
			fontEnumerator.перечислиКодировки("");
			
			Log.LogMessage( "Enumerating all available encodings:\n{0}", fontEnumerator.Text );
		}		
		
		//---------------------------------------------------------------------
		
		protected бул DoEnumerateFamilies( бул толькоФиксШир )
		{
			return DoEnumerateFamilies( толькоФиксШир, FontEncoding.wxFONTENCODING_SYSTEM, false );
		}
		
		protected бул DoEnumerateFamilies( бул толькоФиксШир, FontEncoding кодировка )
		{
			return DoEnumerateFamilies( толькоФиксШир, кодировка, false );
		}
		
		protected бул DoEnumerateFamilies( бул толькоФиксШир, FontEncoding кодировка, бул silent)
		{
			MyFontEnumerator fontEnumerator = new MyFontEnumerator();
			
			fontEnumerator.перечислиИменаФасов( кодировка, толькоФиксШир );
			
			if ( fontEnumerator.GotAny )
			{
				цел nFacenames = fontEnumerator.именаФасов.length;
				if ( !silent )
				{
					Log.LogStatus( "Found {0} {1}fonts", nFacenames, 
						толькоФиксШир ? "fixed ширь" : "" );
				}
				
				ткст facename;
				if ( silent) 
				{
					facename = fontEnumerator.именаФасов[0];
				}
				else
				{
					ткст[] facenames = new ткст[nFacenames];
					цел n;
					for ( n = 0; n < nFacenames; n++ )
						facenames[n] = fontEnumerator.именаФасов[n];
						
					facename = GetSingleChoice( "Choose a facename", "Шрифт demo", facenames );
					/*for ( цел i = 0; i < facenames.length; i ++ )
						if ( facenames[i].Equals( result ) )
							{
								n = i;
								break;
							}
					
					if ( n != -1 )
						facename = facename[n];*/
				}
				
				if ( !( facename.length == 0 ) )
				{
					Шрифт шрифт = new Шрифт( 12, СемействоШрифтов.wxDEFAULT, СтильШрифта.wxNORMAL, ВесШрифта.wxNORMAL, false, facename, кодировка );
					
					DoChangeFont( шрифт );
				}
				
				return да;
			}
			else if ( !silent )
			{
				Log.LogWarning( "No such fonts found." );
			}
			
			return false;
		}
		
		//---------------------------------------------------------------------
		
		protected проц DoResizeFont( цел diff )
		{
			Шрифт шрифт = m_canvas.TextFont;
			
			шрифт.РазмТочки = шрифт.РазмТочки + diff;
			DoChangeFont( шрифт );
		}
		
		//---------------------------------------------------------------------
		
		protected проц DoChangeFont( Шрифт шрифт )
		{
			DoChangeFont( шрифт, null );
		}
		
		protected проц DoChangeFont( Шрифт шрифт, Цвет col)
		{
			m_canvas.TextFont = шрифт;
			if ( col )
				if ( col.Ок() )
					m_canvas.цвет = col;
			m_canvas.Освежи();
			m_textctrl.шрифт = шрифт;
			if ( col )
				if ( col.Ок() )
					m_textctrl.цветПП = col;
		}
	}
	
	//---------------------------------------------------------------------
	
	public class MyFontEnumerator : ПеречислительШрифтов
	{
		private ткст[] m_facenames;
		
		//---------------------------------------------------------------------
		
		public this()
		{
			super() ;
		}
		
		//---------------------------------------------------------------------
			
		public бул GotAny()
		{
			return ( m_facenames.length > 0 );
		}
		
		//---------------------------------------------------------------------
		
		public ткст[] именаФасов()
		{
			return m_facenames;
		}
		 
		//---------------------------------------------------------------------
		
		public override бул приИмяФаса( ткст facename )
		{ 
			version (D_Version2)
			m_facenames ~= facename.idup;
			else
			m_facenames ~= facename.dup;
			return да;
		}
		
	}
	
	//---------------------------------------------------------------------
	
	public class MyEncodingEnumerator : ПеречислительШрифтов
	{
		private цел m_n;
		private ткст m_text;
		
		//---------------------------------------------------------------------	
		
		public this()
			
			{ super(); }
		//---------------------------------------------------------------------	
			
		public ткст Text()
		{
			return m_text;
		}
		
		//---------------------------------------------------------------------	
		 
		public override бул приКодировкаШрифта( ткст facename, 
			ткст кодировка )
		{
			ткст текст = "Кодировка " ~ .вТкст(++m_n) ~ ": " ~ кодировка ~ " (available in facename '" ~ facename ~ "')\n";
			
			m_text ~= текст;
			return да;
		}
	}
	
	//---------------------------------------------------------------------	

	public class FONT : Приложение
	{
		public override бул поИниц()
		{
			FontFrame рамка = new FontFrame( "Шрифт wxWidgets Приложение", Точка( 50, 50 ), Размер( 600,400 ) );
			рамка.показ( да );
			
			return да;
		}

	//---------------------------------------------------------------------
	
		
		static проц Main()
		{
			FONT app = new FONT();
			app.пуск();
		}
	}	


проц main()
{
	FONT.Main();
}
