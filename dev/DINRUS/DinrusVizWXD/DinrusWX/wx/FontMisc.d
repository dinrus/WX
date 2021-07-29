module wx.FontMisc;
public import wx.common;
public import wx.Font;
public import wx.Window;
public import wx.ArrayString;

//! \cond EXTERN
extern (C) ЦелУкз wxFontMapper_ctor();
extern (C) проц   wxFontMapper_dtor(ЦелУкз сам);

extern (C) ЦелУкз wxFontMapper_Get();
extern (C) ЦелУкз wxFontMapper_Set(ЦелУкз маппер);
extern (C) цел    wxFontMapper_GetSupportedEncodingsCount();
extern (C) цел    wxFontMapper_GetEncoding(цел ч);
extern (C) ЦелУкз wxFontMapper_GetEncodingName(цел кодировка);
extern (C) ЦелУкз wxFontMapper_GetEncodingDescription(цел кодировка);
extern (C) цел    wxFontMapper_GetEncodingFromName(ткст имя);

extern (C) цел    wxFontMapper_CharsetToEncoding(ЦелУкз сам, ткст гарнитура, бул интерактивно);
extern (C) бул   wxFontMapper_IsEncodingAvailable(ЦелУкз сам, цел кодировка, ткст фасИмя);
extern (C) бул   wxFontMapper_GetAltForEncoding(ЦелУкз сам, цел кодировка, out цел альтКодировка, ткст фасИмя, бул интерактивно);

extern (C) проц   wxFontMapper_SetDialogParent(ЦелУкз сам, ЦелУкз родитель);
extern (C) проц   wxFontMapper_SetDialogTitle(ЦелУкз сам, ткст титул);
//! \endcond

//---------------------------------------------------------------------


export class МапперШрифта : ВизОбъект
{
    private static МапперШрифта статичМапперШрифта;

    static проц иниц()
    {
        if(!статичМапперШрифта)
            статичМапперШрифта = new МапперШрифта(wxFontMapper_Get());
    }

    //---------------------------------------------------------------------

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
        this(wxFontMapper_ctor(), да);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxFontMapper_dtor(вхобъ);
    }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
    //---------------------------------------------------------------------

    static МапперШрифта дай()
    {
        return статичМапперШрифта;
    }

    //---------------------------------------------------------------------

    export static МапперШрифта установи(МапперШрифта маппер)
    {
        return new МапперШрифта(wxFontMapper_Set(ВизОбъект.безопУк(маппер)));
    }

    //---------------------------------------------------------------------

    static цел члоПоддерживаемыхКодировок()
    {
        return wxFontMapper_GetSupportedEncodingsCount();
    }

    //---------------------------------------------------------------------

    export static ПКодировкаШрифта дайКодировку(цел ч)
    {
        return cast(ПКодировкаШрифта)wxFontMapper_GetEncoding(ч);
    }

    //---------------------------------------------------------------------

    export static ткст дайИмяКодировки(ПКодировкаШрифта кодировка)
    {
        return cast(ткст) new ВизТкст(wxFontMapper_GetEncodingName(cast(цел)кодировка), да);
    }

    //---------------------------------------------------------------------

    export static ПКодировкаШрифта дайКодировкуИзИмени(ткст имя)
    {
        return cast(ПКодировкаШрифта)wxFontMapper_GetEncodingFromName(имя);
    }

    //---------------------------------------------------------------------

    export ПКодировкаШрифта гарнитураВКодировку(ткст гарнитура)
    {
        return cast(ПКодировкаШрифта)гарнитураВКодировку(гарнитура, да);
    }

    export ПКодировкаШрифта гарнитураВКодировку(ткст гарнитура, бул интерактивно)
    {
        return cast(ПКодировкаШрифта)wxFontMapper_CharsetToEncoding(вхобъ, гарнитура, интерактивно);
    }

    //---------------------------------------------------------------------

    export бул кодировкаДоступна(ПКодировкаШрифта кодировка)
    {
        return кодировкаДоступна(кодировка, "");
    }

    export бул кодировкаДоступна(ПКодировкаШрифта кодировка, ткст фасИмя)
    {
        return wxFontMapper_IsEncodingAvailable(вхобъ, cast(цел)кодировка, фасИмя);
    }

    //---------------------------------------------------------------------

    export бул дайАльтДляКодировки(ПКодировкаШрифта кодировка, out ПКодировкаШрифта альтКодировка)
    {
        return дайАльтДляКодировки(кодировка, альтКодировка, "", да);
    }

    export бул дайАльтДляКодировки(ПКодировкаШрифта кодировка, out ПКодировкаШрифта альтКодировка, ткст фасИмя)
    {
        return дайАльтДляКодировки(кодировка, альтКодировка, фасИмя, да);
    }

    export бул дайАльтДляКодировки(ПКодировкаШрифта кодировка, out ПКодировкаШрифта альтКодировка, ткст фасИмя, бул интерактивно)
    {
        return wxFontMapper_GetAltForEncoding(вхобъ, cast(цел)кодировка, альтКодировка, фасИмя, интерактивно);
    }

    //---------------------------------------------------------------------

    export static ткст дайОписаниеКодировки(ПКодировкаШрифта кодировка)
    {
        return cast(ткст) new ВизТкст(wxFontMapper_GetEncodingDescription(cast(цел)кодировка), да);
    }

    //---------------------------------------------------------------------

    export проц устРодителяДиалога(Окно родитель)
    {
        wxFontMapper_SetDialogParent(вхобъ, ВизОбъект.безопУк(родитель));
    }

    //---------------------------------------------------------------------

    export проц устТитулДиалога(ткст титул)
    {
        wxFontMapper_SetDialogTitle(вхобъ, титул);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C) ЦелУкз wxEncodingConverter_ctor();
