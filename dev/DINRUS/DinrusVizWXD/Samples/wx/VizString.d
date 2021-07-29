module wx.VizString;
public import wx.common;

//---------------------------------------------------------------------

/// ВизТкст is a class representing a character ткст.
extern(D) class ВизТкст : ВизОбъект
{
    public this(ЦелУкз вхобъ);
    package this(ЦелУкз вхобъ, бул памСобств);
    public this();
    public this(ткст стр);
    public this(wxChar* wxstr, т_мера wxlen);
    ~this();
    public т_мера length();
    public wxChar* данные();
    public wxChar opIndex(т_мера i);
    public проц opIndexAssign(wxChar c, т_мера i);
    public ткст opCast();
    public ббайт[] вАнзи();
    public wchar_t[] вУайд();
    version (D_Version2)
    {
        public override ткст вТкст();
    }
    else // D_Version1
    {
        public ткст вТкст();
    }
}

