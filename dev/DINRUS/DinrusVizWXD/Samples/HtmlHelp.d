//-----------------------------------------------------------------------------
// wxD/Samples - HtmlHelp.cs
//
// wxD "КонтроллерСправкиГЯР" sample.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $ид: HtmlHelp.d,v 1.9 2006/11/17 15:20:57 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;

	public class MyFrame : Рамка
	{
		public enum Cmd 
		{ 
			HtmlHelp_Quit,
			HtmlHelp_About,
			HtmlHelp_Help
		}
		
		private КонтроллерСправкиГЯР help;
		
		public this( Окно родитель, ткст титул, Точка поз, Размер Размер ) 
		{
			super( родитель, -1, титул, поз, Размер )
;
			Меню menuFile = new Меню();
			
			menuFile.AppendWL( Cmd.HtmlHelp_Help, "&Help", "Test Help...", & OnHelp ) ;
			menuFile.AppendWL( Cmd.HtmlHelp_About, "&About", "About the sample...", & OnAbout ) ;
			menuFile.AppendWL( Cmd.HtmlHelp_Quit, "E&xit\tAlt-X", "Quit this program", & OnQuit ) ;
			
			MenuBar menuBar = new MenuBar();
			menuBar.Append( menuFile, "&File" );
			
			this.menuBar = menuBar;
			
			help = new КонтроллерСправкиГЯР( КонтроллерСправкиГЯР.wxHF_DEFAULT_STYLE | КонтроллерСправкиГЯР.ОТКРЫТЬ_ФАЙЛЫ) ;
			
			help.используйКонфиг( Config.дай() );
			
			help.времПапка = "." ;
			
			бул ret = help.добавьКнигу( "./helpfiles/testing.hhp" );
			if ( !ret )
				MessageBox( "Failed adding book ./helpfiles/testing.hhp" );
				
			ret = help.добавьКнигу( "./helpfiles/another.hhp" );
			if ( !ret )
				MessageBox( "Failed adding book ./helpfiles/another.hhp" );
				
			this.Closing_Add(&OnClosing);
		}
		
		//---------------------------------------------------------------------
		
		public проц OnQuit( Объект отправитель, Событие e )
		{
			Закрой();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnHelp( Объект отправитель, Событие e )
		{
			help.Display( "Test HELPFILE" );
		}
		
		//---------------------------------------------------------------------
		
		public проц OnClosing( Объект отправитель, Событие e )
		{
			if ( help.рамка )
				help.рамка.Закрой();
			e.Skip();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnAbout( Объект отправитель, Событие e )
		{
			MessageBox( this, "КонтроллерСправкиГЯР class sample.\n" 
				"\n" 
				"Ported to wxD by BERO", "About КонтроллерСправкиГЯР", Dialog.wxOK | Dialog.wxICON_INFORMATION );
		}
	}
	
	//---------------------------------------------------------------------

	public class HtmlHelp : Приложение
	{
		public override бул поИниц()
		{
			MyFrame рамка = new MyFrame( null, "КонтроллерСправкиГЯР sample", Окно.ДЕФПОЗ, Окно.вхДефРазм );
			рамка.показ( да );

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			HtmlHelp app = new HtmlHelp();
			app.пуск();
		}
	}		



проц main()
{
	HtmlHelp.Main();
}