extern (C) бул wxEncodingConverter_Init(ЦелУкз сам, цел вхКодировка, цел выхКодировка, цел метод);
extern (C) ЦелУкз wxEncodingConverter_Convert(ЦелУкз сам, ткст ввод);
//! \endcond

//---------------------------------------------------------------------

export class ПреобразовательКодировки : ВизОбъект
{
    enum ППреобразовать
    {
        Строго,
        СПодстановкой
    }

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxEncodingConverter_ctor());
    }

    //---------------------------------------------------------------------

    export бул иниц(ПКодировкаШрифта вхКодировка, ПКодировкаШрифта выхКодировка)
    {
        return иниц(вхКодировка, выхКодировка, cast(цел)ППреобразовать.Строго);
    }

    export бул иниц(ПКодировкаШрифта вхКодировка, ПКодировкаШрифта выхКодировка, цел метод)
    {
        return wxEncodingConverter_Init(вхобъ, cast(цел)вхКодировка, cast(цел)выхКодировка, метод);
    }

    //---------------------------------------------------------------------

    export ткст преобразуй(ткст ввод)
    {
        return cast(ткст) new ВизТкст(wxEncodingConverter_Convert(вхобъ, ввод), да);
    }
}

//---------------------------------------------------------------------

//! \cond EXTERN
extern (C)
{
    alias бул function(ПеречислительШрифтов объ, цел кодировка, бул толькоФиксШир) Virtual_EnumerateFacenames;
    alias бул function(ПеречислительШрифтов объ, ЦелУкз фасИмя) Virtual_EnumerateEncodings;
    alias бул function(ПеречислительШрифтов объ, ЦелУкз фасИмя) Virtual_OnFacename;
    alias бул function(ПеречислительШрифтов объ, ЦелУкз фасИмя, ЦелУкз кодировка) Virtual_OnFontEncoding;
}

