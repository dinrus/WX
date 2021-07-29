module wx.Config;
public import wx.common;
public import wx.Font;
public import wx.Colour;

public enum ПТипЗаписи
{
    Неизвестно,
    Ткст,
    Бул,
    Цел,
    Плав
}

// Флаги стиля для параметра "стиль" конструктора
public enum ПФлагиСтиляКонфиг
{
    ИспользоватьЛокальнФайл = 1,
    ИспользоватьГлобФайл = 2,
    ИспользоватьОтноситПути = 4,
    БезИскейпСимволов = 8
}


//! \cond EXTERN
extern (C) ЦелУкз wxConfigBase_Set(ЦелУкз pConfig);
extern (C) ЦелУкз wxConfigBase_Get(бул createOnDemand);
extern (C) ЦелУкз wxConfigBase_Create();
extern (C) проц   wxConfigBase_DontCreateOnDemand();
extern (C) проц   wxConfigBase_SetPath(ЦелУкз сам, ткст strPath);
extern (C) ЦелУкз wxConfigBase_GetPath(ЦелУкз сам);
extern (C) бул   wxConfigBase_GetFirstGroup(ЦелУкз сам, ЦелУкз стр, inout цел синдекс);
extern (C) бул   wxConfigBase_GetNextGroup(ЦелУкз сам, ЦелУкз стр, inout цел синдекс);
extern (C) бул   wxConfigBase_GetFirstEntry(ЦелУкз сам, ЦелУкз стр, inout цел синдекс);
extern (C) бул   wxConfigBase_GetNextEntry(ЦелУкз сам, ЦелУкз стр, inout цел синдекс);
extern (C) цел    wxConfigBase_GetNumberOfEntries(ЦелУкз сам, бул рекурсивно);
extern (C) цел    wxConfigBase_GetNumberOfGroups(ЦелУкз сам, бул рекурсивно);
extern (C) бул   wxConfigBase_HasGroup(ЦелУкз сам, ткст ткстИмя);
extern (C) бул   wxConfigBase_HasEntry(ЦелУкз сам, ткст ткстИмя);
extern (C) бул   wxConfigBase_Exists(ЦелУкз сам, ткст ткстИмя);
extern (C) цел    wxConfigBase_GetEntryType(ЦелУкз сам, ткст имя);
extern (C) бул   wxConfigBase_ReadStr(ЦелУкз сам, ткст ключ, ЦелУкз pStr);
extern (C) бул   wxConfigBase_ReadStrDef(ЦелУкз сам, ткст ключ, ЦелУкз pStr, ткст дефЗнач);
extern (C) бул   wxConfigBase_ReadInt(ЦелУкз сам, ткст ключ, inout цел pl);
extern (C) бул   wxConfigBase_ReadIntDef(ЦелУкз сам, ткст ключ, inout цел pl, цел дефЗнач);
extern (C) бул   wxConfigBase_ReadDbl(ЦелУкз сам, ткст ключ, inout дво знач);
extern (C) бул   wxConfigBase_ReadDblDef(ЦелУкз сам, ткст ключ, inout дво знач, дво дефЗнач);
extern (C) бул   wxConfigBase_ReadBool(ЦелУкз сам, ткст ключ, inout бул знач);
extern (C) бул   wxConfigBase_ReadBoolDef(ЦелУкз сам, ткст ключ, inout бул знач, бул дефЗнач);
extern (C) ЦелУкз wxConfigBase_ReadStrRet(ЦелУкз сам, ткст ключ, ткст дефЗнач);
extern (C) цел    wxConfigBase_ReadIntRet(ЦелУкз сам, ткст ключ, цел дефЗнач);
extern (C) бул   wxConfigBase_WriteStr(ЦелУкз сам, ткст ключ, ткст знач);
extern (C) бул   wxConfigBase_WriteInt(ЦелУкз сам, ткст ключ, цел знач);
extern (C) бул   wxConfigBase_WriteDbl(ЦелУкз сам, ткст ключ, дво знач);
extern (C) бул   wxConfigBase_WriteBool(ЦелУкз сам, ткст ключ, бул знач);
extern (C) бул   wxConfigBase_Flush(ЦелУкз сам, бул bCurrentOnly);
extern (C) бул   wxConfigBase_RenameEntry(ЦелУкз сам, ткст старИмя, ткст новИмя);
extern (C) бул   wxConfigBase_RenameGroup(ЦелУкз сам, ткст старИмя, ткст новИмя);
extern (C) бул   wxConfigBase_DeleteEntry(ЦелУкз сам, ткст ключ, бул bDeleteGroupIfEmpty);
extern (C) бул   wxConfigBase_DeleteGroup(ЦелУкз сам, ткст ключ);
extern (C) бул   wxConfigBase_DeleteAll(ЦелУкз сам);
extern (C) бул   wxConfigBase_IsExpandingEnvVars(ЦелУкз сам);
extern (C) проц   wxConfigBase_SetExpandEnvVars(ЦелУкз сам, бул bDoIt);
extern (C) ЦелУкз wxConfigBase_ExpandEnvVars(ЦелУкз сам, ткст стр);
extern (C) проц   wxConfigBase_SetRecordDefaults(ЦелУкз сам, бул bDoIt);
extern (C) бул   wxConfigBase_IsRecordingDefaults(ЦелУкз сам);
extern (C) ЦелУкз wxConfigBase_GetAppName(ЦелУкз сам);
extern (C) проц   wxConfigBase_SetAppName(ЦелУкз сам, ткст appName);
extern (C) ЦелУкз wxConfigBase_GetVendorName(ЦелУкз сам);
extern (C) проц   wxConfigBase_SetVendorName(ЦелУкз сам, ткст vendorName);
extern (C) проц   wxConfigBase_SetStyle(ЦелУкз сам, цел стиль);
extern (C) цел    wxConfigBase_GetStyle(ЦелУкз сам);
//! \endcond

