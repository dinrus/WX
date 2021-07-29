module wx.XmlResource;
public import wx.common;
public import wx.Dialog;

public import wx.Window;

public import wx.Frame;

public import wx.Menu;

public import wx.MenuBar;

public import wx.Panel;

public import wx.ToolBar;

version(Dinrus) private import stdrus;

public enum ПФлагиРЯРРесурса : цел
{
    ИспользоватьЛокаль     = 1,
    БезПодклассов = 2
};

//! \cond EXTERN
extern (C) проц wxXmlResource_InitAllHandlers(ЦелУкз сам);
extern (C) бул wxXmlResource_Load(ЦелУкз сам, ткст маскаФайла);
extern (C) бул wxXmlResource_LoadFromByteArray(ЦелУкз сам, ткст маскаФайла, ЦелУкз данные, цел length);
extern (C) ЦелУкз wxXmlResource_LoadDialog(ЦелУкз сам, ЦелУкз родитель, ткст имя);
extern (C) бул wxXmlResource_LoadDialogDlg(ЦелУкз сам, ЦелУкз dlg, ЦелУкз родитель, ткст имя);
extern (C) цел wxXmlResource_GetXRCID(ткст стр_ид);
extern (C) ЦелУкз wxXmlResource_ctorByFilemask(ткст маскаФайла, цел флаги);
extern (C) ЦелУкз wxXmlResource_ctor(цел флаги);
extern (C) бцел wxXmlResource_GetVersion(ЦелУкз сам);
extern (C) бул wxXmlResource_LoadFrameWithFrame(ЦелУкз сам, ЦелУкз рамка, ЦелУкз родитель, ткст имя);
extern (C) ЦелУкз wxXmlResource_LoadFrame(ЦелУкз сам, ЦелУкз родитель, ткст имя);
extern (C) ЦелУкз wxXmlResource_LoadBitmap(ЦелУкз сам, ткст имя);
extern (C) ЦелУкз wxXmlResource_LoadIcon(ЦелУкз сам, ткст имя);
extern (C) ЦелУкз wxXmlResource_LoadMenu(ЦелУкз сам, ткст имя);
extern (C) ЦелУкз wxXmlResource_LoadMenuBarWithParent(ЦелУкз сам, ЦелУкз родитель, ткст имя);
extern (C) ЦелУкз wxXmlResource_LoadMenuBar(ЦелУкз сам, ткст имя);
extern (C) бул wxXmlResource_LoadPanelWithPanel(ЦелУкз сам, ЦелУкз панель, ЦелУкз родитель, ткст имя);
extern (C) ЦелУкз wxXmlResource_LoadPanel(ЦелУкз сам, ЦелУкз родитель, ткст имя);
extern (C) ЦелУкз wxXmlResource_LoadToolBar(ЦелУкз сам, ЦелУкз родитель, ткст имя);
extern (C) цел wxXmlResource_SetFlags(ЦелУкз сам, цел флаги);
extern (C) цел wxXmlResource_GetFlags(ЦелУкз сам);
extern (C) проц wxXmlResource_UpdateResources(ЦелУкз сам);
extern (C) цел wxXmlResource_CompareVersion(ЦелУкз сам, цел майор, цел минор, цел релиз, цел ревизия);
extern (C) бул wxXmlResource_AttachUnknownControl(ЦелУкз сам, ткст имя, ЦелУкз контрол, ЦелУкз родитель);

//---------------------------------------------------------------------

extern (C)
{
    alias ЦелУкз function(ткст имяКласса) XmlSubclassCreate;
}

extern (C) бул wxXmlSubclassFactory_ctor(XmlSubclassCreate create);
//! \endcond

export class РЯРРесурс : ВизОбъект
{
    public static РЯРРесурс глобальныйРЯРРесурс = пусто;

    //---------------------------------------------------------------------