extern (C) ЦелУкз wxFontEnumerator_ctor();
extern (C) проц wxFontEnumerator_dtor(ЦелУкз сам);
extern (C) проц wxFontEnumerator_RegisterVirtual(ЦелУкз сам, ПеречислительШрифтов объ,Virtual_EnumerateFacenames enumerateFacenames, Virtual_EnumerateEncodings enumerateEncodings, Virtual_OnFacename onFacename, Virtual_OnFontEncoding onFontEncoding);
extern (C) ЦелУкз wxFontEnumerator_GetFacenames(ЦелУкз сам);
extern (C) ЦелУкз wxFontEnumerator_GetEncodings(ЦелУкз сам);
extern (C) бул wxFontEnumerator_OnFacename(ЦелУкз сам, ткст фасИмя);
extern (C) бул wxFontEnumerator_OnFontEncoding(ЦелУкз сам, ткст фасИмя, ткст кодировка);
extern (C) бул wxFontEnumerator_EnumerateFacenames(ЦелУкз сам, цел кодировка, бул толькоФиксШир);
extern (C) бул wxFontEnumerator_EnumerateEncodings(ЦелУкз сам, ткст фасИмя);
//! \endcond

//---------------------------------------------------------------------


export class ПеречислительШрифтов : ВизОбъект
{
    export this()
    {
        this(wxFontEnumerator_ctor(), да);

        wxFontEnumerator_RegisterVirtual(вхобъ,this,
                                         &staticDoEnumerateFacenames,
                                         &staticDoEnumerateEncodings,
                                         &staticDoOnFacename,
                                         &staticDoOnFontEncoding);
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
        wxFontEnumerator_dtor(вхобъ);
    }
	//----------------------------
		export ~this(){this.dtor();}
	//----------------------------
    //---------------------------------------------------------------------

    export ткст[] именаФасов()
    {
        return (new ТкстМассива(wxFontEnumerator_GetFacenames(вхобъ), да)).вМассив();
    }

    //---------------------------------------------------------------------

    export ткст[] кодировки()
    {
        return (new ТкстМассива(wxFontEnumerator_GetEncodings(вхобъ), да)).вМассив();
    }

    //---------------------------------------------------------------------

    export  бул приИмяФаса(ткст фасИмя)
    {
        return wxFontEnumerator_OnFacename(вхобъ, фасИмя);
    }

    static export extern(C) бул staticDoOnFacename(ПеречислительШрифтов объ, ЦелУкз фасИмя)
    {
        return объ.приИмяФаса(cast(ткст) new ВизТкст(фасИмя));
    }

    //---------------------------------------------------------------------

    export  бул приКодировкаШрифта(ткст фасИмя, ткст кодировка)
    {
        return wxFontEnumerator_OnFontEncoding(вхобъ, фасИмя, кодировка);
    }

    static export extern(C) бул staticDoOnFontEncoding(ПеречислительШрифтов объ, ЦелУкз фасИмя, ЦелУкз кодировка)
    {
        return объ.приКодировкаШрифта(cast(ткст) new ВизТкст(фасИмя), cast(ткст) new ВизТкст(кодировка));
    }

    //---------------------------------------------------------------------

    /*export  бул перечислиИменаФасов()
    {
    	return перечислиИменаФасов(cast(цел)ПКодировкаШрифта.Система, нет);
    }

    export  бул перечислиИменаФасов(ПКодировкаШрифта кодировка)
    {
    	return перечислиИменаФасов(cast(цел)кодировка, нет);
    }*/

    export  бул перечислиИменаФасов(ПКодировкаШрифта кодировка, бул толькоФиксШир)
    {
        return wxFontEnumerator_EnumerateFacenames(вхобъ, cast(цел)кодировка, толькоФиксШир);
    }

    static export extern(C) бул staticDoEnumerateFacenames(ПеречислительШрифтов объ, цел кодировка, бул толькоФиксШир)
    {
        return объ.перечислиИменаФасов(cast(ПКодировкаШрифта)кодировка, толькоФиксШир);
    }

    //---------------------------------------------------------------------

    /*export  бул перечислиКодировки()
    {
    	return перечислиКодировки(ЦелУкз.init);
    }*/

    export  бул перечислиКодировки(ткст фасИмя)
    {
        return wxFontEnumerator_EnumerateEncodings(вхобъ, фасИмя);
    }

    static export extern(C) бул staticDoEnumerateEncodings(ПеречислительШрифтов объ, ЦелУкз фасИмя)
    {
        return объ.перечислиКодировки(cast(ткст) new ВизТкст(фасИмя));
    }
}
