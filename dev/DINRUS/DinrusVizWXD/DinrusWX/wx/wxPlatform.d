module wx.wxPlatform;
public import wx.common;
version(Dinrus) private import stdrus;

// ------------------------------------------------------
//! \cond EXTERN
static  extern (C) бул wxPlatform_WXMSW();
static  extern (C) бул wxPlatform_WXGTK();
static  extern (C) бул wxPlatform_WXMAC();
static  extern (C) бул wxPlatform_WXX11();
static  extern (C) бул wxPlatform_WXUNIVERSAL();

static  extern (C) бул wxPlatform_WXDEBUG();
static  extern (C) бул wxPlatform_UNIX();
static  extern (C) бул wxPlatform_UNICODE();
static  extern (C) бул wxPlatform_DISPLAY();
static  extern (C) бул wxPlatform_POSTSCRIPT();
static  extern (C) бул wxPlatform_GLCANVAS();
static  extern (C) бул wxPlatform_SOUND();

static  extern (C) ЦелУкз wxPlatform_wxGetOsDescription();
static  extern (C) цел wxPlatform_wxGetOsVersion(inout цел майор, inout цел минор);

static  extern (C) цел wxPlatform_OS_UNKNOWN();
static  extern (C) цел wxPlatform_OS_WINDOWS();
static  extern (C) цел wxPlatform_OS_WINDOWS_9X();
static  extern (C) цел wxPlatform_OS_WINDOWS_NT();
static  extern (C) цел wxPlatform_OS_MAC();
static  extern (C) цел wxPlatform_OS_MAC_OS();
static  extern (C) цел wxPlatform_OS_DARWIN();
static  extern (C) цел wxPlatform_OS_UNIX();
static  extern (C) цел wxPlatform_OS_LINUX();
static  extern (C) цел wxPlatform_OS_FREEBSD();
//! \endcond
// ------------------------------------------------------

/// Win platform
public бул __WXMSW__;
/// GTK platform
public бул __WXGTK__;
/// Mac platform
public бул __WXMAC__;
/// X11 platform
public бул __WXX11__;

/// Universal widgets
public бул __WXUNIVERSAL__;

/// дай OS description as a user-readable ткст
 export ткст дайОписаниеОС()
{
    return cast(ткст) new ВизТкст(wxPlatform_wxGetOsDescription(), да);
}

public бул ANSI;
public бул UNICODE;

public бул DEBUG;
public бул UNIX;

/// wxUSE_DISPLAY
public бул DISPLAY;
/// wxUSE_POSTSCRIPT
public бул POSTSCRIPT;
/// wxUSE_GLCANVAS
public бул GLCANVAS;
/// wxUSE_SOUND
public бул SOUND;

// ------------------------------------------------------

/// Unknown Platform
public цел OS_UNKNOWN;
deprecated alias OS_UNKNOWN wxUNKNOWN_PLATFORM;

/// Windows
public цел OS_WINDOWS;
/// Windows 95/98/ME
public цел OS_WINDOWS_9X;
deprecated alias OS_WINDOWS_9X wxWIN95;
/// Windows NT/2K/XP
public цел OS_WINDOWS_NT;
deprecated alias OS_WINDOWS_NT wxWINDOWS_NT;

/// Apple Mac OS
public цел OS_MAC;
/// Apple Mac OS 8/9/Х with Mac paths
public цел OS_MAC_OS;
deprecated alias OS_MAC_OS wxMAC;
/// Apple Mac OS Х with Unix paths
public цел OS_DARWIN;
deprecated alias OS_DARWIN wxMAC_DARWIN;

/// Unix
public цел OS_UNIX;
deprecated public цел wxUNIX;
/// Linux
public цел OS_LINUX;
/// FreeBSD
public цел OS_FREEBSD;

/// дай OS version
 цел дайВерсиюОС(inout цел майор, inout цел минор)
{
    return wxPlatform_wxGetOsVersion(майор, минор);
}

// ------------------------------------------------------

