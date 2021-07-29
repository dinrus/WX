module wx.TipDialog;
public import wx.common;
public import wx.Dialog;

//! \cond EXTERN
extern (C) ЦелУкз wxCreateFileTipProvider_func(ткст имяф, цел текущаяПодсказка);
extern (C) бул wxShowTip_func(ЦелУкз родитель, ЦелУкз провайдерПодсказок, бул показыватьПриЗапуске);
extern (C) цел wxTipProvider_GetCurrentTip();
//! \endcond

export class ПровайдерПодсказок
{
    export static ЦелУкз создайПровайдерПодсказокФайла(ткст имяф, цел текущаяПодсказка)
    {
        return wxCreateFileTipProvider_func(имяф, текущаяПодсказка);
    }

    export static бул показатьПодсказку(Окно родитель, ЦелУкз провайдерПодсказок)
    {
        return wxShowTip_func(ВизОбъект.безопУк(родитель), провайдерПодсказок, да);
    }

    export static бул показатьПодсказку(Окно родитель, ЦелУкз провайдерПодсказок, бул показыватьПриЗапуске)
    {
        return wxShowTip_func(ВизОбъект.безопУк(родитель), провайдерПодсказок, показыватьПриЗапуске);
    }

   export static цел текущаяПодсказка()
    {
        return wxTipProvider_GetCurrentTip();
    }
}
