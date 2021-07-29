//-----------------------------------------------------------------------------
// wxD/Samples - Sound.d
//
// A wxD version of the wxWidgets "sound" sample.
//
// Written by Vaclav Slavik
// (c) 2004 Vaclav Salvik
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $ид: Sound.d,v 1.5 2008/03/03 15:53:19 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;

import wx.Sound;

ткст WAV_FILE = "./data/doggrowl.wav";

	public class MyFrame : Рамка
	{
		// IDs for the controls and the меню commands
		enum
		{
			// меню элтs
			Sound_Quit = MenuIDs.wxID_EXIT,
			Sound_About = MenuIDs.wxID_ABOUT,
			Sound_PlaySync = MenuIDs.wxID_HIGHEST + 1,
			Sound_PlayAsync,
			Sound_PlayAsyncOnStack,
			Sound_PlayLoop,
			Sound_SelectFile
		}

		//---------------------------------------------------------------------

		public this(ткст титул)
		{
			super(титул);

		    m_sound = null;
    		m_soundFile = WAV_FILE;

			// Уст up a меню

			Меню менюСправки = new Меню();
			менюСправки.Append(Sound_About, "&About...\tF1", "показ about dialog");

			Меню файлМеню = new Меню();
			файлМеню.Append(Sound_SelectFile, "&Select WAV file\tCtrl+O", "Select a new wav file to play");
			файлМеню.Append(Sound_Quit, "E&xit\tAlt-X", "Quit this program");

			Меню playMenu = new Меню();
			playMenu.Append(Sound_PlaySync, "Play sound &synchronously\tCtrl+S");
			playMenu.Append(Sound_PlayAsync, "Play sound &asynchronously\tCtrl+A");
			playMenu.Append(Sound_PlayLoop, "&Loop sound\tCtrl+L");

			// now append the freshly created меню to the меню bar...
			MenuBar menuBar = new MenuBar();
			menuBar.Append(файлМеню, "&File");
			menuBar.Append(playMenu, "&Play");
			menuBar.Append(менюСправки, "&Help");

			// ... and attach this меню bar to the рамка
			this.menuBar = menuBar;
			// Уст up the event table

			собМеню(Sound_SelectFile,	&OnSelectFile);
			собМеню(Sound_Quit,    	&OnQuit);
			собМеню(Sound_About,   	&OnAbout);
			собМеню(Sound_PlaySync,    &OnPlaySync);
			собМеню(Sound_PlayAsync,   &OnPlayAsync);
			собМеню(Sound_PlayLoop,    &OnPlayLoop);

			m_tc = new TextCtrl(this, wxID_ANY, "",
								  ДЕФПОЗ, вхДефРазм,
								  TextCtrl.МНОГОСТРОК|TextCtrl.ТОЛЬКО_ЧТЕНИЕ);
			NotifyUsingFile(m_soundFile);
		}

		private:
			Sound     m_sound;
			ткст    m_soundFile;
			TextCtrl  m_tc;

		//---------------------------------------------------------------------

		проц NotifyUsingFile(ткст имя)
		{
			ткст msg;
			msg = "Using sound file: " ~ имя ~ "\n";
			m_tc.AppendText(msg);
		}

		//---------------------------------------------------------------------

		public проц OnSelectFile(Объект отправитель, Событие e)
		{
			FileDialog dlg = new FileDialog (this, "Choose a sound file",
							 "", "", "WAV files (*.wav)|*.wav", FileDialog.ОТКРЫТЬ|FileDialog.СМЕНИТЬ_ПАПКУ);
			if ( dlg.ShowModal() == wxID_OK )
			{
				m_soundFile = dlg.Path;
				if (m_sound) delete m_sound;
				m_sound = null;
				NotifyUsingFile(m_soundFile);
			}
		}

		//---------------------------------------------------------------------

		public проц OnQuit(Объект отправитель, Событие e)
		{
			// да is to сила the рамка to close
			Закрой(да);
		}

		//---------------------------------------------------------------------

		public проц OnPlaySync(Объект отправитель, Событие e)
		{
			BusyCursor busy = new BusyCursor;
			if (!m_sound)
				m_sound = new Sound(m_soundFile);
			if (m_sound.Ок())
				m_sound.Play(wxSOUND_SYNC);
			delete busy;
		}

		//---------------------------------------------------------------------

		public проц OnPlayAsync(Объект отправитель, Событие e)
		{
			BusyCursor busy = new BusyCursor;
			if (!m_sound)
				m_sound = new Sound(m_soundFile);
			if (m_sound.Ок())
				m_sound.Play(wxSOUND_ASYNC);
			delete busy;
		}

		//---------------------------------------------------------------------

		public проц OnPlayLoop(Объект отправитель, Событие e)
		{
			BusyCursor busy = new BusyCursor;
			if (!m_sound)
				m_sound = new Sound(m_soundFile);
			if (m_sound.Ок())
				m_sound.Play(wxSOUND_ASYNC | wxSOUND_LOOP);
			delete busy;
		}

		//---------------------------------------------------------------------

		public проц OnAbout(Объект отправитель, Событие e)
		{
			ткст msg = "This is the About dialog of the sound sample.\nWelcome to " ~ визВерсияТкст;
			MessageBox(this, msg, "About", Dialog.wxOK | Dialog.wxICON_INFORMATION);
		}

		//---------------------------------------------------------------------
	}



	public class MyApp : Приложение
	{
		//---------------------------------------------------------------------

		public override бул поИниц()
		{
			// create the main application окно
			MyFrame рамка = new MyFrame("wxWidgets Sound Sample");

			// and покажи it (the frames, unlike simple controls, are not shown when
			// created initially)
			рамка.показ(да);

			// success
    		return да;
		}

		//---------------------------------------------------------------------
	}

цел main()
{
	MyApp app = new MyApp();
	app.пуск();
	return 0;
}
