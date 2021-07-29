
module wx.DataFormat;
public import wx.common;

public enum ПИдФорматаДаты
{
    INVALID =          0,
    TEXT =             1,
    BITMAP =           2,
    METAFILE =         3,
    SYLK =             4,
    DIF =              5,
    TIFF =             6,
    OEMTEXT =          7,
    DIB =              8,
    PALETTE =          9,
    PENDATA =          10,
    RIFF =             11,
    WAVE =             12,
    UNICODETEXT =      13,
    ENHMETAFILE =      14,
    FILENAME =         15,
    LOCALE =           16,
    PRIVATE =          20,
    HTML =             30,
    Макс
}

//-----------------------------------------------------------------------------

extern(D) class ФорматДаты : ВизОбъект
{
    public this(ЦелУкз вхобъ);
    //private this(ЦелУкз вхобъ, бул памСобств);
    public  this();
    public this(ПИдФорматаДаты тип);
    public this(ткст ид);
    ~this();
    public ткст ид();
    public проц ид(ткст значение);
    public ПИдФорматаДаты тип();
    public проц тип(ПИдФорматаДаты значение);
}

