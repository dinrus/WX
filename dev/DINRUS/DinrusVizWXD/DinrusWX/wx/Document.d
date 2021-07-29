module wx.Document;
public import wx.common;
public import wx.EvtHandler;

//! \cond VERSION
version(NOT_READY_YET)
{

    //! \cond EXTERN
    extern (C) ЦелУкз wxDocument_ctor(ЦелУкз родитель);
    extern (C) проц   wxDocument_SetFilename(ЦелУкз сам, ткст имяф, бул notifyViews);
    extern (C) ЦелУкз wxDocument_GetFilename(ЦелУкз сам);
    extern (C) проц   wxDocument_SetTitle(ЦелУкз сам, ткст титул);
    extern (C) ЦелУкз wxDocument_GetTitle(ЦелУкз сам);
    extern (C) проц   wxDocument_SetDocumentName(ЦелУкз сам, ткст имя);
    extern (C) ЦелУкз wxDocument_GetDocumentName(ЦелУкз сам);
    extern (C) бул   wxDocument_GetDocumentSaved(ЦелУкз сам);
    extern (C) проц   wxDocument_SetDocumentSaved(ЦелУкз сам, бул saved);
    extern (C) бул   wxDocument_Close(ЦелУкз сам);
    extern (C) бул   wxDocument_Save(ЦелУкз сам);
    extern (C) бул   wxDocument_SaveAs(ЦелУкз сам);
    extern (C) бул   wxDocument_Revert(ЦелУкз сам);
    //extern (C) ЦелУкз wxDocument_SaveObject(ЦелУкз сам, ЦелУкз stream);
    //extern (C) ЦелУкз wxDocument_LoadObject(ЦелУкз сам, ЦелУкз stream);
    extern (C) ЦелУкз wxDocument_GetCommandProcessor(ЦелУкз сам);
    extern (C) проц   wxDocument_SetCommandProcessor(ЦелУкз сам, ЦелУкз proc);
    extern (C) бул   wxDocument_DeleteContents(ЦелУкз сам);
    extern (C) бул   wxDocument_Draw(ЦелУкз сам, ЦелУкз wxDC);
    extern (C) бул   wxDocument_IsModified(ЦелУкз сам);
    extern (C) проц   wxDocument_Modify(ЦелУкз сам, бул mod);
    extern (C) бул   wxDocument_AddView(ЦелУкз сам, ЦелУкз view);
    extern (C) бул   wxDocument_RemoveView(ЦелУкз сам, ЦелУкз view);
    extern (C) ЦелУкз wxDocument_GetViews(ЦелУкз сам);
    extern (C) ЦелУкз wxDocument_GetFirstView(ЦелУкз сам);
    extern (C) проц   wxDocument_UpdateAllViews(ЦелУкз сам, ЦелУкз отправитель, ЦелУкз hint);
    extern (C) проц   wxDocument_NotifyClosing(ЦелУкз сам);
    extern (C) бул   wxDocument_DeleteAllViews(ЦелУкз сам);
    extern (C) ЦелУкз wxDocument_GetDocumentManager(ЦелУкз сам);
    extern (C) ЦелУкз wxDocument_GetDocumentTemplate(ЦелУкз сам);
    extern (C) проц   wxDocument_SetDocumentTemplate(ЦелУкз сам, ЦелУкз temp);
    extern (C) бул   wxDocument_GetPrintableName(ЦелУкз сам, ЦелУкз buf);
    extern (C) ЦелУкз wxDocument_GetDocumentWindow(ЦелУкз сам);
    //! \endcond

    //-----------------------------------------------------------------------------
    export class Документ : ОбработчикСоб
    {
        export  this(Документ родитель)
        {
            super(wxDocument_ctor(ВизОбъект.безопУк(родитель)));
        }

        //-----------------------------------------------------------------------------

        export проц имяФайла(ткст имяф, бул notifyViews)
        {
            wxDocument_SetFilename(вхобъ, имяф, notifyViews);
        }

        export проц имяФайла(ткст значение)
        {
            устИмяф(значение, да);
        }
        export ткст имяФайла()
        {
            return cast(ткст) new ВизТкст(wxDocument_GetFilename(вхобъ), да);
        }

        //-----------------------------------------------------------------------------

        export проц титул(ткст значение)
        {
            wxDocument_SetTitle(вхобъ, значение);
        }
        export ткст титул()
        {
            return cast(ткст) new ВизТкст(wxDocument_GetTitle(вхобъ), да);
        }

        export проц имяДокумента(ткст значение)
        {
            wxDocument_SetDocumentName(вхобъ, значение);
        }
        export ткст имяДокумента()
        {
            return cast(ткст) new ВизТкст(wxDocument_GetDocumentName(вхобъ), да);
        }

        //-----------------------------------------------------------------------------

        export бул докСохранён()
        {
            return wxDocument_GetDocumentSaved(вхобъ);
        }
        export проц докСохранён(бул значение)
        {
            wxDocument_SetDocumentSaved(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export бул закрой()
        {
            return wxDocument_Close(вхобъ);
        }

        export бул сохрани()
        {
            return wxDocument_Save(вхобъ);
        }

        export бул сохраниКак()
        {
            return wxDocument_SaveAs(вхобъ);
        }

        export бул реверт()
        {
            return wxDocument_Revert(вхобъ);
        }

        //-----------------------------------------------------------------------------

        /*
        export OutputStream SaveObject(OutputStream stream)
        {
            return wxDocument_SaveObject(вхобъ, ВизОбъект.безопУк(stream));
        }

        export InputStream LoadObject(InputStream stream)
        {
            return wxDocument_LoadObject(вхобъ, ВизОбъект.безопУк(stream));
        }*/

        //-----------------------------------------------------------------------------

        /*export CommandProcessor CommandProcessor
        {
            get { return найдиОбъект(wxDocument_GetCommandProcessor(вхобъ)); }
            set { wxDocument_SetCommandProcessor(вхобъ, ВизОбъект.безопУк(значение)); }
        }*/

        //-----------------------------------------------------------------------------

        export бул удалиСодержимое()
        {
            return wxDocument_DeleteContents(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export бул рисуй(КонтекстУстройства ку)
        {
            return wxDocument_Draw(вхобъ, ВизОбъект.безопУк(ку));
        }

        //-----------------------------------------------------------------------------

        export бул изменён()
        {
            return wxDocument_IsModified(вхобъ);
        }
        export проц изменён(бул значение)
        {
            измени(значение);
        }

        export проц измени(бул mod)
        {
            wxDocument_Modify(вхобъ, mod);
        }

        //-----------------------------------------------------------------------------

        /*export бул AddView(View view)
        {
            return wxDocument_AddView(вхобъ, ВизОбъект.безопУк(view));
        }

        export бул RemoveView(View view)
        {
            return wxDocument_RemoveView(вхобъ, ВизОбъект.безопУк(view));
        }*/

        /*
        export List GetViews()
        {
            return wxDocument_GetViews(вхобъ);
        }

        export View FirstView() { return wxDocument_GetFirstView(вхобъ); }

        export проц UpdateAllViews(View отправитель, ВизОбъект hint)
        {
            wxDocument_UpdateAllViews(вхобъ, ВизОбъект.безопУк(отправитель), ВизОбъект.безопУк(hint));
        }*/

        //-----------------------------------------------------------------------------

        export проц уведомиОЗакрытии()
        {
            wxDocument_NotifyClosing(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export бул удалиВсеВиды()
        {
            return wxDocument_DeleteAllViews(вхобъ);
        }

        //-----------------------------------------------------------------------------

        /*export DocManager DocumentManager
        {
            get { return (DocManager)найдиОбъект(wxDocument_GetDocumentManager(вхобъ), DocManager); }
        }

        //-----------------------------------------------------------------------------

        export DocTemplate DocumentTemplate() { return (DocTemplate)найдиОбъект(return wxDocument_GetDocumentTemplate(вхобъ), DocTemplate);
        export проц DocumentTemplate(DocTemplate значение) { wxDocument_SetDocumentTemplate(вхобъ, ВизОбъект.безопУк(значение)); }
        }*/

        //-----------------------------------------------------------------------------
        /+
        export бул GetPrintableName(out ткст buf)
        {
            ВизТкст имя = "";
            бул ret = wxDocument_GetPrintableName(вхобъ, ВизОбъект.безопУк(имя));
            buf = имя;

            return ret;
        }
        +/
        //-----------------------------------------------------------------------------

        export Окно окноДокумента()
        {
            return cast(Окно)найдиОбъект(wxDocument_GetDocumentWindow(вхобъ));
        }
    }
} // version(NOT_READY_YET)
//! \endcond