    static this()
    {
        m_create = cast(XmlSubclassCreate)&создайПодклассРЯР;
        wxXmlSubclassFactory_ctor(m_create);
    }
    private static проц устДефолтыПодкласса() {}

    /+
    // Устs the default assembly/namespace based on the assembly от
    // который this метод is called (i.e. your assembly!).
    //
    // Determines these by walking a stack trace. Normally
    // Assembly.GetCallingAssembly should work кноп in my tests it
    // returned the current assembly in the static constructor above.
    private static проц устДефолтыПодкласса()
    {
        ткст my_assembly = Assembly.GetExecutingAssembly().GetName().имя;
        StackTrace st = new StackTrace();

        for (цел i = 0; i < st.FrameCount; ++i)
        {
            тип тип = st.GetFrame(i).GetMethod().ReflectedType;
            ткст st_assembly = тип.Assembly.GetName().имя;
            if (st_assembly != my_assembly)
            {
                _CallerNamespace = тип.Namespace;
                _CallerAssembly = st_assembly;
                stdout.writeLine("Устting sub-class default assembly до {0}, namespace до {1}", _CallerAssembly, _CallerNamespace);
                break;
            }
        }
    }

    // дай/set the assembly used for sub-classing. If this is not set, the
    // assembly of the class that invokes one of the LoadXXX() methods
    // will be used. This property is only used if an assembly is not
    // specified in the XRC XML subclass property via the [assembly]class
    // syntax.
    static проц SubclassAssembly(ткст значение)
    {
        _SubclassAssembly = значение;
    }
    static ткст SubclassAssembly()
    {
        return _SubclassAssembly;
    }
    static ткст _SubclassAssembly;

    // дай/set the namespace that is pre-pended до class names in sub-classing.
    // This is only used if class имя does not have a dot (.) in it. If
    // this is not specified and the class does not already have a namespace
    // specified, the namespace of the class который invoked the LoadXXX() метод
    // is used.
    static проц SubclassNamespace(ткст значение)
    {
        _SubclassNamespace = значение;
    }
    static ткст SubclassNamespace()
    {
        return _SubclassNamespace;
    }
    static ткст _SubclassNamespace;

    // Defaults set via LoadXXX() methods
    private static ткст _CallerAssembly;
    private static ткст _CallerNamespace;
    +/

    //---------------------------------------------------------------------

    export this()
    {
        this(ПФлагиРЯРРесурса.ИспользоватьЛокаль);
    }

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(ПФлагиРЯРРесурса флаги)
    {
        this(wxXmlResource_ctor(cast(цел)флаги));
    }

    export this(ткст маскаФайла, ПФлагиРЯРРесурса флаги)
    {
        this(wxXmlResource_ctorByFilemask(маскаФайла,cast(цел)флаги));
    }

    //---------------------------------------------------------------------

    export static РЯРРесурс дай()
    {
        if (глобальныйРЯРРесурс is пусто)
        {
            глобальныйРЯРРесурс = new РЯРРесурс();
        }

        return глобальныйРЯРРесурс;
    }

    //---------------------------------------------------------------------

    export static РЯРРесурс установи(РЯРРесурс res)
    {
        РЯРРесурс old = глобальныйРЯРРесурс;
        глобальныйРЯРРесурс = res;
        return old;
    }

    //---------------------------------------------------------------------

    export проц иницВсеОбработчики()
    {
        wxXmlResource_InitAllHandlers(вхобъ);
    }

    //---------------------------------------------------------------------

    export бул загрузи(ткст маскаФайла)
    {
        return wxXmlResource_Load(вхобъ,маскаФайла);
    }

    //---------------------------------------------------------------------

    export Диалог загрузиДиалог(Окно родитель, ткст имя)
    {
        устДефолтыПодкласса();
        ЦелУкз ptr = wxXmlResource_LoadDialog(вхобъ,ВизОбъект.безопУк(родитель),имя);
        if (ptr != ЦелУкз.init)
            return new Диалог(ptr);
        else
            return пусто;
    }

