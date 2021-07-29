module wx.VideoMode;
public import wx.common;

deprecated public ВидеоРежим новВидеоРежим(цел ширь, цел высь, цел глубь, цел частота);

public struct ВидеоРежим
{
    public static ВидеоРежим opCall(цел ширь, цел высь, цел глубь, цел частота);
    public бул совпадаетС(ВидеоРежим другой);
    public цел ширь();
    public цел высь();
    public цел глубь();
    public цел освежиЧастоту();
    public ткст вТкст();
}
