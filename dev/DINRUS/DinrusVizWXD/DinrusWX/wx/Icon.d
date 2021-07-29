module wx.Icon;
public import wx.common;
public import wx.Bitmap;
version(Dinrus) private import stdrus;
version(Rulada)
{
	import tango.stdc.stringz;
	import std.utf;
	alias std.utf.toUTF8 вЮ8;
	alias tango.stdc.stringz.toStringz вТкст0;
}


//! \cond EXTERN
extern (C) ЦелУкз wxIcon_ctor();
extern (C) проц   wxIcon_CopyFromBitmap(ЦелУкз сам, ЦелУкз битмап);
extern (C) бул   wxIcon_LoadFile(ЦелУкз сам, ткст имя, ПТипБитмап тип);
//! \endcond

//---------------------------------------------------------------------


export class Пиктограмма : Битмап
{
    public static Пиктограмма НуллИконка;
    export this(ткст имя)
    {
        this();
        Рисунок img = new Рисунок();
        if (!img.загрузиФайл(имя))
            throw new ИсклАргумента("файл '" ~ вЮ8(имя) ~ "' не найден");

        Битмап бмп = new Битмап(img);
        wxIcon_CopyFromBitmap(вхобъ, бмп.вхобъ);
    }

    export this(ткст имя, ПТипБитмап тип)
    {
        this();
//			if (тип == ПТипБитмап.RESOURCE)
//			else
        if (!wxIcon_LoadFile(вхобъ, имя, тип))
            throw new ИсклАргумента("файл '" ~ вЮ8(имя) ~ "' не загружается");
    }

    export this()
    {
        super(wxIcon_ctor());
    }

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    //---------------------------------------------------------------------

    export проц копируйИзБитмапа(Битмап битмап)
    {
        wxIcon_CopyFromBitmap(вхобъ, ВизОбъект.безопУк(битмап));
    }

    //---------------------------------------------------------------------
}