    //---------------------------------------------------------------------

    export бул загрузиДиалог(Диалог dlg, Окно родитель, ткст имя)
    {
        устДефолтыПодкласса();
        return wxXmlResource_LoadDialogDlg(вхобъ,ВизОбъект.безопУк(dlg),ВизОбъект.безопУк(родитель),имя);
    }

    //---------------------------------------------------------------------

    export static цел ДайРЯРКид(ткст стр_ид)
    {
        return wxXmlResource_GetXRCID(стр_ид);
    }

    //---------------------------------------------------------------------

    export static цел РЯРКид(ткст стр_ид)
    {
        return wxXmlResource_GetXRCID(стр_ид);
    }

    //---------------------------------------------------------------------

    export цел версия()
    {
        return wxXmlResource_GetVersion(вхобъ);
    }

    //---------------------------------------------------------------------

    export бул загрузиРамку(Рамка рамка, Окно родитель, ткст имя)
    {
        устДефолтыПодкласса();
        return wxXmlResource_LoadFrameWithFrame(вхобъ, ВизОбъект.безопУк(рамка), ВизОбъект.безопУк(родитель), имя);
    }

    //---------------------------------------------------------------------

    export Рамка загрузиРамку(Окно родитель, ткст имя)
    {
        устДефолтыПодкласса();
        ЦелУкз ptr = wxXmlResource_LoadFrame(вхобъ,ВизОбъект.безопУк(родитель),имя);
        if (ptr != ЦелУкз.init)
            return new Рамка(ptr);
        else
            return пусто;
    }

    //---------------------------------------------------------------------

    export Меню загрузиМеню(ткст имя)
    {
        устДефолтыПодкласса();
        ЦелУкз ptr = wxXmlResource_LoadMenu(вхобъ, имя);
        if (ptr != ЦелУкз.init)
            return new Меню(ptr);
        else
            return пусто;
    }

    //---------------------------------------------------------------------

    export МенюБар загрузиМенюбар(Окно родитель, ткст имя)
    {
        устДефолтыПодкласса();
        ЦелУкз ptr = wxXmlResource_LoadMenuBarWithParent(вхобъ, ВизОбъект.безопУк(родитель), имя);
        if (ptr != ЦелУкз.init)
            return new МенюБар(ptr);
        else
            return пусто;
    }

    //---------------------------------------------------------------------

    export МенюБар загрузиМенюбар(ткст имя)
    {
        устДефолтыПодкласса();
        ЦелУкз ptr = wxXmlResource_LoadMenuBar(вхобъ, имя);
        if (ptr != ЦелУкз.init)
            return new МенюБар(ptr);
        else
            return пусто;
    }

    //---------------------------------------------------------------------

    export бул загрузиПанель(Панель панель, Окно родитель, ткст имя)
    {
        устДефолтыПодкласса();
        return wxXmlResource_LoadPanelWithPanel(вхобъ, ВизОбъект.безопУк(панель), ВизОбъект.безопУк(родитель), имя);
    }

    //---------------------------------------------------------------------

    export Панель загрузиПанель(Окно родитель, ткст имя)
    {
        устДефолтыПодкласса();
        ЦелУкз ptr = wxXmlResource_LoadPanel(вхобъ, ВизОбъект.безопУк(родитель), имя);
        if (ptr != ЦелУкз.init)
            return new Панель(ptr);
        else
            return пусто;
    }

    //---------------------------------------------------------------------

    export Тулбар загрузиТулбар(Окно родитель, ткст имя)
    {
        устДефолтыПодкласса();
        ЦелУкз ptr = wxXmlResource_LoadToolBar(вхобъ, ВизОбъект.безопУк(родитель), имя);
        if (ptr != ЦелУкз.init)
            return new Тулбар(ptr);
        else
            return пусто;
    }

    //---------------------------------------------------------------------