//---------------------------------------------------------------------

// although it Конфиг is not derived от вхобъ we do not change it.
// Use Конфиг.дай() до get an instance.
export class Конфиг : ВизОбъект
{
    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export static ВизОбъект Нов(ЦелУкз ptr)
    {
        return new Конфиг(ptr);
    }

    export static Конфиг установи(Конфиг конфиг)
    {
        return cast(Конфиг)найдиОбъект(wxConfigBase_Set(ВизОбъект.безопУк(конфиг)), &Конфиг.Нов);
    }

    export static Конфиг дай(бул createOnDemand)
    {
        return cast(Конфиг)найдиОбъект(wxConfigBase_Get(createOnDemand), &Конфиг.Нов);
    }

    export static Конфиг дай()
    {
        return cast(Конфиг)найдиОбъект(wxConfigBase_Get(да), &Конфиг.Нов);
    }

    export static Конфиг создай()
    {
        return new Конфиг(wxConfigBase_Create());
    }

    //---------------------------------------------------------------------

    export проц неСоздавайПоЗапросу()
    {
        wxConfigBase_DontCreateOnDemand();
    }

    //---------------------------------------------------------------------

    export проц путь(ткст значение)
    {
        wxConfigBase_SetPath(this.м_вхобъ, значение);
    }
    export ткст путь()
    {
        return cast(ткст) new ВизТкст(wxConfigBase_GetPath(this.м_вхобъ), да);
    }

    //---------------------------------------------------------------------

    export бул дайПервГруппу(inout ткст стр, inout цел синдекс)
    {
        бул ret;
        ВизТкст wstr = new ВизТкст(стр);

        ret = wxConfigBase_GetFirstGroup(this.м_вхобъ, ВизТкст.безопУк(wstr), синдекс);
        стр = wstr.вТкст();

        return ret;
    }

    export бул дайСледщГруппу(inout ткст стр, inout цел синдекс)
    {
        бул ret;
        ВизТкст wstr = new ВизТкст(стр);

        ret = wxConfigBase_GetNextGroup(this.м_вхобъ, ВизТкст.безопУк(wstr), синдекс);
        стр = wstr.вТкст();

        return ret;
    }

    //---------------------------------------------------------------------

    export бул дайПервЗапись(inout ткст стр, inout цел синдекс)
    {
        бул ret;
        ВизТкст wstr = new ВизТкст(стр);

        ret = wxConfigBase_GetFirstEntry(this.м_вхобъ, ВизТкст.безопУк(wstr), синдекс);
        стр = wstr.вТкст();

        return ret;
    }

