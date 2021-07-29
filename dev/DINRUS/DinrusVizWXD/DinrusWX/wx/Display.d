module wx.Display;
public import wx.common;

public import wx.VideoMode;
public import wx.Window;

//version(LDC) { pragma(ldc, "verbose") }

//! \cond EXTERN
extern (C) ЦелУкз wxDisplay_ctor(цел индекс);
//extern (C) ЦелУкз wxDisplay_ctor(inout ВидеоРежим режим);
extern (C) цел wxDisplay_GetCount();
extern (C) цел wxDisplay_GetFromPoint(inout Точка тчк);
extern (C) цел wxDisplay_GetFromWindow(ЦелУкз окно);
extern (C) проц wxDisplay_GetGeometry(ЦелУкз сам, out Прямоугольник прям);
extern (C) ЦелУкз wxDisplay_GetName(ЦелУкз сам);
extern (C) бул wxDisplay_IsPrimary(ЦелУкз сам);
extern (C) проц wxDisplay_GetCurrentMode(ЦелУкз сам, out ВидеоРежим режим);
extern (C) бул wxDisplay_ChangeMode(ЦелУкз сам, ВидеоРежим режим);


extern (C) цел wxDisplay_GetNumModes(ЦелУкз сам, ВидеоРежим режим);
extern (C) проц wxDisplay_GetModes(ЦелУкз сам, ВидеоРежим режим, inout ВидеоРежим[] режимы);


extern (C) проц wxDisplay_ResetMode(ЦелУкз сам);
extern (C) проц wxDisplay_dtor(ЦелУкз сам);
//! \endcond


export class Дисплей : ВизОбъект
{
    //------------------------------------------------------------------------

    // Symbolic constant used by all найди()-like functions returning positive
    // integer on success as failure indicator. While this is global in
    // wxWidgets it makes more sense до be in each class that uses it???
    // Or maybe move it до Окно.cs.
    public const цел НЕ_НАЙДЕН = -1;

    //------------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    private this(ЦелУкз вхобъ, бул памСобств)
    {
        super(вхобъ);
        this.памСобств = памСобств;
    }

    //------------------------------------------------------------------------

    export this(цел индекс)
    {
        this(wxDisplay_ctor(индекс), да);
    }

    //------------------------------------------------------------------------

    //export this(ВидеоРежим режим)
    //	{ this(wxDisplay_ctor(режим), да); }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxDisplay_dtor(вхобъ);
    }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
    //------------------------------------------------------------------------
    static цел счёт()
    {
        return wxDisplay_GetCount();
    }

    // Массив из всех Дисплеев, индексированных номером
    export static Дисплей[] дайДисплеи()
    {
        цел счёт = счёт;
        Дисплей[] displays = new Дисплей[счёт];
        for (цел i = 0; i < счёт; i++)
        {
            displays[i] = new Дисплей(i);
        }
        return displays;
    }

    //------------------------------------------------------------------------
    // An массив of available VideoModes for this display.
     export ВидеоРежим[] дайРежимы()
    {
        return дайРежимы(ВидеоРежим(0,0,0,0));
    }

    // An массив of the VideoModes that match режим. A match occurs when
    // the resolution and глубь matches and the освежи frequency in
    // equal до or greater than режим.RefreshFrequency.
     export ВидеоРежим[] дайРежимы(ВидеоРежим режим)
    {
        цел члоРежимов = wxDisplay_GetNumModes(вхобъ, режим);
        ВидеоРежим[] режимы = new ВидеоРежим[члоРежимов];
        wxDisplay_GetModes(вхобъ, режим, режимы);
        return режимы;
    }


    //------------------------------------------------------------------------

    export static цел дайИзТочки(Точка тчк)
    {
        return wxDisplay_GetFromPoint(тчк);
    }

    //------------------------------------------------------------------------

     export цел дайИзОкна(Окно окно)
    {
        version(__WXMSW__)
        {
            return wxDisplay_GetFromWindow(ВизОбъект.безопУк(окно));
        }
        else
        {
            throw new Исключение("дисплей.дайИзОкна доступен только для WIN32");
        } // version(__WXMSW__)
    }

    //------------------------------------------------------------------------

     export Прямоугольник геометрия()
    {
        Прямоугольник прям;
        wxDisplay_GetGeometry(вхобъ, прям);
        return прям;
    }

    //------------------------------------------------------------------------

     export ткст имя()
    {
        return cast(ткст) new ВизТкст(wxDisplay_GetName(вхобъ), да);
    }

    //------------------------------------------------------------------------

     export бул первичен()
    {
        return wxDisplay_IsPrimary(вхобъ);
    }

    //------------------------------------------------------------------------


     export ВидеоРежим текущРежим()
    {
        ВидеоРежим режим;
        wxDisplay_GetCurrentMode(вхобъ, режим);
        return режим;
    }

    //------------------------------------------------------------------------

     export бул смениРежим(ВидеоРежим режим)
    {
        return wxDisplay_ChangeMode(вхобъ, режим);
    }

    //------------------------------------------------------------------------

     export проц сбросьРежим()
    {
        wxDisplay_ResetMode(вхобъ);
    }

    //------------------------------------------------------------------------

}

