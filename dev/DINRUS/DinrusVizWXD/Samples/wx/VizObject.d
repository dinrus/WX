module wx.VizObject;
public import wx.common;

//! \cond STD
version (Tango)
import tango.core.Version;
//! \endcond

public static ткст дайТрансляцию(ткст стр);
public static ткст _(ткст стр);
//---------------------------------------------------------------------

extern(D) class ВизОбъект : ИВымещаемый
{
    // Reference до the associated C++ object
    public ЦелУкз вхобъ = ЦелУкз.init;

    // Hashtable до associate C++ объекты with D references
    //private static ВизОбъект[ЦелУкз] объекты;

    // памСобств is да when we create a new instance with the wrapper ctor
    // or if a call до a wrapper function returns new c++ instance.
    // Otherwise the created c++ object won't be deleted by the вымести member.
    protected бул памСобств = нет;

    //---------------------------------------------------------------------

    public this(ЦелУкз вхобъ);
    //private this(ЦелУкз вхобъ,бул памСобств);
    public static ЦелУкз безопУк(ВизОбъект объ);
    //private static ткст дайИмяТипа(ЦелУкз вхобъ);
    public ткст дайИмяТипа();
    //private static проц добавьОбъект(ВизОбъект объ);
    alias static ВизОбъект function(ЦелУкз вхобъ) новфункц;
    public static ВизОбъект найдиОбъект(ЦелУкз укз, новфункц Нов);
    public static ВизОбъект найдиОбъект(ЦелУкз укз);
    public static бул удалиОбъект(ЦелУкз укз);
    static extern(C) проц VirtualDispose(ЦелУкз укз);
    //private проц виртВымести();
    protected проц dtor();
    public  проц вымести();
    ~this();
    protected бул вымещен();
}

