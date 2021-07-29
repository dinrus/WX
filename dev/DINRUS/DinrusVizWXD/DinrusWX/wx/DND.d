module wx.DND;
public import wx.common;
public import wx.DataObject;
public import wx.Window;

public enum ПТяг
{
    ТолькоКопировать    = 0,
    ПеремещениеВозможно   = 1,
    ДефПеремещение = 3
}

//---------------------------------------------------------------------

public enum ПРезультатТяга
{
    Ошибка,
    Никакой,
    Копирование,
    Перемещение,
    Линк,
    Отмена
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C)
{
    alias цел function(ИстокБроса объ, цел флаги) Virtual_DoDragDrop;
}

extern (C) ЦелУкз wxDropSource_Win_ctor(ЦелУкз ок);
extern (C) ЦелУкз wxDropSource_DataObject_ctor(ЦелУкз объДанных, ЦелУкз ок);
extern (C) проц wxDropSource_dtor(ЦелУкз сам);
extern (C) проц wxDropSource_RegisterVirtual(ЦелУкз сам, ИстокБроса объ, Virtual_DoDragDrop doDragDrop);
extern (C) цел wxDropSource_DoDragDrop(ЦелУкз сам, цел флаги);
extern (C) проц wxDropSource_SetData(ЦелУкз сам, ЦелУкз объДанных);
//! \endcond

//---------------------------------------------------------------------


export class ИстокБроса : ВизОбъект
{
    protected ОбъектДанных m_dataObject = пусто;

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    private this(ЦелУкз вхобъ, бул памСобств)
    {
        super(вхобъ);
        this.памСобств = памСобств;
    }

    export this(Окно ок = пусто)
    {
        this(wxDropSource_Win_ctor(ВизОбъект.безопУк(ок)), да);
        m_dataObject = пусто;

        wxDropSource_RegisterVirtual( м_вхобъ, this, &staticDoDoDragDrop );
    }

    export this(ОбъектДанных объДанных, Окно ок = пусто)
    {
        this(wxDropSource_DataObject_ctor(ВизОбъект.безопУк(объДанных), ВизОбъект.безопУк(ок)), да);
        m_dataObject = объДанных;

        wxDropSource_RegisterVirtual( м_вхобъ, this, &staticDoDoDragDrop );
    }

    //---------------------------------------------------------------------
    override protected проц dtor()
    {
        wxDropSource_dtor(м_вхобъ);
    }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
    //---------------------------------------------------------------------

    static export extern (C) цел staticDoDoDragDrop(ИстокБроса объ,цел флаги)
    {
        return cast(цел)объ.делайТягБрос(флаги);
    }

    export  ПРезультатТяга делайТягБрос(цел флаги)
    {
        return cast(ПРезультатТяга)wxDropSource_DoDragDrop(м_вхобъ, флаги);
    }

    //---------------------------------------------------------------------

