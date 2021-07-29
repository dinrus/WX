
///////////////////////////////////////////////////////////////////////////////
// Имя:    wxauitest.cpp
// Purpose:   wxaui: wx advanced user interface - sample/test program
// Author:    Benjamin I. Williams
// Modified by: David Gileadi: converted to D код
// Created:   2005-10-03
// RCS-ИД:
// Copyright:   (C) Copyright 2005, Kirix Corporation, All Rights Reserved.
// Licence:   wxWindows Library Licence, Version 3.1
///////////////////////////////////////////////////////////////////////////////

import wx.wx;
import wx.Defs;
import wx.Grid;
import wx.TreeCtrl;
import wx.SpinCtrl;
import wx.ArtProvider;
import wx.Clipboard;
import wx.Image;
import wx.ColourDialog;
import wx.HTML;
import wx.Window;
import wx.aui.aui;
import stdrus;


// -- application --

class MyApp : Приложение
{
  public бул поИниц()
  {
    Рамка рамка = new MyFrame(null,
                   ЛЮБОЙ,
                   "Тестовое Приложение wxAUI 0.9.2",
                   Окно.ДЕФПОЗ,
                   Размер(800, 600));
    //УстTopWindow(рамка);
    рамка.показ();

    return да;
  }

  static проц Main()
  {
    MyApp app = new MyApp();
    app.пуск();
  }
}

цел main()
{
  MyApp.Main();
  return 0;
}


// -- рамка --

