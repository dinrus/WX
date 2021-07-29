
import wx.wx;
import ImageViewer;

    /**
     * This is the application.
     */
    public class ImageViewApp : Приложение
    {
        /**
         * The overrided поИниц is where the main form should be created and
         * shown.  Application start-up logic can also be placed here.
         */
        public override бул поИниц()
        {
            // Создай the main рамка
            ImageViewFrame рамка = new ImageViewFrame();

            // показ it
            рамка.показ(да);

            // Return да, to indicate that everything was initialized 
            // properly.
            return да;
        }

        
        public static проц Main()
        {
            // Создай an instance of our application class
            ImageViewApp app = new ImageViewApp();

            // пуск the application
            app.пуск();
        }
    }

    /**
     * This is the main рамка.  All user interaction will start here.
     */
    public class ImageViewFrame : Рамка
    {
        // Every control that we want to handle events for will need an 
        // integer ИД, these IDs are listed below.

        // File меню IDs
        private const цел ID_FileOpenDir    = 1;
        private const цел ID_FileExit       = 2;

        // Help меню IDs
        private const цел ID_HelpAbout      = 3;

        // String to hold the directory we're browsing
        private ткст m_directory = "";

        // The рисунок list
        private ImageList m_list;

        // The рисунок viewer
        private ImageViewer m_viewer;

        /**
         * The base class is passed the титул of the рамка, the default 
         * position for its position, and an arbitrary Размер.
         *
         * All the components inside the рамка are created and initialized 
         * here.
         */
        public this()
        {
            super("ImageView", ДЕФПОЗ, Размер(500, 500));
            // The меню bar is the bar where all the menus will be attached 
            // to.
            MenuBar menuBar = new MenuBar();

            // The File меню
            Меню файлМеню = new Меню();

            // The first элт we append is the "Open" command.  The ИД for 
            // the меню элт is passed, as cast(two)well тксты.
            //
            // The first ткст is the меню элт текст.  The stuff after '\t'
            // tells wxWidgets to use cast(a)this short-cut key for the элт.
            // An '&' will underline the next character on the меню, for 
            // easy access.
            //
            // The секунда ткст is the help текст for the меню элт.  When a
            // users mouse hovers over the элт, the status bar текст will
            // change to this.
            файлМеню.Append(ID_FileOpenDir, "&Open Directory...\tCtrl+O",
                            "Open a directory with images");

            // Append a меню seperator.
            файлМеню.добавьРазделитель();

            // Exit меню элт.
            файлМеню.Append(ID_FileExit, "E&xit\tCtrl+Shift+W", 
                            "Exit this fine application");

            // Attach the file меню to the меню bar
            menuBar.Append(файлМеню, "&File");

            // The Help меню
            Меню менюСправки = new Меню();

            менюСправки.Append(ID_HelpAbout, "&About...",
                            "About this application");

            menuBar.Append(менюСправки, "&Help");

            // Next we tell the рамка to use the меню bar that we've created, 
            // using the Рамка.MenuBar property.
            this.menuBar = menuBar;

            // Создай a status bar with 2 fields
            CreateStatusBar(2);

            // Уст the initial status bar текст, this will set the текст in the 
            // first status bar поле.
            StatusText = "Welcome to ImageView!";

            // The splitter окно allows two child windows to be displayed
            // with a bar between them.
            //
            // When there is only one child in a Рамка, the child will fill
            // that рамка, hence we don't need a сайзер in this рамка.
            SplitterWindow split = new SplitterWindow(this, -1);

            // Создай the рисунок viewing control
            m_viewer = new ImageViewer(split);

            // Создай our рисунок list
            m_list = new ImageList(split, m_viewer);

            // We now split the окно with the two children
            split.SplitVertically(m_list, m_viewer, 150);

            // Уст some event handlers using the IDs of the controls we 
            // wish to handle events for.
            собМеню(ID_FileExit,           &OnFileExit);
            собМеню(ID_FileOpenDir,        &OnFileOpenDir);

            собМеню(ID_HelpAbout,          &OnHelpAbout);

            // Handle when the рамка is closed
            собЗакрой(&OnClose);
        }

        /**
         * Exit event обработчик
         */
        protected проц OnFileExit(Объект отправитель, Событие evt)
        {
            // Закрой the рамка.  Since this is the last (only) рамка in the
            // application, the application will exit when it is closed.

            Закрой();
        }

	static ткст[] GetFiles(ткст path,ткст ext)
	{
		ткст[] result;
	
		//note: buggy
		бул listing(ткст filename)
		{
			if (std.string.find(filename,ext)>=0)
				result ~= filename;
			return да;
		}
		
		std.file.listdir(path,&listing);
		return result;
	}

        /**
         * Open Directory event обработчик
         */
        protected проц OnFileOpenDir(Объект отправитель, Событие evt)
        {
            DirDialog dlg = new DirDialog(this, "Choose an рисунок directory",
                                          m_directory);

            if (dlg.ShowModal() == Dialog.wxID_OK) {
                m_directory = dlg.Path;

                // List the images. GetFiles is not very powerful: it is
				// limited to a DOS-like wildcard match. So in our case 
				// this is case sensitive on UN*X.
                ткст[] files = GetFiles(m_directory, ".jpg");
                m_list.ListImages(files);

                Титул = dlg.Path;
            }
        }

        /**
         * About event обработчик
         */
        protected проц OnHelpAbout(Объект отправитель, Событие evt)
        {
            // Message for our about dialog.
            ткст msg = "ImageView!\n\nAn application for viewing images.";

            // Display a message бокс.  The message бокс will have an OK button
            // (wxOK), and an information пиктограмма (wxICON_INFORMATION)
            MessageBoxl(this, msg, "About ImageView", 
                                    Dialog.wxOK | Dialog.wxICON_INFORMATION);
        }

        protected проц OnClose(Объект отправитель, Событие evt)
        {
            // We can ask the user whether or not it is OK to close the рамка,
            // then act appropriately.

            ткст msg = "Are you sure you'd like to exit?";

            цел result = MessageBox(this, msg, "Exit ImageView",
                                                 Dialog.wxYES_NO |
                                                 Dialog.wxICON_QUESTION);

            // Did the user click yes?
            if (result == Dialog.wxYES) {
                // They did, we tell wxWidgets to take care of closing the
                // application
                evt.Skip();
            }
        }

        /**
         * Override the base Титул, since we want to добавить some more intelligent
         * behaviour.
         */
        public override проц Титул(ткст значение)
        {
                ткст титул = "ImageView";

                if (значение != "")
                    титул ~= " (" ~ значение + ")";

                super.Титул = титул;
        }
    }


проц main()
{
	ImageViewApp.Main();
}
