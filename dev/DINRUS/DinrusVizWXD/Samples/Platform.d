
private import stdrus;

alias фм FORMAT;
alias пишифнс PRINT;


import wx.wx;

public class MyFrame : Рамка
{
	public this(ткст титул)
	{
		super(титул, ДЕФПОЗ, вхДефРазм);

		цел p, major, minor;
		ткст platform;
		
		p = дайВерсиюОС(major, minor);
		if (p == OS_WINDOWS_9X || p == OS_WINDOWS_NT)
			platform = "Windows";
		else if (p == OS_MAC_OS || p == OS_DARWIN)
			platform = "Macintosh";
		else if (p == OS_LINUX)
			platform = "GNU/Linux";
		else if (p == OS_FREEBSD)
			platform = "FreeBSD";
		else
			platform = "Window7++";

		CreateStatusBar();
		УстStatusText(FORMAT("%s-%0x%s%0x", platform, major,".",minor));

		wxStaticText текст = new wxStaticText(this, wxGetOsDescription()
			~ " " ~ (UNICODE ? "Unicode" : (ANSI ? "ANSI" : "Unknown")),
			ДЕФПОЗ, вхДефРазм, Alignment.wxALIGN_CENTRE);
  	}
}

class MyApp : Приложение
{
	public override бул поИниц()
	{
       MyFrame рамка = new MyFrame("wxPlatform");
       рамка.показ(да);
       return да;
	}
}

цел main()
{
	version(__WXMSW__)
		PRINT("__WXMSW__");
	version(__WXGTK__)
		PRINT("__WXGTK__");
	version(__WXMAC__)
		PRINT("__WXMAC__");
	version(__WXX11__)
		PRINT("__WXX11__");

	MyApp app = new MyApp();
	app.пуск();
	return 0;
}