class MyFrame : public Рамка
{
  enum
  {
    ID_CreateTree = MenuIDs.wxID_HIGHEST+1,
    ID_CreateGrid,
    ID_CreateText,
    ID_CreateHTML,
    ID_CreateSizeReport,
    ID_GridContent,
    ID_TextContent,
    ID_TreeContent,
    ID_HTMLContent,
    ID_SizeReportContent,
    ID_CreatePerspective,
    ID_CopyPerspectiveCode,
    ID_AllowFloating,
    ID_AllowActivePane,
    ID_TransparentHint,
    ID_TransparentHintFade,
    ID_TransparentDrag,
    ID_NoGradient,
    ID_VerticalGradient,
    ID_HorizontalGradient,
    ID_Settings,
    ID_About,
    ID_FirstPerspective = ID_CreatePerspective+1000
  };

public:
  this(wxWindow родитель,
      цел ид,
      ткст титул,
      Точка поз = Окно.ДЕФПОЗ,
      Размер размер = вхДефРазм,
      long стиль = wxDEFAULT_FRAME_STYLE | УТОПЛЕННЫЙ_БОРДЮР)
  {
    super(родитель, ид, титул, поз, размер, стиль);

    m_mgr = new FrameManager();

    // tell wxFrameManager to manage this рамка
    m_mgr.УстFrame(this);

    // set рамка пиктограмма
    пиктограмма = new Пиктограмма("./data/mondrian.png");

    // create меню
    MenuBar mb = new MenuBar;

    Меню file_menu = new Меню;
    file_menu.добавь(MenuIDs.wxID_EXIT, "Exit");

    Меню view_menu = new Меню;
    view_menu.добавь(ID_CreateText, "Создать Текст Ктрл");
    view_menu.добавь(ID_CreateHTML, "Создать ГЯР Ктрл");
    view_menu.добавь(ID_CreateTree, "Создать Дерево");
    view_menu.добавь(ID_CreateGrid, "Создать Сетку");
    view_menu.добавь(ID_CreateSizeReport, "Создай Размер Reporter");
    view_menu.добавьРазделитель();
    view_menu.добавь(ID_GridContent, "Use a Grid for the Content Pane");
    view_menu.добавь(ID_TextContent, "Use a Text Control for the Content Pane");
    view_menu.добавь(ID_HTMLContent, "Use an HTML Control for the Content Pane");
    view_menu.добавь(ID_TreeContent, "Use a Tree Control for the Content Pane");
    view_menu.добавь(ID_SizeReportContent, "Use a Размер Reporter for the Content Pane");

    Меню опции_меню = new Меню;
    опции_меню.добавьЧекЭлт(ID_AllowFloating, "Allow Floating");
    опции_меню.добавьЧекЭлт(ID_TransparentHint, "Transparent Hint");
    опции_меню.добавьЧекЭлт(ID_TransparentHintFade, "Transparent Hint Fade-in");
    опции_меню.добавьЧекЭлт(ID_TransparentDrag, "Transparent ПТяг");
    опции_меню.добавьЧекЭлт(ID_AllowActivePane, "Allow Активен Pane");
    опции_меню.добавьРазделитель();
    опции_меню.добавьРадиоЭлт(ID_NoGradient, "No Caption Gradient");
    опции_меню.добавьРадиоЭлт(ID_VerticalGradient, "Vertical Caption Gradient");
    опции_меню.добавьРадиоЭлт(ID_HorizontalGradient, "Horizontal Caption Gradient");
    опции_меню.добавьРазделитель();
    опции_меню.добавь(ID_Settings, "Устtings Pane");

    m_perspectives_menu = new Меню;
    m_perspectives_menu.добавь(ID_CreatePerspective, "Создать Перспективу");
    m_perspectives_menu.добавь(ID_CopyPerspectiveCode, "Copy Perspective Data To Clipboard");
    m_perspectives_menu.добавьРазделитель();
    m_perspectives_menu.добавь(ID_FirstPerspective+0, "Default Startup");
    m_perspectives_menu.добавь(ID_FirstPerspective+1, "Все Пано");

    Меню help_menu = new Меню;
    help_menu.добавь(ID_About, "About...");

    mb.добавь(file_menu, "Файл");
    mb.добавь(view_menu, "Вид");
    mb.добавь(m_perspectives_menu, "Перспективы");
    mb.добавь(опции_меню, "Опции");
    mb.добавь(help_menu, "Справка");

    menuBar = mb;

    CreateStatusBar();
    statusBar.StatusText = "Ready";


    // min Размер for the рамка itself isn't completely done.
    // see the end up wxFrameManager::Обнови() for the test
    // код. For now, just hard код a рамка minimum Размер
    УстРазмПодсказ(400,300);

    // create some toolbars
    ToolBar tb1 = new ToolBar(this, -1, Окно.ДЕФПОЗ, вхДефРазм,
                     ToolBar.wxTB_FLAT | ToolBar.wxTB_NODIVIDER);
    tb1.ToolBitmapSize = Размер(48,48);
    tb1.AddTool(101, "Test", АртПровайдер.ДайБитмап(ПАртИД.wxART_ERROR));
    tb1.AddSeparator();
    tb1.AddTool(102, "Test", АртПровайдер.ДайБитмап(ПАртИД.wxART_QUESTION));
    tb1.AddTool(103, "Test", АртПровайдер.ДайБитмап(ПАртИД.wxART_INFORMATION));
    tb1.AddTool(103, "Test", АртПровайдер.ДайБитмап(ПАртИД.wxART_WARNING));
    tb1.AddTool(103, "Test", АртПровайдер.ДайБитмап(ПАртИД.wxART_MISSING_IMAGE));
    tb1.Realize();



    ToolBar tb2 = new ToolBar(this, -1, Окно.ДЕФПОЗ, вхДефРазм,
                     ToolBar.wxTB_FLAT | ToolBar.wxTB_NODIVIDER);
    tb2.ToolBitmapSize = Размер(16,16);

    Битмап tb2_bmp1 = АртПровайдер.ДайБитмап(ПАртИД.wxART_QUESTION, ПАртКлиент.wxART_OTHER, Размер(16,16));
    tb2.AddTool(101, "Test", tb2_bmp1);
    tb2.AddTool(101, "Test", tb2_bmp1);
    tb2.AddTool(101, "Test", tb2_bmp1);
    tb2.AddTool(101, "Test", tb2_bmp1);
    tb2.AddSeparator();
    tb2.AddTool(101, "Test", tb2_bmp1);
    tb2.AddTool(101, "Test", tb2_bmp1);
    tb2.AddSeparator();
    tb2.AddTool(101, "Test", tb2_bmp1);
    tb2.AddTool(101, "Test", tb2_bmp1);
    tb2.AddTool(101, "Test", tb2_bmp1);
    tb2.AddTool(101, "Test", tb2_bmp1);
    tb2.Realize();


    ToolBar tb3 = new ToolBar(this, -1, Окно.ДЕФПОЗ, вхДефРазм,
                     ToolBar.wxTB_FLAT | ToolBar.wxTB_NODIVIDER);
    tb3.ToolBitmapSize = Размер(16,16);
    Битмап tb3_bmp1 = АртПровайдер.ДайБитмап(ПАртИД.wxART_FOLDER, ПАртКлиент.wxART_OTHER, Размер(16,16));
    tb3.AddTool(101, "Test", tb3_bmp1);
    tb3.AddTool(101, "Test", tb3_bmp1);
    tb3.AddTool(101, "Test", tb3_bmp1);
    tb3.AddTool(101, "Test", tb3_bmp1);
    tb3.AddSeparator();
    tb3.AddTool(101, "Test", tb3_bmp1);
    tb3.AddTool(101, "Test", tb3_bmp1);
    tb3.Realize();

    ToolBar tb4 = new ToolBar(this, -1, Окно.ДЕФПОЗ, вхДефРазм,
                     ToolBar.wxTB_FLAT | ToolBar.wxTB_NODIVIDER | /*ToolBar.wxTB_HORZ_LAYOUT*/0x0800 | ToolBar.wxTB_TEXT);
    tb4.ToolBitmapSize = Размер(16,16);
    Битмап tb4_bmp1 = АртПровайдер.ДайБитмап(ПАртИД.wxART_NORMAL_FILE, ПАртКлиент.wxART_OTHER, Размер(16,16));
    tb4.AddTool(101, "Элемент 1", tb4_bmp1);
    tb4.AddTool(101, "Элемент 2", tb4_bmp1);
    tb4.AddTool(101, "Элемент 3", tb4_bmp1);
    tb4.AddTool(101, "Элемент 4", tb4_bmp1);
    tb4.AddSeparator();
    tb4.AddTool(101, "Элемент 5", tb4_bmp1);
    tb4.AddTool(101, "Элемент 6", tb4_bmp1);
    tb4.AddTool(101, "Элемент 7", tb4_bmp1);
    tb4.AddTool(101, "Элемент 8", tb4_bmp1);
    tb4.Realize();


    // Уст up the event table

    собСотриФон(&OnEraseBackground);
    собРазмер(&приПеремере);
    собМеню(ID_CreateTree, &OnCreateTree);
    собМеню(ID_CreateGrid, &OnCreateGrid);
    собМеню(ID_CreateText, &OnCreateText);
    собМеню(ID_CreateHTML, &OnCreateHTML);
    собМеню(ID_CreateSizeReport, &OnCreateSizeReport);
    собМеню(ID_CreatePerspective, &OnCreatePerspective);
    собМеню(ID_CopyPerspectiveCode, &OnCopyPerspectiveCode);
    собМеню(ID_AllowFloating, &OnManagerFlag);
    собМеню(ID_TransparentHint, &OnManagerFlag);
    собМеню(ID_TransparentHintFade, &OnManagerFlag);
    собМеню(ID_TransparentDrag, &OnManagerFlag);
    собМеню(ID_AllowActivePane, &OnManagerFlag);
    собМеню(ID_NoGradient, &OnGradient);
    собМеню(ID_VerticalGradient, &OnGradient);
    собМеню(ID_HorizontalGradient, &OnGradient);
    собМеню(ID_Settings, &OnУстtings);
    собМеню(ID_GridContent, &OnChangeContentPane);
    собМеню(ID_TreeContent, &OnChangeContentPane);
    собМеню(ID_TextContent, &OnChangeContentPane);
    собМеню(ID_SizeReportContent, &OnChangeContentPane);
    собМеню(ID_HTMLContent, &OnChangeContentPane);
    собОбновиИП(ID_AllowFloating, &OnUpdateUI);
    собОбновиИП(ID_TransparentHint, &OnUpdateUI);
    собОбновиИП(ID_TransparentHintFade, &OnUpdateUI);
    собОбновиИП(ID_TransparentDrag, &OnUpdateUI);
    собОбновиИП(ID_NoGradient, &OnUpdateUI);
    собОбновиИП(ID_VerticalGradient, &OnUpdateUI);
    собОбновиИП(ID_HorizontalGradient, &OnUpdateUI);
    for (цел i = 0; i < 1000; i++)
      собМеню(ID_FirstPerspective + i, &OnRestorePerspective);


    // добавить a bunch of panes
    PaneInfo info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test1").Caption("Pane Caption").
            Верх());

    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test2").Caption("Client Размер Reporter").
            Низ().Позиция(1));

    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test3").Caption("Client Размер Reporter").
            Низ());

    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test4").Caption("Pane Caption").
            Лево());

    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test5").Caption("Pane Caption").
            Право());

    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test6").Caption("Client Размер Reporter").
            Право().Row(1));

    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test7").Caption("Client Размер Reporter").
            Лево().Layer(1));
