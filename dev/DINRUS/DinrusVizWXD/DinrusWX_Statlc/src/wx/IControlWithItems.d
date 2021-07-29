module wx.IControlWithItems;
public import wx.ClientData;

public interface ИКонтролСЭлементами
{
    цел добавь(ткст элт);

    цел добавь(ткст элт, ДанныеКлиента данныеКлиента);

    проц добавьТкст(ткст элт);

    проц добавь(ткст[] тксты);

    цел вставь(ткст элт, цел поз);

    цел вставь(ткст элт, цел поз, ДанныеКлиента данныеКлиента);

    проц очисть();

    проц удали(цел ч);

    цел счёт();

    бул пуст();

    ткст дайТкст(цел ч);

    ткст[] дайТксты();

    проц устТкст(цел ч, ткст т);

    цел найдиТкст(ткст т);

    проц выдели(цел ч);

    цел дайВыделение();

    ткст выделениеТекста();

    проц устОбъКлиента(цел ч, ДанныеКлиента данныеКлиента);

    ДанныеКлиента дайОбъКлиента(цел ч);

    бул естьДанныеОбъКлиента();

    бул естьНетипированнДанныеКлиента();

    бул наследоватьЦвета();
}

