/////////////////////////////////////////////////////////////////////////////
// Имя:        tbtest.cpp
// Purpose:     wxTaskBarIcon demo
// Author:      Julian Smart
// Modified by: afb, ported to wxD
// Created:     01/02/97
// RCS-ИД:      $ид: TaskBar.d,v 1.1 2007/09/08 09:30:28 afb Exp $
// Copyright:   (c)
// Licence:     wxWindows licence
/////////////////////////////////////////////////////////////////////////////

import wx.wx;

// Declare two frames
MyDialog   dialog = null;

проц main()
{
	MyApp app = new MyApp();
	app.пуск();
}

// Define a new application
class MyApp: Приложение
{
public:

бул поИниц()
{
    // Создай the main рамка окно
    dialog = new MyDialog(null, wxID_ANY, "wxTaskBarIcon Test Dialog", Dialog.ДЕФПОЗ, wxSize(365, 290));

    dialog.показ(да);

    return да;
}

}

class MyDialog: wxDialog
{
public:

this(wxWindow родитель, цел ид, ткст титул,
    wxPoint поз, wxSize Размер, цел windowStyle = wxDEFAULT_DIALOG_STYLE)
{
    super(родитель, ид, титул, поз, Размер, windowStyle);

    Init();

    собКнопка(MenuIDs.wxID_OK, &OnOK);
    собКнопка(MenuIDs.wxID_EXIT, &ПоВыходу);
    собЗакрой(&OnCloseWindow);
}

~this()
{
    delete m_taskBarIcon;
}

проц OnOK(Объект отправитель, Событие event)
{
    показ(false);
}

проц ПоВыходу(Объект отправитель, Событие event)
{
    Закрой(да);
}

проц OnCloseWindow(Объект отправитель, Событие event)
{
    Разрушь();
}

проц Init()
{
  cast(проц)new wxStaticText(this, wxID_ANY, "Press 'Спрячь me' to hide me, Exit to quit.",
                         wxPoint(10, 20));

  cast(проц)new wxStaticText(this, wxID_ANY, "Double-click on the taskbar пиктограмма to покажи me again.",
                         wxPoint(10, 40));

  cast(проц)new wxButton(this, MenuIDs.wxID_EXIT, "Exit", wxPoint(185, 230), wxSize(80, 25));
  (new wxButton(this, wxID_OK, "Спрячь me", wxPoint(100, 230), wxSize(80, 25))).УстДеф();
  Центр(Ориентация.wxBOTH);
   
  m_taskBarIcon = new MyTaskBarIcon();
  if (!m_taskBarIcon.УстIcon(new Пиктограмма("./data/mondrian.png"), "wxTaskBarIcon Sample"))
        MessageBox("Could not set пиктограмма.");
}

protected:
    MyTaskBarIcon   m_taskBarIcon;

}

enum {
    PU_RESTORE = 10001,
    PU_NEW_ICON,
    PU_OLD_ICON,
    PU_EXIT,
    PU_CHECKMARK,
    PU_SUB1,
    PU_SUB2,
    PU_SUBMAIN
}


class MyTaskBarIcon : wxTaskBarIcon
{
public:
    this(wxTaskBarIconType iconType = wxTaskBarIconType.DEFAULT_TYPE)
    {
    super(iconType);

    собМеню(PU_RESTORE, &OnMenuRestore);
    собМеню(PU_EXIT,    &OnMenuExit);
    собМеню(PU_NEW_ICON,&OnMenuУстNewIcon);
    собМеню(PU_OLD_ICON,&OnMenuУстOldIcon);
    собМеню(PU_CHECKMARK,&OnMenuCheckmark);
    собОбновиИП(PU_CHECKMARK,&OnMenuUICheckmark);
    собТаскбарЛеваяДНажата  (&OnLeftButtonDClick);
    собМеню(PU_SUB1, &OnMenuSub);
    собМеню(PU_SUB2, &OnMenuSub);
    }


проц OnMenuRestore(Объект отправитель, Событие event)
{
    dialog.показ(да);
}

проц OnMenuExit(Объект отправитель, Событие event)
{
    dialog.Закрой(да);
}

static бул check = да;

проц OnMenuCheckmark(Объект отправитель, Событие event)
{
       check =!check;
}

проц OnMenuUICheckmark(Объект отправитель, Событие event)
{
       (cast(UpdateUIEvent)event).Check( check );
}

проц OnMenuУстNewIcon(Объект отправитель, Событие event)
{
    Пиктограмма пиктограмма = new Пиктограмма("./data/smile.png");

    if (!УстIcon(пиктограмма, "wxTaskBarIcon Sample - a different пиктограмма"))
        MessageBox("Could not set new пиктограмма.");
}

проц OnMenuУстOldIcon(Объект отправитель, Событие event)
{
    if (IsIconInstalled())
    {
        RemoveIcon();
    }
    else
    {
        MessageBox("wxTaskBarIcon Sample - пиктограмма already is the old version");
    }
}

проц OnMenuSub(Объект отправитель, Событие event)
{
    MessageBox("You clicked on a submenu!");
}

// Overridables
wxMenu создайВсплывающееМеню()
{
    // Try creating menus different ways
    // TODO: Probably try calling УстBitmap with some XPMs here
    wxMenu меню = new wxMenu;
    меню.Append(PU_RESTORE, "&Restore TBTest");
    меню.добавьРазделитель();
    меню.Append(PU_OLD_ICON, "&Restore Old Пиктограмма");    
    меню.Append(PU_NEW_ICON, "&Уст Нов Пиктограмма");
    меню.добавьРазделитель();
    меню.Append(PU_CHECKMARK, "Checkmark","", ItemKind.wxITEM_CHECK);
    меню.добавьРазделитель();
    wxMenu submenu = new wxMenu;
    submenu.Append(PU_SUB1, "One submenu");
    submenu.добавьРазделитель();
    submenu.Append(PU_SUB2, "Another submenu");
    меню.Append(PU_SUBMAIN, "Submenu", submenu);
version(__WXMAC__) {} else { /*Mac есть built-in quit меню*/
    меню.добавьРазделитель();
    меню.Append(PU_EXIT,    "E&xit");
}
    return меню;
}

проц OnLeftButtonDClick(Объект отправитель, Событие event)
{
    dialog.показ(да);
}

}