/*
    info = new PaneInfo();
    m_mgr.AddPane(CreateTreeCtrl(), info.
            Имя("test8").Caption("Tree Pane").
            Лево().Layer(1).Позиция(1));
*/
    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test9").Caption("Min Размер 200x100").
            ЛучшийРазмер(Размер(200,100)).МинРазм(Размер(200,100)).
            Низ().Layer(1));

    info = new PaneInfo();
    m_mgr.AddPane(CreateTextCtrl(), info.
            Имя("test10").Caption("Text Pane").
            Низ().Layer(1).Позиция(1));

    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("test11").Caption("Fixed Pane").
            Низ().Layer(1).Позиция(2).Fixed());


    info = new PaneInfo();
    m_mgr.AddPane(new УстtingsPanel(this,this), info.
            Имя("settings").Caption("Dock Manager Устtings").
            Dockable(false).Float().Спрячь());

    // create some center panes

    info = new PaneInfo();
    m_mgr.AddPane(CreateGrid(), info.Имя("grid_content").
            CenterPane().Спрячь());
/*
    info = new PaneInfo();
    m_mgr.AddPane(CreateTreeCtrl(), info.Имя("tree_content").
            CenterPane().Спрячь());
*/
    info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.Имя("sizereport_content").
            CenterPane().Спрячь());

    info = new PaneInfo();
    m_mgr.AddPane(CreateTextCtrl(), info.Имя("text_content").
            CenterPane().Спрячь());

    info = new PaneInfo();
    m_mgr.AddPane(CreateHTMLCtrl(), info.Имя("html_content").
            CenterPane());

    // добавить the toolbars to the manager

    info = new PaneInfo();
    m_mgr.AddPane(tb1, info.
            Имя("tb1").Caption("Big Toolbar").
            ToolbarPane().Верх().
            LeftDockable(false).RightDockable(false));

    info = new PaneInfo();
    m_mgr.AddPane(tb2, info.
            Имя("tb2").Caption("Toolbar 2").
            ToolbarPane().Верх().Row(1).
            LeftDockable(false).RightDockable(false));

    info = new PaneInfo();
    m_mgr.AddPane(tb3, info.
            Имя("tb3").Caption("Toolbar 3").
            ToolbarPane().Верх().Row(1).Позиция(1).
            LeftDockable(false).RightDockable(false));

    info = new PaneInfo();
    m_mgr.AddPane(tb4, info.
            Имя("tb4").Caption("Sample Bookmark Toolbar").
            ToolbarPane().Верх().Row(2).
            LeftDockable(false).RightDockable(false));

    info = new PaneInfo();
    m_mgr.AddPane(new Кнопка(this, -1, "Test Кнопка"),
            info.Имя("tb5").
            ToolbarPane().Верх().Row(2).Позиция(1).
            LeftDockable(false).RightDockable(false));



    // make some default perspectives

    ткст perspective_all = m_mgr.SavePerspective();

    цел i, count;
    for (i = 0, count = m_mgr.GetPaneCount(); i < count; ++i)
      if (!m_mgr.GetPane(i).IsToolbar())
        m_mgr.GetPane(i).Спрячь();
    m_mgr.GetPane("tb1").Спрячь();
    m_mgr.GetPane("tb5").Спрячь();
    m_mgr.GetPane("test8").показ().Лево().Layer(0).Row(0).Позиция(0);
    m_mgr.GetPane("test10").показ().Низ().Layer(0).Row(0).Позиция(0);
    m_mgr.GetPane("html_content").показ();
    ткст perspective_default = m_mgr.SavePerspective();

    m_perspectives ~= perspective_default;
    m_perspectives ~= perspective_all;

    // "commit" all changes made to wxFrameManager
    m_mgr.Обнови();
  }

  ~this()
  {
    m_mgr.деиниц();
  }

  DockArt GetDockArt()
  {
    return m_mgr.GetArtProvider();
  }

  проц DoUpdate()
  {
    m_mgr.Обнови();
  }