    export ОбъектДанных объДанных()
    {
        return m_dataObject;
    }
    export проц объДанных(ОбъектДанных значение)
    {
        m_dataObject = значение;
        wxDropSource_SetData(м_вхобъ, ВизОбъект.безопУк(значение));
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C)
{
    alias цел  function(МишеньСброса объ, цел x, цел y, цел def) Virtual_OnDragOver;
    alias бул function(МишеньСброса объ, цел x, цел y) Virtual_OnDrop;
    alias цел  function(МишеньСброса объ, цел x, цел y, цел def) Virtual_OnData3;
    alias бул function(МишеньСброса объ) Virtual_GetData;
    alias проц function(МишеньСброса объ) Virtual_OnLeave;
    alias цел  function(МишеньСброса объ, цел x, цел y, цел def) Virtual_OnEnter;
}
//! \endcond

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxDropTarget_ctor(ЦелУкз объДанных);
extern (C) проц wxDropTarget_dtor(ЦелУкз сам);
extern (C) проц wxDropTarget_RegisterVirtual(ЦелУкз сам, МишеньСброса объ, Virtual_OnDragOver onDragOver, Virtual_OnDrop onDrop, Virtual_OnData3 onData, Virtual_GetData getData, Virtual_OnLeave onLeave, Virtual_OnEnter onEnter);
extern (C) проц   wxDropTarget_RegisterDisposable(ЦелУкз сам, Virtual_Dispose onDispose);
extern (C) проц   wxDropTarget_SetDataObject(ЦелУкз сам, ЦелУкз объДанных);
extern (C) цел wxDropTarget_OnEnter(ЦелУкз сам, цел x, цел y, цел def);
extern (C) цел wxDropTarget_OnDragOver(ЦелУкз сам, цел x, цел y, цел def);
extern (C) проц   wxDropTarget_OnLeave(ЦелУкз сам);
extern (C) бул wxDropTarget_OnDrop(ЦелУкз сам, цел x, цел y);
extern (C) бул wxDropTarget_GetData(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

export abstract class МишеньСброса : ВизОбъект
{
    protected ОбъектДанных m_dataObject = пусто;

    export this(ОбъектДанных объДанных = пусто)
    {
        this(wxDropTarget_ctor(ВизОбъект.безопУк(объДанных)), да);
        m_dataObject = объДанных;

        wxDropTarget_RegisterVirtual( вхобъ, this,
                                      &staticDoOnDragOver,
                                      &staticOnDrop,
                                      &staticDoOnData,
                                      &staticGetData,
                                      &staticOnLeave,
                                      &staticDoOnEnter);

        wxDropTarget_RegisterDisposable(вхобъ, &VirtualDispose);
    }

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    private this(ЦелУкз вхобъ, бул памСобств)
    {
        super(вхобъ);
        this.памСобств = памСобств;
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxDropTarget_dtor(вхобъ);
    }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
    //---------------------------------------------------------------------

    static export extern(C) цел staticDoOnDragOver(МишеньСброса объ, цел x, цел y, цел def)
    {
        return cast(цел)объ.приТягНадЦелью(x, y, cast(ПРезультатТяга)def);
    }
    export  ПРезультатТяга приТягНадЦелью(цел x, цел y, ПРезультатТяга def)
    {
        return cast(ПРезультатТяга)wxDropTarget_OnDragOver(вхобъ, x, y, cast(цел)def);
    }

    //---------------------------------------------------------------------

    static export extern (C) бул staticOnDrop(МишеньСброса объ, цел x, цел y)
    {
        return объ.приБросе(x,y);
    }
    export  бул приБросе(цел x, цел y)
    {
        return wxDropTarget_OnDrop(вхобъ, x, y);
    }

    //---------------------------------------------------------------------

    static export extern (C) цел staticDoOnData(МишеньСброса объ, цел x, цел y, цел def)
    {
        return cast(цел)объ.приДанных(x, y, cast(ПРезультатТяга) def);
    }
    export abstract ПРезультатТяга приДанных(цел x, цел y, ПРезультатТяга def);

    //---------------------------------------------------------------------

    static export extern (C) бул staticGetData(МишеньСброса объ)
    {
        return объ.дайДанные();
    }
    export  бул дайДанные()
    {
        return wxDropTarget_GetData(вхобъ);
    }

    //---------------------------------------------------------------------

    static export extern (C) цел staticDoOnEnter(МишеньСброса объ, цел x, цел y, цел def)
    {
        return cast(цел)объ.приВходе(x, y, cast(ПРезультатТяга) def);
    }
    export  ПРезультатТяга приВходе(цел x, цел y, ПРезультатТяга def)
    {
        return cast(ПРезультатТяга)wxDropTarget_OnEnter(вхобъ, x, y, cast(цел)def);
    }

    //---------------------------------------------------------------------

    static export extern (C) проц staticOnLeave(МишеньСброса объ)
    {
        return объ.приВыходе();
    }
    export  проц приВыходе()
    {
        wxDropTarget_OnLeave(вхобъ);
    }

    //---------------------------------------------------------------------

    export ОбъектДанных объДанных()
    {
        return m_dataObject;
    }
    export проц объДанных(ОбъектДанных значение)
    {
        m_dataObject = значение;
        wxDropTarget_SetDataObject(вхобъ, ВизОбъект.безопУк(значение));
    }

    //	export static ВизОбъект Нов(ЦелУкз ptr) { return new МишеньСброса(ptr); }
}

//---------------------------------------------------------------------

//! \cond EXTERN
static export extern (C) бул wxTextDropTarget_OnDrop(ЦелУкз сам, цел x, цел y);
static export extern (C) бул wxTextDropTarget_GetData(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

export abstract class ЦельБросаТекста : МишеньСброса
{
    export this()
    {
        super(new ОбъектТекстДанных());
    }

    export abstract бул приБросеТекста(цел x, цел y, ткст текст);

    //---------------------------------------------------------------------

    export override ПРезультатТяга приДанных(цел x, цел y, ПРезультатТяга def)
    {
        if (!дайДанные())
            return ПРезультатТяга.Никакой;

        ОбъектТекстДанных dobj = cast(ОбъектТекстДанных)m_dataObject;

        return приБросеТекста(x, y, dobj.текст) ? def : ПРезультатТяга.Никакой;
    }

    //---------------------------------------------------------------------

    export override бул приБросе(цел x, цел y)
    {
        return wxTextDropTarget_OnDrop(вхобъ, x, y);
    }

    //---------------------------------------------------------------------

    export override бул дайДанные()
    {
        return wxTextDropTarget_GetData(вхобъ);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
static export extern (C) бул wxFileDropTarget_OnDrop(ЦелУкз сам, цел x, цел y);
static export extern (C) бул wxFileDropTarget_GetData(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

export abstract class ЦельБросаФайла : МишеньСброса
{
    export this()
    {
        super(new ОбъектФайлДанных());
    }

    export abstract бул приЗабросеФайлов(цел x, цел y, ткст[] именаФ);

    //---------------------------------------------------------------------

    export override ПРезультатТяга приДанных(цел x, цел y, ПРезультатТяга def)
    {
        if ( !дайДанные() )
            return ПРезультатТяга.Никакой;

        ОбъектФайлДанных dobj = cast(ОбъектФайлДанных)m_dataObject;

        return приЗабросеФайлов(x, y, dobj.именаФайлов) ? def : ПРезультатТяга.Никакой;
    }

    //---------------------------------------------------------------------

    export override бул приБросе(цел x, цел y)
    {
        return wxFileDropTarget_OnDrop(вхобъ, x, y);
    }

    //---------------------------------------------------------------------

    export override бул дайДанные()
    {
        return wxFileDropTarget_GetData(вхобъ);
    }
}

