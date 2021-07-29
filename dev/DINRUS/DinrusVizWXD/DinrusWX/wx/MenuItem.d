module wx.MenuItem;
public import wx.common;
public import wx.Accelerator;
public import wx.Menu;
public import wx.Bitmap;
public import wx.EvtHandler;

//! \cond EXTERN
extern (C) ЦелУкз wxMenuItem_GetMenu(ЦелУкз сам);
extern (C) проц   wxMenuItem_SetMenu(ЦелУкз сам, ЦелУкз меню);
extern (C) проц   wxMenuItem_SetId(ЦелУкз сам, цел ид);
extern (C) цел    wxMenuItem_GetId(ЦелУкз сам);
extern (C) бул   wxMenuItem_IsSeparator(ЦелУкз сам);
extern (C) проц   wxMenuItem_SetText(ЦелУкз сам, ткст стр);
extern (C) ЦелУкз wxMenuItem_GetLabel(ЦелУкз сам);
extern (C) ЦелУкз wxMenuItem_GetText(ЦелУкз сам);
extern (C) ЦелУкз wxMenuItem_GetLabelFromText(ЦелУкз сам, ткст текст);
extern (C) цел    wxMenuItem_GetKind(ЦелУкз сам);
extern (C) проц   wxMenuItem_SetCheckable(ЦелУкз сам, бул чекаемо);
extern (C) бул   wxMenuItem_IsCheckable(ЦелУкз сам);
extern (C) бул   wxMenuItem_IsSubMenu(ЦелУкз сам);
extern (C) проц   wxMenuItem_SetSubMenu(ЦелУкз сам, ЦелУкз меню);
extern (C) ЦелУкз wxMenuItem_GetSubMenu(ЦелУкз сам);
extern (C) проц   wxMenuItem_Enable(ЦелУкз сам, бул вкл);
extern (C) бул   wxMenuItem_IsEnabled(ЦелУкз сам);
extern (C) проц   wxMenuItem_Check(ЦелУкз сам, бул чекать);
extern (C) бул   wxMenuItem_IsChecked(ЦелУкз сам);
extern (C) проц   wxMenuItem_Toggle(ЦелУкз сам);
extern (C) проц   wxMenuItem_SetHelp(ЦелУкз сам, ткст стр);
extern (C) ЦелУкз wxMenuItem_GetHelp(ЦелУкз сам);
extern (C) ЦелУкз wxMenuItem_GetAccel(ЦелУкз сам);
extern (C) проц   wxMenuItem_SetAccel(ЦелУкз сам, ЦелУкз accel);
extern (C) проц   wxMenuItem_SetName(ЦелУкз сам, ткст стр);
extern (C) ЦелУкз wxMenuItem_GetName(ЦелУкз сам);
extern (C) ЦелУкз wxMenuItem_NewCheck(ЦелУкз менюРодитель, цел ид, ткст текст, ткст справка, бул отмечается, ЦелУкз подМеню);
extern (C) ЦелУкз wxMenuItem_New(ЦелУкз менюРодитель, цел ид, ткст текст, ткст справка, цел вид, ЦелУкз подМеню);
//extern (C) проц   wxMenuItem_SetBitmap(ЦелУкз сам, ЦелУкз битмап);
//extern (C) ЦелУкз wxMenuItem_GetBitmap(ЦелУкз сам);
extern (C) ЦелУкз wxMenuItem_ctor(ЦелУкз менюРодитель, цел ид, ткст текст, ткст справка, цел вид, ЦелУкз подМеню);
//! \endcond

//-----------------------------------------------------------------------------