private:
  проц OnEraseBackground(Объект отправитель, Событие event)
  {
    event.Skip();
  }

  проц приПеремере(Объект отправитель, Событие event)
  {
    event.Skip();
  }

  проц OnУстtings(Объект отправитель, Событие event)
  {
    // покажи the settings pane, and плав it
    PaneInfo floating_pane = m_mgr.GetPane("settings").Float().показ();

    if (floating_pane.floating_pos == Окно.ДЕФПОЗ)
      floating_pane.FloatingPosition(GetStartPosition());

    m_mgr.Обнови();
  }


  проц OnGradient(Объект отправитель, Событие event)
  {
    цел gradient = 0;

    switch (event.ИД())
    {
      case ID_NoGradient:     gradient = wxPaneDockArtGradients.wxAUI_GRADIENT_NONE; break;
      case ID_VerticalGradient:   gradient = wxPaneDockArtGradients.wxAUI_GRADIENT_VERTICAL; break;
      case ID_HorizontalGradient: gradient = wxPaneDockArtGradients.wxAUI_GRADIENT_HORIZONTAL; break;
    }

    m_mgr.GetArtProvider().УстMetric(wxPaneDockArtУстting.wxAUI_ART_GRADIENT_TYPE, gradient);
    m_mgr.Обнови();
  }

  проц OnManagerFlag(Объект отправитель, Событие event)
  {
    бцел flag = 0;

version(__WXMSW__)
{}
else
{
    if (event.ИД() == ID_TransparentDrag ||
      event.ИД() == ID_TransparentHint ||
      event.ИД() == ID_TransparentHintFade)
    {
      MessageBox("This option is presently only available on wxMSW");
      return;
    }
}

    switch (event.ИД())
    {
      case ID_AllowFloating: flag = wxFrameManagerOption.wxAUI_MGR_ALLOW_FLOATING; break;
      case ID_TransparentDrag: flag = wxFrameManagerOption.wxAUI_MGR_TRANSPARENT_DRAG; break;
      case ID_TransparentHint: flag = wxFrameManagerOption.wxAUI_MGR_TRANSPARENT_HINT; break;
      case ID_TransparentHintFade: flag = wxFrameManagerOption.wxAUI_MGR_TRANSPARENT_HINT_FADE; break;
      case ID_AllowActivePane: flag = wxFrameManagerOption.wxAUI_MGR_ALLOW_ACTIVE_PANE; break;
    }
    m_mgr.УстФлаги(m_mgr.GetФлаги() ^ flag);
    m_mgr.Обнови();
  }

  проц OnUpdateUI(Объект отправитель, Событие event)
  {
    бцел флаги = m_mgr.GetФлаги();

    switch (event.ИД())
    {
      case ID_NoGradient:
        (cast(UpdateUIEvent)event).Check(m_mgr.GetArtProvider().GetMetric(wxPaneDockArtУстting.wxAUI_ART_GRADIENT_TYPE) == wxPaneDockArtGradients.wxAUI_GRADIENT_NONE ? да : false);
        break;
      case ID_VerticalGradient:
        (cast(UpdateUIEvent)event).Check(m_mgr.GetArtProvider().GetMetric(wxPaneDockArtУстting.wxAUI_ART_GRADIENT_TYPE) == wxPaneDockArtGradients.wxAUI_GRADIENT_VERTICAL ? да : false);
        break;
      case ID_HorizontalGradient:
        (cast(UpdateUIEvent)event).Check(m_mgr.GetArtProvider().GetMetric(wxPaneDockArtУстting.wxAUI_ART_GRADIENT_TYPE) == wxPaneDockArtGradients.wxAUI_GRADIENT_HORIZONTAL ? да : false);
        break;
      case ID_AllowFloating:
        (cast(UpdateUIEvent)event).Check(флаги & wxFrameManagerOption.wxAUI_MGR_ALLOW_FLOATING ? да : false);
        break;
      case ID_TransparentDrag:
        (cast(UpdateUIEvent)event).Check(флаги & wxFrameManagerOption.wxAUI_MGR_TRANSPARENT_DRAG ? да : false);
        break;
      case ID_TransparentHint:
        (cast(UpdateUIEvent)event).Check(флаги & wxFrameManagerOption.wxAUI_MGR_TRANSPARENT_HINT ? да : false);
        break;
      case ID_TransparentHintFade:
        (cast(UpdateUIEvent)event).Check(флаги & wxFrameManagerOption.wxAUI_MGR_TRANSPARENT_HINT_FADE ? да : false);
        break;
    }
  }

  проц OnCreatePerspective(Объект отправитель, Событие event)
  {
    TextEntryDialog dlg = new TextEntryDialog(this, "Enter a имя for the new перспектива:",
                "wxAUI Test");

    dlg.Value = фм("Perspective %d", m_perspectives.length+1);
    if (dlg.ShowModal() != wxID_OK)
      return;

    if (m_perspectives.length == 0)
    {
      m_perspectives_menu.добавьРазделитель();
    }

    m_perspectives_menu.добавь(ID_FirstPerspective + m_perspectives.length, dlg.Value);
    m_perspectives ~= m_mgr.SavePerspective();
  }

  проц OnCopyPerspectiveCode(Объект отправитель, Событие event)
  {
    ткст s = m_mgr.SavePerspective();

    if (Clipboard.TheClipboard.Open())
    {
      Clipboard.TheClipboard.УстData(new TextDataObject(s));
      Clipboard.TheClipboard.Закрой();
    }
  }

  проц OnRestorePerspective(Объект отправитель, Событие event)
  {
    m_mgr.LoadPerspective(m_perspectives[event.ИД - ID_FirstPerspective]);
  }


  Точка GetStartPosition()
  {
    static цел x = 0;
    x += 20;
    Точка тчк = клиентКЭкрану(Точка(0,0));
    return Точка(тчк.X + x, тчк.Y + x);
  }

  проц OnCreateTree(Объект отправитель, Событие event)
  {
    PaneInfo info = new PaneInfo();
    m_mgr.AddPane(CreateTreeCtrl(), info.
            Имя("Test").Caption("Tree Control").
            Float().FloatingPosition(GetStartPosition()).
            FloatingSize(Размер(150,300)));
    m_mgr.Обнови();
  }

  проц OnCreateGrid(Объект отправитель, Событие event)
  {
    PaneInfo info = new PaneInfo();
    m_mgr.AddPane(CreateGrid(), info.
            Имя("Test").Caption("Grid").
            Float().FloatingPosition(GetStartPosition()).
            FloatingSize(Размер(300,200)));
    m_mgr.Обнови();
  }

  проц OnCreateHTML(Объект отправитель, Событие event)
  {
    PaneInfo info = new PaneInfo();
    m_mgr.AddPane(CreateHTMLCtrl(), info.
            Имя("Test").Caption("Grid").
            Float().FloatingPosition(GetStartPosition()).
            FloatingSize(Размер(300,200)));
    m_mgr.Обнови();
  }

  проц OnCreateText(Объект отправитель, Событие event)
  {
    PaneInfo info = new PaneInfo();
    m_mgr.AddPane(CreateTextCtrl(), info.
            Имя("Test").Caption("Text Control").
            Float().FloatingPosition(GetStartPosition()));
    m_mgr.Обнови();
  }

  проц OnCreateSizeReport(Объект отправитель, Событие event)
  {
    PaneInfo info = new PaneInfo();
    m_mgr.AddPane(CreateSizeReportCtrl(), info.
            Имя("Test").Caption("Client Размер Reporter").
            Float().FloatingPosition(GetStartPosition()));
    m_mgr.Обнови();
  }

  проц OnChangeContentPane(Объект отправитель, Событие event)
  {
    m_mgr.GetPane("grid_content").показ(event.ИД() == ID_GridContent ? да:false);
    m_mgr.GetPane("text_content").показ(event.ИД() == ID_TextContent ? да:false);
    m_mgr.GetPane("tree_content").показ(event.ИД() == ID_TreeContent ? да:false);
    m_mgr.GetPane("sizereport_content").показ(event.ИД() == ID_SizeReportContent ? да:false);
    m_mgr.GetPane("html_content").показ(event.ИД() == ID_HTMLContent ? да:false);
    m_mgr.Обнови();
  }

  TextCtrl CreateTextCtrl()
  {
    ткст текст;
    static цел n = 0;

    текст = фм("This is текст бокс %d", ++n);

    return new TextCtrl(this,-1, текст,
                Точка(0,0), Размер(150,90),
                wxNO_BORDER | TextCtrl.МНОГОСТРОК);
  }


  Grid CreateGrid()
  {
    Grid grid = new Grid(this, -1,
                  Точка(0,0),
                  Размер(150,250),
                  wxNO_BORDER | wxWANTS_CHARS);
    grid.CreateGrid(50, 20);
    return grid;
  }

  TreeCtrl CreateTreeCtrl()
  {
    TreeCtrl tree = new TreeCtrl(this, -1,
                      Точка(0,0), Размер(160,250),
                      TreeCtrl.wxTR_DEFAULT_STYLE | wxNO_BORDER);

    TreeItemId root = tree.добавьКорень("wxAUI Project");
    ИдыЭлтовМассиваДерева элтs = new ИдыЭлтовМассиваДерева();


    ImageList imglist = new ImageList(16, 16, да, 2);
    imglist.Добавь(АртПровайдер.ДайБитмап(ПАртИД.wxART_FOLDER, ПАртКлиент.wxART_OTHER, Размер(16,16)));
    imglist.Добавь(АртПровайдер.ДайБитмап(ПАртИД.wxART_NORMAL_FILE, ПАртКлиент.wxART_OTHER, Размер(16,16)));
    tree.AssignImageList(imglist);

    элтs.Добавь(tree.приставьЭлт(root, "Элемент 1", 0));
    элтs.Добавь(tree.приставьЭлт(root, "Элемент 2", 0));
    элтs.Добавь(tree.приставьЭлт(root, "Элемент 3", 0));
    элтs.Добавь(tree.приставьЭлт(root, "Элемент 4", 0));
    элтs.Добавь(tree.приставьЭлт(root, "Элемент 5", 0));


    цел i, count;
    for (i = 0, count = элтs.Счёт(); i < count; ++i)
    {
      TreeItemId ид = элтs.Элемент(i);
      tree.приставьЭлт(ид, "Subэлт 1", 1);
      tree.приставьЭлт(ид, "Subэлт 2", 1);
      tree.приставьЭлт(ид, "Subэлт 3", 1);
      tree.приставьЭлт(ид, "Subэлт 4", 1);
      tree.приставьЭлт(ид, "Subэлт 5", 1);
    }


    tree.раскрой(root);

    return tree;
  }

  SizeReportCtrl CreateSizeReportCtrl(цел ширь = 80, цел высь = 80)
  {
    SizeReportCtrl ctrl = new SizeReportCtrl(this, -1,
                     Окно.ДЕФПОЗ,
                     Размер(ширь, высь), m_mgr);
    return ctrl;
  }

  HtmlWindow CreateHTMLCtrl()
  {
    HtmlWindow ctrl = new HtmlWindow(this, -1,
                     Окно.ДЕФПОЗ,
                     Размер(400,300));
    ctrl.устСтраницу(GetIntroText());
    return ctrl;
  }


  ткст GetIntroText()
  {
    return
      "<html><body>"
      "<h3>Welcome to wxAUI 0.9.2</h3>"
      "<br/><b>Overview</b><br/>"
      "<p>wxAUI is an Advanced User Interface library for the wxWidgets toolkit "
      "that allows developers to create high-quality, cross-platform user "
      "interfaces quickly and easily.</p>"
      "<p><b>Features</b></p>"
      "<p>With wxAUI version 0.9.2, developers can create application frameworks with:</p>"
      "<ul>"
      "<li>Native, dockable floating frames</li>"
      "<li>Perspective saving and loading</li>"
      "<li>Native toolbars incorporating real-time, &quot;spring-loaded&quot; dragging</li>"
      "<li>Customizable floating/docking behavior</li>"
      "<li>Completely customizable look-and-feel</li>"
      "<li>Optional transparent окно effects (while dragging or docking)</li>"
      "</ul>"
      "<p><b>What's new in 0.9.2?</b></p>"
      "<p>The following features/fixes have been added since the last version of wxAUI:</p>"
      "<ul>"
      "<li>Support for wxMac</li>"
      "<li>Updates for wxWidgets 2.6.3</li>"
      "<li>Fix to pass more unused events through</li>"
      "<li>Fix to разрешить floating windows to receive idle events</li>"
      "<li>Fix for minimizing/maximizing problem with transparent hint pane</li>"
      "<li>Fix to not paint empty hint rectangles</li>"
      "<li>Fix for 64-bit compilation</li>"
      "</ul>"
      "<p><b>What changed in 0.9.1?</b></p>"
      "<p>The following features/fixes were added in wxAUI 0.9.1:</p>"
      "<ul>"
      "<li>Support for MDI frames</li>"
      "<li>Gradient captions option</li>"
      "<li>Активен/Inactive panes option</li>"
      "<li>Fix for screen artifacts/paint problems</li>"
      "<li>Fix for hiding/showing floated окно problem</li>"
      "<li>Fix for floating pane sizing problem</li>"
      "<li>Fix for drop position problem when dragging around center pane margins</li>"
      "<li>LF-only текст file фмting for source код</li>"
      "</ul>"
      "<p>See README.txt for more inфмion.</p>"
      "</body></html>";
  }

  FrameManager m_mgr;
  char[][] m_perspectives;
  Меню m_perspectives_menu;
}



