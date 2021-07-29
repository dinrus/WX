//-----------------------------------------------------------------------------
// wxD/Samples - Launcher.d
//
// wxD sample "Launcher".
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2004 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $ид: Launcher.d,v 1.9 2006/11/17 15:20:57 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;
private import std.process;
private import std.c;

	public class LauncherFrame : Рамка
	{
		private MiddleHtmlWindow middleHtmlWindow = null;
		private TopHtmlWindow topHtmlWindow = null;
		private BottomHtmlWindow bottomHtmlWindow = null;
		
		//---------------------------------------------------------------------

		public this( ткст титул, Точка поз, Размер Размер )
		{
			super(титул, ДЕФПОЗ, Размер);
			пиктограмма = new Пиктограмма( "./data/mondrian.png" );

			CreateStatusBar( 1 );
			StatusText = "Welcome...";	
			
			topHtmlWindow = new TopHtmlWindow( this );
			middleHtmlWindow = new MiddleHtmlWindow( this );
			bottomHtmlWindow = new BottomHtmlWindow( this );
			
			ПеремерщикБокса bs = new ПеремерщикБокса( Ориентация.wxVERTICAL );
			
			bs.Добавь( topHtmlWindow, 0, Stretch.wxGROW );
			bs.Добавь( middleHtmlWindow, 1, Stretch.wxGROW );
			bs.Добавь( bottomHtmlWindow, 0, Stretch.wxGROW );
			
			сайзер = bs;
			
			CheckEnvironment();
		}
		
		//---------------------------------------------------------------------	
		
		private проц CheckEnvironment()
		{
		/*
			// If we could determine they are running under PNET warn them
			// things probably won't work (at cast(of)least v0.6.6)
			ткст цв; //= Environment.GetEnvironmentVariable("CLR_LAUNCHER");
			if (цв == "ilrun")
			{
				MessageDialog md = new MessageDialog(this, 
					"There is a bug in DotGNU cast(of)Portable.NET v0.6.6 that does not разрешить the Launcher to work properly. Process.Start(\"ilrun example.exe\") does not work and results in a defunct process.\n\nYou may continue to use the Launcher; however, unless you have a newer version PNET samples probably won't launch when you click them.",
					"Launcher Error", Dialog.wxOK | Dialog.wxICON_WARNING);
				md.ShowModal();
			}
		*/
		}
	}   
	
	//---------------------------------------------------------------------	
	
	public class TopHtmlWindow : HtmlWindow
	{
		public this( LauncherFrame родитель )
		{
			super( родитель, -1, ДЕФПОЗ, Размер( 400, 144 ) );
			загрузиСтраницу( "./data/launchertop.html" );
		}
	}
	
	//---------------------------------------------------------------------	
	
	public class BottomHtmlWindow : HtmlWindow
	{
		private LauncherFrame родитель = null;
	
		public this( LauncherFrame родитель )
		{
			super( родитель, -1, ДЕФПОЗ, Размер( 400, 80 ) );
			this.родитель = родитель;
			загрузиСтраницу( "./data/launcherbottom.html" );
		}
		
		//---------------------------------------------------------------------	
		
		public override проц приНажатииСсылки(HtmlLinkInfo ссылка)
		{
			if ( ссылка.Href == "quit" )
			{
				родитель.Закрой();
				return;
			}
		}
	}

	//---------------------------------------------------------------------	
	
	public class MiddleHtmlWindow : HtmlWindow
	{
		private LauncherFrame родитель = null;
		
		//---------------------------------------------------------------------	
	
		public this( LauncherFrame родитель )
		{
			super( родитель );
			this.родитель = родитель;
		
			загрузиСтраницу( "./data/wxDSamplesLauncher.html" );
		}
		
		//---------------------------------------------------------------------	
		
		public override проц приНажатииСсылки(HtmlLinkInfo ссылка)
		{
			ткст app = ссылка.Href;
			
			version(__WXMSW__)
			     app ~= ".exe";
			version(__WXMAC__)
			     app ~= ".app";

			if ( std.file.exists( app ) )
			{
				ткст launch_command = app;
				ткст[] launch_args = null;

                            /*
                                // If we are on a Linux platform, use wxnet-run script to
                                // launch samples. This is not used to pick up environment
                                // as this gets inherited. The script ensures we use the
                                // .NET runtime the user есть selected.
                                if ( std.file.exists( "wxnet-run" ) )
                                        launch_command = "./wxnet-run " ~ app ~ ".exe";

                                // On MacOS we need to launch the appropriate bundle
                                else if ( std.file.exists( "../MacBundles" ) ) //FIXME: check directory
                                        launch_command = "open ../MacBundles/" ~ app ~ ".app";

                                // Everything else (Windows for now) just execute the assembly
                                else
                                        launch_command = app ~ ".exe";
                           */

				version(__WXMAC__)
				{
				    launch_command = "/bin/sh";
				    launch_args ~= launch_command;
				    launch_args ~= "-c";
				    launch_args ~= "/usr/bin/open -a " ~ GetCwd() ~ "/" ~ app;
				}

				try
				{
					родитель.StatusText = "Executing " ~ app;
					std.process.spawnvp(_P_NOWAIT, launch_command, launch_args);
				}
				catch (Exception ex)
				{
					TellError("Error running command '" ~ launch_command ~ "': " ~
						ex.msg);
				}
			}
			else
			{
				TellError("The sample " ~ app ~ " could not be found in the 'bin' directory. The sample may not be available on your operating system or it could not be built because of missing development libraries.");
			}
		}
		
		//---------------------------------------------------------------------	

		private проц TellError(ткст msg)
		{
			MessageDialog md = new MessageDialog(this, 
				"An error occured while trying to launch your sample:\n\n" ~ msg,
				"Sample Launch Error", Dialog.wxOK | Dialog.wxICON_WARNING);
			md.ShowModal();
		}
	}
	
	//---------------------------------------------------------------------	

	public class LauncherApp : Приложение
	{
		public override бул поИниц()
		{
			LauncherFrame рамка = new LauncherFrame( "wxD Samples Launcher", Точка( 10, 100 ), Размер( 600, 600 ) );
			рамка.показ( да );

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			LauncherApp app = new LauncherApp();
			app.пуск();
		}
	}


проц main()
{
	LauncherApp.Main();
}