    export проц флаги(ПФлагиРЯРРесурса значение)
    {
        wxXmlResource_SetFlags(вхобъ, cast(цел)значение);
    }
    export ПФлагиРЯРРесурса флаги()
    {
        return cast(ПФлагиРЯРРесурса)wxXmlResource_GetFlags(вхобъ);
    }

    //---------------------------------------------------------------------
    /+
    export проц UpdateResources()
    {
        wxXmlResource_UpdateResources(вхобъ);
    }
    +/
    //---------------------------------------------------------------------

    export Битмап загрузиБитмап(ткст имя)
    {
        return new Битмап(wxXmlResource_LoadBitmap(вхобъ, имя));
    }

    //---------------------------------------------------------------------

    export Пиктограмма загрузиИконку(ткст имя)
    {
        return new Пиктограмма(wxXmlResource_LoadIcon(вхобъ, имя));
    }

    //---------------------------------------------------------------------

    export цел сравниВерсию(цел майор, цел минор, цел релиз, цел ревизия)
    {
        return wxXmlResource_CompareVersion(вхобъ, майор, минор, релиз, ревизия);
    }

    //---------------------------------------------------------------------

    export бул приторочьНеизвестныйКонтрол(ткст имя, Окно контрол)
    {
        return приторочьНеизвестныйКонтрол(имя, контрол, пусто);
    }

    export бул приторочьНеизвестныйКонтрол(ткст имя, Окно контрол, Окно родитель)
    {
        return wxXmlResource_AttachUnknownControl(вхобъ, имя, ВизОбъект.безопУк(контрол), ВизОбъект.безопУк(родитель));
    }

    //---------------------------------------------------------------------

    export static ВизОбъект РЯРКТРЛ(Окно окно, ткст ид, новфункц функц)
    {
        return окно.найдиОкно(РЯРКид(ид), функц);
    }

    export static ВизОбъект дайКонтрол(Окно окно, ткст ид, новфункц функц)
    {
        return РЯРКТРЛ(окно, ид, функц);
    }
    //---------------------------------------------------------------------
    // РЯРРесурс контрол subclassing

    private static XmlSubclassCreate m_create; // = cast(XmlSubclassCreate)&создайПодклассРЯР;
    //private static ЦелУкз function(ткст имяКласса) m_create = &создайПодклассРЯР;

    export static extern(C) ЦелУкз создайПодклассРЯР(ткст имяКласса)
    {
        /+
        ткст имя = имяКласса;
        ткст assembly = пусто;
        // позволить these two formats for for class names:
        //   class
        //   [assembly]class (specify assembly)

        Match m = Regex.Match(имя, "\\[(.+)\\]");
        if (m.Success)
        {
            assembly = m.Result("$1");
            имя = m.Result("$'");
        }
        else
        {
            assembly = _SubclassAssembly;
        }

        // Use caller'т assembly?
        if ((assembly == пусто) || (assembly == ""))
            assembly = _CallerAssembly;

        // Tack on any namespace префикс до the class? Only if the
        // class does not already have a "." in it
        if (имя.IndexOf(".") == -1)
        {
            ткст ns = "";
            // Use caller'т namespace?
            if ((_SubclassNamespace == пусто) || (_SubclassNamespace == ""))
                ns = _CallerNamespace;
            else
                ns = _SubclassNamespace;
            имя = ns + "." + имя;
        }

        try
        {
            stdout.writeLine("Attempting до create " ~ имя ~ " от assembly " ~ assembly);
            //	ObjectHandle handle = Activator.CreateInstance(assembly, имя);

            if (handle === пусто)
            {
                return ЦелУкз.init;
            }

            ВизОбъект o = cast(ВизОбъект)handle.Unwrap();
            return o.вхобъ;
        }
        catch (Исключение e)
        {
            stdout.writeLine(e);

            return ЦелУкз.init;
        }
        +/
        return ЦелУкз.init;
    }

}