// -- SizeReportCtrl --
// (a utility control that always reports it's клиент Размер)

class SizeReportCtrl : Control
{
public:

  this(wxWindow родитель, цел ид = -1,
           Точка поз = Окно.ДЕФПОЗ,
           Размер Размер = вхДефРазм,
           FrameManager mgr = null)
  {
    super(родитель, ид, поз, Размер, wxNO_BORDER);

    m_mgr = mgr;

    собРисование(&OnPaint);
    собРазмер(&приПеремере);
    собСотриФон(&OnEraseBackground);
  }

private:

  проц OnPaint(Объект отправитель, Событие evt)
  {
    evt.Skip();

    PaintDC dc = new PaintDC(this);
    Размер Размер = РазмерКлиента;
    ткст s;
    цел h, w, высь;

    s = фм("Размер: %d x %d", Размер.Ширь, Размер.Высь);

    dc.УстFont(Шрифт.Нормальный);
    dc.ДайПротяженностьТекста(s, w, высь);
    высь += 3;
    dc.УстBrush(Кисть.wxWHITE_BRUSH);
    dc.УстPen(Pen.wxWHITE_PEN);
    dc.DrawRectangle(0, 0, Размер.Ширь, Размер.Высь);
    dc.УстPen(Pen.wxLIGHT_GREY_PEN);
    dc.DrawLine(0, 0, Размер.Ширь, Размер.Высь);
    dc.DrawLine(0, Размер.Высь, Размер.Ширь, 0);
    dc.DrawText(s, (Размер.Ширь-w)/2, ((Размер.Высь-(высь*5))/2));

    if (m_mgr)
    {
      PaneInfo pi = m_mgr.GetPane(this);

      s = фм("Layer: %d", pi.dock_layer);
      dc.ДайПротяженностьТекста(s, w, h);
      dc.DrawText(s, (Размер.Ширь-w)/2, ((Размер.Высь-(высь*5))/2)+(высь*1));

      s = фм("Dock: %d Row: %d", pi.dock_direction, pi.dock_row);
      dc.ДайПротяженностьТекста(s, w, h);
      dc.DrawText(s, (Размер.Ширь-w)/2, ((Размер.Высь-(высь*5))/2)+(высь*2));

      s = фм("Позиция: %d", pi.dock_pos);
      dc.ДайПротяженностьТекста(s, w, h);
      dc.DrawText(s, (Размер.Ширь-w)/2, ((Размер.Высь-(высь*5))/2)+(высь*3));

      s = фм("Proportion: %d", pi.dock_proportion);
      dc.ДайПротяженностьТекста(s, w, h);
      dc.DrawText(s, (Размер.Ширь-w)/2, ((Размер.Высь-(высь*5))/2)+(высь*4));
    }
  }

