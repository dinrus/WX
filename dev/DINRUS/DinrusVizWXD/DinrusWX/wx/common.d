/// Common structs that do not belong до any particular class
module wx.common;

version = Unicode;
version = __WXMSW__;

interface ИВымещаемый
{
    проц вымести();
}

interface ИКлонируемый
{
    Объект клонируй();
}

/// An implementation-specific тип that is used до represent a pointer or a handle.
typedef ук ЦелУкз;

version(Unicode)
alias шим wxChar;
else //version(ANSI)
    alias ббайт wxChar;

export extern(D) ткст примемЗаУникума(ткст т)
{
    return т;    // DMD 2.006
}

////////////////////////////////////////////////////////
/// НЕ ЭККСПОРТИРУЕМ (?)

struct Точка
{
      //  export:
    цел Х,У;

    /** struct constructor */
    static Точка opCall(цел x,цел y)
    {
        Точка тчк;
        тчк.Х = x;
        тчк.У = y;
        return тчк;
    }
}

struct Размер
{
       // export:
    цел ширь,высь;

    /** struct constructor */
    static Размер opCall(цел w,цел h)
    {
        Размер рм;
        рм.ширь = w;
        рм.высь = h;
        return рм;
    }
}

struct Прямоугольник
{
     //   export:
    цел Х,У,ширь,высь;
    цел  лево()
    {
        return Х;
    }
    проц лево(цел значение)
    {
        Х = значение;
    }
    цел  верх()
    {
        return У;
    }
    проц верх(цел значение)
    {
        У = значение;
    }

    цел  право()
    {
        return Х + ширь - 1;
    }
    проц право(цел значение)
    {
        ширь = значение - Х + 1;
    }
    цел  низ()
    {
        return У + высь - 1;
    }
    проц низ(цел значение)
    {
        высь = значение - У + 1;
    }

    /** struct constructor */
    static Прямоугольник opCall(цел x,цел y,цел w,цел h)
    {
        Прямоугольник прям;
        прям.Х = x;
        прям.У = y;
        прям.ширь = w;
        прям.высь = h;
        return прям;
    }
}
alias Прямоугольник Прям;
////////////////////////////////////////////////////
//////////module wx.VizObject;

//! \cond EXTERN
extern (C)
{
    alias проц function(ЦелУкз укз) Virtual_Dispose;
}