    export бул дайСледщЗапись(inout ткст стр, inout цел синдекс)
    {
        бул ret;
        ВизТкст wstr = new ВизТкст(стр);

        ret = wxConfigBase_GetNextEntry(this.м_вхобъ, ВизТкст.безопУк(wstr), синдекс);
        стр = wstr.вТкст();

        return ret;
    }

    //---------------------------------------------------------------------

    export цел дайЧлоЗаписей(бул рекурсивно)
    {
        return wxConfigBase_GetNumberOfEntries(this.м_вхобъ, рекурсивно);
    }

    export цел дайЧлоГрупп(бул рекурсивно)
    {
        return wxConfigBase_GetNumberOfGroups(this.м_вхобъ, рекурсивно);
    }

    //---------------------------------------------------------------------

    export бул естьГруппа(ткст ткстИмя)
    {
        return wxConfigBase_HasGroup(this.м_вхобъ, ткстИмя);
    }

    export бул естьЗапись(ткст ткстИмя)
    {
        return wxConfigBase_HasEntry(this.м_вхобъ, ткстИмя);
    }

    //---------------------------------------------------------------------

    export бул существует(ткст ткстИмя)
    {
        return wxConfigBase_Exists(this.м_вхобъ, ткстИмя);
    }

    export ПТипЗаписи дайТипЗаписи(ткст имя)
    {
        return cast(ПТипЗаписи)wxConfigBase_GetEntryType(this.м_вхобъ, имя);
    }

    //---------------------------------------------------------------------

    export бул читай(ткст ключ, inout ткст стр)
    {
        бул ret;
        ВизТкст wstr = new ВизТкст(стр);

        ret = wxConfigBase_ReadStr(this.м_вхобъ, ключ, ВизТкст.безопУк(wstr));
        стр = wstr.вТкст();

        return ret;
    }

    export бул читай(ткст ключ, inout ткст стр, ткст дефЗнач)
    {
        бул ret;
        ВизТкст wstr = new ВизТкст(стр);

        ret = wxConfigBase_ReadStrDef(this.м_вхобъ, ключ, ВизТкст.безопУк(wstr), дефЗнач);
        стр = wstr.вТкст();

        return ret;
    }

    //---------------------------------------------------------------------

    export бул читай(ткст ключ, inout цел pl)
    {
        return wxConfigBase_ReadInt(this.м_вхобъ, ключ, pl);
    }

    export бул читай(ткст ключ, inout цел pl, цел дефЗнач)
    {
        return wxConfigBase_ReadIntDef(this.м_вхобъ, ключ, pl, дефЗнач);
    }

    //---------------------------------------------------------------------

    export бул читай(ткст ключ, inout дво знач)
    {
        return wxConfigBase_ReadDbl(this.м_вхобъ, ключ, знач);
    }

    export бул читай(ткст ключ, inout дво знач, дво дефЗнач)
    {
        return wxConfigBase_ReadDblDef(this.м_вхобъ, ключ, знач, дефЗнач);
    }

    //---------------------------------------------------------------------

    export бул читай(ткст ключ, inout бул знач)
    {
        return wxConfigBase_ReadBool(this.м_вхобъ, ключ, знач);
    }

    export бул читай(ткст ключ, inout бул знач, бул дефЗнач)
    {
        return wxConfigBase_ReadBoolDef(this.м_вхобъ, ключ, знач, дефЗнач);
    }

    //---------------------------------------------------------------------

    export бул читай(ткст ключ, inout Шрифт знач)
    {
        return читай(ключ, знач, Шрифт.Нормальный);
    }