  проц OnEraseBackground(Объект отправитель, Событие evt)
  {
    // intentionally empty
  }

  проц приПеремере(Объект отправитель, Событие evt)
  {
    Освежи();
  }
private:

  FrameManager m_mgr;
}




class УстtingsPanel : Panel
{
  enum
  {
    ID_PaneBorderSize = MenuIDs.wxID_HIGHEST+1,
    ID_SashSize,
    ID_CaptionSize,
    ID_BackgroundColor,
    ID_SashColor,
    ID_InactiveCaptionColor,
    ID_InactiveCaptionGradientColor,
    ID_InactiveCaptionTextColor,
    ID_ActiveCaptionColor,
    ID_ActiveCaptionGradientColor,
    ID_ActiveCaptionTextColor,
    ID_BorderColor,
    ID_GripperColor
  };

public:

  this(wxWindow родитель, MyFrame рамка)
  {
    super(родитель, -1, Окно.ДЕФПОЗ, вхДефРазм);

    ПеремерщикБокса vert = new ПеремерщикБокса(Ориентация.wxVERTICAL);

    //vert.Добавь(1, 1, 1, Stretch.wxEXPAND);

    ПеремерщикБокса s1 = new ПеремерщикБокса(Ориентация.wxHORIZONTAL);
    m_border_size = new SpinCtrl(this, ID_PaneBorderSize, "", Окно.ДЕФПОЗ, Размер(50,20));
    s1.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s1.Добавь(new StaticText(this, -1, "Pane ПБордюр Размер:"));
    s1.Добавь(m_border_size);
    s1.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s1.УстItemMinSize(1, Размер(180, 20));
    //vert.Добавь(s1, 0, Stretch.wxEXPAND | wxLEFT | wxBOTTOM, 5);

    ПеремерщикБокса s2 = new ПеремерщикБокса(Ориентация.wxHORIZONTAL);
    m_sash_size = new SpinCtrl(this, ID_SashSize, "", Окно.ДЕФПОЗ, Размер(50,20));
    s2.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s2.Добавь(new StaticText(this, -1, "Sash Размер:"));
    s2.Добавь(m_sash_size);
    s2.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s2.УстItemMinSize(1, Размер(180, 20));
    //vert.Добавь(s2, 0, Stretch.wxEXPAND | wxLEFT | wxBOTTOM, 5);

    ПеремерщикБокса s3 = new ПеремерщикБокса(Ориентация.wxHORIZONTAL);
    m_caption_size = new SpinCtrl(this, ID_CaptionSize, "", Окно.ДЕФПОЗ, Размер(50,20));
    s3.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s3.Добавь(new StaticText(this, -1, "Caption Размер:"));
    s3.Добавь(m_caption_size);
    s3.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s3.УстItemMinSize(1, Размер(180, 20));
    //vert.Добавь(s3, 0, Stretch.wxEXPAND | wxLEFT | wxBOTTOM, 5);

    //vert.Добавь(1, 1, 1, Stretch.wxEXPAND);


    Битмап b = CreateColorBitmap(Цвет.wxBLACK);

    ПеремерщикБокса s4 = new ПеремерщикБокса(Ориентация.wxHORIZONTAL);
    m_background_color = new КнопкаБитмап(this, ID_BackgroundColor, b, Окно.ДЕФПОЗ, Размер(50,25));
    s4.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s4.Добавь(new StaticText(this, -1, "Background Color:"));
    s4.Добавь(m_background_color);
    s4.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s4.УстItemMinSize(1, Размер(180, 20));

    ПеремерщикБокса s5 = new ПеремерщикБокса(Ориентация.wxHORIZONTAL);
    m_sash_color = new КнопкаБитмап(this, ID_SashColor, b, Окно.ДЕФПОЗ, Размер(50,25));
    s5.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s5.Добавь(new StaticText(this, -1, "Sash Color:"));
    s5.Добавь(m_sash_color);
    s5.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s5.УстItemMinSize(1, Размер(180, 20));

    ПеремерщикБокса s6 = new ПеремерщикБокса(Ориентация.wxHORIZONTAL);
    m_inactive_caption_color = new КнопкаБитмап(this, ID_InactiveCaptionColor, b, Окно.ДЕФПОЗ, Размер(50,25));
    s6.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s6.Добавь(new StaticText(this, -1, "Normal Caption:"));
    s6.Добавь(m_inactive_caption_color);
    s6.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s6.УстItemMinSize(1, Размер(180, 20));

    ПеремерщикБокса s7 = new ПеремерщикБокса(Ориентация.wxHORIZONTAL);
    m_inactive_caption_gradient_color = new КнопкаБитмап(this, ID_InactiveCaptionGradientColor, b, Окно.ДЕФПОЗ, Размер(50,25));
    s7.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s7.Добавь(new StaticText(this, -1, "Normal Caption Gradient:"));
    s7.Добавь(m_inactive_caption_gradient_color);
    s7.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s7.УстItemMinSize(1, Размер(180, 20));

    ПеремерщикБокса s8 = new ПеремерщикБокса(Ориентация.wxHORIZONTAL);
    m_inactive_caption_text_color = new КнопкаБитмап(this, ID_InactiveCaptionTextColor, b, Окно.ДЕФПОЗ, Размер(50,25));
    s8.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s8.Добавь(new StaticText(this, -1, "Normal Caption Text:"));
    s8.Добавь(m_inactive_caption_text_color);
    s8.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s8.УстItemMinSize(1, Размер(180, 20));

    ПеремерщикБокса s9 = new ПеремерщикБокса(Ориентация.wxHORIZONTAL);
    m_active_caption_color = new КнопкаБитмап(this, ID_ActiveCaptionColor, b, Окно.ДЕФПОЗ, Размер(50,25));
    s9.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s9.Добавь(new StaticText(this, -1, "Активен Caption:"));
    s9.Добавь(m_active_caption_color);
    s9.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s9.УстItemMinSize(1, Размер(180, 20));

    ПеремерщикБокса s10 = new ПеремерщикБокса(Ориентация.wxHORIZONTAL);
    m_active_caption_gradient_color = new КнопкаБитмап(this, ID_ActiveCaptionGradientColor, b, Окно.ДЕФПОЗ, Размер(50,25));
    s10.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s10.Добавь(new StaticText(this, -1, "Активен Caption Gradient:"));
    s10.Добавь(m_active_caption_gradient_color);
    s10.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s10.УстItemMinSize(1, Размер(180, 20));

    ПеремерщикБокса s11 = new ПеремерщикБокса(Ориентация.wxHORIZONTAL);
    m_active_caption_text_color = new КнопкаБитмап(this, ID_ActiveCaptionTextColor, b, Окно.ДЕФПОЗ, Размер(50,25));
    s11.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s11.Добавь(new StaticText(this, -1, "Активен Caption Text:"));
    s11.Добавь(m_active_caption_text_color);
    s11.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s11.УстItemMinSize(1, Размер(180, 20));

    ПеремерщикБокса s12 = new ПеремерщикБокса(Ориентация.wxHORIZONTAL);
    m_border_color = new КнопкаБитмап(this, ID_BorderColor, b, Окно.ДЕФПОЗ, Размер(50,25));
    s12.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s12.Добавь(new StaticText(this, -1, "ПБордюр Color:"));
    s12.Добавь(m_border_color);
    s12.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s12.УстItemMinSize(1, Размер(180, 20));

    ПеремерщикБокса s13 = new ПеремерщикБокса(Ориентация.wxHORIZONTAL);
    m_gripper_color = new КнопкаБитмап(this, ID_GripperColor, b, Окно.ДЕФПОЗ, Размер(50,25));
    s13.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s13.Добавь(new StaticText(this, -1, "Gripper Color:"));
    s13.Добавь(m_gripper_color);
    s13.Добавь(1, 1, 1, Stretch.wxEXPAND);
    s13.УстItemMinSize(1, Размер(180, 20));

    GridSizer grid_sizer = new GridSizer(0, 2, 0, 0);
    grid_sizer.HGap = 5;
    grid_sizer.Добавь(s1);  grid_sizer.Добавь(s4);
    grid_sizer.Добавь(s2);  grid_sizer.Добавь(s5);
    grid_sizer.Добавь(s3);  grid_sizer.Добавь(s13);
    grid_sizer.Добавь(1,1); grid_sizer.Добавь(s12);
    grid_sizer.Добавь(s6);  grid_sizer.Добавь(s9);
    grid_sizer.Добавь(s7);  grid_sizer.Добавь(s10);
    grid_sizer.Добавь(s8);  grid_sizer.Добавь(s11);

    ПеремерщикБокса cont_sizer = new ПеремерщикБокса(Ориентация.wxVERTICAL);
    cont_sizer.Добавь(grid_sizer, 1, Stretch.wxEXPAND | Direction.wxALL, 5);
    УстПеремерщик(cont_sizer);
    сайзер().УстРазмПодсказ(this);

    m_frame = рамка;
    m_border_size.Value = рамка.GetDockArt().GetMetric(wxPaneDockArtУстting.wxAUI_ART_PANE_BORDER_SIZE);
    m_sash_size.Value = рамка.GetDockArt().GetMetric(wxPaneDockArtУстting.wxAUI_ART_SASH_SIZE);
    m_caption_size.Value = рамка.GetDockArt().GetMetric(wxPaneDockArtУстting.wxAUI_ART_CAPTION_SIZE);

    UpdateColors();

    собСпинктрл(ID_PaneBorderSize, &OnPaneBorderSize);
    собСпинктрл(ID_SashSize, &OnSashSize);
    собСпинктрл(ID_CaptionSize, &OnCaptionSize);
    собКнопка(ID_BackgroundColor, &OnУстColor);
    собКнопка(ID_SashColor, &OnУстColor);
    собКнопка(ID_InactiveCaptionColor, &OnУстColor);
    собКнопка(ID_InactiveCaptionGradientColor, &OnУстColor);
    собКнопка(ID_InactiveCaptionTextColor, &OnУстColor);
    собКнопка(ID_ActiveCaptionColor, &OnУстColor);
    собКнопка(ID_ActiveCaptionGradientColor, &OnУстColor);
    собКнопка(ID_ActiveCaptionTextColor, &OnУстColor);
    собКнопка(ID_BorderColor, &OnУстColor);
    собКнопка(ID_GripperColor, &OnУстColor);
  }

private:

  Битмап CreateColorBitmap(Цвет c)
  {
    Рисунок рисунок = new Рисунок(25,14);
    for (цел x = 0; x < 25; ++x)
      for (цел y = 0; y < 14; ++y)
      {
        Цвет pixcol = c;
        if (x == 0 || x == 24 || y == 0 || y == 13)
          pixcol = Цвет.wxBLACK;
        рисунок.УстRGB(x, y, pixcol.Red(), pixcol.Green(), pixcol.Blue());
      }
    return new Битмап(рисунок);
  }

  проц UpdateColors()
  {
    Цвет bk = m_frame.GetDockArt().GetColor(wxPaneDockArtУстting.wxAUI_ART_BACKGROUND_COLOUR);
    m_background_color.ЯрлыкБитмапа = CreateColorBitmap(bk);

    Цвет cap = m_frame.GetDockArt().GetColor(wxPaneDockArtУстting.wxAUI_ART_INACTIVE_CAPTION_COLOUR);
    m_inactive_caption_color.ЯрлыкБитмапа = CreateColorBitmap(cap);

    Цвет capgrad = m_frame.GetDockArt().GetColor(wxPaneDockArtУстting.wxAUI_ART_INACTIVE_CAPTION_GRADIENT_COLOUR);
    m_inactive_caption_gradient_color.ЯрлыкБитмапа = CreateColorBitmap(capgrad);

    Цвет captxt = m_frame.GetDockArt().GetColor(wxPaneDockArtУстting.wxAUI_ART_INACTIVE_CAPTION_TEXT_COLOUR);
    m_inactive_caption_text_color.ЯрлыкБитмапа = CreateColorBitmap(captxt);

    Цвет acap = m_frame.GetDockArt().GetColor(wxPaneDockArtУстting.wxAUI_ART_ACTIVE_CAPTION_COLOUR);
    m_active_caption_color.ЯрлыкБитмапа = CreateColorBitmap(acap);

    Цвет acapgrad = m_frame.GetDockArt().GetColor(wxPaneDockArtУстting.wxAUI_ART_ACTIVE_CAPTION_GRADIENT_COLOUR);
    m_active_caption_gradient_color.ЯрлыкБитмапа = CreateColorBitmap(acapgrad);

    Цвет acaptxt = m_frame.GetDockArt().GetColor(wxPaneDockArtУстting.wxAUI_ART_ACTIVE_CAPTION_TEXT_COLOUR);
    m_active_caption_text_color.ЯрлыкБитмапа = CreateColorBitmap(acaptxt);

    Цвет sash = m_frame.GetDockArt().GetColor(wxPaneDockArtУстting.wxAUI_ART_SASH_COLOUR);
    m_sash_color.ЯрлыкБитмапа = CreateColorBitmap(sash);

    Цвет бордюр = m_frame.GetDockArt().GetColor(wxPaneDockArtУстting.wxAUI_ART_BORDER_COLOUR);
    m_border_color.ЯрлыкБитмапа = CreateColorBitmap(бордюр);

    Цвет gripper = m_frame.GetDockArt().GetColor(wxPaneDockArtУстting.wxAUI_ART_GRIPPER_COLOUR);
    m_gripper_color.ЯрлыкБитмапа = CreateColorBitmap(gripper);
  }

