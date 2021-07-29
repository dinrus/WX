module wx.App;
public import wx.common;
public import wx.EvtHandler;
public import wx.Window;
public import wx.GdiCommon;
public import wx.Clipboard;
public import wx.FontMisc;

version(Dinrus) private import stdrus;

version(Rulada)
{
	import tango.stdc.stringz;
	import std.utf;
	alias std.utf.toUTF8 вЮ8;
	alias tango.stdc.stringz.toStringz вТкст0;
}


//! \cond EXTERN
extern (C)
{
    alias бул function(Приложение o) Virtual_OnInit;
    alias цел  function(Приложение o) Virtual_OnRun;
    alias цел  function(Приложение o) Virtual_OnExit;
    alias бул function(Приложение o,inout цел argc,ткст0* argv) Virtual_Initialize;
}

extern (C) ЦелУкз wxApp_ctor();
extern (C) проц wxApp_RegisterVirtual(ЦелУкз сам, Приложение o, Virtual_OnInit onInit, Virtual_OnRun onRun, Virtual_OnExit onExit, Virtual_Initialize initalize);
extern (C) бул wxApp_Initialize(ЦелУкз сам,inout цел argc,ткст0* argv);
extern (C) бул wxApp_OnInit(ЦелУкз сам);
extern (C) бул wxApp_OnRun(ЦелУкз сам);
extern (C) цел wxApp_OnExit(ЦелУкз сам);

extern (C) проц   wxApp_Run(цел argc, ткст0* argv);

extern (C) проц   wxApp_SetVendorName(ЦелУкз сам, ткст имя);
extern (C) ЦелУкз wxApp_GetVendorName(ЦелУкз сам);

extern (C) проц   wxApp_SetAppName(ЦелУкз сам, ткст имя);
extern (C) ЦелУкз wxApp_GetAppName(ЦелУкз сам);

extern (C) проц   wxApp_SetTopWindow(ЦелУкз сам, ЦелУкз окно);
extern (C) ЦелУкз wxApp_GetTopWindow(ЦелУкз сам);

extern (C) бул   wxApp_SafeYield(ЦелУкз ок, бул толькоПриНеобх);
extern (C) бул   wxApp_Yield(ЦелУкз сам, бул толькоПриНеобх);
extern (C) проц   wxApp_WakeUpIdle();
extern (C) проц   wxApp_ExitMainLoop(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

static export extern(C) бул staticInitialize(Приложение o,inout цел argc,ткст0* argv)
{
	return o.иниц(argc,argv);
}

static export extern(C) бул staticOnInit(Приложение o)
{
	БуферОбмена.иниц();
	try return o.поИниц();
	catch(Объект e) o.ловиИскл(e);
	return нет;
}

static export extern(C) цел  staticOnRun(Приложение o)
{
	return o.поПуску();
}

static export extern(C) цел  staticOnExit(Приложение o)
{
	return o.поВыходу();
}
//---------------------------------------------------------------------

/// Класс Приложение представляет само приложение.
/**
  * Он используется для:
  * - установки и получения свойств по всему приложению;
  * - реализации цикла событий и сообщений оконной системы;
  * - инициализации обработки приложения посредством Приложение.поИниц;
  * - разрешить дефолтную обработку событий, не проводимую другими объектами приложения.
  **/
export abstract class Приложение : ОбработчикСоб
{

    private static Приложение app;
    private Объект м_схваченноеИскл = пусто;
	
    export проц ловиИскл(Объект e)
    {
        м_схваченноеИскл=e;
    }

    //---------------------------------------------------------------------

    export this()
    {
        super(wxApp_ctor());
        app = this;

        МапперШрифта.иниц();

        wxApp_RegisterVirtual(this.м_вхобъ, this, &staticOnInit, &staticOnRun, &staticOnExit, &staticInitialize);
    }

    //---------------------------------------------------------------------


    export бул иниц(inout цел argc,ткст0* argv)
    {
        бул ret = wxApp_Initialize(this.м_вхобъ, argc,argv);
        иницСтокОбъекты();
        return ret;
    }

    export  бул поИниц()
    {
        return wxApp_OnInit(this.м_вхобъ);
    }

    export  цел поПуску()
    {
        return wxApp_OnRun(this.м_вхобъ);
    }

    export  цел поВыходу()
    {
        return wxApp_OnExit(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

    export static Приложение дайПриложение()
    {
        return app;
    }

    //---------------------------------------------------------------------

    export проц пуск()
    {
        ткст[] арги; // = Environment.GetCommandLineArgs();
        арги.length = 1;
        арги[0] = "wx".dup;
        пуск(арги);
    }

    export проц пуск(ткст[] арги)
    {
        ткст0[] c_args = new ткст0[арги.length];
        foreach (цел i, ткст arg; арги)
        {
            ткст стр = примемЗаУникума(arg);
            c_args[i] = cast(ткст0) вТкст0(вЮ8(стр));
        }

        wxApp_Run(c_args.length, c_args.ptr);

        if(м_схваченноеИскл)
        {
            Объект e=м_схваченноеИскл;
            //Возможно пользователь выловил это исключение и запускает
            //приложение снова, значит, нужно зачистить
            м_схваченноеИскл=пусто;
            throw e;
        }
    }

    //---------------------------------------------------------------------

    export ткст имяВендора()
    {
        return cast(ткст) new ВизТкст(wxApp_GetVendorName(this.м_вхобъ), да);
    }
    export проц имяВендора(ткст имя)
    {
        wxApp_SetVendorName(this.м_вхобъ, имя);
    }
    export ткст имяПриложения()
    {
        return cast(ткст) new ВизТкст(wxApp_GetAppName(this.м_вхобъ), да);
    }
    export проц имяПриложения(ткст имя)
    {
        wxApp_SetAppName(this.м_вхобъ, имя);
    }

    //---------------------------------------------------------------------

    export Окно топОкно()
    {
        return cast(Окно) найдиОбъект(wxApp_GetTopWindow(this.м_вхобъ));
    }
    export проц топОкно(Окно окно)
    {
        wxApp_SetTopWindow(this.м_вхобъ, окно.вхобъ);
    }

    //---------------------------------------------------------------------

    export static бул безопЖни()
    {
        return wxApp_SafeYield(ВизОбъект.безопУк(пусто), нет);
    }
	
    export static бул безопЖни(Окно ок)
    {
        return wxApp_SafeYield(ВизОбъект.безопУк(ок), нет);
    }
	
    export static бул безопЖни(Окно ок, бул толькоПриНеобх)
    {
        return wxApp_SafeYield(ВизОбъект.безопУк(ок), толькоПриНеобх);
    }
	
    export бул жни()
    {
        return wxApp_Yield(this.м_вхобъ, нет);
    }
	
    export бул жни(бул толькоПриНеобх)
    {
        return wxApp_Yield(this.м_вхобъ, толькоПриНеобх);
    }

    //---------------------------------------------------------------------

    export static проц побудка()
    {
        wxApp_WakeUpIdle();
    }

    export проц выйдиИзГлавнЦикла()
    {
        wxApp_ExitMainLoop(this.м_вхобъ);
    }

    //---------------------------------------------------------------------
}
