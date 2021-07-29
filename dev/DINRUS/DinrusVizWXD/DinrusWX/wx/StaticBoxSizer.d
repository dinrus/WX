module wx.StaticBoxSizer;;
public import wx.common;
public import wx.BoxSizer;
public import wx.StaticBox;

//! \cond EXTERN
extern (C) ЦелУкз wxStaticBoxSizer_ctor(ЦелУкз бокс, цел ориент);
extern (C) ЦелУкз wxStaticBoxSizer_GetStaticBox(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

export class ПеремерщикСтатическогоБокса : ПеремерщикБокса
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(СтатическийБокс бокс, цел ориент)
    {
        super(wxStaticBoxSizer_ctor(ВизОбъект.безопУк(бокс), ориент));
    }

    export this(цел ориент, Окно родитель, ткст ярлык)
    {
        this(new СтатическийБокс(родитель, -1, ярлык), ориент);
    }

    //---------------------------------------------------------------------

    export СтатическийБокс статБокс()
    {
        return cast(СтатическийБокс)найдиОбъект(
                   wxStaticBoxSizer_GetStaticBox(вхобъ)
               );
    }

    //---------------------------------------------------------------------
}
