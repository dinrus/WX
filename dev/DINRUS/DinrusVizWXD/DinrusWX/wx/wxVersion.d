module wx.wxVersion;
public import wx.common;
version(Dinrus) private import stdrus;

//! \cond EXTERN
extern (C) цел wxVersion_MAJOR_VERSION();
extern (C) цел wxVersion_MINOR_VERSION();
extern (C) цел wxVersion_RELEASE_NUMBER();
extern (C) цел wxVersion_SUBRELEASE_NUMBER();
extern (C) ЦелУкз wxVersion_VERSION_STRING();
extern (C) цел wxVersion_ABI_VERSION();
//! \endcond

export цел визВерсияМайор()
{
    return wxVersion_MAJOR_VERSION();
}
export цел визВерсияМинор()
{
    return wxVersion_MINOR_VERSION();
}
export цел визНомерРелиза()
{
    return wxVersion_RELEASE_NUMBER();
}
export цел визНомерСубРелиза()
{
    return wxVersion_SUBRELEASE_NUMBER();
}

export ткст визВерсияТкст()
{
    return cast(ткст) new ВизТкст(wxVersion_VERSION_STRING(), да);
}

export цел визВерсияБИП()
{
    return wxVersion_ABI_VERSION();
}