  проц OnPaneBorderSize(Объект отправитель, Событие event)
  {
    m_frame.GetDockArt().УстMetric(wxPaneDockArtУстting.wxAUI_ART_PANE_BORDER_SIZE,
                     m_border_size.Value);
    m_frame.DoUpdate();
  }

  проц OnSashSize(Объект отправитель, Событие event)
  {
    m_frame.GetDockArt().УстMetric(wxPaneDockArtУстting.wxAUI_ART_SASH_SIZE,
                     m_sash_size.Value);
    m_frame.DoUpdate();
  }

  проц OnCaptionSize(Объект отправитель, Событие event)
  {
    m_frame.GetDockArt().УстMetric(wxPaneDockArtУстting.wxAUI_ART_CAPTION_SIZE,
                     m_caption_size.Value);
    m_frame.DoUpdate();
  }

  проц OnУстColor(Объект отправитель, Событие event)
  {
    ColourDialog dlg = new ColourDialog(m_frame);
    dlg.Титул = "Color Picker";
    if (dlg.ShowModal() != wxID_OK)
      return;

    цел var = 0;
    switch (event.ИД)
    {
      case ID_BackgroundColor:        var = wxPaneDockArtУстting.wxAUI_ART_BACKGROUND_COLOUR; break;
      case ID_SashColor:          var = wxPaneDockArtУстting.wxAUI_ART_SASH_COLOUR; break;
      case ID_InactiveCaptionColor:     var = wxPaneDockArtУстting.wxAUI_ART_INACTIVE_CAPTION_COLOUR; break;
      case ID_InactiveCaptionGradientColor: var = wxPaneDockArtУстting.wxAUI_ART_INACTIVE_CAPTION_GRADIENT_COLOUR; break;
      case ID_InactiveCaptionTextColor:   var = wxPaneDockArtУстting.wxAUI_ART_INACTIVE_CAPTION_TEXT_COLOUR; break;
      case ID_ActiveCaptionColor:       var = wxPaneDockArtУстting.wxAUI_ART_ACTIVE_CAPTION_COLOUR; break;
      case ID_ActiveCaptionGradientColor:   var = wxPaneDockArtУстting.wxAUI_ART_ACTIVE_CAPTION_GRADIENT_COLOUR; break;
      case ID_ActiveCaptionTextColor:     var = wxPaneDockArtУстting.wxAUI_ART_ACTIVE_CAPTION_TEXT_COLOUR; break;
      case ID_BorderColor:          var = wxPaneDockArtУстting.wxAUI_ART_BORDER_COLOUR; break;
      case ID_GripperColor:         var = wxPaneDockArtУстting.wxAUI_ART_GRIPPER_COLOUR; break;
      default: return;
    }

    m_frame.GetDockArt().УстColor(var, dlg.colourData.цвет);
    m_frame.DoUpdate();
    UpdateColors();
  }

private:

  MyFrame m_frame;
  SpinCtrl m_border_size;
  SpinCtrl m_sash_size;
  SpinCtrl m_caption_size;
  КнопкаБитмап m_inactive_caption_text_color;
  КнопкаБитмап m_inactive_caption_gradient_color;
  КнопкаБитмап m_inactive_caption_color;
  КнопкаБитмап m_active_caption_text_color;
  КнопкаБитмап m_active_caption_gradient_color;
  КнопкаБитмап m_active_caption_color;
  КнопкаБитмап m_sash_color;
  КнопкаБитмап m_background_color;
  КнопкаБитмап m_border_color;
  КнопкаБитмап m_gripper_color;
}