    export бул читай(ткст ключ, inout Шрифт знач, Шрифт дефЗнач)
    {
        бул ret = да;

        цел размТочки = 0, семейство = 0, стиль = 0, вес = 0, кодировка = 0;
        бул подчеркни = нет;
        ткст имяФас = "";

        ret &= читай(ключ ~ "/PointSize", размТочки,  cast(цел)дефЗнач.размТочки);
        ret &= читай(ключ ~ "/Family",    семейство,     cast(цел)дефЗнач.семейство);
        ret &= читай(ключ ~ "/Style",     стиль,      cast(цел)дефЗнач.стиль);
        ret &= читай(ключ ~ "/Weight",    вес,     cast(цел)дефЗнач.вес);
        ret &= читай(ключ ~ "/Underline", подчеркни,  cast(бул)дефЗнач.подчёркнут);
        ret &= читай(ключ ~ "/FaceName",  имяФас,   дефЗнач.имяФас);
        ret &= читай(ключ ~ "/Encoding",  кодировка,   cast(цел)дефЗнач.кодировка);

        знач.размТочки   = размТочки;
        знач.семейство      = cast(ПСемействоШрифтов)семейство;
        знач.стиль       = cast(ПСтильШрифта)стиль;
        знач.вес      = cast(ПВесШрифта)вес;
        знач.подчёркнут  = подчеркни;
        знач.имяФас    = имяФас;
        знач.кодировка    = cast(ПКодировкаШрифта)кодировка;

        return ret;
    }

    //---------------------------------------------------------------------

    export бул читай(ткст ключ, inout Цвет знач)
    {
        Цвет def = new Цвет(0, 0, 0);
        return читай(ключ, знач, def);
    }

    private static цел hex2int(ткст стр)
    {
        цел значение = 0;
        foreach(char foo; стр)
        {
            char ch = foo;
            if (ch>='0' && ch<='9') ch-='0';
            else if (ch>='A' && ch<='F') ch=ch-'A'+10;
            else if (ch>='a' && ch<='f') ch=ch-'a'+10;
            else return -1;
            значение = значение*10 + ch;
        }
        return значение;
    }

    export бул читай(ткст ключ, inout Цвет знач, Цвет дефЗнач)
    {
        ткст стр;
        бул ret = читай(ключ,стр);
        if (!ret || !стр || стр[0]!='#')
        {
            //    знач = defval;
        }
        else
        {
            бцел c = hex2int(стр[1..стр.length]);

            цел к = (c>>16)&255;
            цел з = (c>>8)&255;
            цел с = c&255;

            знач = new Цвет(cast(ббайт)к, cast(ббайт)з, cast(ббайт)с);
        }
        return ret;
        /*
                    бул ret = да;
                    цел к = 0, с = 0, з = 0;

                    ret &= читай(ключ ~ "/красный",   к, cast(цел)дефЗнач.красный);
                    ret &= читай(ключ ~ "/синий",  с, cast(цел)дефЗнач.синий);
                    ret &= читай(ключ ~ "/зелёный", з, cast(цел)дефЗнач.зелёный);

                    знач = new Цвет(cast(ббайт)к, cast(ббайт)з, cast(ббайт)с);

                    return ret;
        */
    }

    //---------------------------------------------------------------------
    /+
    export ткст читай(ткст ключ, ткст дефЗнач)
    {
        return cast(ткст) new ВизТкст(wxConfigBase_ReadStrRet(вхобъ, ключ, дефЗнач), да);
    }
    +/
    export цел читай(ткст ключ, цел дефЗнач)
    {
        return wxConfigBase_ReadIntRet(this.м_вхобъ, ключ, дефЗнач);
    }

    export бул читай(ткст ключ, бул дефЗнач)
    {
        бул знач = нет;
        читай(ключ, знач, дефЗнач);
        return знач;
    }

    export Цвет читай(ткст ключ, Цвет дефЗнач)
    {
        Цвет кол = new Цвет();
        читай(ключ, кол, дефЗнач);
        return кол;
    }

    export Шрифт читай(ткст ключ, Шрифт дефЗнач)
    {
        Шрифт шрфт = new Шрифт();
        читай(ключ, шрфт, дефЗнач);
        return шрфт;
    }

    //---------------------------------------------------------------------

    export бул пиши(ткст ключ, ткст знач)
    {
        return wxConfigBase_WriteStr(this.м_вхобъ, ключ, знач);
    }

    export бул пиши(ткст ключ, цел знач)
    {
        return wxConfigBase_WriteInt(this.м_вхобъ, ключ, знач);
    }

    export бул пиши(ткст ключ, дво знач)
    {
        return wxConfigBase_WriteDbl(this.м_вхобъ, ключ, знач);
    }

    export бул пиши(ткст ключ, бул знач)
    {
        return wxConfigBase_WriteBool(this.м_вхобъ, ключ, знач);
    }

    private static проц tohex(ткст0 т,бцел значение)
    {
        const static char[16] hexdigits = "0123456789ABCDEF";
        т[0] = hexdigits[значение>>4];
        т[1] = hexdigits[значение&15];
    }

