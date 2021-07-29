/// Common structs that do not belong до any particular class
module wx.common;

public import wx.VizObject;
public import wx.VizString;

version = Unicode;
version = __МСВ__;

interface ИВымещаемый
{
    проц вымести();
}

interface ИКлонируемый
{
    Объект клонируй();
}

typedef ук ЦелУкз;

ткст примемЗаУникума(ткст т);


class ИсклНуллУказателя : Исключение
{
    this(ткст сооб);
}

class ИсклНуллССылки : Исключение
{
    this(ткст сооб);
}

class ИсклАргумента : Исключение
{
    this(ткст сооб);
}

class ИсклНевернОперации : Исключение
{
    this(ткст сооб);
}

class ИсклНуллАргумента : Исключение
{
    this(ткст сооб);
}

struct Точка
{
    цел Х,У;

    /** struct constructor */
    static Точка opCall(цел x,цел y);
}

struct Размер
{
    цел ширь,высь;

    /** struct constructor */
    static Размер opCall(цел w,цел h);
}

struct Прямоугольник
{
    цел Х,У,ширь,высь;
    цел  Лево();
    проц Лево(цел значение);
    цел  Верх();
    проц Верх(цел значение);
    цел  Право();
    проц Право(цел значение);
    цел  Низ();
    проц Низ(цел значение);

    static Прямоугольник opCall(цел x,цел y,цел w,цел h);
}
alias Прямоугольник Прям;