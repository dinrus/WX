//-----------------------------------------------------------------------------
// wxD/Samples - HTML.cs
//
// A NET version of the wxWidgets "HTML" sample.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// Copyright (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $ид: HTML.d,v 1.9 2006/11/17 15:20:57 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;

    public class MyFrame : Рамка
    {
        enum Cmd { Open, OpenURL, About, Quit, Dialog, Back, Forward }


        HtmlWindow m_html;

        //---------------------------------------------------------------------

        public this(ткст титул, Точка поз, Размер Размер)
        {
            super(титул, поз, Размер);
            // Уст the окно пиктограмма

            this.пиктограмма = new Пиктограмма("./data/mondrian.png");

            // Уст up a меню

            Меню файлМеню = new Меню();
            файлМеню.Append(Cmd.Open, "Open...\tCtrl+O",
                            "Open a page");
            файлМеню.Append(Cmd.OpenURL, "Open URL...\tCtrl+U",
                            "Open a URL");
            файлМеню.добавьРазделитель();
            файлМеню.Append(Cmd.Quit, "E&xit\tAlt-X", 
                            "Quit this program");

            Меню goMenu = new Меню();
            goMenu.Append(Cmd.Back, "&Back\tCtrl+B", 
                          "Browse зад one page");
            goMenu.Append(Cmd.Forward, "&Forward\tCtrl+F", 
                          "Browse вперёд one page");

            Меню менюСправки = new Меню();
            менюСправки.Append(Cmd.About, "&About...\tF1", 
                            "показ about dialog");

            MenuBar menuBar = new MenuBar();
            menuBar.Append(файлМеню, "&File");
            menuBar.Append(goMenu,   "&Browse");
            menuBar.Append(менюСправки, "&Help");

            this.menuBar = menuBar;

            // Уст up a status bar

            CreateStatusBar(2);
            StatusText = "Welcome to wxWidgets!";

            // Создай the HTML окно

            m_html = new HtmlWindow(this);
            m_html.устОтносящРамку(this, "HTML : %s");
            m_html.относящСтатусбар = 1;
            m_html.загрузиСтраницу("./data/test.htm");

            // Уст up the event table

            собМеню(Cmd.Open,    &OnOpen);
            собМеню(Cmd.OpenURL, &OnOpenURL);
            собМеню(Cmd.Quit,    &OnQuit);
            собМеню(Cmd.Back,    &OnBack);
            собМеню(Cmd.Forward, &OnForward);
            собМеню(Cmd.About,   &OnAbout);
        }

        //---------------------------------------------------------------------

        public проц OnOpen(Объект отправитель, Событие e)
        {
            ткст page = FileSelector("Open HTML document", "", "", "", 
                                           "HTML Files (*.htm)|*.htm|" ~ 
                                           "All Files (*.*)|*.*");
            if (page != "") {
                m_html.загрузиСтраницу(page);
            }
        }

        public проц OnOpenURL(Объект отправитель, Событие e)
        {
            TextEntryDialog dlg = 
                new TextEntryDialog(this, "Enter URL to open", "Open URL", 
                                    "http://wxnet.sourceforge.net/news.html", 
                                    Dialog.wxOK | Dialog.wxCANCEL);
            if (dlg.ShowModal() == Dialog.wxID_OK) {
                m_html.загрузиСтраницу(dlg.Value);
            }
        }

        public проц OnQuit(Объект отправитель, Событие e)
        {
            Закрой();
        }

        //---------------------------------------------------------------------

        public проц OnAbout(Объект отправитель, Событие e)
        {
            HtmlAboutDialog dlg = new HtmlAboutDialog(this);
            dlg.ShowModal();
        }

        //---------------------------------------------------------------------

        public проц OnBack(Объект отправитель, Событие e)
        {
            if (!m_html.историяНазад()) {
                MessageDialog dlg = 
                    new MessageDialog(this, "Can't go зад any further", 
                                      "HTML", Dialog.wxOK | Dialog.wxCENTRE);
                dlg.ShowModal();
            }
        }

        public проц OnForward(Объект отправитель, Событие e)
        {
            if (!m_html.историяВперёд()) {
                MessageDialog dlg = 
                    new MessageDialog(this, "There is no вперёд", 
                                      "HTML", Dialog.wxOK | Dialog.wxCENTRE);
                dlg.ShowModal();
            }
        }

        //---------------------------------------------------------------------
    }

    public class HtmlAboutDialog : Dialog
    {
        //---------------------------------------------------------------------

        public this (Окно родитель)
        {
            super(родитель, -1, "About HTML");

            this.сайзер = new ПеремерщикБокса(Ориентация.wxVERTICAL);

            // Создай the about html окно

            HtmlWindow html = new HtmlWindow(this, -1, ДЕФПОЗ,
                                             Размер(380,160), 
                                             HtmlWindow.БЕЗ_СКРОЛЛБАРА);
            html.бордюры = 0;
            html.загрузиСтраницу("./data/about.htm");

            html.Размер = html.внутрПредставление.Размер;

            сайзер.Добавь(html, 1, Direction.wxALL, 5);

            // Создай the OK button

            сайзер.Добавь(new Кнопка(this, -1, "OK"), 0, 
                      Alignment.wxALIGN_CENTER | Direction.wxALL, 5);
            сайзер.Встрой(this);

            собКнопка(-1, &OnOK);
        }

        //---------------------------------------------------------------------

        public проц OnOK(Объект отправитель, Событие e)
        {
            EndModal(wxID_OK);
        }

        //---------------------------------------------------------------------
    }

    public class MyApp : Приложение
    {
        //---------------------------------------------------------------------

        public override бул поИниц()
        {
            MyFrame рамка = new MyFrame("HTML Sample", Точка(50,50), Размер(450,340));

            рамка.показ(да);

            return да;
        }

        //---------------------------------------------------------------------

        static проц Main()
        {
            MyApp app = new MyApp();
            app.пуск();
        }

        //---------------------------------------------------------------------
    }

проц main()
{
	MyApp.Main();
}