static this()
{
    __WXMSW__ = wxPlatform_WXMSW();
    __WXGTK__ = wxPlatform_WXGTK();
    __WXMAC__ = wxPlatform_WXMAC();
    __WXX11__ = wxPlatform_WXX11();

    __WXUNIVERSAL__ = wxPlatform_WXUNIVERSAL();

    // чекать that wxc matches wxd:
    version(__WXMSW__)
    assert(__WXMSW__);
    version(__WXGTK__)
    assert(__WXGTK__);
    version(__WXMAC__)
    assert(__WXMAC__);
    version(__WXX11__)
    assert(__WXX11__);

    UNICODE = wxPlatform_UNICODE();
    ANSI = !UNICODE;

    DEBUG = wxPlatform_WXDEBUG();
    UNIX = wxPlatform_UNIX();

version(Unicode)
    assert(UNICODE);
    else version(ANSI)
        assert(ANSI);

    DISPLAY = wxPlatform_DISPLAY();
    POSTSCRIPT = wxPlatform_POSTSCRIPT();
    GLCANVAS = wxPlatform_GLCANVAS();
    SOUND = wxPlatform_SOUND();

    // constants
    OS_UNKNOWN = wxPlatform_OS_UNKNOWN();
    OS_WINDOWS = wxPlatform_OS_WINDOWS();
    OS_WINDOWS_9X = wxPlatform_OS_WINDOWS_9X();
    OS_WINDOWS_NT = wxPlatform_OS_WINDOWS_NT();
    OS_MAC = wxPlatform_OS_MAC();
    OS_MAC_OS = wxPlatform_OS_MAC_OS();
    OS_DARWIN = wxPlatform_OS_DARWIN();
    OS_UNIX = wxPlatform_OS_UNIX();
    OS_LINUX = wxPlatform_OS_LINUX();
    OS_FREEBSD = wxPlatform_OS_FREEBSD();

}

enum ППлатформа : бцел
{
НЕИЗВЕСТНО,
МСВ,
ГТК,
МАК,
Х11,
УНИВЕРСАЛ
}
enum ПОС : бцел
{
НЕИЗВЕСТНО,
ВИДОВС,
ВИНДОВС_9Х,
ВИНДОВС_НТ,
МАК,
МК_ОС,
ДАРВИН,
ЮНИКС,
ЛИНУКС,
ФРИБСД
}

export ПОС дайОс()
{
if(wxPlatform_OS_UNKNOWN()) return ПОС.НЕИЗВЕСТНО;
else if(wxPlatform_OS_WINDOWS()) return ПОС.ВИДОВС;
else if(wxPlatform_OS_WINDOWS_9X()) return ПОС.ВИНДОВС_9Х;
else if(wxPlatform_OS_WINDOWS_NT()) return ПОС.ВИНДОВС_НТ;
else if(wxPlatform_OS_MAC()) return ПОС.МАК;
else if(wxPlatform_OS_MAC_OS()) return ПОС.МК_ОС;
else if(wxPlatform_OS_DARWIN()) return ПОС.ДАРВИН;
else if(wxPlatform_OS_UNIX()) return ПОС.ЮНИКС;
else if(wxPlatform_OS_LINUX()) return ПОС.ЛИНУКС;
else if(wxPlatform_OS_FREEBSD()) return ПОС.ФРИБСД;
else throw new Exception("Версия ОС WXWidgets неизвестна");
}

export ППлатформа дайПлатформу()
{
if(wxPlatform_WXMSW()) return ППлатформа.МСВ;
else if(wxPlatform_WXGTK()) return ППлатформа.ГТК;
else if(wxPlatform_WXMAC()) return ППлатформа.МАК;
else if(wxPlatform_WXX11()) return ППлатформа.Х11;
else if(wxPlatform_WXUNIVERSAL()) return ППлатформа.УНИВЕРСАЛ;
else throw new Exception("Версия платформы WXWidgets неизвестна");
}

export бул версияОтладочная()
{
if(wxPlatform_WXDEBUG()) return да;
  else return нет;
}

export бул версияЮникс()
{
if(wxPlatform_UNIX()) return да;
  else return нет;
}

export бул версияЮникод()
{
if(wxPlatform_UNICODE()) return да;
  else return нет;
}

export бул версияДисплей()
{
if(wxPlatform_DISPLAY()) return да;
  else return нет;
}

export бул версияПостскрипт()
{
if(wxPlatform_POSTSCRIPT()) return да;
  else return нет;
}

export бул версияГЛКанвас()
{
if(wxPlatform_GLCANVAS()) return да;
  else return нет;
}

export бул версияЗвук()
{
if(wxPlatform_SOUND()) return да;
  else return нет;
}
