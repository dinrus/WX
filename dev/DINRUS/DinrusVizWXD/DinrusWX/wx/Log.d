module wx.Log;
public import wx.common;
public import wx.TextCtrl;
version(Dinrus) private import stdrus;
version(Rulada)
{
version = Tango;
import tango.text.convert.Format;
	import tango.stdc.stringz;
	import std.utf;
	alias std.utf.toUTF8 вЮ8;
	alias tango.stdc.stringz.toStringz вТкст0;
}



//! \cond EXTERN
extern (C) ЦелУкз wxLog_ctor();
extern (C) бул wxLog_IsEnabled();
extern (C) проц wxLog_FlushActive();
extern (C) ЦелУкз wxLog_SetActiveTargetTextCtrl(ЦелУкз pLogger);
extern (C) проц wxLog_Log_Function(цел what, ткст szFormat);
extern (C) проц wxLog_AddTraceMask(ткст tmask);
//! \endcond

export class Лог : ВизОбъект
{
    enum ПУровеньОшЛога : цел
    {
        Лог,
        ФатОш,
        Ош,
        Предупр,
        Инфо,
        Подробн,
        Статус,
        СисОш
    }

    export this(ЦелУкз вхобъ)
    {
        super(вхобъ);
    }

    export this()
    {
        super(wxLog_ctor());
    }


    static бул активирован()
    {
        return wxLog_IsEnabled();
    }

    export static проц слейАктивный()
    {
        wxLog_FlushActive();
    }

    // at the moment only ТекстКтрл
    export static проц устАктивнуюЦель(ТекстКтрл pLogger)
    {
        wxLog_SetActiveTargetTextCtrl(ВизОбъект.безопУк(pLogger));
    }

    export static проц добавьМаскуТрассы(ткст tmask)
    {
        wxLog_AddTraceMask(tmask);
    }

    export static проц логСообщения(...)
    {
        wxLog_Log_Function(cast(цел)ПУровеньОшЛога.Лог, форматируйТкст(_arguments,_argptr));
    }

    export static проц логФатальнойОшибки(...)
    {
        wxLog_Log_Function(cast(цел)ПУровеньОшЛога.ФатОш, форматируйТкст(_arguments,_argptr));
    }

    export static проц логОшибки(...)
    {
        wxLog_Log_Function(cast(цел)ПУровеньОшЛога.Ош, форматируйТкст(_arguments,_argptr));
    }

    export static проц логПредупреждения(...)
    {
        wxLog_Log_Function(cast(цел)ПУровеньОшЛога.Предупр, форматируйТкст(_arguments,_argptr));
    }

    export static проц логИнфо(...)
    {
        wxLog_Log_Function(cast(цел)ПУровеньОшЛога.Инфо, форматируйТкст(_arguments,_argptr));
    }

    export static проц логДетально(...)
    {
        wxLog_Log_Function(cast(цел)ПУровеньОшЛога.Подробн, форматируйТкст(_arguments,_argptr));
    }

    export static проц логСтатус(...)
    {
        wxLog_Log_Function(cast(цел)ПУровеньОшЛога.Статус, форматируйТкст(_arguments,_argptr));
    }

    export static проц логСисОшибки(...)
    {
        wxLog_Log_Function(cast(цел)ПУровеньОшЛога.СисОш, форматируйТкст(_arguments,_argptr));
    }

    private static ткст форматируйТкст(ИнфОТипе[] аргументы, спис_ва argptr)
    {
        ткст т;

        version (Tango)
        {
            ткст fmts = "";
            for(цел i=0; i < аргументы.length; i++)
            {
                fmts ~= "{}";
            }
            т = Format.convert(аргументы, argptr, fmts);
        }
        else // Phobos
        {
            проц putc(dchar c)
            {
                кодируйЮ(т, c);
            }

            форматДелай(&putc, аргументы, argptr);
        }

        return примемЗаУникума(т);
    }

//! \cond VERSION
    version (none)
    {
        /* C# compatible */
        private static ткст форматируйТкст(ткст стр,спис_ва argptr,ИнфОтипе[] аргументы)
        {
            if (аргументы.length==0) return стр;

            ткст[] арги = new ткст[аргументы.length];

            for(бцел i=0; i<аргументы.length; i++)
            {
                ИнфОтипе ид = аргументы[i];
                ткст значение;
                if (ид == typeid(цел))
                {
                    значение = .вТкст(*cast(цел*)argptr);
                    argptr += цел.sizeof;
                }
                else if (ид == typeid(long))
                {
                    значение = .вТкст(*cast(long*)argptr);
                    argptr += long.sizeof;
                }
                else if (ид == typeid(плав))
                {
                    значение = .вТкст(*cast(long*)argptr);
                    argptr += long.sizeof;
                }
                else if (ид == typeid(дво))
                {
                    значение = .вТкст(*cast(long*)argptr);
                    argptr += long.sizeof;
                }
                else if (ид == typeid(ткст))
                {
                    значение = *cast(ткст*)argptr;
                    argptr += ткст.sizeof;
                }
                арги[i] = значение;
            }

            ткст ret;
            while(1)
            {
                цел старт,конец;
                старт = найди(стр,'{');
                if (старт<0) break;

                ret ~= стр[0..старт];
                стр = стр[старт+1..стр.length];

                конец = найди(стр,'}');
                assert(конец>0);
                цел инд = atoi(стр[0..конец]);
                assert(инд<арги.length);

                ret ~= арги[инд];
                стр = стр[конец+1..стр.length];
            }
            ret ~= стр;

            return ret;
        }

    }
//! \endcond
}

