module wx.aui.DockArt;
public import  wx.aui.FrameManager;
public import wx.wx;

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C) alias цел function(ДокАрт объ, цел ид) Virtual_GetMetric;
extern (C) alias проц function(ДокАрт объ, цел ид, цел новЗнач) Virtual_SetMetric;
extern (C) alias проц function(ДокАрт объ, цел ид, ЦелУкз шрифт) Virtual_SetFont;
extern (C) alias ЦелУкз function(ДокАрт объ, цел ид) Virtual_GetFont;
extern (C) alias ЦелУкз function(ДокАрт объ, цел ид) Virtual_GetColour;
extern (C) alias проц function(ДокАрт объ, цел ид, ЦелУкз цвет) Virtual_SetColour;
extern (C) alias ЦелУкз function(ДокАрт объ, цел ид) Virtual_GetColor;
extern (C) alias проц function(ДокАрт объ, цел ид, ЦелУкз цв) Virtual_SetColor;
extern (C) alias проц function(ДокАрт объ, ЦелУкз ку, цел ориентация, inout Прямоугольник прям) Virtual_DrawSash;
extern (C) alias проц function(ДокАрт объ, ЦелУкз ку, цел ориентация, inout Прямоугольник прям) Virtual_DrawBackground;
extern (C) alias проц function(ДокАрт объ, ЦелУкз ку, ткст текст, inout Прямоугольник прям, ЦелУкз пано) Virtual_DrawCaption;
extern (C) alias проц function(ДокАрт объ, ЦелУкз ку, inout Прямоугольник прям, ЦелУкз пано) Virtual_DrawGripper;
extern (C) alias проц function(ДокАрт объ, ЦелУкз ку, inout Прямоугольник прям, ЦелУкз пано) Virtual_DrawBorder;
extern (C) alias проц function(ДокАрт объ, ЦелУкз ку, цел button, цел состКнопки, inout Прямоугольник прям, ЦелУкз пано) Virtual_DrawPaneButton;

//-----------------------------------------------------------------------------

static export extern (C) ЦелУкз wxDockArt_ctor();
static export extern (C) проц wxDockArt_dtor(ЦелУкз сам);
static export extern (C) ЦелУкз wxDefaultDockArt_ctor();
static export extern (C) проц wxDefaultDockArt_dtor(ЦелУкз сам);
static export extern (C) проц wxDockArt_RegisterVirtual(ЦелУкз сам, ДокАрт объ,
        Virtual_GetMetric getMetric,
        Virtual_SetMetric setMetric,
        Virtual_SetFont setFont,
        Virtual_GetFont getFont,
        Virtual_GetColour getColour,
        Virtual_SetColour setColour,
        Virtual_GetColor getColor,
        Virtual_SetColor setColor,
        Virtual_DrawSash drawSash,
        Virtual_DrawBackground drawBackground,
        Virtual_DrawCaption drawCaption,
        Virtual_DrawGripper drawGripper,
        Virtual_DrawBorder drawBorder,
        Virtual_DrawPaneButton drawPaneButton);
static export extern (C) цел wxDockArt_GetMetric(ЦелУкз сам, цел ид);
static export extern (C) проц wxDockArt_SetMetric(ЦелУкз сам, цел ид, цел новЗнач);
static export extern (C) проц wxDockArt_SetFont(ЦелУкз сам, цел ид, ЦелУкз шрифт);
static export extern (C) ЦелУкз wxDockArt_GetFont(ЦелУкз сам, цел ид);
static export extern (C) ЦелУкз wxDockArt_GetColour(ЦелУкз сам, цел ид);
static export extern (C) проц wxDockArt_SetColour(ЦелУкз сам, цел ид, ЦелУкз цвет);
static export extern (C) ЦелУкз wxDockArt_GetColor(ЦелУкз сам, цел ид);
static export extern (C) проц wxDockArt_SetColor(ЦелУкз сам, цел ид, ЦелУкз цв);
static export extern (C) проц wxDockArt_DrawSash(ЦелУкз сам, ЦелУкз ку, цел ориентация, inout Прямоугольник прям);
static export extern (C) проц wxDockArt_DrawBackground(ЦелУкз сам, ЦелУкз ку, цел ориентация, inout Прямоугольник прям);
static export extern (C) проц wxDockArt_DrawCaption(ЦелУкз сам, ЦелУкз ку, ткст текст, inout Прямоугольник прям, ЦелУкз пано);
static export extern (C) проц wxDockArt_DrawGripper(ЦелУкз сам, ЦелУкз ку, inout Прямоугольник прям, ЦелУкз пано);
static export extern (C) проц wxDockArt_DrawBorder(ЦелУкз сам, ЦелУкз ку, inout Прямоугольник прям, ЦелУкз пано);
static export extern (C) проц wxDockArt_DrawPaneButton(ЦелУкз сам, ЦелУкз ку, цел button, цел состКнопки, inout Прямоугольник прям, ЦелУкз пано);
//! \endcond

