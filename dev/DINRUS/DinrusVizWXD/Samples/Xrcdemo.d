//-----------------------------------------------------------------------------
// wxD/Samples - Xrcdemo.d
//
// wxD "Xrcdemo" sample.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2004 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $ид: Xrcdemo.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;

	public class XrcFrame : Рамка
	{
		public this()
			{ this( null ); }
			
		public this( Окно родитель )			
		{
			XmlResource.дай().LoadFrame( this, родитель, "main_frame" );
			
			пиктограмма = new Пиктограмма( "./data/rc/appicon.ico" );
			
			menuBar = XmlResource.дай().LoadMenuBar( "main_menu" );
			
			toolBar = XmlResource.дай().LoadToolBar( this, "main_toolbar" );
			
			CreateStatusBar( 1 );
			
			собМеню( XmlResource.XRCID( "exit_tool_or_menuэлт" ), & OnExitToolOrMenuКоманда ) ;
			собМеню( XmlResource.XRCID( "non_derived_dialog_tool_or_menuэлт" ), & OnNonDerivedDialogToolOrMenuКоманда ) ;
			собМеню( XmlResource.XRCID( "derived_tool_or_menuэлт" ), & OnDerivedDialogToolOrMenuКоманда ) ;
			собМеню( XmlResource.XRCID( "controls_tool_or_menuэлт" ), & OnControlsToolOrMenuКоманда ) ;
			собМеню( XmlResource.XRCID( "uncentered_tool_or_menuэлт" ), & OnUncenteredToolOrMenuКоманда ) ;
			собМеню( XmlResource.XRCID( "custom_class_tool_or_menuэлт" ), & OnCustomClassToolOrMenuКоманда ) ;
			собМеню( XmlResource.XRCID( "platform_property_tool_or_menuэлт" ), & OnPlatformPropertyToolOrMenuКоманда ) ;
			собМеню( XmlResource.XRCID( "art_provider_tool_or_menuэлт" ), & OnArtProviderToolOrMenuКоманда ) ;
			собМеню( XmlResource.XRCID( "variable_expansion_tool_or_menuэлт" ), & OnVariableExpansionToolOrMenuКоманда ) ;
			собМеню( XmlResource.XRCID( "wxglade_dialog_menuэлт" ), & OnWxGladeMenu ) ;
			собМеню( XmlResource.XRCID( "about_tool_or_menuэлт" ), & OnAboutToolOrMenuКоманда ) ;
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnExitToolOrMenuКоманда( Объект отправитель, Событие e )
		{
			Закрой(да);
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnNonDerivedDialogToolOrMenuКоманда( Объект отправитель, Событие e )
		{
			Dialog dlg = XmlResource.дай().LoadDialog(this, "non_derived_dialog" ); 
			
			dlg.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnDerivedDialogToolOrMenuКоманда( Объект отправитель, Событие e )
		{
			PreferencesDialog preferencesDialog = new PreferencesDialog( this );
			
			preferencesDialog.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnWxGladeMenu( Объект отправитель, Событие e )
		{
		
			/*Dialog dlg = XmlResource.дай().LoadDialog(this, "wxglade_dialog" ); 
			
			dlg.ShowModal();*/
			
			wxGladeDialog wxgladeDialog = new wxGladeDialog( this );
			
			wxgladeDialog.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnControlsToolOrMenuКоманда( Объект отправитель, Событие e )
		{
			Dialog dlg = XmlResource.дай().LoadDialog(this, "controls_dialog" );
			
			//ListCtrl lc = (ListCtrl)dlg.НайдиОкно( XmlResource.XRCID( "controls_listctrl" ), typeof( ListCtrl) );
			
			ListCtrl lc = cast(ListCtrl)XmlResource.XRCCTRL( dlg, "controls_listctrl", &ListCtrl.Нов );
			
			lc.InsertColumn( 0, "Имя", ListCtrl.wxLIST_FORMAT_LEFT, 200);
			lc.InsertItem( 0, "Todd Hope" );
			lc.InsertItem( 1, "Kim Wynd" );
			lc.InsertItem( 2, "Leon Li" );
			
			TreeCtrl treectrl = cast(TreeCtrl)XmlResource.XRCCTRL(  dlg, "controls_treectrl", &TreeCtrl.Нов );
			
			treectrl.добавьКорень( "Godfather" );
			
			treectrl.приставьЭлт( treectrl.корневойЭлт, "Evil henchman 1" );
			treectrl.приставьЭлт( treectrl.корневойЭлт, "Evil henchman 2" );
			treectrl.приставьЭлт( treectrl.корневойЭлт, "Evil accountant" );
			
			dlg.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnUncenteredToolOrMenuКоманда( Объект отправитель, Событие e )
		{
			Dialog dlg = XmlResource.дай().LoadDialog( this, "uncentered_dialog" );
			dlg.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnCustomClassToolOrMenuКоманда( Объект отправитель, Событие e )
		{
			Dialog dlg = XmlResource.дай().LoadDialog( this, "custom_class_dialog" );
			
			MyResizableListCtrl a_myResizableListCtrl = new MyResizableListCtrl( dlg,
									-1,
									ДЕФПОЗ,
									вхДефРазм,
									ListCtrl.wxLC_REPORT,
									null );
									
			XmlResource.дай().AttachUnknownControl( "custom_control_placeholder", a_myResizableListCtrl );
			
			dlg.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnPlatformPropertyToolOrMenuКоманда( Объект отправитель, Событие e )
		{
			Dialog dlg = XmlResource.дай().LoadDialog( this, "platform_property_dialog" );
			dlg.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnArtProviderToolOrMenuКоманда( Объект отправитель, Событие e )
		{
			Dialog dlg = XmlResource.дай().LoadDialog( this, "art_provider_dialog" );
			dlg.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnVariableExpansionToolOrMenuКоманда( Объект отправитель, Событие e )
		{
			Dialog dlg = XmlResource.дай().LoadDialog( this, "variable_expansion_dialog" );
			dlg.ShowModal();
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnAboutToolOrMenuКоманда( Объект отправитель, Событие e )
		{
			ткст msg = "This is the about dialog of XML resources demo.\n" 
					"Ported to D by BERO";
			MessageBox( this, msg, "About XML resources demo", Dialog.wxOK | Dialog.wxICON_INFORMATION );
		}
	}   
	
	//---------------------------------------------------------------------	
	
	public class PreferencesDialog : Dialog
	{
		public this( Окно родитель )
		{
			XmlResource.дай().LoadDialog( this, родитель, "derived_dialog" );
		
			собКнопка( XmlResource.XRCID( "my_button" ), & OnMyButtonClicked ) ;
			собОбновиИП( XmlResource.XRCID( "my_checkbox" ), & OuUpdateUIMyCheckbox ) ;
			собКнопка( wxID_OK, & OnOK ) ;
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnMyButtonClicked( Объект отправитель, Событие e )
		{
			MessageBox( this, "You cliecked on My Кнопка", "", Dialog.wxOK  | Dialog.wxICON_INFORMATION );
		}
		
		//---------------------------------------------------------------------	
		
		public проц OuUpdateUIMyCheckbox( Объект отправитель, Событие e )
		{
			 бул myCheckBoxIsChecked = ( cast(CheckBox)XmlResource.XRCCTRL(  this, "my_checkbox", &CheckBox.Нов ) ).IsChecked;
			 
			 ( cast(TextCtrl)XmlResource.XRCCTRL( this, "my_textctrl", &TextCtrl.Нов ) ).Включи( myCheckBoxIsChecked );
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnOK( Объект отправитель, Событие e )
		{
			MessageDialog md = new MessageDialog( this, "Press OK to close Derived dialog, or Cancel to abort",
					"Overriding base class OK button обработчик", Dialog.wxOK | Dialog.wxCANCEL | Dialog.wxCENTER );
					
			if ( md.ShowModal() == wxID_OK )
			{
				EndModal( wxID_OK );
			}
		}
	}
	
	//---------------------------------------------------------------------	
	
	public class MyResizableListCtrl : ListCtrl
	{
		enum COL { RECORD_COLUMN = 0, ACTION_COLUMN, PRIORITY_COLUMN }
		
		enum Cmd { PU_ADD_RECORD, PU_EDIT_RECORD, PU_DELETE_RECORD }
		
		//---------------------------------------------------------------------	
	
		public this( Окно родитель, цел ид, Точка поз, Размер Размер, long стиль, Оценщик оценщик)
		{
			super( родитель, ид, поз, Размер, стиль, оценщик, "myResizableListCtrl" );
			InsertColumn( COL.RECORD_COLUMN, "Record", ListCtrl.wxLIST_FORMAT_LEFT, 140 );
			InsertColumn( COL.ACTION_COLUMN, "Action", ListCtrl.wxLIST_FORMAT_LEFT, 70 );
			InsertColumn( COL.PRIORITY_COLUMN, "Priority", ListCtrl.wxLIST_FORMAT_LEFT, 70 );
			
			собПраваяВнизу( & ContextSensitiveMenu ) ;
			собРазмер( & приПеремере ) ;
		}
		
		//---------------------------------------------------------------------	
		
		public проц ContextSensitiveMenu( Объект отправитель, Событие e )
		{
			MouseEvent me = cast(MouseEvent) e;
		
			Меню a_menu = new Меню();
			
			a_menu.Append( Cmd.PU_ADD_RECORD, "Добавь a new record" );
			a_menu.Append( Cmd.PU_EDIT_RECORD, "Edit selected record..." );
			a_menu.Append( Cmd.PU_DELETE_RECORD, "Delete selected record" );
			
			if ( SelectedItemCount == 0 )
			{
				a_menu.Включи( Cmd.PU_EDIT_RECORD, false );
				a_menu.Включи( Cmd.PU_DELETE_RECORD, false );
			}
			
			ВсплывающееМеню( a_menu, me.Позиция );
		}
		
		//---------------------------------------------------------------------	
		
		protected проц приПеремере( Объект отправитель, Событие e )
		{
			УстColumnWidths();
			e.Skip();
		}
		
		//---------------------------------------------------------------------	
		
		public проц УстColumnWidths()
		{
			//цел leftmostColumnWidth = Размер.Ширь;
			цел leftmostColumnWidth = Ширь;
			
			leftmostColumnWidth -= GetColumnWidth( COL.ACTION_COLUMN );
			leftmostColumnWidth -= GetColumnWidth( COL.PRIORITY_COLUMN );
			leftmostColumnWidth -= SystemУстtings.GetMetric( SystemMetric.wxSYS_VSCROLL_X );
			leftmostColumnWidth -= 5;
			
			УстColumnWidth( COL.RECORD_COLUMN, leftmostColumnWidth );
		}
	}
	
	//---------------------------------------------------------------------	
	
	public class wxGladeDialog : Dialog
	{
		public this( Окно родитель )
		{
			XmlResource.дай().LoadDialog( this, родитель, "wxglade_dialog" );
		
			собКнопка( wxID_OK, & OnOK ) ;
		}
		
		//---------------------------------------------------------------------	
		
		public проц OnOK( Объект отправитель, Событие e)
		{
			Закрой();
		}
	}
	
	//---------------------------------------------------------------------	

	public class Xrcdemo : Приложение
	{
		//---------------------------------------------------------------------

		public override бул поИниц()
		{
			Рисунок.InitAllHandlers();
			
			XmlResource.дай().InitAllHandlers();
			
			XmlResource.дай().Load( "./data/rc/меню.xrc" );
			
			XmlResource.дай().Load( "./data/rc/toolbar.xrc" );
			
			XmlResource.дай().Load( "./data/rc/basicdlg.xrc" );
			
			XmlResource.дай().Load( "./data/rc/derivdlg.xrc" );
			
			XmlResource.дай().Load( "./data/rc/controls.xrc" );
			
			XmlResource.дай().Load( "./data/rc/рамка.xrc" );
			
			XmlResource.дай().Load( "./data/rc/uncenter.xrc" );    
			
			XmlResource.дай().Load( "./data/rc/custclas.xrc" );
			
			XmlResource.дай().Load( "./data/rc/artprov.xrc" );
			
			XmlResource.дай().Load( "./data/rc/platform.xrc" );
			
			XmlResource.дай().Load( "./data/rc/variable.xrc" );
			
			XmlResource.дай().Load( "./data/rc/wxglade.xrc" );
			
			XrcFrame рамка = new XrcFrame();
			рамка.показ(да);

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			Xrcdemo app = new Xrcdemo();			
			app.пуск();
		}

		//---------------------------------------------------------------------
	}

проц main()
{
	Xrcdemo.Main();
}
