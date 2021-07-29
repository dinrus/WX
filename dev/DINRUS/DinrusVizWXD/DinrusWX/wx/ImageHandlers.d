module wx.ImageHandlers;
public import wx.common;
public import wx.Image;

//! \cond EXTERN
extern (C) ЦелУкз BMPHandler_ctor();
extern (C) ЦелУкз ICOHandler_ctor();
extern (C) ЦелУкз CURHandler_ctor();
extern (C) ЦелУкз ANIHandler_ctor();
extern (C) ЦелУкз GIFHandler_ctor();
extern (C) ЦелУкз PNGHandler_ctor();
extern (C) ЦелУкз PCXHandler_ctor();
extern (C) ЦелУкз JPEGHandler_ctor();
extern (C) ЦелУкз XPMHandler_ctor();
extern (C) ЦелУкз PNMHandler_ctor();
extern (C) ЦелУкз TIFFHandler_ctor();
//! \endcond



export class БМПОбработчик : ОбработчикРисунка
{
    export this(ЦелУкз ptr)
    {
        super(ptr);
    }

    export this()
    {
        super(BMPHandler_ctor());
    }
}

export class ИКООбработчик : БМПОбработчик
{
    export this(ЦелУкз ptr)
    {
        super(ptr);
    }

    export this()
    {
        super(ICOHandler_ctor());
    }
}

export class КУРОбработчик : ИКООбработчик
{
    export this(ЦелУкз ptr)
    {
        super(ptr);
    }

    export this()
    {
        super(CURHandler_ctor());
    }
}

export class АНИОбработчик : КУРОбработчик
{
    export this(ЦелУкз ptr)
    {
        super(ptr);
    }

    export this()
    {
        super(ANIHandler_ctor());
    }
}

export class ПНГОбработчик : ОбработчикРисунка
{
    export this(ЦелУкз ptr)
    {
        super(ptr);
    }

    export this()
    {
        super(PNGHandler_ctor());
    }
}

export class ГИФОбработчик : ОбработчикРисунка
{
    export this(ЦелУкз ptr)
    {
        super(ptr);
    }

    export this()
    {
        super(GIFHandler_ctor());
    }
}

export class ПЦХОбработчик : ОбработчикРисунка
{
    export this(ЦелУкз ptr)
    {
        super(ptr);
    }

    export this()
    {
        super(PCXHandler_ctor());
    }
}

export class ДжПЕГОбработчик : ОбработчикРисунка
{
    export this(ЦелУкз ptr)
    {
        super(ptr);
    }

    export this()
    {
        super(JPEGHandler_ctor());
    }
}


export class ПНМОбработчик : ОбработчикРисунка
{
    export this(ЦелУкз ptr)
    {
        super(ptr);
    }

    export this()
    {
        super(PNMHandler_ctor());
    }
}

export class ХПМОбработчик : ОбработчикРисунка
{
    export this(ЦелУкз ptr)
    {
        super(ptr);
    }

    export this()
    {
        super(XPMHandler_ctor());
    }
}

export class ТИФФОбработчик : ОбработчикРисунка
{
    export this(ЦелУкз ptr)
    {
        super(ptr);
    }

    export this()
    {
        super(TIFFHandler_ctor());
    }
}