    export бул пиши(ткст ключ, Цвет кол)
    {
        /*
                    бул ret = да;
                    ret &= пиши(ключ ~ "/красный",   cast(цел)кол.красный);
                    ret &= пиши(ключ ~ "/синий",  cast(цел)кол.синий);
                    ret &= пиши(ключ ~ "/зелёный", cast(цел)кол.зелёный);
                    return ret;
        */
        ткст buf = new char[7];
        buf[0] = '#';
        tohex(&buf[1],кол.красный);
        tohex(&buf[3],кол.зелёный);
        tohex(&buf[5],кол.синий);
        return пиши(ключ,примемЗаУникума(buf));
    }

    export бул пиши(ткст ключ, Шрифт знач)
    {
        бул ret = да;

        ret &= пиши(ключ ~ "/PointSize", cast(цел)знач.размТочки);
        ret &= пиши(ключ ~ "/Family",    cast(цел)знач.семейство);
        ret &= пиши(ключ ~ "/Style",     cast(цел)знач.стиль);
        ret &= пиши(ключ ~ "/Weight",    cast(цел)знач.вес);
        ret &= пиши(ключ ~ "/Underline", cast(бул)знач.подчёркнут);
        ret &= пиши(ключ ~ "/FaceName",  знач.имяФас);
        ret &= пиши(ключ ~ "/Encoding",  cast(цел)знач.кодировка);

        return ret;
    }

    //---------------------------------------------------------------------

    export бул слей(бул толькоТек)
    {
        return wxConfigBase_Flush(this.м_вхобъ, толькоТек);
    }

    //---------------------------------------------------------------------

    export бул переименуйЗапись(ткст старИмя, ткст новИмя)
    {
        return wxConfigBase_RenameEntry(this.м_вхобъ, старИмя, новИмя);
    }

    export бул переименуйГруппу(ткст старИмя, ткст новИмя)
    {
        return wxConfigBase_RenameGroup(this.м_вхобъ, старИмя, новИмя);
    }

    //---------------------------------------------------------------------

    export бул удалиЗапись(ткст ключ, бул удалиГрЕслиПуста)
    {
        return wxConfigBase_DeleteEntry(this.м_вхобъ, ключ, удалиГрЕслиПуста);
    }

    export бул удалиГруппу(ткст ключ)
    {
        return wxConfigBase_DeleteGroup(this.м_вхобъ, ключ);
    }

    export бул удалиВсе()
    {
        return wxConfigBase_DeleteAll(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

    export бул разверниПеремСреды()
    {
        return wxConfigBase_IsExpandingEnvVars(this.м_вхобъ);
    }
    export проц разверниПеремСреды(бул значение)
    {
        wxConfigBase_SetExpandEnvVars(this.м_вхобъ, значение);
    }

    /*export ткст разверниПеремСреды(ткст стр)
    {
        return cast(ткст) new ВизТкст(wxConfigBase_ExpandEnvVars(вхобъ, стр));
    }*/

    //---------------------------------------------------------------------

    export проц запишиДефолты(бул значение)
    {
        wxConfigBase_SetRecordDefaults(this.м_вхобъ, значение);
    }
    export бул запишиДефолты()
    {
        return wxConfigBase_IsRecordingDefaults(this.м_вхобъ);
    }

    //---------------------------------------------------------------------

    export ткст имяПриложения()
    {
        return cast(ткст) new ВизТкст(wxConfigBase_GetAppName(this.м_вхобъ), да);
    }
    export проц имяПриложения(ткст значение)
    {
        wxConfigBase_SetAppName(this.м_вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export ткст имяВендора()
    {
        return cast(ткст) new ВизТкст(wxConfigBase_GetVendorName(this.м_вхобъ), да);
    }
    export проц ИмяВендора(ткст значение)
    {
        wxConfigBase_SetVendorName(this.м_вхобъ, значение);
    }

    //---------------------------------------------------------------------

    export проц стиль(цел значение)
    {
        wxConfigBase_SetStyle(this.м_вхобъ, значение);
    }
    export цел стиль()
    {
        return wxConfigBase_GetStyle(this.м_вхобъ);
    }

    //---------------------------------------------------------------------
}