//-----------------------------------------------------------------------------

/// dock art provider код - a dock provider provides all drawing
/// functionality до the wxAui dock manager.  This allows the dock
/// manager до have plugable look-and-feels
export class ДокАрт : ВизОбъект
{
    ЦелУкз proxy;

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
        proxy = wxDockArt_ctor();
        wxDockArt_RegisterVirtual(proxy, this,
                                  &staticGetMetric,
                                  &staticSetMetric,
                                  &staticSetFont,
                                  &staticGetFont,
                                  &staticGetColour,
                                  &staticSetColour,
                                  &staticGetColor,
                                  &staticSetColor,
                                  &staticDrawSash,
                                  &staticDrawBackground,
                                  &staticDrawCaption,
                                  &staticDrawGripper,
                                  &staticDrawBorder,
                                  &staticDrawPaneButton);
    }

    override  проц dtor()
    {
        wxDockArt_dtor(proxy);
    }

    extern (C)  static цел staticGetMetric(ДокАрт объ, цел ид)
    {
        return объ.дайМетрику(ид);
    }
    extern (C)  static проц staticSetMetric(ДокАрт объ, цел ид, цел новЗнач)
    {
        объ.устМетрику(ид, новЗнач);
    }
    extern (C)  static проц staticSetFont(ДокАрт объ, цел ид, ЦелУкз шрифт)
    {
        ВизОбъект o = найдиОбъект(шрифт);
        Шрифт f = (o)? cast(Шрифт)o : new Шрифт(шрифт);
        объ.устШрифт(ид, f);
    }
    extern (C)  static ЦелУкз staticGetFont(ДокАрт объ, цел ид)
    {
        return ВизОбъект.безопУк(объ.дайШрифт(ид));
    }
    extern (C)  static ЦелУкз staticGetColour(ДокАрт объ, цел ид)
    {
        return ВизОбъект.безопУк(объ.дайЦвет(ид));
    }
    extern (C)  static проц staticSetColour(ДокАрт объ, цел ид, ЦелУкз цвет)
    {
        ВизОбъект o = найдиОбъект(цвет);
        Цвет c = (o)? cast(Цвет)o : new Цвет(цвет);
        объ.устЦвет(ид, c);
    }
    extern (C)  static ЦелУкз staticGetColor(ДокАрт объ, цел ид)
    {
        return ВизОбъект.безопУк(объ.дайЦвет(ид));
    }
    extern (C)  static проц staticSetColor(ДокАрт объ, цел ид, ЦелУкз цв)
    {
        ВизОбъект o = найдиОбъект(цв);
        Цвет c = (o)? cast(Цвет)o : new Цвет(цв);
        объ.устЦвет(ид, c);
    }
    extern (C)  static проц staticDrawSash(ДокАрт объ, ЦелУкз ку, цел ориентация, inout Прямоугольник прям)
    {
        ВизОбъект o = найдиОбъект(ку);
        КонтекстУстройства d = (o)? cast(КонтекстУстройства)o : new КонтекстУстройства(ку);
        объ.рисуйСаш(d, ориентация, прям);
    }
    extern (C)  static проц staticDrawBackground(ДокАрт объ, ЦелУкз ку, цел ориентация, inout Прямоугольник прям)
    {
        ВизОбъект o = найдиОбъект(ку);
        КонтекстУстройства d = (o)? cast(КонтекстУстройства)o : new КонтекстУстройства(ку);
        объ.рисуйФон(d, ориентация, прям);
    }
    extern (C)  static проц staticDrawCaption(ДокАрт объ, ЦелУкз ку, ткст текст, inout Прямоугольник прям, ЦелУкз пано)
    {
        ВизОбъект o = найдиОбъект(ку);
        КонтекстУстройства d = (o)? cast(КонтекстУстройства)o : new КонтекстУстройства(ку);
        o = найдиОбъект(пано);
        ИнфОПано p = (o)? cast(ИнфОПано)o : new ИнфОПано(пано);
        объ.рисуйКапшн(d, текст, прям, p);
    }
    extern (C)  static проц staticDrawGripper(ДокАрт объ, ЦелУкз ку, inout Прямоугольник прям, ЦелУкз пано)
    {
        ВизОбъект o = найдиОбъект(ку);
        КонтекстУстройства d = (o)? cast(КонтекстУстройства)o : new КонтекстУстройства(ку);
        o = найдиОбъект(пано);
        ИнфОПано p = (o)? cast(ИнфОПано)o : new ИнфОПано(пано);
        объ.рисуйГриппер(d, прям, p);
    }
    extern (C)  static проц staticDrawBorder(ДокАрт объ, ЦелУкз ку, inout Прямоугольник прям, ЦелУкз пано)
    {
        ВизОбъект o = найдиОбъект(ку);
        КонтекстУстройства d = (o)? cast(КонтекстУстройства)o : new КонтекстУстройства(ку);
        o = найдиОбъект(пано);
        ИнфОПано p = (o)? cast(ИнфОПано)o : new ИнфОПано(пано);
        объ.рисуйБордюр(d, прям, p);
    }
    extern (C)  static проц staticDrawPaneButton(ДокАрт объ, ЦелУкз ку, цел button, цел состКнопки, inout Прямоугольник прям, ЦелУкз пано)
    {
        ВизОбъект o = найдиОбъект(ку);
        КонтекстУстройства d = (o)? cast(КонтекстУстройства)o : new КонтекстУстройства(ку);
        o = найдиОбъект(пано);
        ИнфОПано p = (o)? cast(ИнфОПано)o : new ИнфОПано(пано);
        объ.рисуйКнопкуПано(d, button, состКнопки, прям, p);
    }

    export цел дайМетрику(цел ид)
    {
        return wxDockArt_GetMetric(вхобъ, ид);
    }
    export проц устМетрику(цел ид, цел новЗнач)
    {
        wxDockArt_SetMetric(вхобъ, ид, новЗнач);
    }
    export проц устШрифт(цел ид, Шрифт шрифт)
    {
        wxDockArt_SetFont(вхобъ, ид, ВизОбъект.безопУк(шрифт));
    }
    export Шрифт дайШрифт(цел ид)
    {
        ЦелУкз ptr = wxDockArt_GetFont(вхобъ, ид);
        ВизОбъект o = найдиОбъект(ptr);
        return (o)? cast(Шрифт)o : new Шрифт(ptr);
    }
    export Цвет дайЦвет(цел ид)
    {
        ЦелУкз ptr = wxDockArt_GetColour(вхобъ, ид);
        ВизОбъект o = найдиОбъект(ptr);
        return (o)? cast(Цвет)o : new Цвет(ptr);
    }
    export проц устЦвет(цел ид, Цвет цвет)
    {
        wxDockArt_SetColour(вхобъ, ид, ВизОбъект.безопУк(цвет));
    }
	/*
    export проц устЦвет(цел ид, Цвет цв)
    {
        wxDockArt_SetColor(вхобъ, ид, ВизОбъект.безопУк(цв));
    }
	*/
    export проц рисуйСаш(КонтекстУстройства ку, цел ориентация, Прямоугольник прям)
    {
        wxDockArt_DrawSash(вхобъ, ВизОбъект.безопУк(ку), ориентация, прям);
    }
    export проц рисуйФон(КонтекстУстройства ку, цел ориентация, Прямоугольник прям)
    {
        wxDockArt_DrawBackground(вхобъ, ВизОбъект.безопУк(ку), ориентация, прям);
    }
    export проц рисуйКапшн(КонтекстУстройства ку, ткст текст, Прямоугольник прям, ИнфОПано пано)
    {
        wxDockArt_DrawCaption(вхобъ, ВизОбъект.безопУк(ку), текст, прям, ВизОбъект.безопУк(пано));
    }
    export проц рисуйГриппер(КонтекстУстройства ку, Прямоугольник прям, ИнфОПано пано)
    {
        wxDockArt_DrawGripper(вхобъ, ВизОбъект.безопУк(ку), прям, ВизОбъект.безопУк(пано));
    }
    export проц рисуйБордюр(КонтекстУстройства ку, Прямоугольник прям, ИнфОПано пано)
    {
        wxDockArt_DrawBorder(вхобъ, ВизОбъект.безопУк(ку), прям, ВизОбъект.безопУк(пано));
    }
    export проц рисуйКнопкуПано(КонтекстУстройства ку, цел button, цел состКнопки, Прямоугольник прям, ИнфОПано пано)
    {
        wxDockArt_DrawPaneButton(вхобъ, ВизОбъект.безопУк(ку), button, состКнопки, прям, ВизОбъект.безопУк(пано));
    }
}

/// this is the default art provider for МенеджерРамки.  Dock art
/// can be customized by creating a class derived от this one.
export class ДефДокАрт : ДокАрт
{
    export this()
    {
        super(wxDefaultDockArt_ctor());
    }

    override  проц dtor()
    {
        wxDefaultDockArt_dtor(вхобъ);
    }
}
