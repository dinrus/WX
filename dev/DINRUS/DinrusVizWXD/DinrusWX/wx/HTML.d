module wx.HTML;
public import wx.common;
public import wx.ScrolledWindow;
public import wx.Frame;
public import wx.Config;
public import wx.PrintData;
public import wx.MouseEvent;

//version(LDC) { pragma(ldc, "verbose") }

//class ЯчейкаКонтейнераГЯР;
//class ФильтрГЯР;
//class ТэгГЯР;

public enum ПтипУЛРГЯР
{
    Страница,
    Рисунок,
    Другое
}

//-----------------------------------------------------------------------------

public enum ПСтатусОткрыванияГЯР
{
    Открыть,
    Блокировать,
    Перенаправить
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxHtmlTag_GetParent(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlTag_GetFirstSibling(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlTag_GetLastSibling(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlTag_GetChildren(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlTag_GetPreviousSibling(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlTag_GetNextSibling(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlTag_GetNextTag(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlTag_GetName(ЦелУкз сам);
extern (C) бул   wxHtmlTag_HasParam(ЦелУкз сам, ткст par);
extern (C) ЦелУкз wxHtmlTag_GetParam(ЦелУкз сам, ткст par, бул with_commas);
extern (C) бул   wxHtmlTag_GetParamAsColour(ЦелУкз сам, ткст par, ЦелУкз цв);
extern (C) бул   wxHtmlTag_GetParamAsInt(ЦелУкз сам, ткст par, inout цел цв);
extern (C) цел    wxHtmlTag_ScanParam(ЦелУкз сам, ткст par, ткст format, ЦелУкз парам);
extern (C) ЦелУкз wxHtmlTag_GetAllParams(ЦелУкз сам);
extern (C) бул   wxHtmlTag_IsEnding(ЦелУкз сам);
extern (C) бул   wxHtmlTag_HasEnding(ЦелУкз сам);
extern (C) цел    wxHtmlTag_GetBeginPos(ЦелУкз сам);
extern (C) цел    wxHtmlTag_GetEndPos1(ЦелУкз сам);
extern (C) цел    wxHtmlTag_GetEndPos2(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class ТэгГЯР : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new ТэгГЯР(ptr);
    }
    //-----------------------------------------------------------------------------
    private static ТэгГЯР найдиОбъ(ЦелУкз ptr)
    {
        return cast(ТэгГЯР)найдиОбъект(ptr, &ТэгГЯР.Нов);
    }

    export ТэгГЯР родитель()
    {
        return ТэгГЯР.найдиОбъ(wxHtmlTag_GetParent(вхобъ));
    }

    export ТэгГЯР первПасынок()
    {
        return ТэгГЯР.найдиОбъ(wxHtmlTag_GetFirstSibling(вхобъ));
    }

    export ТэгГЯР последнПасынок()
    {
        return ТэгГЯР.найдиОбъ(wxHtmlTag_GetLastSibling(вхобъ));
    }

    export ТэгГЯР отпрыски()
    {
        return ТэгГЯР.найдиОбъ(wxHtmlTag_GetChildren(вхобъ));
    }

    //-----------------------------------------------------------------------------

    export ТэгГЯР предшПасынок()
    {
        return ТэгГЯР.найдиОбъ(wxHtmlTag_GetPreviousSibling(вхобъ));
    }

    export ТэгГЯР следщПасынок()
    {
        return ТэгГЯР.найдиОбъ(wxHtmlTag_GetNextSibling(вхобъ));
    }

    //-----------------------------------------------------------------------------

    export ТэгГЯР следщТэг()
    {
        return ТэгГЯР.найдиОбъ(wxHtmlTag_GetNextTag(вхобъ));
    }

    //-----------------------------------------------------------------------------

    export ткст имя()
    {
        return cast(ткст) new ВизТкст(wxHtmlTag_GetName(вхобъ), да);
    }

    //-----------------------------------------------------------------------------

    export бул естьПарам(ткст par)
    {
        return wxHtmlTag_HasParam(вхобъ, par);
    }

    export ткст дайПарам(ткст par, бул with_commas)
    {
        return cast(ткст) new ВизТкст(wxHtmlTag_GetParam(вхобъ, par, with_commas), да);
    }

    //-----------------------------------------------------------------------------

    export бул дайПарамКакЦвет(ткст par, Цвет цв)
    {
        return wxHtmlTag_GetParamAsColour(вхобъ, par, ВизОбъект.безопУк(цв));
    }

    //-----------------------------------------------------------------------------

    export бул дайПарамКакЦел(ткст par, out цел цв)
    {
        цв = 0;
        return wxHtmlTag_GetParamAsInt(вхобъ, par, цв);
    }

    //-----------------------------------------------------------------------------

    export цел сканируйПарам(ткст par, ткст format, ВизОбъект парам)
    {
        return wxHtmlTag_ScanParam(вхобъ, par, format, ВизОбъект.безопУк(парам));
    }

    //-----------------------------------------------------------------------------

    export ткст всеПарамы()
    {
        return cast(ткст) new ВизТкст(wxHtmlTag_GetAllParams(вхобъ), да);
    }

    //-----------------------------------------------------------------------------

    /* export бул IsEnding() { return wxHtmlTag_IsEnding(вхобъ); } */

    export бул естьОкончание()
    {
        return wxHtmlTag_HasEnding(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export цел позНачала()
    {
        return wxHtmlTag_GetBeginPos(вхобъ);
    }

    export цел позКонца1()
    {
        return wxHtmlTag_GetEndPos1(вхобъ);
    }

    export цел позКонца2()
    {
        return wxHtmlTag_GetEndPos2(вхобъ);
    }

    //-----------------------------------------------------------------------------
    /+
    export static implicit operator ТэгГЯР (ЦелУкз объ)
    {
        return cast(ТэгГЯР)найдиОбъект(объ, &ТэгГЯР.Нов);
    }
    +/
}

export abstract class ФильтрГЯР : ВизОбъект
{
    // TODO

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    /*export abstract бул читается(FSFile файл);
    export abstract ткст ReadFile(FSFile файл);*/
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxHtmlCell_ctor();
extern (C) проц   wxHtmlCell_SetParent(ЦелУкз сам, ЦелУкз p);
extern (C) ЦелУкз wxHtmlCell_GetParent(ЦелУкз сам);
extern (C) цел    wxHtmlCell_GetPosX(ЦелУкз сам);
extern (C) цел    wxHtmlCell_GetPosY(ЦелУкз сам);
extern (C) цел    wxHtmlCell_GetWidth(ЦелУкз сам);
extern (C) цел    wxHtmlCell_GetHeight(ЦелУкз сам);
extern (C) цел    wxHtmlCell_GetDescent(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlCell_GetId(ЦелУкз сам);
extern (C) проц   wxHtmlCell_SetId(ЦелУкз сам, ткст ид);
extern (C) ЦелУкз wxHtmlCell_GetNext(ЦелУкз сам);
extern (C) проц   wxHtmlCell_SetPos(ЦелУкз сам, цел x, цел y);
extern (C) проц   wxHtmlCell_SetLink(ЦелУкз сам, ЦелУкз ссылка);
extern (C) проц   wxHtmlCell_SetNext(ЦелУкз сам, ЦелУкз ячейка);
extern (C) проц   wxHtmlCell_Layout(ЦелУкз сам, цел w);
extern (C) проц   wxHtmlCell_Draw(ЦелУкз сам, ЦелУкз ку, цел x, цел y, цел view_y1, цел view_y2, ЦелУкз инфо);
extern (C) проц   wxHtmlCell_DrawInvisible(ЦелУкз сам, ЦелУкз ку, цел x, цел y, ЦелУкз инфо);
extern (C) ЦелУкз wxHtmlCell_Find(ЦелУкз сам, цел условие, ЦелУкз парам);
extern (C) проц   wxHtmlCell_OnMouseClick(ЦелУкз сам, ЦелУкз родитель, цел x, цел y, ЦелУкз соб);
extern (C) бул   wxHtmlCell_AdjustPagebreak(ЦелУкз сам, inout цел разрывСтр);
extern (C) проц   wxHtmlCell_SetCanLiveOnPagebreak(ЦелУкз сам, бул can);
extern (C) проц   wxHtmlCell_GetHorizontalConstraints(ЦелУкз сам, inout цел left, inout цел right);
extern (C) бул   wxHtmlCell_IsTerminalCell(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlCell_FindCellByPos(ЦелУкз сам, цел x, цел y);
//! \endcond

export class ЯчейкаГЯР : ВизОбъект
{
    //-----------------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxHtmlCell_ctor());
    }

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new ЯчейкаГЯР(ptr);
    }
    export static ЯчейкаГЯР найдиОбъ(ЦелУкз ptr)
    {
        return cast(ЯчейкаГЯР)найдиОбъект(ptr, &ЯчейкаГЯР.Нов);
    }

    //-----------------------------------------------------------------------------

    export проц родитель(ЯчейкаКонтейнераГЯР значение)
    {
        wxHtmlCell_SetParent(вхобъ, ВизОбъект.безопУк(значение));
    }
    export ЯчейкаКонтейнераГЯР родитель()
    {
        return cast(ЯчейкаКонтейнераГЯР)найдиОбъект(wxHtmlCell_GetParent(вхобъ), &ЯчейкаКонтейнераГЯР.Нов);
    }

    //-----------------------------------------------------------------------------

    export цел Х()
    {
        return wxHtmlCell_GetPosX(вхобъ);
    }

    export цел У()
    {
        return wxHtmlCell_GetPosY(вхобъ);
    }

    export цел ширь()
    {
        return wxHtmlCell_GetWidth(вхобъ);
    }

    export цел высь()
    {
        return wxHtmlCell_GetHeight(вхобъ);
    }

    /* helper */
    export цел позХ()
    {
        return Х;
    }
    export цел позУ()
    {
        return У;
    }

    export Точка позиция()
    {
        return Точка(Х,У);
    }
    export проц  позиция(Точка тчк)
    {
        устПоз(тчк.Х,тчк.У);
    }

    export Размер размер()
    {
        return Размер(ширь,высь);
    }

    export Прямоугольник прям()
    {
        return Прямоугольник(Х,У,ширь,высь);
    }

    //-----------------------------------------------------------------------------

    export цел спуск()
    {
        return wxHtmlCell_GetDescent(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export  ткст ид()
    {
        return cast(ткст) new ВизТкст(wxHtmlCell_GetId(вхобъ), да);
    }
    export  проц ид(ткст значение)
    {
        wxHtmlCell_SetId(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export ЯчейкаГЯР следщ()
    {
        return cast(ЯчейкаГЯР)найдиОбъект(wxHtmlCell_GetNext(вхобъ), &ЯчейкаГЯР.Нов);
    }
    export проц следщ(ЯчейкаГЯР значение)
    {
        wxHtmlCell_SetNext(вхобъ, ВизОбъект.безопУк(значение));
    }

    //-----------------------------------------------------------------------------

    export проц устПоз(цел x, цел y)
    {
        wxHtmlCell_SetPos(вхобъ, x, y);
    }

    //-----------------------------------------------------------------------------

    export проц ссылка(ИнфОСсылкеГЯР значение)
    {
        wxHtmlCell_SetLink(вхобъ, ВизОбъект.безопУк(значение));
    }

    //-----------------------------------------------------------------------------

    export  проц раскладка(цел w)
    {
        wxHtmlCell_Layout(вхобъ, w);
    }

    //-----------------------------------------------------------------------------

    export  проц рисуй(КонтекстУстройства ку, цел x, цел y, цел view_y1, цел view_y2, ИнфОбОтображенииГЯР инфо)
    {
        wxHtmlCell_Draw(вхобъ, ВизОбъект.безопУк(ку), x, y, view_y1, view_y2, ВизОбъект.безопУк(инфо));
    }

    //-----------------------------------------------------------------------------

    export  проц рисуйНевидимо(КонтекстУстройства ку, цел x, цел y, ИнфОбОтображенииГЯР инфо)
    {
        wxHtmlCell_DrawInvisible(вхобъ, ВизОбъект.безопУк(ку), x, y, ВизОбъект.безопУк(инфо));
    }

    //-----------------------------------------------------------------------------

    export  ЯчейкаГЯР найди(цел условие, ВизОбъект парам)
    {
        return cast(ЯчейкаГЯР)найдиОбъект(wxHtmlCell_Find(вхобъ, условие, ВизОбъект.безопУк(парам)), &ЯчейкаГЯР.Нов);
    }

    //-----------------------------------------------------------------------------

    export  проц поНажатиюМыши(Окно родитель, цел x, цел y, СобытиеМыши соб)
    {
        wxHtmlCell_OnMouseClick(вхобъ, ВизОбъект.безопУк(родитель), x, y, ВизОбъект.безопУк(соб));
    }

    //-----------------------------------------------------------------------------

    export  бул устройРазрывСтр(inout цел разрывСтр)
    {
        return wxHtmlCell_AdjustPagebreak(вхобъ, разрывСтр);
    }

    //-----------------------------------------------------------------------------

    export проц можетБытьНаРазрывеСтр(бул значение)
    {
        wxHtmlCell_SetCanLiveOnPagebreak(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------
    /*
            export проц GetHorizontalConstraints(out цел left, out цел right)
            {
                left = right = 0;
                wxHtmlCell_GetHorizontalConstraints(вхобъ, left, right);
            }
    */
    //-----------------------------------------------------------------------------

    export  бул терминальнаяЯчейка_ли()
    {
        return wxHtmlCell_IsTerminalCell(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export ЯчейкаГЯР найдиЯчейкуПоПоз(цел x, цел y)
    {
        return cast(ЯчейкаГЯР)найдиОбъект(wxHtmlCell_FindCellByPos(вхобъ, x, y), &ЯчейкаГЯР.Нов);
    }

    //-----------------------------------------------------------------------------
    /+
    export static implicit operator ЯчейкаГЯР (ЦелУкз объ)
    {
        return cast(ЯчейкаГЯР)найдиОбъект(объ, &ЯчейкаГЯР.Нов);
    }
    +/
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxHtmlFontCell_ctor(ЦелУкз шрифт);
extern (C) проц   wxHtmlFontCell_Draw(ЦелУкз сам, ЦелУкз ку, цел x, цел y, цел view_y1, цел view_y2, ЦелУкз инфо);
extern (C) проц   wxHtmlFontCell_DrawInvisible(ЦелУкз сам, ЦелУкз ку, цел x, цел y, ЦелУкз инфо);
//! \endcond


export class ЯчейкаШрифтаГЯР : ЯчейкаГЯР
{
    //-----------------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(Шрифт шрифт)
    {
        this(wxHtmlFontCell_ctor(ВизОбъект.безопУк(шрифт)));
    }

    //-----------------------------------------------------------------------------

    export override проц рисуй(КонтекстУстройства ку, цел x, цел y, цел view_y1, цел view_y2, ИнфОбОтображенииГЯР инфо)
    {
        wxHtmlFontCell_Draw(вхобъ, ВизОбъект.безопУк(ку), x, y, view_y1, view_y2, ВизОбъект.безопУк(инфо));
    }

    //-----------------------------------------------------------------------------

    export override проц рисуйНевидимо(КонтекстУстройства ку, цел x, цел y, ИнфОбОтображенииГЯР инфо)
    {
        wxHtmlFontCell_DrawInvisible(вхобъ, ВизОбъект.безопУк(ку), x, y, ВизОбъект.безопУк(инфо));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxHtmlContainerCell_ctor(ЦелУкз родитель);
extern (C) проц   wxHtmlContainerCell_Layout(ЦелУкз сам, цел w);
extern (C) проц   wxHtmlContainerCell_Draw(ЦелУкз сам, ЦелУкз ку, цел x, цел y, цел view_y1, цел view_y2, ЦелУкз инфо);
extern (C) проц   wxHtmlContainerCell_DrawInvisible(ЦелУкз сам, ЦелУкз ку, цел x, цел y, ЦелУкз инфо);
extern (C) бул   wxHtmlContainerCell_AdjustPagebreak(ЦелУкз сам, inout цел разрывСтр);
extern (C) проц   wxHtmlContainerCell_InsertCell(ЦелУкз сам, ЦелУкз ячейка);
extern (C) проц   wxHtmlContainerCell_SetAlignHor(ЦелУкз сам, цел al);
extern (C) цел    wxHtmlContainerCell_GetAlignHor(ЦелУкз сам);
extern (C) проц   wxHtmlContainerCell_SetAlignVer(ЦелУкз сам, цел al);
extern (C) цел    wxHtmlContainerCell_GetAlignVer(ЦелУкз сам);
extern (C) проц   wxHtmlContainerCell_SetIndent(ЦелУкз сам, цел i, цел what, цел единицы);
extern (C) цел    wxHtmlContainerCell_GetIndent(ЦелУкз сам, цел инд);
extern (C) цел    wxHtmlContainerCell_GetIndentUnits(ЦелУкз сам, цел инд);
extern (C) проц   wxHtmlContainerCell_SetAlign(ЦелУкз сам, ЦелУкз тэг);
extern (C) проц   wxHtmlContainerCell_SetWidthFloat(ЦелУкз сам, цел w, цел единицы);
extern (C) проц   wxHtmlContainerCell_SetWidthFloatTag(ЦелУкз сам, ЦелУкз тэг, дво масштаб_пикселя);
extern (C) проц   wxHtmlContainerCell_SetMinHeight(ЦелУкз сам, цел h, цел раскладка);
extern (C) проц   wxHtmlContainerCell_SetBackgroundColour(ЦелУкз сам, ЦелУкз цв);
extern (C) ЦелУкз wxHtmlContainerCell_GetBackgroundColour(ЦелУкз сам);
extern (C) проц   wxHtmlContainerCell_SetBorder(ЦелУкз сам, ЦелУкз clr1, ЦелУкз clr2);
extern (C) ЦелУкз wxHtmlContainerCell_GetLink(ЦелУкз сам, цел x, цел y);
extern (C) ЦелУкз wxHtmlContainerCell_Find(ЦелУкз сам, цел условие, ЦелУкз парам);
extern (C) проц   wxHtmlContainerCell_OnMouseClick(ЦелУкз сам, ЦелУкз родитель, цел x, цел y, ЦелУкз соб);
extern (C) проц   wxHtmlContainerCell_GetHorizontalConstraints(ЦелУкз сам, inout цел left, inout цел right);
extern (C) ЦелУкз wxHtmlContainerCell_GetFirstCell(ЦелУкз сам);
extern (C) бул   wxHtmlContainerCell_IsTerminalCell(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlContainerCell_FindCellByPos(ЦелУкз сам, цел x, цел y);
//! \endcond

export class ЯчейкаКонтейнераГЯР : ЯчейкаГЯР
{
    //-----------------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(ЯчейкаКонтейнераГЯР родитель)
    {
        this(wxHtmlContainerCell_ctor(ВизОбъект.безопУк(родитель)));
    }

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new ЯчейкаКонтейнераГЯР(ptr);
    }

    //-----------------------------------------------------------------------------

    export override проц раскладка(цел w)
    {
        wxHtmlContainerCell_Layout(вхобъ, w);
    }

    //-----------------------------------------------------------------------------

    export override проц рисуй(КонтекстУстройства ку, цел x, цел y, цел view_y1, цел view_y2, ИнфОбОтображенииГЯР инфо)
    {
        wxHtmlContainerCell_Draw(вхобъ, ВизОбъект.безопУк(ку), x, y, view_y1, view_y2, ВизОбъект.безопУк(инфо));
    }

    //-----------------------------------------------------------------------------

    export override проц рисуйНевидимо(КонтекстУстройства ку, цел x, цел y, ИнфОбОтображенииГЯР инфо)
    {
        wxHtmlContainerCell_DrawInvisible(вхобъ, ВизОбъект.безопУк(ку), x, y, ВизОбъект.безопУк(инфо));
    }

    //-----------------------------------------------------------------------------

    export override бул устройРазрывСтр(inout цел разрывСтр)
    {
        return wxHtmlContainerCell_AdjustPagebreak(вхобъ, разрывСтр);
    }

    //-----------------------------------------------------------------------------

    export проц вставьЯчейку(ЯчейкаГЯР ячейка)
    {
        wxHtmlContainerCell_InsertCell(вхобъ, ВизОбъект.безопУк(ячейка));
    }

    //-----------------------------------------------------------------------------

    export проц разместиГориз(цел значение)
    {
        wxHtmlContainerCell_SetAlignHor(вхобъ, значение);
    }
    export цел разместиГориз()
    {
        return wxHtmlContainerCell_GetAlignHor(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц разместиВерт(цел значение)
    {
        wxHtmlContainerCell_SetAlignVer(вхобъ, значение);
    }
    export цел разместиВерт()
    {
        return wxHtmlContainerCell_GetAlignVer(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц устОтступ(цел i, цел what, цел единицы)
    {
        wxHtmlContainerCell_SetIndent(вхобъ, i, what, единицы);
    }

    export цел дайОтступ(цел инд)
    {
        return wxHtmlContainerCell_GetIndent(вхобъ, инд);
    }

    export цел дайЕдцыОтступа(цел инд)
    {
        return wxHtmlContainerCell_GetIndentUnits(вхобъ, инд);
    }

    //-----------------------------------------------------------------------------

    export проц расположи(ТэгГЯР значение)
    {
        wxHtmlContainerCell_SetAlign(вхобъ, ВизОбъект.безопУк(значение));
    }

    //-----------------------------------------------------------------------------

    export проц устПлавШирину(цел w, цел единицы)
    {
        wxHtmlContainerCell_SetWidthFloat(вхобъ, w, единицы);
    }

    export проц устПлавШирину(ТэгГЯР тэг, дво масштаб_пикселя)
    {
        wxHtmlContainerCell_SetWidthFloatTag(вхобъ, ВизОбъект.безопУк(тэг), масштаб_пикселя);
    }

    //-----------------------------------------------------------------------------

    export проц устМинВысоту(цел h, цел раскладка)
    {
        wxHtmlContainerCell_SetMinHeight(вхобъ, h, раскладка);
    }

    //-----------------------------------------------------------------------------

    export проц цветФона(Цвет значение)
    {
        wxHtmlContainerCell_SetBackgroundColour(вхобъ, ВизОбъект.безопУк(значение));
    }
    export Цвет цветФона()
    {
        return new Цвет(wxHtmlContainerCell_GetBackgroundColour(вхобъ), да);
    }

    //-----------------------------------------------------------------------------

    export проц устБордюр(Цвет clr1, Цвет clr2)
    {
        wxHtmlContainerCell_SetBorder(вхобъ, ВизОбъект.безопУк(clr1), ВизОбъект.безопУк(clr2));
    }

    //-----------------------------------------------------------------------------

    export  ИнфОСсылкеГЯР дайСсылку(цел x, цел y)
    {
        return cast(ИнфОСсылкеГЯР)найдиОбъект(wxHtmlContainerCell_GetLink(вхобъ, x, y), &ИнфОСсылкеГЯР.Нов);
    }

    //-----------------------------------------------------------------------------

    export override ЯчейкаГЯР найди(цел условие, ВизОбъект парам)
    {
//            return cast(ЯчейкаГЯР)найдиОбъект(wxHtmlContainerCell_Find(вхобъ, условие, ВизОбъект.безопУк(парам)), &ЯчейкаГЯР.Нов);
        return ЯчейкаГЯР.найдиОбъ(wxHtmlContainerCell_Find(вхобъ, условие, ВизОбъект.безопУк(парам)));
    }

    //-----------------------------------------------------------------------------

    export override проц поНажатиюМыши(Окно родитель, цел x, цел y, СобытиеМыши соб)
    {
        wxHtmlContainerCell_OnMouseClick(вхобъ, ВизОбъект.безопУк(родитель), x, y, ВизОбъект.безопУк(соб));
    }

    //-----------------------------------------------------------------------------
    /*
            export проц GetHorizontalConstraints(out цел left, out цел right)
            {
                left = right = 0;
                wxHtmlContainerCell_GetHorizontalConstraints(вхобъ, left, right);
            }
    */
    //-----------------------------------------------------------------------------
    /*
            export ЯчейкаГЯР FirstCell() { return ЯчейкаГЯР.найдиОбъ(wxHtmlContainerCell_GetFirstCell(вхобъ)); }
    */
    //-----------------------------------------------------------------------------

    export override бул терминальнаяЯчейка_ли()
    {
        return wxHtmlContainerCell_IsTerminalCell(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export override ЯчейкаГЯР найдиЯчейкуПоПоз(цел x, цел y)
    {
        return ЯчейкаГЯР.найдиОбъ(wxHtmlContainerCell_FindCellByPos(вхобъ, x, y));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxHtmlColourCell_ctor(ЦелУкз цв, цел флаги);
extern (C) проц   wxHtmlColourCell_Draw(ЦелУкз сам, ЦелУкз ку, цел x, цел y, цел view_y1, цел view_y2, ЦелУкз инфо);
extern (C) проц   wxHtmlColourCell_DrawInvisible(ЦелУкз сам, ЦелУкз ку, цел x, цел y, ЦелУкз инфо);
//! \endcond


export class ЯчейкаЦветаГЯР : ЯчейкаГЯР
{
    //-----------------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export  this(Цвет цв, цел флаги)
    {
        this(wxHtmlColourCell_ctor(ВизОбъект.безопУк(цв), флаги));
    }

    //-----------------------------------------------------------------------------

    export override проц рисуй(КонтекстУстройства ку, цел x, цел y, цел view_y1, цел view_y2, ИнфОбОтображенииГЯР инфо)
    {
        wxHtmlColourCell_Draw(вхобъ, ВизОбъект.безопУк(ку), x, y, view_y1, view_y2, ВизОбъект.безопУк(инфо));
    }

    //-----------------------------------------------------------------------------

    export override проц рисуйНевидимо(КонтекстУстройства ку, цел x, цел y, ИнфОбОтображенииГЯР инфо)
    {
        wxHtmlColourCell_DrawInvisible(вхобъ, ВизОбъект.безопУк(ку), x, y, ВизОбъект.безопУк(инфо));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxHtmlLinkInfo_ctor();
/*extern (C) ЦелУкз wxHtmlLinkInfo_ctor(ткст href, ткст цель);*/
/*extern (C) ЦелУкз wxHtmlLinkInfo_ctor(ЦелУкз l);*/
extern (C) проц   wxHtmlLinkInfo_SetEvent(ЦелУкз сам, ЦелУкз e);
extern (C) проц   wxHtmlLinkInfo_SetHtmlCell(ЦелУкз сам, ЦелУкз e);
extern (C) ЦелУкз wxHtmlLinkInfo_GetHref(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlLinkInfo_GetTarget(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlLinkInfo_GetEvent(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlLinkInfo_GetHtmlCell(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class ИнфОСсылкеГЯР : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export  this()
    {
        super(wxHtmlLinkInfo_ctor());
    }

    //-----------------------------------------------------------------------------

    /*export  this(ткст href, ткст цель)
    	{ super(wxHtmlLinkInfo_ctor(href, цель)); }*/

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new ЯчейкаГЯР(ptr);
    }

    //-----------------------------------------------------------------------------

    /*export  this(ИнфОСсылкеГЯР l)
    	{ super(wxHtmlLinkInfo_ctor(ВизОбъект.безопУк(l))); }*/
    //-----------------------------------------------------------------------------

    export проц событие(СобытиеМыши значение)
    {
        wxHtmlLinkInfo_SetEvent(вхобъ, ВизОбъект.безопУк(значение));
    }
    export СобытиеМыши событие()
    {
        return cast(СобытиеМыши)найдиОбъект(wxHtmlLinkInfo_GetEvent(вхобъ), cast(ВизОбъект function (ЦелУкз))&СобытиеМыши.Нов);
    }

    //-----------------------------------------------------------------------------

    export ткст гиперссылка()
    {
        return cast(ткст) new ВизТкст(wxHtmlLinkInfo_GetHref(вхобъ), да);
    }

    //-----------------------------------------------------------------------------

    export ткст цель()
    {
        return cast(ткст) new ВизТкст(wxHtmlLinkInfo_GetTarget(вхобъ), да);
    }

    //-----------------------------------------------------------------------------

    export ЯчейкаГЯР ячейкаГЯР()
    {
        return cast(ЯчейкаГЯР)найдиОбъект(wxHtmlLinkInfo_GetHtmlCell(вхобъ), &ЯчейкаГЯР.Нов);
    }
    export проц ячейкаГЯР(ЯчейкаГЯР значение)
    {
        wxHtmlLinkInfo_SetHtmlCell(вхобъ, ВизОбъект.безопУк(значение));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxHtmlWidgetCell_ctor(ЦелУкз окно, цел w);
extern (C) проц   wxHtmlWidgetCell_Draw(ЦелУкз сам, ЦелУкз ку, цел x, цел y, цел view_y1, цел view_y2, ЦелУкз инфо);
extern (C) проц   wxHtmlWidgetCell_DrawInvisible(ЦелУкз сам, ЦелУкз ку, цел x, цел y, ЦелУкз инфо);
extern (C) проц   wxHtmlWidgetCell_Layout(ЦелУкз сам, цел w);
//! \endcond

//-----------------------------------------------------------------------------

export class ЯчейкаВиджетаГЯР : ЯчейкаГЯР
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(Окно окно, цел w)
    {
        this(wxHtmlWidgetCell_ctor(ВизОбъект.безопУк(окно), w));
    }

    //-----------------------------------------------------------------------------

    export override проц рисуй(КонтекстУстройства ку, цел x, цел y, цел view_y1, цел view_y2, ИнфОбОтображенииГЯР инфо)
    {
        wxHtmlWidgetCell_Draw(вхобъ, ВизОбъект.безопУк(ку), x, y, view_y1, view_y2, ВизОбъект.безопУк(инфо));
    }

    //-----------------------------------------------------------------------------

    export override проц рисуйНевидимо(КонтекстУстройства ку, цел x, цел y, ИнфОбОтображенииГЯР инфо)
    {
        wxHtmlWidgetCell_DrawInvisible(вхобъ, ВизОбъект.безопУк(ку), x, y, ВизОбъект.безопУк(инфо));
    }

    //-----------------------------------------------------------------------------

    export override проц раскладка(цел w)
    {
        wxHtmlWidgetCell_Layout(вхобъ, w);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxHtmlWordCell_ctor(ткст слово, ЦелУкз ку);
extern (C) проц   wxHtmlWordCell_Draw(ЦелУкз сам, ЦелУкз ку, цел x, цел y, цел view_y1, цел view_y2, ЦелУкз инфо);
//! \endcond

//-----------------------------------------------------------------------------

export class ЯчейкаСловаГЯР : ЯчейкаГЯР
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export  this(ткст слово, КонтекстУстройства ку)
    {
        this(wxHtmlWordCell_ctor(слово, ВизОбъект.безопУк(ку)));
    }

    //-----------------------------------------------------------------------------

    export override проц рисуй(КонтекстУстройства ку, цел x, цел y, цел view_y1, цел view_y2, ИнфОбОтображенииГЯР инфо)
    {
        wxHtmlWordCell_Draw(вхобъ, ВизОбъект.безопУк(ку), x, y, view_y1, view_y2, ВизОбъект.безопУк(инфо));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) бул   wxHtmlFilterPlainText_CanRead(ЦелУкз сам, ЦелУкз файл);
extern (C) ЦелУкз wxHtmlFilterPlainText_ReadFile(ЦелУкз сам, ЦелУкз файл);
//! \endcond

//-----------------------------------------------------------------------------


export class ФильтрПлоскогоТекстаГЯР : ФильтрГЯР
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    //-----------------------------------------------------------------------------

    /*export override бул читается(FSFile файл)
    {
        return wxHtmlFilterPlainText_CanRead(вхобъ, ВизОбъект.безопУк(файл));
    }

    //-----------------------------------------------------------------------------

    export override ткст ReadFile(FSFile файл)
    {
        return cast(ткст) new ВизТкст(wxHtmlFilterPlainText_ReadFile(вхобъ, ВизОбъект.безопУк(файл)));
    }
    }

    //-----------------------------------------------------------------------------

           //! \cond EXTERN
           extern (C) бул   wxHtmlFilterHTML_CanRead(ЦелУкз сам, ЦелУкз файл);
           extern (C) ЦелУкз wxHtmlFilterHTML_ReadFile(ЦелУкз сам, ЦелУкз файл);
           //! \endcond

           //-----------------------------------------------------------------------------

       alias HtmlFilterHTML wxHtmlFilterHTML;
       export class HtmlFilterHTML : ФильтрГЯР
       {
           export this(ЦелУкз вхобъ)
               { super(вхобъ); }

           //-----------------------------------------------------------------------------

           /*export override бул читается(FSFile файл)
           {
               return wxHtmlFilterHTML_CanRead(вхобъ, ВизОбъект.безопУк(файл));
           }

           //-----------------------------------------------------------------------------

           export override ткст ReadFile(FSFile файл)
           {
               return cast(ткст) new ВизТкст(wxHtmlFilterHTML_ReadFile(вхобъ, ВизОбъект.безопУк(файл)));
           }*/
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxHtmlTagsModule_ctor();
extern (C) бул   wxHtmlTagsModule_OnInit(ЦелУкз сам);
extern (C) проц   wxHtmlTagsModule_OnExit(ЦелУкз сам);
extern (C) проц   wxHtmlTagsModule_FillHandlersTable(ЦелУкз сам, ЦелУкз парсер);
//! \endcond

//-----------------------------------------------------------------------------

export class МодульТэговГЯР : ВизОбъект // TODO: Module
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxHtmlTagsModule_ctor());
    }

    //-----------------------------------------------------------------------------

    export бул поИниц()
    {
        return wxHtmlTagsModule_OnInit(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц поВыходу()
    {
        wxHtmlTagsModule_OnExit(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц заполниТаблицуОбработчиков(ПарсерГЯРОкна  парсер)
    {
        wxHtmlTagsModule_FillHandlersTable(вхобъ, ВизОбъект.безопУк(парсер));
    }
}

//-----------------------------------------------------------------------------

export abstract class ОбработчикТэгаГЯРОкна : ОбработчикТэгаГЯР
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxHtmlWinParser_ctor(ЦелУкз окно);
extern (C) проц   wxHtmlWinParser_InitParser(ЦелУкз сам, ткст исток);
extern (C) проц   wxHtmlWinParser_DoneParser(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlWinParser_GetProduct(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlWinParser_OpenURL(ЦелУкз сам, цел тип, ткст улр);
extern (C) проц   wxHtmlWinParser_SetDC(ЦелУкз сам, ЦелУкз ку, дво масштаб_пикселя);
extern (C) ЦелУкз wxHtmlWinParser_GetDC(ЦелУкз сам);
extern (C) дво wxHtmlWinParser_GetPixelScale(ЦелУкз сам);
extern (C) цел    wxHtmlWinParser_GetCharHeight(ЦелУкз сам);
extern (C) цел    wxHtmlWinParser_GetCharWidth(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlWinParser_GetWindow(ЦелУкз сам);
extern (C) проц   wxHtmlWinParser_SetFonts(ЦелУкз сам, ткст нормФас, ткст фиксФас, цел* размы);
extern (C) проц   wxHtmlWinParser_AddModule(ЦелУкз сам, ЦелУкз mod);
extern (C) проц   wxHtmlWinParser_RemoveModule(ЦелУкз сам, ЦелУкз mod);
extern (C) ЦелУкз wxHtmlWinParser_GetContainer(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlWinParser_OpenContainer(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlWinParser_SetContainer(ЦелУкз сам, ЦелУкз c);
extern (C) ЦелУкз wxHtmlWinParser_CloseContainer(ЦелУкз сам);
extern (C) цел    wxHtmlWinParser_GetFontSize(ЦелУкз сам);
extern (C) проц   wxHtmlWinParser_SetFontSize(ЦелУкз сам, цел т);
extern (C) цел    wxHtmlWinParser_GetFontBold(ЦелУкз сам);
extern (C) проц   wxHtmlWinParser_SetFontBold(ЦелУкз сам, цел x);
extern (C) цел    wxHtmlWinParser_GetFontItalic(ЦелУкз сам);
extern (C) проц   wxHtmlWinParser_SetFontItalic(ЦелУкз сам, цел x);
extern (C) цел    wxHtmlWinParser_GetFontUnderlined(ЦелУкз сам);
extern (C) проц   wxHtmlWinParser_SetFontUnderlined(ЦелУкз сам, цел x);
extern (C) цел    wxHtmlWinParser_GetFontFixed(ЦелУкз сам);
extern (C) проц   wxHtmlWinParser_SetFontFixed(ЦелУкз сам, цел x);
extern (C) ЦелУкз wxHtmlWinParser_GetFontFace(ЦелУкз сам);
extern (C) проц   wxHtmlWinParser_SetFontFace(ЦелУкз сам, ткст фас);
extern (C) цел    wxHtmlWinParser_GetAlign(ЦелУкз сам);
extern (C) проц   wxHtmlWinParser_SetAlign(ЦелУкз сам, цел a);
extern (C) ЦелУкз wxHtmlWinParser_GetLinkColor(ЦелУкз сам);
extern (C) проц   wxHtmlWinParser_SetLinkColor(ЦелУкз сам, ЦелУкз цв);
extern (C) ЦелУкз wxHtmlWinParser_GetActualColor(ЦелУкз сам);
extern (C) проц   wxHtmlWinParser_SetActualColor(ЦелУкз сам, ЦелУкз цв);
extern (C) ЦелУкз wxHtmlWinParser_GetLink(ЦелУкз сам);
extern (C) проц   wxHtmlWinParser_SetLink(ЦелУкз сам, ЦелУкз ссылка);
extern (C) ЦелУкз wxHtmlWinParser_CreateCurrentFont(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class ПарсерГЯРОкна : ПарсерГЯР
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this(ОкноГЯР окно)
    {
        super(wxHtmlWinParser_ctor(ВизОбъект.безопУк(окно)));
    }

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new ПарсерГЯРОкна(ptr);
    }
    //-----------------------------------------------------------------------------

    export override проц иницПарсер(ткст исток)
    {
        wxHtmlWinParser_InitParser(вхобъ, исток);
    }

    //-----------------------------------------------------------------------------

    export override проц парсерВыполнен()
    {
        wxHtmlWinParser_DoneParser(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export override ВизОбъект продукт()
    {
//FIXME            return найдиОбъект(wxHtmlWinParser_GetProduct(вхобъ), typeof(ВизОбъект));
        return найдиОбъект(wxHtmlWinParser_GetProduct(вхобъ));
    }

    //-----------------------------------------------------------------------------

    /*export FSFile OpenURL(ПтипУЛРГЯР тип, ткст улр)
    {
        return wxHtmlWinParser_OpenURL(вхобъ, ВизОбъект.безопУк(тип), улр);
    }*/

    //-----------------------------------------------------------------------------

    export проц устКУ(КонтекстУстройства ку, дво масштаб_пикселя)
    {
        wxHtmlWinParser_SetDC(вхобъ, ВизОбъект.безопУк(ку), масштаб_пикселя);
    }

    //-----------------------------------------------------------------------------

    export КонтекстУстройства дайКУ()
    {
        return cast(КонтекстУстройства)найдиОбъект(wxHtmlWinParser_GetDC(вхобъ), &КонтекстУстройства.Нов);
    }

    //-----------------------------------------------------------------------------

    export дво масштабПикселя()
    {
        return wxHtmlWinParser_GetPixelScale(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export цел высьСим()
    {
        return wxHtmlWinParser_GetCharHeight(вхобъ);
    }

    export цел ширьСим()
    {
        return wxHtmlWinParser_GetCharWidth(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export ОкноГЯР окно()
    {
        return cast(ОкноГЯР)найдиОбъект(wxHtmlWinParser_GetWindow(вхобъ), &ОкноГЯР.Нов);
    }

    //-----------------------------------------------------------------------------

    export проц устШрифты(ткст нормФас, ткст фиксФас, цел[] размы)
    {
        wxHtmlWinParser_SetFonts(вхобъ, нормФас, фиксФас, размы.ptr);
    }

    //-----------------------------------------------------------------------------

    export проц добавьМодуль(МодульТэговГЯР mod)
    {
        wxHtmlWinParser_AddModule(вхобъ, ВизОбъект.безопУк(mod));
    }

    export проц удалиМодуль(МодульТэговГЯР mod)
    {
        wxHtmlWinParser_RemoveModule(вхобъ, ВизОбъект.безопУк(mod));
    }

    //-----------------------------------------------------------------------------

    export ЯчейкаКонтейнераГЯР контейнер()
    {
        return cast(ЯчейкаКонтейнераГЯР)найдиОбъект(wxHtmlWinParser_GetContainer(вхобъ), &ЯчейкаКонтейнераГЯР.Нов);
    }

    export ЯчейкаКонтейнераГЯР устКонтейнер(ЯчейкаКонтейнераГЯР конт)
    {
        return cast(ЯчейкаКонтейнераГЯР)найдиОбъект(wxHtmlWinParser_SetContainer(вхобъ, ВизОбъект.безопУк(конт)), &ЯчейкаКонтейнераГЯР.Нов);
    }

    //-----------------------------------------------------------------------------

    export ЯчейкаКонтейнераГЯР откройКонтейнер()
    {
        return cast(ЯчейкаКонтейнераГЯР)найдиОбъект(wxHtmlWinParser_OpenContainer(вхобъ), &ЯчейкаКонтейнераГЯР.Нов);
    }

    export ЯчейкаКонтейнераГЯР закройКонтейнер()
    {
        return cast(ЯчейкаКонтейнераГЯР)найдиОбъект(wxHtmlWinParser_CloseContainer(вхобъ), &ЯчейкаКонтейнераГЯР.Нов);
    }

    //-----------------------------------------------------------------------------

    export цел размШрифта()
    {
        return wxHtmlWinParser_GetFontSize(вхобъ);
    }
    export проц размШрифта(цел значение)
    {
        wxHtmlWinParser_SetFontSize(вхобъ, значение);
    }

    export цел полужирныйШрифт()
    {
        return wxHtmlWinParser_GetFontBold(вхобъ);
    }
    export проц полужирныйШрифт(цел значение)
    {
        wxHtmlWinParser_SetFontBold(вхобъ, значение);
    }

    export цел курсивныйШрифт()
    {
        return wxHtmlWinParser_GetFontItalic(вхобъ);
    }
    export проц курсивныйШрифт(цел значение)
    {
        wxHtmlWinParser_SetFontItalic(вхобъ, значение);
    }

    export цел шрифтПодчёркнут()
    {
        return wxHtmlWinParser_GetFontUnderlined(вхобъ);
    }
    export проц шрифтПодчёркнут(цел значение)
    {
        wxHtmlWinParser_SetFontUnderlined(вхобъ, значение);
    }

    export цел шрифтФиксирован()
    {
        return wxHtmlWinParser_GetFontFixed(вхобъ);
    }
    export проц шрифтФиксирован(цел значение)
    {
        wxHtmlWinParser_SetFontFixed(вхобъ, значение);
    }

    export ткст фасШрифта()
    {
        return cast(ткст) new ВизТкст(wxHtmlWinParser_GetFontFace(вхобъ), да);
    }
    export проц фасШрифта(ткст значение)
    {
        wxHtmlWinParser_SetFontFace(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export цел расположи()
    {
        return wxHtmlWinParser_GetAlign(вхобъ);
    }
    export проц расположи(цел значение)
    {
        wxHtmlWinParser_SetAlign(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export Цвет цветСсылки()
    {
        return new Цвет(wxHtmlWinParser_GetLinkColor(вхобъ), да);
    }
    export проц цветСсылки(Цвет значение)
    {
        wxHtmlWinParser_SetLinkColor(вхобъ, ВизОбъект.безопУк(значение));
    }

    export Цвет действитЦвет()
    {
        return new Цвет(wxHtmlWinParser_GetActualColor(вхобъ), да);
    }
    export проц действитЦвет(Цвет значение)
    {
        wxHtmlWinParser_SetActualColor(вхобъ, ВизОбъект.безопУк(значение));
    }

    //-----------------------------------------------------------------------------

    export ИнфОСсылкеГЯР ссылка()
    {
        return cast(ИнфОСсылкеГЯР)найдиОбъект(wxHtmlWinParser_GetLink(вхобъ), &ИнфОСсылкеГЯР.Нов);
    }
    export проц ссылка(ИнфОСсылкеГЯР значение)
    {
        wxHtmlWinParser_SetLink(вхобъ, ВизОбъект.безопУк(значение));
    }

    //-----------------------------------------------------------------------------

    export Шрифт создайТекущШрифт()
    {
        return new Шрифт(wxHtmlWinParser_CreateCurrentFont(вхобъ));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) проц   wxHtmlTagHandler_SetParser(ЦелУкз сам, ЦелУкз парсер);
//! \endcond

//-----------------------------------------------------------------------------

export abstract class ОбработчикТэгаГЯР : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц парсер(ПарсерГЯР значение)
    {
        wxHtmlTagHandler_SetParser(вхобъ, ВизОбъект.безопУк(значение));
    }

    //-----------------------------------------------------------------------------

    export abstract ткст дайПоддерживаемыеТэги();
    export abstract бул обработайТэг(ТэгГЯР тэг);
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxHtmlEntitiesParser_ctor();
extern (C) проц   wxHtmlEntitiesParser_SetEncoding(ЦелУкз сам, цел кодировка);
extern (C) ЦелУкз wxHtmlEntitiesParser_Parse(ЦелУкз сам, ткст ввод);
extern (C) char   wxHtmlEntitiesParser_GetEntityChar(ЦелУкз сам, ткст сущность);
extern (C) char   wxHtmlEntitiesParser_GetCharForCode(ЦелУкз сам, бцел код);
//! \endcond

//-----------------------------------------------------------------------------
export class ПарсерСущностейГЯР : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export  this()
    {
        super(wxHtmlEntitiesParser_ctor());
    }

    //-----------------------------------------------------------------------------

    export проц кодировка(ПКодировкаШрифта значение)
    {
        wxHtmlEntitiesParser_SetEncoding(вхобъ, cast(цел)значение);
    }

    //-----------------------------------------------------------------------------

    export ткст разбор(ткст ввод)
    {
        return cast(ткст) new ВизТкст(wxHtmlEntitiesParser_Parse(вхобъ, ввод), да);
    }

    //-----------------------------------------------------------------------------

    export char дайСимСущности(ткст сущность)
    {
        return wxHtmlEntitiesParser_GetEntityChar(вхобъ, сущность);
    }

    export char дайСимДляКода(цел код)
    {
        return wxHtmlEntitiesParser_GetCharForCode(вхобъ, cast(бцел)код);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) проц   wxHtmlParser_SetFS(ЦелУкз сам, ЦелУкз fs);
extern (C) ЦелУкз wxHtmlParser_GetFS(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlParser_OpenURL(ЦелУкз сам, цел тип, ткст улр);
extern (C) ЦелУкз wxHtmlParser_Parse(ЦелУкз сам, ткст исток);
extern (C) проц   wxHtmlParser_InitParser(ЦелУкз сам, ткст исток);
extern (C) проц   wxHtmlParser_DoneParser(ЦелУкз сам);
extern (C) проц   wxHtmlParser_StopParsing(ЦелУкз сам);
extern (C) проц   wxHtmlParser_DoParsing(ЦелУкз сам, цел начПоз, цел конПоз);
extern (C) проц   wxHtmlParser_DoParsingAll(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlParser_GetCurrentTag(ЦелУкз сам);
extern (C) проц   wxHtmlParser_AddTagHandler(ЦелУкз сам, ЦелУкз обработчик);
extern (C) проц   wxHtmlParser_PushTagHandler(ЦелУкз сам, ЦелУкз обработчик, ткст тэги);
extern (C) проц   wxHtmlParser_PopTagHandler(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlParser_GetSource(ЦелУкз сам);
extern (C) проц   wxHtmlParser_SetSource(ЦелУкз сам, ткст src);
extern (C) проц   wxHtmlParser_SetSourceAndSaveState(ЦелУкз сам, ткст src);
extern (C) бул   wxHtmlParser_RestoreState(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlParser_ExtractCharsetInformation(ЦелУкз сам, ткст маркап);
//! \endcond

//-----------------------------------------------------------------------------

export abstract class ПарсерГЯР : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    //-----------------------------------------------------------------------------

    /*export проц УстFS(FileSystem fs)
    {
        wxHtmlParser_SetFS(вхобъ, ВизОбъект.безопУк(fs));
    }

    //-----------------------------------------------------------------------------

    export FileSystem GetFS()
    {
        return wxHtmlParser_GetFS(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export FSFile OpenURL(ПтипУЛРГЯР тип, ткст улр)
    {
        return wxHtmlParser_OpenURL(вхобъ, ВизОбъект.безопУк(тип), улр);
    }*/

    //-----------------------------------------------------------------------------

    export ВизОбъект разбор(ткст исток)
    {
        return new ВизОбъект(wxHtmlParser_Parse(вхобъ, исток));
    }

    //-----------------------------------------------------------------------------

    export  проц иницПарсер(ткст исток)
    {
        wxHtmlParser_InitParser(вхобъ, исток);
    }

    //-----------------------------------------------------------------------------

    export  проц парсерВыполнен()
    {
        wxHtmlParser_DoneParser(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц стопРазбор()
    {
        wxHtmlParser_StopParsing(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц выполниРазбор(цел начПоз, цел конПоз)
    {
        wxHtmlParser_DoParsing(вхобъ, начПоз, конПоз);
    }

    //-----------------------------------------------------------------------------

    export проц выполниРазбор()
    {
        wxHtmlParser_DoParsingAll(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export ТэгГЯР дайТекТэг()
    {
        return ТэгГЯР.найдиОбъ(wxHtmlParser_GetCurrentTag(вхобъ));
    }

    //-----------------------------------------------------------------------------

    export abstract ВизОбъект продукт();

    //-----------------------------------------------------------------------------

    export проц добавьОбработчикТэга(ОбработчикТэгаГЯР обработчик)
    {
        wxHtmlParser_AddTagHandler(вхобъ, ВизОбъект.безопУк(обработчик));
    }

    //-----------------------------------------------------------------------------

    export проц суньОбработчикТэга(ОбработчикТэгаГЯР обработчик, ткст тэги)
    {
        wxHtmlParser_PushTagHandler(вхобъ, ВизОбъект.безопУк(обработчик), тэги);
    }

    //-----------------------------------------------------------------------------

    export проц выньОбработчикТэга()
    {
        wxHtmlParser_PopTagHandler(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export ткст источник()
    {
        return cast(ткст) new ВизТкст(wxHtmlParser_GetSource(вхобъ), да);
    }
    export проц источник(ткст значение)
    {
        wxHtmlParser_SetSource(вхобъ, значение);
    }

    export проц истокИСохрСост(ткст значение)
    {
        wxHtmlParser_SetSourceAndSaveState(вхобъ, значение);
    }

    export бул восстановиСостояние()
    {
        return wxHtmlParser_RestoreState(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export ткст извлекиИнфоГарнитуре(ткст маркап)
    {
        return cast(ткст) new ВизТкст(wxHtmlParser_ExtractCharsetInformation(вхобъ, маркап), да);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) цел    wxHtmlProcessor_GetPriority(ЦелУкз сам);
extern (C) проц   wxHtmlProcessor_Enable(ЦелУкз сам, бул вкл);
extern (C) бул   wxHtmlProcessor_IsEnabled(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export abstract class ПроцессорГЯР : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export abstract ткст процесс(ткст текст);

    //-----------------------------------------------------------------------------

    export цел приоритет()
    {
        return wxHtmlProcessor_GetPriority(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц активен(бул значение)
    {
        wxHtmlProcessor_Enable(вхобъ, значение);
    }
    export бул активен()
    {
        return wxHtmlProcessor_IsEnabled(вхобъ);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxHtmlRenderingInfo_ctor();
extern (C) проц wxHtmlRenderingInfo_dtor(ЦелУкз сам);
extern (C) проц wxHtmlRenderingInfo_SetSelection(ЦелУкз сам, ЦелУкз т);
extern (C) ЦелУкз wxHtmlRenderingInfo_GetSelection(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class ИнфОбОтображенииГЯР : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    private this(ЦелУкз вхобъ, бул памСобств)
    {
        super(вхобъ);
        this.памСобств = памСобств;
    }

    export this()
    {
        this(wxHtmlRenderingInfo_ctor(), да);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxHtmlRenderingInfo_dtor(вхобъ);
    }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
    //-----------------------------------------------------------------------------

    export ВыделениеГЯР выделение()
    {
        return cast(ВыделениеГЯР)найдиОбъект(wxHtmlRenderingInfo_GetSelection(вхобъ), &ВыделениеГЯР.Нов);
    }
    export проц выделение(ВыделениеГЯР значение)
    {
        wxHtmlRenderingInfo_SetSelection(вхобъ, ВизОбъект.безопУк(значение));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxHtmlSelection_ctor();
extern (C) проц wxHtmlSelection_dtor(ЦелУкз сам);
extern (C) проц wxHtmlSelection_Set(ЦелУкз сам, inout Точка позОт, ЦелУкз отЯчейки, inout Точка позДо, ЦелУкз доЯчейки);
extern (C) проц wxHtmlSelection_Set2(ЦелУкз сам, ЦелУкз отЯчейки, ЦелУкз доЯчейки);
extern (C) ЦелУкз wxHtmlSelection_GetFromCell(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlSelection_GetToCell(ЦелУкз сам);
extern (C) проц wxHtmlSelection_GetFromPos(ЦелУкз сам, out Точка позОт);
extern (C) проц wxHtmlSelection_GetToPos(ЦелУкз сам, out Точка позДо);
extern (C) проц wxHtmlSelection_GetFromPrivPos(ЦелУкз сам, out Точка fromPrivPos);
extern (C) проц wxHtmlSelection_GetToPrivPos(ЦелУкз сам, out Точка toPrivPos);
extern (C) проц wxHtmlSelection_SetFromPrivPos(ЦелУкз сам, inout Точка поз);
extern (C) проц wxHtmlSelection_SetToPrivPos(ЦелУкз сам, inout Точка поз);
extern (C) проц wxHtmlSelection_ClearPrivPos(ЦелУкз сам);
extern (C) бул wxHtmlSelection_IsEmpty(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

export class ВыделениеГЯР : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    private this(ЦелУкз вхобъ, бул памСобств)
    {
        super(вхобъ);
        this.памСобств = памСобств;
    }

    export this()
    {
        this(wxHtmlSelection_ctor(), да);
    }

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new ВыделениеГЯР(ptr);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxHtmlSelection_dtor(вхобъ);
    }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
    //-----------------------------------------------------------------------------

    export проц установи(Точка позОт, ЯчейкаГЯР отЯчейки, Точка позДо, ЯчейкаГЯР доЯчейки)
    {
        wxHtmlSelection_Set(вхобъ, позОт, ВизОбъект.безопУк(отЯчейки), позДо, ВизОбъект.безопУк(доЯчейки));
    }

    export проц установи(ЯчейкаГЯР отЯчейки, ЯчейкаГЯР доЯчейки)
    {
        wxHtmlSelection_Set2(вхобъ, ВизОбъект.безопУк(отЯчейки), ВизОбъект.безопУк(доЯчейки));
    }

    //-----------------------------------------------------------------------------

    export ЯчейкаГЯР ячейкаОт()
    {
        return cast(ЯчейкаГЯР)найдиОбъект(wxHtmlSelection_GetFromCell(вхобъ), &ЯчейкаГЯР.Нов);
    }

    export ЯчейкаГЯР ячейкаДо()
    {
        return cast(ЯчейкаГЯР)найдиОбъект(wxHtmlSelection_GetToCell(вхобъ), &ЯчейкаГЯР.Нов);
    }

    //-----------------------------------------------------------------------------

    export Точка позОт()
    {
        Точка tpoint;
        wxHtmlSelection_GetFromPos(вхобъ, tpoint);
        return tpoint;
    }

    export Точка позДо()
    {
        Точка tpoint;
        wxHtmlSelection_GetToPos(вхобъ, tpoint);
        return tpoint;
    }

    //-----------------------------------------------------------------------------

    export Точка отПривПоз()
    {
        Точка tpoint;
        wxHtmlSelection_GetFromPrivPos(вхобъ, tpoint);
        return tpoint;
    }

    export проц отПривПоз(Точка значение)
    {
        wxHtmlSelection_SetFromPrivPos(вхобъ, значение);
    }

    export Точка доПривПоз()
    {
        Точка tpoint;
        wxHtmlSelection_GetToPrivPos(вхобъ, tpoint);
        return tpoint;
    }

    export проц доПривПоз(Точка значение)
    {
        wxHtmlSelection_SetToPrivPos(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export проц очистьПривПоз()
    {
        wxHtmlSelection_ClearPrivPos(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export бул пуст()
    {
        return wxHtmlSelection_IsEmpty(вхобъ);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxHtmlEasyPrinting_ctor(ткст имя, ЦелУкз родитель);
extern (C) бул   wxHtmlEasyPrinting_PreviewFile(ЦелУкз сам, ткст файлГЯР);
extern (C) бул   wxHtmlEasyPrinting_PreviewText(ЦелУкз сам, ткст текстГяр, ткст базПуть);
extern (C) бул   wxHtmlEasyPrinting_PrintFile(ЦелУкз сам, ткст файлГЯР);
extern (C) бул   wxHtmlEasyPrinting_PrintText(ЦелУкз сам, ткст текстГяр, ткст базПуть);
//extern (C) проц   wxHtmlEasyPrinting_PrinterSetup(ЦелУкз сам);
extern (C) проц   wxHtmlEasyPrinting_PageSetup(ЦелУкз сам);
extern (C) проц   wxHtmlEasyPrinting_SetHeader(ЦелУкз сам, ткст заголовок, цел страница);
extern (C) проц   wxHtmlEasyPrinting_SetFooter(ЦелУкз сам, ткст подвал, цел страница);
extern (C) проц   wxHtmlEasyPrinting_SetFonts(ЦелУкз сам, ткст нормФас, ткст фиксФас, цел* размы);
extern (C) проц   wxHtmlEasyPrinting_SetStandardFonts(ЦелУкз сам, цел размер, ткст нормФас, ткст фиксФас);
extern (C) ЦелУкз wxHtmlEasyPrinting_GetPrintData(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlEasyPrinting_GetPageSetupData(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------


export class ЛёгкаяПечатьГЯР : ВизОбъект
{
    public const цел НечётныеСтраницы	= 0;
    public const цел ЧётныеСтраницы	= 1;
    public const цел ВсеСтраницы	= 2;

    //-----------------------------------------------------------------------------

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        this("Printing", пусто);
    }

    export this(ткст имя)
    {
        this(имя, пусто);
    }

    export this(ткст имя, Окно родитОкно)
    {
        super(wxHtmlEasyPrinting_ctor(имя, ВизОбъект.безопУк(родитОкно)));
    }

    //-----------------------------------------------------------------------------

    export бул предпросмотрФайла(ткст файлГЯР)
    {
        return wxHtmlEasyPrinting_PreviewFile(вхобъ, файлГЯР);
    }

    //-----------------------------------------------------------------------------

    export бул предпросмотрТекста(ткст текстГяр)
    {
        return предпросмотрТекста(текстГяр, "");
    }

    export бул предпросмотрТекста(ткст текстГяр, ткст базПуть)
    {
        return wxHtmlEasyPrinting_PreviewText(вхобъ, текстГяр, базПуть);
    }

    //-----------------------------------------------------------------------------

    export бул печатьФайла(ткст файлГЯР)
    {
        return wxHtmlEasyPrinting_PrintFile(вхобъ, файлГЯР);
    }

    //-----------------------------------------------------------------------------

    export бул печатьТекста(ткст текстГяр)
    {
        return печатьТекста(текстГяр, "");
    }

    export бул печатьТекста(ткст текстГяр, ткст базПуть)
    {
        return wxHtmlEasyPrinting_PrintText(вхобъ, текстГяр, базПуть);
    }

    //-----------------------------------------------------------------------------

    /*export проц PrinterSetup()
    {
    	wxHtmlEasyPrinting_PrinterSetup(вхобъ);
    }*/

    //-----------------------------------------------------------------------------

    export проц настройкаСтраницы()
    {
        wxHtmlEasyPrinting_PageSetup(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц устЗаголовок(ткст заголовок)
    {
        устЗаголовок(заголовок, ВсеСтраницы);
    }

    export проц устЗаголовок(ткст заголовок, цел страница)
    {
        wxHtmlEasyPrinting_SetHeader(вхобъ, заголовок, страница);
    }

    //-----------------------------------------------------------------------------

    export проц устПодвал(ткст подвал)
    {
        устПодвал(подвал, ВсеСтраницы);
    }

    export проц устПодвал(ткст подвал, цел страница)
    {
        wxHtmlEasyPrinting_SetFooter(вхобъ, подвал, страница);
    }

    //-----------------------------------------------------------------------------

    export проц устШрифты(ткст нормФас, ткст фиксФас)
    {
        устШрифты(нормФас, фиксФас, пусто);
    }

    export проц устШрифты(ткст нормФас, ткст фиксФас, цел[] размы)
    {
        wxHtmlEasyPrinting_SetFonts(вхобъ, нормФас, фиксФас, размы.ptr);
    }

    //-----------------------------------------------------------------------------

    export проц устСтандартнШрифты()
    {
        устСтандартнШрифты(-1, "", "");
    }

    export проц устСтандартнШрифты(цел размер)
    {
        устСтандартнШрифты(размер, "", "");
    }

    export проц устСтандартнШрифты(цел размер, ткст нормФас)
    {
        устСтандартнШрифты(размер, нормФас, "");
    }

    export проц устСтандартнШрифты(цел размер, ткст нормФас, ткст фиксФас)
    {
        wxHtmlEasyPrinting_SetStandardFonts(вхобъ, размер, нормФас, фиксФас);
    }

    //-----------------------------------------------------------------------------

    export ДанныеПечати данныеПечати()
    {
        return cast(ДанныеПечати)найдиОбъект(wxHtmlEasyPrinting_GetPrintData(вхобъ), &ДанныеПечати.Нов);
    }

    //-----------------------------------------------------------------------------

    export ДанныеДиалогаНастройкиСтраницы данныеНастройкиСтраницы()
    {
        return cast(ДанныеДиалогаНастройкиСтраницы)найдиОбъект(wxHtmlEasyPrinting_GetPageSetupData(вхобъ), &ДанныеДиалогаНастройкиСтраницы.Нов);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C)
{
    alias проц function(ОкноГЯР объ, ЦелУкз ссылка) Virtual_OnLinkClicked;
    alias проц function(ОкноГЯР объ, ЦелУкз титул) Virtual_OnУстTitle;
    alias проц function(ОкноГЯР объ, ЦелУкз ячейка, цел x, цел y) Virtual_OnCellMouseHover;
    alias проц function(ОкноГЯР объ, ЦелУкз ячейка, цел x, цел y, ЦелУкз собМыши) Virtual_OnCellClicked;
    alias цел function(ОкноГЯР объ, цел тип, ЦелУкз улр, ЦелУкз переадр) Virtual_OnOpeningURL;
}

extern (C) ЦелУкз wxHtmlWindow_ctor();
extern (C) проц   wxHtmlWindow_RegisterVirtual(ЦелУкз сам, ОкноГЯР объ,
        Virtual_OnLinkClicked onLinkClicked,
        Virtual_OnУстTitle onУстTitle,
        Virtual_OnCellMouseHover onCellMouseHover,
        Virtual_OnCellClicked onCellClicked,
        Virtual_OnOpeningURL onOpeningURL);
extern (C) бул   wxHtmlWindow_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер размер, бцел стиль, ткст имя);
extern (C) бул   wxHtmlWindow_SetPage(ЦелУкз сам, ткст исток);
extern (C) бул   wxHtmlWindow_AppendToPage(ЦелУкз сам, ткст исток);
extern (C) бул   wxHtmlWindow_LoadPage(ЦелУкз сам, ткст локация);
extern (C) бул   wxHtmlWindow_LoadFile(ЦелУкз сам, ткст имяф);
extern (C) ЦелУкз wxHtmlWindow_GetOpenedPage(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlWindow_GetOpenedAnchor(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlWindow_GetOpenedPageTitle(ЦелУкз сам);
extern (C) проц   wxHtmlWindow_SetRelatedFrame(ЦелУкз сам, ЦелУкз рамка, ткст format);
extern (C) ЦелУкз wxHtmlWindow_GetRelatedFrame(ЦелУкз сам);
extern (C) проц   wxHtmlWindow_SetRelatedStatusBar(ЦелУкз сам, цел bar);
extern (C) проц   wxHtmlWindow_SetFonts(ЦелУкз сам, ткст нормФас, ткст фиксФас, цел* размы);
extern (C) проц   wxHtmlWindow_SetBorders(ЦелУкз сам, цел с);
extern (C) проц   wxHtmlWindow_ReadCustomization(ЦелУкз сам, ЦелУкз кфг, ткст путь);
extern (C) проц   wxHtmlWindow_WriteCustomization(ЦелУкз сам, ЦелУкз кфг, ткст путь);
extern (C) бул   wxHtmlWindow_HistoryBack(ЦелУкз сам);
extern (C) бул   wxHtmlWindow_HistoryForward(ЦелУкз сам);
extern (C) бул   wxHtmlWindow_HistoryCanBack(ЦелУкз сам);
extern (C) бул   wxHtmlWindow_HistoryCanForward(ЦелУкз сам);
extern (C) проц   wxHtmlWindow_HistoryClear(ЦелУкз сам);
extern (C) ЦелУкз wxHtmlWindow_GetInternalRepresentation(ЦелУкз сам);
extern (C) проц   wxHtmlWindow_AddFilter(ЦелУкз фильтр);
extern (C) ЦелУкз wxHtmlWindow_GetParser(ЦелУкз сам);
extern (C) проц   wxHtmlWindow_AddProcessor(ЦелУкз сам, ЦелУкз процессор);
extern (C) проц   wxHtmlWindow_AddGlobalProcessor(ЦелУкз процессор);
extern (C) бул   wxHtmlWindow_AcceptsFocusFromKeyboard(ЦелУкз сам);
extern (C) проц   wxHtmlWindow_OnSetTitle(ЦелУкз сам, ткст титул);
extern (C) проц   wxHtmlWindow_OnCellClicked(ЦелУкз сам, ЦелУкз ячейка, цел x, цел y, ЦелУкз соб);
extern (C) проц   wxHtmlWindow_OnLinkClicked(ЦелУкз сам, ЦелУкз ссылка);
extern (C) цел    wxHtmlWindow_OnOpeningURL(ЦелУкз сам, цел тип, ткст улр, ткст переадр);

extern (C) проц   wxHtmlWindow_SelectAll(ЦелУкз сам);
extern (C) проц   wxHtmlWindow_SelectWord(ЦелУкз сам, inout Точка поз);
extern (C) проц   wxHtmlWindow_SelectLine(ЦелУкз сам, inout Точка поз);

extern (C) ЦелУкз wxHtmlWindow_ToText(ЦелУкз сам);

extern (C) ЦелУкз wxHtmlWindow_SelectionToText(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------


export class ОкноГЯР : ОкноСПрокруткой
{
    public const цел БЕЗ_СКРОЛЛБАРА   = 0x0002;
    public const цел АВТОСКРОЛЛБАР    = 0x0004;
    public const цел БЕЗ_ВЫДЕЛЕНИЯ      = 0x0008;

    //-----------------------------------------------------------------------------

    export this(ЦелУкз  вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxHtmlWindow_ctor());
    }

    export this(Окно родитель, цел ид /*= ЛЮБОЙ*/, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = АВТОСКРОЛЛБАР, ткст имя = "htmlWindow")
    {
        super(wxHtmlWindow_ctor());

        wxHtmlWindow_RegisterVirtual(вхобъ, this,
                                     &staticDoOnLinkClicked,
                                     &staticDoOnSetTitle,
                                     &staticDoOnCellMouseHover,
                                     &staticDoOnCellClicked,
                                     &staticDoOnOpeningURL
                                    );

        if (!создай(родитель, ид, поз, размер, стиль, имя))
        {
            throw new ИсклНевернОперации("Не удалось создать ОкноГЯР");
        }
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    export this(Окно родитель, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль = АВТОСКРОЛЛБАР, ткст имя = "htmlWindow")
    {
        this(родитель, Окно.уникИд, поз, размер, стиль, имя);
    }

    //-----------------------------------------------------------------------------

    export override бул создай(Окно родитель, цел ид, inout Точка поз, inout Размер размер, цел стиль, ткст имя)
    {
        return wxHtmlWindow_Create(вхобъ, ВизОбъект.безопУк(родитель), ид, поз, размер, cast(бцел)стиль, имя);
    }

    //-----------------------------------------------------------------------------

    export бул устСтраницу(ткст исток)
    {
        return wxHtmlWindow_SetPage(вхобъ, исток);
    }

    export бул приставьКСтранице(ткст исток)
    {
        return wxHtmlWindow_AppendToPage(вхобъ, исток);
    }

    //-----------------------------------------------------------------------------

    export  бул загрузиСтраницу(ткст локация)
    {
        return wxHtmlWindow_LoadPage(вхобъ, локация);
    }

    export бул загрузиФайл(ткст имяф)
    {
        return wxHtmlWindow_LoadFile(вхобъ, имяф);
    }

    //-----------------------------------------------------------------------------

    export ткст открытаяСтраница()
    {
        return cast(ткст) new ВизТкст(wxHtmlWindow_GetOpenedPage(вхобъ), да);
    }

    export ткст открытыйЯкорь()
    {
        return cast(ткст) new ВизТкст(wxHtmlWindow_GetOpenedAnchor(вхобъ), да);
    }

    export ткст титулОткрытойСтраницы()
    {
        return cast(ткст) new ВизТкст(wxHtmlWindow_GetOpenedPageTitle(вхобъ), да);
    }

    //-----------------------------------------------------------------------------

    export проц устОтносящРамку(Рамка рамка, ткст format)
    {
        wxHtmlWindow_SetRelatedFrame(вхобъ, ВизОбъект.безопУк(рамка), format);
    }

    export Рамка относящРамка()
    {
        return cast(Рамка)найдиОбъект(wxHtmlWindow_GetRelatedFrame(вхобъ), &Рамка.Нов);
    }

    //-----------------------------------------------------------------------------

    export проц относящСтатусбар(цел значение)
    {
        wxHtmlWindow_SetRelatedStatusBar(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export проц устШрифты(ткст нормФас, ткст фиксФас, цел[] размы)
    {
        wxHtmlWindow_SetFonts(вхобъ, нормФас, фиксФас, размы.ptr);
    }

    //-----------------------------------------------------------------------------

    export проц бордюры(цел значение)
    {
        wxHtmlWindow_SetBorders(вхобъ, значение);
    }

    //-----------------------------------------------------------------------------

    export  проц читайКустомизацию(Конфиг кфг, ткст путь)
    {
        wxHtmlWindow_ReadCustomization(вхобъ, ВизОбъект.безопУк(кфг), путь);
    }

    //-----------------------------------------------------------------------------

    export  проц пишиКустомизацию(Конфиг кфг, ткст путь)
    {
        wxHtmlWindow_WriteCustomization(вхобъ, ВизОбъект.безопУк(кфг), путь);
    }

    //-----------------------------------------------------------------------------

    export бул историяНазад()
    {
        return wxHtmlWindow_HistoryBack(вхобъ);
    }

    export бул историяВперёд()
    {
        return wxHtmlWindow_HistoryForward(вхобъ);
    }

    export бул историяМожноНазад()
    {
        return wxHtmlWindow_HistoryCanBack(вхобъ);
    }

    export бул историяМожноВперёд()
    {
        return wxHtmlWindow_HistoryCanForward(вхобъ);
    }

    export проц историяОчисти()
    {
        wxHtmlWindow_HistoryClear(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export ЯчейкаКонтейнераГЯР внутрПредставление()
    {
        return cast(ЯчейкаКонтейнераГЯР)найдиОбъект(wxHtmlWindow_GetInternalRepresentation(вхобъ), &ЯчейкаКонтейнераГЯР.Нов);
    }

    //-----------------------------------------------------------------------------

    export static проц добавьФильтр(ФильтрГЯР фильтр)
    {
        wxHtmlWindow_AddFilter(ВизОбъект.безопУк(фильтр));
    }

    //-----------------------------------------------------------------------------

    export ПарсерГЯРОкна парсер()
    {
        return cast(ПарсерГЯРОкна)найдиОбъект(wxHtmlWindow_GetParser(вхобъ), &ПарсерГЯРОкна.Нов);
    }

    //-----------------------------------------------------------------------------

    export проц добавьПроцессор(ПроцессорГЯР процессор)
    {
        wxHtmlWindow_AddProcessor(вхобъ, ВизОбъект.безопУк(процессор));
    }

    export static проц добавьГлобПроцессор(ПроцессорГЯР процессор)
    {
        wxHtmlWindow_AddGlobalProcessor(ВизОбъект.безопУк(процессор));
    }

    //-----------------------------------------------------------------------------

    export override бул фокусируемоПоКлавиатуре()
    {
        return wxHtmlWindow_AcceptsFocusFromKeyboard(вхобъ);
    }

    //-----------------------------------------------------------------------------

    static export extern(C)  проц staticDoOnSetTitle(ОкноГЯР объ, ЦелУкз титул)
    {
        объ.приУстановкеТитула(cast(ткст) new ВизТкст(титул));
    }

    export  проц приУстановкеТитула(ткст титул)
    {
        wxHtmlWindow_OnSetTitle(вхобъ, титул);
    }

    //-----------------------------------------------------------------------------

    static export extern(C)  проц staticDoOnCellMouseHover(ОкноГЯР объ, ЦелУкз ячейка, цел x, цел y)
    {
        объ.приМышьНадЯчейкой(new ЯчейкаГЯР(ячейка), x, y);
    }

    export  проц приМышьНадЯчейкой(ЯчейкаГЯР ячейка, цел x, цел y)
    {
        // Do nothing here
    }

    //-----------------------------------------------------------------------------

    static export extern(C)  проц staticDoOnCellClicked(ОкноГЯР объ, ЦелУкз ячейка, цел x, цел y, ЦелУкз собМыши)
    {
        объ.приНажатииЯчейки(new ЯчейкаГЯР(ячейка), x, y, new СобытиеМыши(собМыши));
    }

    export  проц приНажатииЯчейки(ЯчейкаГЯР ячейка, цел x, цел y, СобытиеМыши соб)
    {
        wxHtmlWindow_OnCellClicked(вхобъ, ВизОбъект.безопУк(ячейка), x, y, ВизОбъект.безопУк(соб));
    }

    //-----------------------------------------------------------------------------

    static export extern(C)  проц staticDoOnLinkClicked(ОкноГЯР объ, ЦелУкз ссылка)
    {
        объ.приНажатииСсылки(new ИнфОСсылкеГЯР(ссылка));
    }

    export  проц приНажатииСсылки(ИнфОСсылкеГЯР ссылка)
    {
        wxHtmlWindow_OnLinkClicked(вхобъ, ВизОбъект.безопУк(ссылка));
    }

    //-----------------------------------------------------------------------------

    static export extern(C)  цел staticDoOnOpeningURL(ОкноГЯР объ, цел тип, ЦелУкз улр, ЦелУкз переадр)
    {
        return cast(цел)объ.приОткрытииУЛР(cast(ПтипУЛРГЯР) тип, cast(ткст) new ВизТкст(улр), cast(ткст) new ВизТкст(переадр));
    }

    export ПСтатусОткрыванияГЯР приОткрытииУЛР(ПтипУЛРГЯР тип, ткст улр, ткст переадр)
    {
        return cast(ПСтатусОткрыванияГЯР)wxHtmlWindow_OnOpeningURL(вхобъ, cast(цел)тип, улр, переадр);
    }

    //-----------------------------------------------------------------------------

    export проц выделиВсе()
    {
        wxHtmlWindow_SelectAll(вхобъ);
    }

    //-----------------------------------------------------------------------------

    export проц выделиСтроку(Точка поз)
    {
        wxHtmlWindow_SelectLine(вхобъ, поз);
    }

    //-----------------------------------------------------------------------------

    export проц выделиСлово(Точка поз)
    {
        wxHtmlWindow_SelectWord(вхобъ, поз);
    }

    //-----------------------------------------------------------------------------

    export ткст текст()
    {
        return cast(ткст) new ВизТкст(wxHtmlWindow_ToText(вхобъ), да);
    }

    //-----------------------------------------------------------------------------

    export ткст текстВыделения()
    {
        return cast(ткст) new ВизТкст(wxHtmlWindow_SelectionToText(вхобъ), да);
    }
}