export class ЭлтМеню : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export  this(Меню менюРодитель = пусто, цел ид =  СЕПАРАТОР, ткст текст = "", ткст справка = "", ПВидЭлта вид = ПВидЭлта.Нормальный, Меню подМеню = пусто)
    {
        this(wxMenuItem_ctor(ВизОбъект.безопУк(менюРодитель), ид, текст, справка, cast(цел)вид, ВизОбъект.безопУк(подМеню)));
    }

    export static ВизОбъект Нов2(ЦелУкз ptr)
    {
        return new ЭлтМеню(ptr);
    }
    //-----------------------------------------------------------------------------

    export static ЭлтМеню Нов(Меню менюРодитель = пусто, цел ид = СЕПАРАТОР, ткст текст = "", ткст справка = "", ПВидЭлта вид=ПВидЭлта.Нормальный, Меню подМеню = пусто)
    {
        return new ЭлтМеню(wxMenuItem_New(ВизОбъект.безопУк(менюРодитель), ид, текст, справка, cast(цел)вид, ВизОбъект.безопУк(подМеню)));
    }
    /* OLD API
    	export static ЭлтМеню Нов(Меню менюРодитель, цел ид, ткст текст, ткст справка, бул отмечается, Меню подМеню)
    	{
    		return new ЭлтМеню(wxMenuItem_NewCheck(ВизОбъект.безопУк(менюРодитель), ид, текст, справка, отмечается, ВизОбъект.безопУк(подМеню)));
    	}

    */	//-----------------------------------------------------------------------------

    export Меню меню()
    {
        return cast(Меню)найдиОбъект(wxMenuItem_GetMenu(вхобъ), &Меню.Нов);
    }
    export проц меню(Меню значение)
    {
        wxMenuItem_SetMenu(вхобъ, ВизОбъект.безопУк(значение));
    }

    //-----------------------------------------------------------------------------

    export цел ид()
    {
        return wxMenuItem_GetId(вхобъ);
    }
    export проц ид(цел значение)
    {
        wxMenuItem_SetId(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export бул сепаратор_ли()
    {
        return wxMenuItem_IsSeparator(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц текст(ткст значение)
    {
        wxMenuItem_SetText(вхобъ, значение);
    }
    export ткст текст()
    {
        return cast(ткст) new ВизТкст(wxMenuItem_GetText(вхобъ), да);
    }

    //-----------------------------------------------------------------------------

    export ткст ярлык()
    {
        return cast(ткст) new ВизТкст(wxMenuItem_GetLabel(вхобъ), да);
    }

    //-----------------------------------------------------------------------------

    export ткст дайЯрлыкИзТкста(ткст текст)
    {
        return cast(ткст) new ВизТкст(wxMenuItem_GetLabelFromText(вхобъ, текст), да);
    }

    //-----------------------------------------------------------------------------

    export ПВидЭлта вид()
    {
        return cast(ПВидЭлта)wxMenuItem_GetKind(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц отмечается(бул значение)
    {
        wxMenuItem_SetCheckable(вхобъ, значение);
    }
    export бул отмечается()
    {
        return wxMenuItem_IsCheckable(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул подменю_ли()
    {
        return wxMenuItem_IsSubMenu(вхобъ);
    }

    export проц подменю(Меню значение)
    {
        wxMenuItem_SetSubMenu(вхобъ, ВизОбъект.безопУк(значение));
    }
    export Меню подменю()
    {
        return cast(Меню)найдиОбъект(wxMenuItem_GetSubMenu(вхобъ), &Меню.Нов);
    }

    //-----------------------------------------------------------------------------

    export проц активен(бул значение)
    {
        wxMenuItem_Enable(вхобъ, значение);
    }
    export бул активен()
    {
        return wxMenuItem_IsEnabled(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц отмечен(бул значение)
    {
        wxMenuItem_Check(вхобъ, значение);
    }
    export бул отмечен()
    {
        return wxMenuItem_IsChecked(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц переключи()
    {
        wxMenuItem_Toggle(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц справка(ткст значение)
    {
        wxMenuItem_SetHelp(вхобъ, значение);
    }
    export ткст справка()
    {
        return cast(ткст) new ВизТкст(wxMenuItem_GetHelp(вхобъ), да);
    }

    //-----------------------------------------------------------------------------

    export ЗаписьАкселератора аксель()
    {
        return cast(ЗаписьАкселератора)найдиОбъект(wxMenuItem_GetAccel(вхобъ), &ЗаписьАкселератора.Нов);
    }
    export проц аксель(ЗаписьАкселератора значение)
    {
        wxMenuItem_SetAccel(вхобъ, ВизОбъект.безопУк(значение));
    }

    //-----------------------------------------------------------------------------

    export проц имя(ткст значение)
    {
        wxMenuItem_SetName(вхобъ, значение);
    }
    export ткст имя()
    {
        return cast(ткст) new ВизТкст(wxMenuItem_GetName(вхобъ), да);
    }

    //-----------------------------------------------------------------------------
    /+
    export проц битмап(Битмап значение)
    {
        wxMenuItem_SetBitmap(вхобъ, ВизОбъект.безопУк(значение));
    }
    export Битмап битмап()
    {
        return cast(Битмап)найдиОбъект(wxMenuItem_GetBitmap(вхобъ), &Битмап.Нов);
    }
    +/
    //---------------------------------------------------------------------

    export проц добавьНажатие(ДатчикСобытий значение)
    {
        this.меню.добавьСобытие(ид, значение, this);
    }
    export проц удалиНажатие(ДатчикСобытий значение) { }

    export проц Select_Add(ДатчикСобытий значение)
    {
        this.меню.добавьСобытие(ид, значение, this);
    }
    export проц Select_Remove(ДатчикСобытий значение) { }
}

