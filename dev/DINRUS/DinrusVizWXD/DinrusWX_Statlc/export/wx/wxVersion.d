
module wx.wxVersion;
//public import wx.common;

extern(D) цел визВерсияМайор();
extern(D) цел визВерсияМинор();
extern(D) цел визНомерРелиза();
extern(D) цел визНомерСубРелиза();
extern(D) ткст визВерсияТкст();
extern(D) цел визВерсияБИП();

struct Версия
{
    цел майор;
    цел минор;
    цел номерРелиза;
    цел номерПодрелиза;
    ткст ткстВерсии;
    цел версияБИП;
}
static Версия текВерсия;

static this()
{
    текВерсия.майор = визВерсияМайор();
    текВерсия.минор = визВерсияМинор();
    текВерсия.номерРелиза = визНомерРелиза();
    текВерсия.номерПодрелиза = визНомерСубРелиза();
    текВерсия.ткстВерсии = визВерсияТкст();
    текВерсия.версияБИП = визВерсияБИП();
}
