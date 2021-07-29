module wx.Sizer;
public import wx.common, wx.Window;

//---------------------------------------------------------------------

extern(D)  abstract class Перемерщик : ВизОбъект
{
    public this(ЦелУкз вхобъ);
    public проц добавь(Окно окно, цел пропорция=0, цел флаг=0, цел бордюр=0, ВизОбъект данныеПользователя=пусто);
    public проц добавь(Перемерщик сайзер, цел пропорция=0, цел флаг=0, цел бордюр=0, ВизОбъект данныеПользователя=пусто);
    public проц добавь(цел ширь, цел высь, цел пропорция=0, цел флаг=0, цел бордюр=0, ВизОбъект данныеПользователя=пусто);
    public проц добавьСпейсер(цел размер);
    public проц добавьСпейсерРастяга(цел пропорция = 1);
    public Размер встрой(Окно окно);
    public проц встройВнутрь(Окно окно);
    public проц раскладка();
    public проц вставь(бцел индекс, Окно окно, цел пропорция=0, цел флаг=0,
                                 цел бордюр=0, ВизОбъект данныеПользователя=пусто);
    public проц вставь(бцел индекс, Перемерщик сайзер, цел пропорция=0, цел флаг=0,
                                 цел бордюр=0, ВизОбъект данныеПользователя=пусто);
    public проц вставь(бцел индекс, цел ширь, цел высь, цел пропорция=0,
                                 цел флаг=0, цел бордюр=0, ВизОбъект данныеПользователя=пусто);
    public проц приставь(Окно окно, цел пропорция=0, цел флаг=0, цел бордюр=0,
                                     ВизОбъект данныеПользователя=пусто);
    public проц приставь(Перемерщик сайзер, цел пропорция=0, цел флаг=0, цел бордюр=0,
                                     ВизОбъект данныеПользователя=пусто);
    public проц приставь(цел ширь, цел высь, цел пропорция=0, цел флаг=0,
                                     цел бордюр=0, ВизОбъект данныеПользователя=пусто);
    public проц приставьСпейсер(цел размер);
    public проц приставьСпейсерРастяга(цел пропорция = 1);
    public бул удали(Перемерщик сайзер);
    public бул удали(цел поз);
    public проц устМинРазм(Размер размер);
    public бул устМинРазмЭлта(Окно окно, Размер размер);
    public бул устМинРазмЭлта(Перемерщик сайзер, Размер размер);
    public бул устМинРазмЭлта(цел поз, Размер размер);
    public Размер размер();
    public Точка позиция();
    public Размер минРазм();
    public  проц пересчётРазмеров();
    public  Размер вычислиМин();
    public проц устРазмПодсказ(Окно окно);
    public проц устВиртуалРазмПодсказ(Окно окно);
    public проц устИзмерение(цел x, цел y, цел ширь, цел высь);
    public проц показ(Окно окно, бул показ);
    public проц показ(Перемерщик сайзер, бул показ);
    public проц показ(бул пкз);
    public проц очисть(бул удалитьОкна);
    public проц удалиОкно();
    public проц спрячь(Окно окно);
    public проц спрячь(Перемерщик сайзер);
    public бул виден(Окно окно);
    public бул виден(Перемерщик сайзер);
    public бул отторочь(Окно окно);
    public бул отторочь(Перемерщик сайзер);
    public бул отторочь(цел индекс);
}