extern (C) ЦелУкз wxObject_GetTypeName(ЦелУкз объ);
extern (C) проц   wxObject_dtor(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------
// this is for Локаль gettext support...

//! \cond EXTERN
extern (C) ЦелУкз wxGetTranslation_func(ткст стр);
//! \endcond

export static ткст дайТрансляцию(ткст стр)
{
    return cast(ткст) new ВизТкст(wxGetTranslation_func(стр), да);
}

// in wxWidgets it is a c/c++ macro

export static ткст _(ткст стр)
{
    return cast(ткст) new ВизТкст(wxGetTranslation_func(стр), да);
}

//---------------------------------------------------------------------
/+
template findObject(class T)
T найди(ЦелУкз укз)
{
    Объект o = ВизОбъект.найдиОбъект(укз);
    if (o) return cast(T)o;
    else new T(укз);
}
+/
/// Это корневой класс всех классов wxWidgets.
/// Он декларирует виртуальный деструктор, который гарантирует вызов всех
/// деструкторов объектов производных классов при необходимости.
/**
  * ВизОбъект - хаб схемы создания динамических объектов, позволяющий
  * программме создавать экземпляры класса, зная только его текстовое
  * имя класса, и опрашивать иерархию этого класса.
  **/
export class ВизОбъект : ИВымещаемый
{
    // Ссылка на ассоциированный объект C++.
    public ЦелУкз м_вхобъ = ЦелУкз.init;

    // Хэш-таблица для ассоциации объектов C++ с ссылками Динруса.
    private static ВизОбъект[ЦелУкз] объекты;

    // памСобств = да, когда создаётся новый экземпляр посредством wrapper ctor
    // или если вызов функции-обмотки возвращает новый экземпляр c++.
    // Иначе созданный объект c++ не будет удалён членом "вымести".
    protected бул памСобств = нет;

    export ЦелУкз вхобъ(ЦелУкз объ = ЦелУкз.init){
       if(объ != ЦелУкз.init) м_вхобъ = объ;
		return this.м_вхобъ;
	}

    //---------------------------------------------------------------------

    export this(ЦелУкз объ)
    {
       // synchronized(typeof(ВизОбъект)) {
        this.м_вхобъ = объ;

        if (this.м_вхобъ == ЦелУкз.init)
        {
                throw new ИсклНуллССылки("Не удаётся создать экземпляр " ~ this.вТкст());
        }

        добавьОбъект(this);
        //	}
    }

    export this(ЦелУкз объ, бул памСобств)
    {
        this(объ);
        this.памСобств = памСобств;
    }

    //---------------------------------------------------------------------

    export static ЦелУкз безопУк(ВизОбъект объ)
    {
        return объ ? объ.вхобъ() : ЦелУкз.init;
    }

    //---------------------------------------------------------------------

    export static ткст дайИмяТипа(ЦелУкз объ)
    {
        return cast(ткст) new ВизТкст(wxObject_GetTypeName(объ), да);
    }

    export ткст дайИмяТипа()
    {
        return cast(ткст) new ВизТкст(wxObject_GetTypeName(this.м_вхобъ), да);
    }

    //---------------------------------------------------------------------

    // Регистрирует ВизОбъект, чтобы на него можно было ссылаться,
    // используя указатель на объект С++.

    export static проц добавьОбъект(ВизОбъект объ)
    {
        if (объ.м_вхобъ != ЦелУкз.init)
        {
            объекты[объ.м_вхобъ] = объ;
        }
    }

    //---------------------------------------------------------------------

    // Лоцирует зарегистрированный объект, который ссылается на данный
	// указатель на объект C++.
    //
    // Если указатель не найден, ссылка на объект создаётся
    // с помощью типа.

    alias static ВизОбъект function(ЦелУкз объ) новфункц;

    export static ВизОбъект найдиОбъект(ЦелУкз укз, новфункц Нов)
    {
        if (укз == ЦелУкз.init)
        {
            return пусто;
        }

        ВизОбъект o = найдиОбъект(укз);

        // If the object wasn't found, create it
        //	if (тип != пусто && (o == пусто || o.GetType() != тип)) {
        //		o = (ВизОбъект)Activator.CreateInstance(тип, new object[]{укз});
        //	}
        if (o is пусто)
        {
            o = Нов(укз);
        }

        return o;
    }

    // Лоцирует зарегистрированный объект, который ссылается на данный
	// указатель на объект C++.

    export static ВизОбъект найдиОбъект(ЦелУкз укз)
    {
        if (укз != ЦелУкз.init)
        {
            ВизОбъект *o = укз in объекты;
            if (o) return *o;
        }

        return пусто;
    }

    //---------------------------------------------------------------------

    // Удаляет зарегистрированный объект.
    // Возвращает да, если объект найден в
    // Hashtable и удалён (для вымести)

    export static бул удалиОбъект(ЦелУкз укз)
    {
        бул retval = нет;

        if (укз != ЦелУкз.init)
        {
            if(укз in объекты)
            {
                объекты.remove(укз);
                retval = да;
            }
        }

        return retval;
    }

    //---------------------------------------------------------------------

    // called when an c++ (wx)ВизОбъект dtor gets invoked
    static export extern(C) проц VirtualDispose(ЦелУкз укз)
    {
        найдиОбъект(укз).виртВымести();
    }

    private проц виртВымести()
    {
        удалиОбъект(this.м_вхобъ);
        м_вхобъ = ЦелУкз.init;
    }

    protected проц dtor()
    {
        wxObject_dtor(м_вхобъ);
    }

    export  проц вымести()
    {
        if (м_вхобъ != ЦелУкз.init)
        {
            //	бул still_there = удалиОбъект(вхобъ);

            //	lock (typeof (ВизОбъект)) {
            if (памСобств /*&& still_there*/)
            {
                dtor();
            }
            //	}

            удалиОбъект(м_вхобъ);
            м_вхобъ = ЦелУкз.init;
            //	памСобств = нет;
        }
        //GC.SuppressFinalize(this);
    }

   export ~this()
    {
        вымести();
    }

    export бул вымещен()
    {
        return м_вхобъ==ЦелУкз.init;
    }
}
//////////////////////////////////////////////////////
//////////module wx.VizString;
///public import wx.common;
///version(Dinrus)   private import stdrus;


//! \cond EXTERN
static export extern (C) ЦелУкз  wxString_ctor(ткст стр);
static export extern (C) ЦелУкз  wxString_ctor2(wxChar* стр, т_мера len);
static export extern (C) проц    wxString_dtor(ЦелУкз сам);
static export extern (C) т_мера  wxString_Length(ЦелУкз сам);
static export extern (C) wxChar* wxString_Data(ЦелУкз сам);
static export extern (C) wxChar  wxString_GetChar(ЦелУкз сам, т_мера i);
static export extern (C) проц    wxString_SetChar(ЦелУкз сам, т_мера i, wxChar c);

static export extern (C) т_мера  wxString_ansi_len(ЦелУкз сам);
static export extern (C) т_мера  wxString_ansi_str(ЦелУкз сам, ббайт *буфер, т_мера buflen);
static export extern (C) т_мера  wxString_wide_len(ЦелУкз сам);
static export extern (C) т_мера  wxString_wide_str(ЦелУкз сам, шим *буфер, т_мера buflen);
static export extern (C) т_мера  wxString_utf8_len(ЦелУкз сам);
static export extern (C) т_мера  wxString_utf8_str(ЦелУкз сам, char *буфер, т_мера buflen);
//! \endcond

//---------------------------------------------------------------------

/// ВизТкст is a class representing a character ткст.
export class ВизТкст : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    package this(ЦелУкз вхобъ, бул памСобств)
    {
        super(вхобъ);
        this.памСобств = памСобств;
    }

    export this()
    {
        this("");
    }

    export this(ткст стр)
    {
        this(wxString_ctor(стр), да);
    }

    export this(wxChar* wxstr, т_мера wxlen)
    {
        this(wxString_ctor2(wxstr, wxlen), да);
    }

    //---------------------------------------------------------------------
    override protected проц dtor()
    {
        wxString_dtor(вхобъ);
    }
		//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
    //---------------------------------------------------------------------

    export т_мера длина()
    {
        return wxString_Length(this.м_вхобъ);
    }
    export wxChar* данные()
    {
        return wxString_Data(this.м_вхобъ);
    }
    export wxChar opIndex(т_мера i)
    {
        return wxString_GetChar(this.м_вхобъ, i);
    }
    export проц opIndexAssign(wxChar c, т_мера i)
    {
        wxString_SetChar(this.м_вхобъ, i, c);
    }
    export ткст opCast()
    {
        return this.вТкст();
    }
    export ббайт[] вАнзи()
    {
        т_мера len = wxString_ansi_len(this.м_вхобъ);
        ббайт[] буфер = new ббайт[len + 1]; // include NUL
        len = wxString_ansi_str(this.м_вхобъ, буфер.ptr, буфер.length);
        буфер.length = len;
        return буфер;
    }
    export шим[] вУайд()
    {
        т_мера len = wxString_wide_len(this.м_вхобъ);
        шим[] буфер = new шим[len + 1]; // include NUL
        len = wxString_wide_str(this.м_вхобъ, буфер.ptr, буфер.length);
        буфер.length = len;
        return буфер;
    }
    /+
    version (D_Version2)
    {
        export override ткст вТкст()
        {
            т_мера len = wxString_utf8_len(вхобъ);
            ткст буфер = new char[len + 1]; // include NUL
            len = wxString_utf8_str(вхобъ, буфер.ptr, буфер.length);
            буфер.length = len;
            return примемЗаУникума(буфер);
        }
    }
    +/
  //  else // D_Version1
  //  {
        export ткст вТкст()
        {
            т_мера len = wxString_utf8_len(вхобъ);
            ткст буфер = new char[len + 1]; // include NUL
            len = wxString_utf8_str(this.м_вхобъ, буфер.ptr, буфер.length);
            буфер.length = len;
            return примемЗаУникума(буфер);
        }
   // }
}
//////////////////////////////////////////////////////


export extern(D) class ИсклНуллУказателя : Исключение
{
    export:
    this(ткст сооб)
    {
        super(сооб);
    }
}

export extern(D) class ИсклНуллССылки : Исключение
{
        export:
    this(ткст сооб)
    {
        super(сооб);
    }
}

export extern(D) class ИсклАргумента : Исключение
{
    export:
    this(ткст сооб)
    {
        super(сооб);
    }
}

export extern(D) class ИсклНевернОперации : Исключение
{
        export:
    this(ткст сооб)
    {
        super(сооб);
    }
}

export extern(D) class ИсклНуллАргумента : Исключение
{
        export:
    this(ткст сооб)
    {
        super(сооб);
    }
}

