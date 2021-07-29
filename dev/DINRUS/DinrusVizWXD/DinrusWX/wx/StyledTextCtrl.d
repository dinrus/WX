module wx.StyledTextCtrl;
//version = WXD_STYLEDTEXTCTRL;


//! \cond VERSION
version(WXD_STYLEDTEXTCTRL)
{
//! \endcond

    public import wx.common;
    public import wx.Control;
    public import wx.CommandEvent;

    //! \cond EXTERN
    extern (C) ТипСобытия wxStyledTextCtrl_собСТКИзменение();
    extern (C) ТипСобытия wxStyledTextCtrl_собСТКНуженСтиль();
    extern (C) ТипСобытия wxStyledTextCtrl_собСТКДобавленСим();
    extern (C) ТипСобытия wxStyledTextCtrl_собСТКДостигнутаТочкаСохранения();
    extern (C) ТипСобытия wxStyledTextCtrl_собСТКПокинутаТочкаСохранения();
    extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_ROMODIFYATTEMPT();
    extern (C) ТипСобытия wxStyledTextCtrl_собСТККлавиша();
    extern (C) ТипСобытия wxStyledTextCtrl_собСТКДНажатие();
    extern (C) ТипСобытия wxStyledTextCtrl_собСТКОбновитьИП();
    extern (C) ТипСобытия wxStyledTextCtrl_собСТКМодифицирован();
    extern (C) ТипСобытия wxStyledTextCtrl_собСТКЗаписьМакроса();
    extern (C) ТипСобытия wxStyledTextCtrl_собСТКНажатМаржин();
    extern (C) ТипСобытия wxStyledTextCtrl_собСТКНуженПоказ();
    extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_POSCHANGED();
    extern (C) ТипСобытия wxStyledTextCtrl_собСТКОтрисован();
    extern (C) ТипСобытия wxStyledTextCtrl_собСТКВыделениеПользователемСписка();
    extern (C) ТипСобытия wxStyledTextCtrl_собСТКБрошенУИР();
    extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_DWELLSTART();
    extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_DWELLEND();
    extern (C) ТипСобытия wxStyledTextCtrl_собСТКНачалоТяга();
    extern (C) ТипСобытия wxStyledTextCtrl_собСТККонецТяга();
    extern (C) ТипСобытия wxStyledTextCtrl_собСТКДелайБрос();
    extern (C) ТипСобытия wxStyledTextCtrl_собСТКЗум();
    extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_HOTSPOT_CLICK();
    extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_HOTSPOT_DCLICK();
    extern (C) ТипСобытия wxStyledTextCtrl_EVT_STC_CALLTIP_CLICK();

    extern (C) ЦелУкз wxStyledTextCtrl_ctor(ЦелУкз родитель, цел ид, inout Точка поз, inout Размер размер, бцел стиль, ткст имя);
    extern (C) проц   wxStyledTextCtrl_AddText(ЦелУкз сам, ткст текст);
    //extern (C) проц   wxStyledTextCtrl_AddStyledText(ЦелУкз сам, ЦелУкз данные);
    extern (C) проц   wxStyledTextCtrl_InsertText(ЦелУкз сам, цел поз, ткст текст);
    extern (C) проц   wxStyledTextCtrl_ClearAll(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_ClearDocumentStyle(ЦелУкз сам);
    extern (C) цел    wxStyledTextCtrl_GetLength(ЦелУкз сам);
    extern (C) цел    wxStyledTextCtrl_GetCharAt(ЦелУкз сам, цел поз);
    extern (C) цел    wxStyledTextCtrl_GetCurrentPos(ЦелУкз сам);
    extern (C) цел    wxStyledTextCtrl_GetAnchor(ЦелУкз сам);
    extern (C) цел    wxStyledTextCtrl_GetStyleAt(ЦелУкз сам, цел поз);
    extern (C) проц   wxStyledTextCtrl_Redo(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetUndoCollection(ЦелУкз сам, бул collectUndo);
    extern (C) проц   wxStyledTextCtrl_SelectAll(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetSavePoint(ЦелУкз сам);
    //extern (C) ЦелУкз wxStyledTextCtrl_GetStyledText(ЦелУкз сам, цел стартПоз, цел конПоз);
    extern (C) бул   wxStyledTextCtrl_CanRedo(ЦелУкз сам);
    extern (C) цел    wxStyledTextCtrl_MarkerLineFromHandle(ЦелУкз сам, цел handle);
    extern (C) проц   wxStyledTextCtrl_MarkerDeleteHandle(ЦелУкз сам, цел handle);
    extern (C) бул   wxStyledTextCtrl_GetUndoCollection(ЦелУкз сам);
    extern (C) цел    wxStyledTextCtrl_GetViewWhiteSpace(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetViewWhiteSpace(ЦелУкз сам, цел viewWS);
    extern (C) цел    wxStyledTextCtrl_PositionFromPoint(ЦелУкз сам, inout Точка тчк);
    extern (C) цел    wxStyledTextCtrl_PositionFromPointClose(ЦелУкз сам, цел x, цел y);
    extern (C) проц   wxStyledTextCtrl_GotoLine(ЦелУкз сам, цел строка);
    extern (C) проц   wxStyledTextCtrl_GotoPos(ЦелУкз сам, цел поз);
    extern (C) проц   wxStyledTextCtrl_SetAnchor(ЦелУкз сам, цел posAnchor);
    extern (C) ЦелУкз wxStyledTextCtrl_GetCurLine(ЦелУкз сам, inout цел позВСтроке);
    extern (C) цел    wxStyledTextCtrl_GetEndStyled(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_ConvertEOLs(ЦелУкз сам, цел eolMode);
    extern (C) цел    wxStyledTextCtrl_GetEOLMode(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetEOLMode(ЦелУкз сам, цел eolMode);
    extern (C) проц   wxStyledTextCtrl_StartStyling(ЦелУкз сам, цел поз, цел маска);
    extern (C) проц   wxStyledTextCtrl_SetStyling(ЦелУкз сам, цел length, цел стиль);
    extern (C) бул   wxStyledTextCtrl_GetBufferedDraw(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetBufferedDraw(ЦелУкз сам, бул buffered);
    extern (C) проц   wxStyledTextCtrl_SetTabWidth(ЦелУкз сам, цел tabWidth);
    extern (C) цел    wxStyledTextCtrl_GetTabWidth(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetCodePage(ЦелУкз сам, цел codePage);
    extern (C) проц   wxStyledTextCtrl_MarkerDefine(ЦелУкз сам, цел номерМаркера, цел символМаркера, ЦелУкз переднийПлан, ЦелУкз заднийПлан);
    extern (C) проц   wxStyledTextCtrl_MarkerSetForeground(ЦелУкз сам, цел номерМаркера, ЦелУкз перед);
    extern (C) проц   wxStyledTextCtrl_MarkerSetBackground(ЦелУкз сам, цел номерМаркера, ЦелУкз зад);
    extern (C) цел    wxStyledTextCtrl_MarkerAdd(ЦелУкз сам, цел строка, цел номерМаркера);
    extern (C) проц   wxStyledTextCtrl_MarkerDelete(ЦелУкз сам, цел строка, цел номерМаркера);
    extern (C) проц   wxStyledTextCtrl_MarkerDeleteAll(ЦелУкз сам, цел номерМаркера);
    extern (C) цел    wxStyledTextCtrl_MarkerGet(ЦелУкз сам, цел строка);
    extern (C) цел    wxStyledTextCtrl_MarkerNext(ЦелУкз сам, цел началоСтроки, цел маскаМаркера);
    extern (C) цел    wxStyledTextCtrl_MarkerPrevious(ЦелУкз сам, цел началоСтроки, цел маскаМаркера);
    extern (C) проц   wxStyledTextCtrl_MarkerDefineBitmap(ЦелУкз сам, цел номерМаркера, ЦелУкз бмп);
    extern (C) проц   wxStyledTextCtrl_SetMarginType(ЦелУкз сам, цел маржин, цел marginType);
    extern (C) цел    wxStyledTextCtrl_GetMarginType(ЦелУкз сам, цел маржин);
    extern (C) проц   wxStyledTextCtrl_SetMarginWidth(ЦелУкз сам, цел маржин, цел pixelWidth);
    extern (C) цел    wxStyledTextCtrl_GetMarginWidth(ЦелУкз сам, цел маржин);
    extern (C) проц   wxStyledTextCtrl_SetMarginMask(ЦелУкз сам, цел маржин, цел маска);
    extern (C) цел    wxStyledTextCtrl_GetMarginMask(ЦелУкз сам, цел маржин);
    extern (C) проц   wxStyledTextCtrl_SetMarginSensitive(ЦелУкз сам, цел маржин, бул sensitive);
    extern (C) бул   wxStyledTextCtrl_GetMarginSensitive(ЦелУкз сам, цел маржин);
    extern (C) проц   wxStyledTextCtrl_StyleClearAll(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_StyleSetForeground(ЦелУкз сам, цел стиль, ЦелУкз перед);
    extern (C) проц   wxStyledTextCtrl_StyleSetBackground(ЦелУкз сам, цел стиль, ЦелУкз зад);
    extern (C) проц   wxStyledTextCtrl_StyleSetBold(ЦелУкз сам, цел стиль, бул полужирный);
    extern (C) проц   wxStyledTextCtrl_StyleSetItalic(ЦелУкз сам, цел стиль, бул italic);
    extern (C) проц   wxStyledTextCtrl_StyleSetSize(ЦелУкз сам, цел стиль, цел sizePoints);
    extern (C) проц   wxStyledTextCtrl_StyleSetFaceName(ЦелУкз сам, цел стиль, ткст fontName);
    extern (C) проц   wxStyledTextCtrl_StyleSetEOLFilled(ЦелУкз сам, цел стиль, бул filled);
    extern (C) проц   wxStyledTextCtrl_StyleResetDefault(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_StyleSetUnderline(ЦелУкз сам, цел стиль, бул подчеркни);
    extern (C) проц   wxStyledTextCtrl_StyleSetCase(ЦелУкз сам, цел стиль, цел caseForce);
    extern (C) проц   wxStyledTextCtrl_StyleSetCharacterSet(ЦелУкз сам, цел стиль, цел characterSet);
    extern (C) проц   wxStyledTextCtrl_StyleSetHotSpot(ЦелУкз сам, цел стиль, бул hotspot);
    extern (C) проц   wxStyledTextCtrl_SetSelForeground(ЦелУкз сам, бул useSetting, ЦелУкз перед);
    extern (C) проц   wxStyledTextCtrl_SetSelBackground(ЦелУкз сам, бул useSetting, ЦелУкз зад);
    extern (C) проц   wxStyledTextCtrl_SetCaretForeground(ЦелУкз сам, ЦелУкз перед);
    extern (C) проц   wxStyledTextCtrl_CmdKeyAssign(ЦелУкз сам, цел ключ, цел modifiers, цел кмд);
    extern (C) проц   wxStyledTextCtrl_CmdKeyClear(ЦелУкз сам, цел ключ, цел modifiers);
    extern (C) проц   wxStyledTextCtrl_CmdKeyClearAll(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetStyleBytes(ЦелУкз сам, цел length, ббайт* styleBytes);
    extern (C) проц   wxStyledTextCtrl_StyleSetVisible(ЦелУкз сам, цел стиль, бул видим);
    extern (C) цел    wxStyledTextCtrl_GetCaretPeriod(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetCaretPeriod(ЦелУкз сам, цел periodMilliseconds);
    extern (C) проц   wxStyledTextCtrl_SetWordChars(ЦелУкз сам, ткст characters);
    extern (C) проц   wxStyledTextCtrl_BeginUndoAction(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_EndUndoAction(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_IndicatorSetStyle(ЦелУкз сам, цел indic, цел стиль);
    extern (C) цел    wxStyledTextCtrl_IndicatorGetStyle(ЦелУкз сам, цел indic);
    extern (C) проц   wxStyledTextCtrl_IndicatorSetForeground(ЦелУкз сам, цел indic, ЦелУкз перед);
    extern (C) ЦелУкз wxStyledTextCtrl_IndicatorGetForeground(ЦелУкз сам, цел indic);
    extern (C) проц   wxStyledTextCtrl_SetWhitespaceForeground(ЦелУкз сам, бул useSetting, ЦелУкз перед);
    extern (C) проц   wxStyledTextCtrl_SetWhitespaceBackground(ЦелУкз сам, бул useSetting, ЦелУкз зад);
    extern (C) проц   wxStyledTextCtrl_SetStyleBits(ЦелУкз сам, цел bits);
    extern (C) цел    wxStyledTextCtrl_GetStyleBits(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetLineState(ЦелУкз сам, цел строка, цел состояние);
    extern (C) цел    wxStyledTextCtrl_GetLineState(ЦелУкз сам, цел строка);
    extern (C) цел    wxStyledTextCtrl_GetMaxLineState(ЦелУкз сам);
    extern (C) бул   wxStyledTextCtrl_GetCaretLineVisible(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetCaretLineVisible(ЦелУкз сам, бул показ);
    extern (C) ЦелУкз wxStyledTextCtrl_GetCaretLineBack(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetCaretLineBack(ЦелУкз сам, ЦелУкз зад);
    extern (C) проц   wxStyledTextCtrl_StyleSetChangeable(ЦелУкз сам, цел стиль, бул changeable);
    extern (C) проц   wxStyledTextCtrl_AutoCompShow(ЦелУкз сам, цел lenEntered, ткст списЭлтов);
    extern (C) проц   wxStyledTextCtrl_AutoCompCancel(ЦелУкз сам);
    extern (C) бул   wxStyledTextCtrl_AutoCompActive(ЦелУкз сам);
    extern (C) цел    wxStyledTextCtrl_AutoCompPosStart(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_AutoCompComplete(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_AutoCompStops(ЦелУкз сам, ткст characterSet);
    extern (C) проц   wxStyledTextCtrl_AutoCompSetSeparator(ЦелУкз сам, цел separatorCharacter);
    extern (C) цел    wxStyledTextCtrl_AutoCompGetSeparator(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_AutoCompSelect(ЦелУкз сам, ткст текст);
    extern (C) проц   wxStyledTextCtrl_AutoCompSetCancelAtStart(ЦелУкз сам, бул cancel);
    extern (C) бул   wxStyledTextCtrl_AutoCompGetCancelAtStart(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_AutoCompSetFillUps(ЦелУкз сам, ткст characterSet);
    extern (C) проц   wxStyledTextCtrl_AutoCompSetChooseSingle(ЦелУкз сам, бул chooseSingle);
    extern (C) бул   wxStyledTextCtrl_AutoCompGetChooseSingle(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_AutoCompSetIgnoreCase(ЦелУкз сам, бул ignoreCase);
    extern (C) бул   wxStyledTextCtrl_AutoCompGetIgnoreCase(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_UserListShow(ЦелУкз сам, цел типСписка, ткст списЭлтов);
    extern (C) проц   wxStyledTextCtrl_AutoCompSetAutoHide(ЦелУкз сам, бул autoHide);
    extern (C) бул   wxStyledTextCtrl_AutoCompGetAutoHide(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_AutoCompSetDropRestOfWord(ЦелУкз сам, бул dropRestOfWord);
    extern (C) бул   wxStyledTextCtrl_AutoCompGetDropRestOfWord(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_RegisterImage(ЦелУкз сам, цел тип, ЦелУкз бмп);
    extern (C) проц   wxStyledTextCtrl_ClearRegisteredImages(ЦелУкз сам);
    extern (C) цел    wxStyledTextCtrl_AutoCompGetTypeSeparator(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_AutoCompSetTypeSeparator(ЦелУкз сам, цел separatorCharacter);
    extern (C) проц   wxStyledTextCtrl_SetIndent(ЦелУкз сам, цел размОтступа);
    extern (C) цел    wxStyledTextCtrl_GetIndent(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetUseTabs(ЦелУкз сам, бул useTabs);
    extern (C) бул   wxStyledTextCtrl_GetUseTabs(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetLineIndentation(ЦелУкз сам, цел строка, цел размОтступа);
    extern (C) цел    wxStyledTextCtrl_GetLineIndentation(ЦелУкз сам, цел строка);
    extern (C) цел    wxStyledTextCtrl_GetLineIndentPosition(ЦелУкз сам, цел строка);
    extern (C) цел    wxStyledTextCtrl_GetColumn(ЦелУкз сам, цел поз);
    extern (C) проц   wxStyledTextCtrl_SetUseHorizontalScrollBar(ЦелУкз сам, бул показ);
    extern (C) бул   wxStyledTextCtrl_GetUseHorizontalScrollBar(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetIndentationGuides(ЦелУкз сам, бул показ);
    extern (C) бул   wxStyledTextCtrl_GetIndentationGuides(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetHighlightGuide(ЦелУкз сам, цел колонка);
    extern (C) цел    wxStyledTextCtrl_GetHighlightGuide(ЦелУкз сам);
    extern (C) цел    wxStyledTextCtrl_GetLineEndPosition(ЦелУкз сам, цел строка);
    extern (C) цел    wxStyledTextCtrl_GetCodePage(ЦелУкз сам);
    extern (C) ЦелУкз wxStyledTextCtrl_GetCaretForeground(ЦелУкз сам);
    extern (C) бул   wxStyledTextCtrl_GetReadOnly(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetCurrentPos(ЦелУкз сам, цел поз);
    extern (C) проц   wxStyledTextCtrl_SetSelectionStart(ЦелУкз сам, цел поз);
    extern (C) цел    wxStyledTextCtrl_GetSelectionStart(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetSelectionEnd(ЦелУкз сам, цел поз);
    extern (C) цел    wxStyledTextCtrl_GetSelectionEnd(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetPrintMagnification(ЦелУкз сам, цел magnification);
    extern (C) цел    wxStyledTextCtrl_GetPrintMagnification(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetPrintColourMode(ЦелУкз сам, цел режим);
    extern (C) цел    wxStyledTextCtrl_GetPrintColourMode(ЦелУкз сам);
    extern (C) цел    wxStyledTextCtrl_FindText(ЦелУкз сам, цел минПоз, цел максПоз, ткст текст, цел флаги);
    extern (C) цел    wxStyledTextCtrl_FormatRange(ЦелУкз сам, бул doDraw, цел стартПоз, цел конПоз, ЦелУкз draw, ЦелУкз цель, inout Прямоугольник renderRect, inout Прямоугольник pageRect);
    extern (C) цел    wxStyledTextCtrl_GetFirstVisibleLine(ЦелУкз сам);
    extern (C) ЦелУкз wxStyledTextCtrl_GetLine(ЦелУкз сам, цел строка);
    extern (C) цел    wxStyledTextCtrl_GetLineCount(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetMarginLeft(ЦелУкз сам, цел pixelWidth);
    extern (C) цел    wxStyledTextCtrl_GetMarginLeft(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetMarginRight(ЦелУкз сам, цел pixelWidth);
    extern (C) цел    wxStyledTextCtrl_GetMarginRight(ЦелУкз сам);
    extern (C) бул   wxStyledTextCtrl_GetModify(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetSelection(ЦелУкз сам, цел старт, цел конец);
    extern (C) ЦелУкз wxStyledTextCtrl_GetSelectedText(ЦелУкз сам);
    extern (C) ЦелУкз wxStyledTextCtrl_GetTextRange(ЦелУкз сам, цел стартПоз, цел конПоз);
    extern (C) проц   wxStyledTextCtrl_HideSelection(ЦелУкз сам, бул normal);
    extern (C) цел    wxStyledTextCtrl_LineFromPosition(ЦелУкз сам, цел поз);
    extern (C) цел    wxStyledTextCtrl_PositionFromLine(ЦелУкз сам, цел строка);
    extern (C) проц   wxStyledTextCtrl_LineScroll(ЦелУкз сам, цел колонки, цел строки);
    extern (C) проц   wxStyledTextCtrl_EnsureCaretVisible(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_ReplaceSelection(ЦелУкз сам, ткст текст);
    extern (C) проц   wxStyledTextCtrl_SetReadOnly(ЦелУкз сам, бул readOnly);
    extern (C) бул   wxStyledTextCtrl_CanPaste(ЦелУкз сам);
    extern (C) бул   wxStyledTextCtrl_CanUndo(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_EmptyUndoBuffer(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_Undo(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_Cut(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_Copy(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_Paste(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_Clear(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetText(ЦелУкз сам, ткст текст);
    extern (C) ЦелУкз wxStyledTextCtrl_GetText(ЦелУкз сам);
    extern (C) цел    wxStyledTextCtrl_GetTextLength(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetOvertype(ЦелУкз сам, бул overtype);
    extern (C) бул   wxStyledTextCtrl_GetOvertype(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetCaretWidth(ЦелУкз сам, цел pixelWidth);
    extern (C) цел    wxStyledTextCtrl_GetCaretWidth(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetTargetStart(ЦелУкз сам, цел поз);
    extern (C) цел    wxStyledTextCtrl_GetTargetStart(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetTargetEnd(ЦелУкз сам, цел поз);
    extern (C) цел    wxStyledTextCtrl_GetTargetEnd(ЦелУкз сам);
    extern (C) цел    wxStyledTextCtrl_ReplaceTarget(ЦелУкз сам, ткст текст);
    extern (C) цел    wxStyledTextCtrl_ReplaceTargetRE(ЦелУкз сам, ткст текст);
    extern (C) цел    wxStyledTextCtrl_SearchInTarget(ЦелУкз сам, ткст текст);
    extern (C) проц   wxStyledTextCtrl_SetSearchФлаги(ЦелУкз сам, цел флаги);
    extern (C) цел    wxStyledTextCtrl_GetSearchФлаги(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_CallTipShow(ЦелУкз сам, цел поз, ткст definition);
    extern (C) проц   wxStyledTextCtrl_CallTipCancel(ЦелУкз сам);
    extern (C) бул   wxStyledTextCtrl_CallTipActive(ЦелУкз сам);
    extern (C) цел    wxStyledTextCtrl_CallTipPosAtStart(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_CallTipSetHighlight(ЦелУкз сам, цел старт, цел конец);
    extern (C) проц   wxStyledTextCtrl_CallTipSetBackground(ЦелУкз сам, ЦелУкз зад);
    extern (C) проц   wxStyledTextCtrl_CallTipSetForeground(ЦелУкз сам, ЦелУкз перед);
    extern (C) проц   wxStyledTextCtrl_CallTipSetForegroundHighlight(ЦелУкз сам, ЦелУкз перед);
    extern (C) цел    wxStyledTextCtrl_VisibleFromDocLine(ЦелУкз сам, цел строка);
    extern (C) цел    wxStyledTextCtrl_DocLineFromVisible(ЦелУкз сам, цел lineDisplay);
    extern (C) проц   wxStyledTextCtrl_SetFoldLevel(ЦелУкз сам, цел строка, цел level);
    extern (C) цел    wxStyledTextCtrl_GetFoldLevel(ЦелУкз сам, цел строка);
    extern (C) цел    wxStyledTextCtrl_GetLastChild(ЦелУкз сам, цел строка, цел level);
    extern (C) цел    wxStyledTextCtrl_GetFoldParent(ЦелУкз сам, цел строка);
    extern (C) проц   wxStyledTextCtrl_ShowLines(ЦелУкз сам, цел началоСтроки, цел lineEnd);
    extern (C) проц   wxStyledTextCtrl_HideLines(ЦелУкз сам, цел началоСтроки, цел lineEnd);
    extern (C) бул   wxStyledTextCtrl_GetLineVisible(ЦелУкз сам, цел строка);
    extern (C) проц   wxStyledTextCtrl_SetFoldExpanded(ЦелУкз сам, цел строка, бул expanded);
    extern (C) бул   wxStyledTextCtrl_GetFoldExpanded(ЦелУкз сам, цел строка);
    extern (C) проц   wxStyledTextCtrl_ToggleFold(ЦелУкз сам, цел строка);
    extern (C) проц   wxStyledTextCtrl_EnsureVisible(ЦелУкз сам, цел строка);
    extern (C) проц   wxStyledTextCtrl_SetFoldФлаги(ЦелУкз сам, цел флаги);
    extern (C) проц   wxStyledTextCtrl_EnsureVisibleEnforcePolicy(ЦелУкз сам, цел строка);
    extern (C) проц   wxStyledTextCtrl_SetTabIndents(ЦелУкз сам, бул tabIndents);
    extern (C) бул   wxStyledTextCtrl_GetTabIndents(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetBackSpaceUnIndents(ЦелУкз сам, бул bsUnIndents);
    extern (C) бул   wxStyledTextCtrl_GetBackSpaceUnIndents(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetMouseDwellTime(ЦелУкз сам, цел periodMilliseconds);
    extern (C) цел    wxStyledTextCtrl_GetMouseDwellTime(ЦелУкз сам);
    extern (C) цел    wxStyledTextCtrl_WordStartPosition(ЦелУкз сам, цел поз, бул onlyWordCharacters);
    extern (C) цел    wxStyledTextCtrl_WordEndPosition(ЦелУкз сам, цел поз, бул onlyWordCharacters);
    extern (C) проц   wxStyledTextCtrl_SetWrapMode(ЦелУкз сам, цел режим);
    extern (C) цел    wxStyledTextCtrl_GetWrapMode(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetLayoutCache(ЦелУкз сам, цел режим);
    extern (C) цел    wxStyledTextCtrl_GetLayoutCache(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetScrollWidth(ЦелУкз сам, цел pixelWidth);
    extern (C) цел    wxStyledTextCtrl_GetScrollWidth(ЦелУкз сам);
    extern (C) цел    wxStyledTextCtrl_TextWidth(ЦелУкз сам, цел стиль, ткст текст);
    extern (C) проц   wxStyledTextCtrl_SetEndAtLastLine(ЦелУкз сам, бул endAtLastLine);
    extern (C) бул   wxStyledTextCtrl_GetEndAtLastLine(ЦелУкз сам);
    extern (C) цел    wxStyledTextCtrl_TextHeight(ЦелУкз сам, цел строка);
    extern (C) проц   wxStyledTextCtrl_SetUseVerticalScrollBar(ЦелУкз сам, бул показ);
    extern (C) бул   wxStyledTextCtrl_GetUseVerticalScrollBar(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_AppendText(ЦелУкз сам, цел length, ткст текст);
    extern (C) бул   wxStyledTextCtrl_GetTwoPhaseDraw(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetTwoPhaseDraw(ЦелУкз сам, бул twoPhase);
    extern (C) проц   wxStyledTextCtrl_TargetFromSelection(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_LinesJoin(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_LinesSplit(ЦелУкз сам, цел pixelWidth);
    extern (C) проц   wxStyledTextCtrl_SetFoldMarginColour(ЦелУкз сам, бул useSetting, ЦелУкз зад);
    extern (C) проц   wxStyledTextCtrl_SetFoldMarginHiColour(ЦелУкз сам, бул useSetting, ЦелУкз перед);
    extern (C) проц   wxStyledTextCtrl_LineDuplicate(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_HomeDisplay(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_HomeDisplayExtend(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_LineEndDisplay(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_LineEndDisplayExtend(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_MoveCaretInsideView(ЦелУкз сам);
    extern (C) цел    wxStyledTextCtrl_LineLength(ЦелУкз сам, цел строка);
    extern (C) проц   wxStyledTextCtrl_BraceHighlight(ЦелУкз сам, цел pos1, цел pos2);
    extern (C) проц   wxStyledTextCtrl_BraceBadLight(ЦелУкз сам, цел поз);
    extern (C) цел    wxStyledTextCtrl_BraceMatch(ЦелУкз сам, цел поз);
    extern (C) бул   wxStyledTextCtrl_GetViewEOL(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetViewEOL(ЦелУкз сам, бул видим);
    extern (C) ЦелУкз wxStyledTextCtrl_GetDocPointer(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetDocPointer(ЦелУкз сам, ЦелУкз docPointer);
    extern (C) проц   wxStyledTextCtrl_SetModEventMask(ЦелУкз сам, цел маска);
    extern (C) цел    wxStyledTextCtrl_GetEdgeColumn(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetEdgeColumn(ЦелУкз сам, цел колонка);
    extern (C) цел    wxStyledTextCtrl_GetEdgeMode(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetEdgeMode(ЦелУкз сам, цел режим);
    extern (C) ЦелУкз wxStyledTextCtrl_GetEdgeColour(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetEdgeColour(ЦелУкз сам, ЦелУкз edgeColour);
    extern (C) проц   wxStyledTextCtrl_SearchAnchor(ЦелУкз сам);
    extern (C) цел    wxStyledTextCtrl_SearchNext(ЦелУкз сам, цел флаги, ткст текст);
    extern (C) цел    wxStyledTextCtrl_SearchPrev(ЦелУкз сам, цел флаги, ткст текст);
    extern (C) цел    wxStyledTextCtrl_LinesOnScreen(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_UsePopUp(ЦелУкз сам, бул allowPopUp);
    extern (C) бул   wxStyledTextCtrl_SelectionIsRectangle(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetZoom(ЦелУкз сам, цел zoom);
    extern (C) цел    wxStyledTextCtrl_GetZoom(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_CreateDocument(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_AddRefDocument(ЦелУкз сам, ЦелУкз docPointer);
    extern (C) проц   wxStyledTextCtrl_ReleaseDocument(ЦелУкз сам, ЦелУкз docPointer);
    extern (C) цел    wxStyledTextCtrl_GetModEventMask(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetSTCFocus(ЦелУкз сам, бул focus);
    extern (C) бул   wxStyledTextCtrl_GetSTCFocus(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetStatus(ЦелУкз сам, цел statusCode);
    extern (C) цел    wxStyledTextCtrl_GetStatus(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetMouseDownCaptures(ЦелУкз сам, бул captures);
    extern (C) бул   wxStyledTextCtrl_GetMouseDownCaptures(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetSTCCursor(ЦелУкз сам, цел cursorType);
    extern (C) цел    wxStyledTextCtrl_GetSTCCursor(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetControlCharSymbol(ЦелУкз сам, цел symbol);
    extern (C) цел    wxStyledTextCtrl_GetControlCharSymbol(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_WordPartLeft(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_WordPartLeftExtend(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_WordPartRight(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_WordPartRightExtend(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetVisiblePolicy(ЦелУкз сам, цел visiblePolicy, цел visibleSlop);
    extern (C) проц   wxStyledTextCtrl_DelLineLeft(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_DelLineRight(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetXOffset(ЦелУкз сам, цел newOffset);
    extern (C) цел    wxStyledTextCtrl_GetXOffset(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_ChooseCaretX(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetXCaretPolicy(ЦелУкз сам, цел caretPolicy, цел caretSlop);
    extern (C) проц   wxStyledTextCtrl_SetYCaretPolicy(ЦелУкз сам, цел caretPolicy, цел caretSlop);
    extern (C) проц   wxStyledTextCtrl_SetPrintWrapMode(ЦелУкз сам, цел режим);
    extern (C) цел    wxStyledTextCtrl_GetPrintWrapMode(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetHotspotActiveForeground(ЦелУкз сам, бул useSetting, ЦелУкз перед);
    extern (C) проц   wxStyledTextCtrl_SetHotspotActiveBackground(ЦелУкз сам, бул useSetting, ЦелУкз зад);
    extern (C) проц   wxStyledTextCtrl_SetHotspotActiveUnderline(ЦелУкз сам, бул подчеркни);
    extern (C) проц   wxStyledTextCtrl_StartRecord(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_StopRecord(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetLexer(ЦелУкз сам, цел lexer);
    extern (C) цел    wxStyledTextCtrl_GetLexer(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_Colourise(ЦелУкз сам, цел старт, цел конец);
    extern (C) проц   wxStyledTextCtrl_SetProperty(ЦелУкз сам, ткст ключ, ткст значение);
    extern (C) проц   wxStyledTextCtrl_SetKeyWords(ЦелУкз сам, цел keywordSet, ткст keyWords);
    extern (C) проц   wxStyledTextCtrl_SetLexerLanguage(ЦелУкз сам, ткст язык);
    extern (C) цел    wxStyledTextCtrl_GetCurrentLine(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_StyleSetSpec(ЦелУкз сам, цел styleNum, ткст spec);
    extern (C) проц   wxStyledTextCtrl_StyleSetFont(ЦелУкз сам, цел styleNum, ЦелУкз шрифт);
    extern (C) проц   wxStyledTextCtrl_StyleSetFontAttr(ЦелУкз сам, цел styleNum, цел размер, ткст имяФас, бул полужирный, бул italic, бул подчеркни);
    extern (C) проц   wxStyledTextCtrl_CmdKeyExecute(ЦелУкз сам, цел кмд);
    extern (C) проц   wxStyledTextCtrl_SetMargins(ЦелУкз сам, цел left, цел right);
    extern (C) проц   wxStyledTextCtrl_GetSelection(ЦелУкз сам, inout цел стартПоз, inout цел конПоз);
    extern (C) проц   wxStyledTextCtrl_PointFromPosition(ЦелУкз сам, цел поз, inout Точка тчк);
    extern (C) проц   wxStyledTextCtrl_ScrollToLine(ЦелУкз сам, цел строка);
    extern (C) проц   wxStyledTextCtrl_ScrollToColumn(ЦелУкз сам, цел колонка);
    extern (C) цел    wxStyledTextCtrl_SendMsg(ЦелУкз сам, цел сооб, цел wp, цел lp);
    //extern (C) проц   wxStyledTextCtrl_SetVScrollBar(ЦелУкз сам, ЦелУкз bar);
    //extern (C) проц   wxStyledTextCtrl_SetHScrollBar(ЦелУкз сам, ЦелУкз bar);
    extern (C) бул   wxStyledTextCtrl_GetLastKeydownProcessed(ЦелУкз сам);
    extern (C) проц   wxStyledTextCtrl_SetLastKeydownProcessed(ЦелУкз сам, бул знач);
    extern (C) бул   wxStyledTextCtrl_SaveFile(ЦелУкз сам, ткст имяф);
    extern (C) бул   wxStyledTextCtrl_LoadFile(ЦелУкз сам, ткст имяф);
    //! \endcond

    //-----------------------------------------------------------------------------

    export class СтильныйТекстКтрл : Контрол
    {
        //-----------------------------------------------------------------------------

        // СтильныйТекстКтрл Events

        public static ТипСобытия СОБ_СТК_ИЗМЕНЕНИЕ;
        public static ТипСобытия СОБ_СТК_НУЖНЫЙСТИЛЬ;
        public static ТипСобытия СОБ_СТК_ДОБАВЛЕНСИМ;
        public static ТипСобытия СОБ_СТК_ДОСТИГНУТАТОЧКАСОХРАНЕНИЯ;
        public static ТипСобытия СОБ_СТК_ПОКИНУТАТОЧКАСОХРАНЕНИЯ;
        public static ТипСобытия wxEVT_STC_ROMODIFYATTEMPT;
        public static ТипСобытия СОБ_СТК_КЛАВИША;
        public static ТипСобытия СОБ_СТК_ДНАЖАТИЕ;
        public static ТипСобытия СОБ_СТК_ОБНОВИТЬИП;
        public static ТипСобытия СОБ_СТК_МОДИФИЦИРОВАН;
        public static ТипСобытия СОБ_СТК_ЗАПИСЬМАКРОСА;
        public static ТипСобытия СОБ_СТК_НАЖАТМАРЖИН;
        public static ТипСобытия СОБ_СТК_НУЖЕНПОКАЗ;
        //public static ТипСобытия wxEVT_STC_POSCHANGED;
        public static ТипСобытия СОБ_СТК_ОТРИСОВАН;
        public static ТипСобытия СОБ_СТК_ВЫДЕЛЕНИЕПОЛЬЗОВАТЕЛЕМСПИСКА;
        public static ТипСобытия СОБ_СТК_БРОШЕНУИР;
        public static ТипСобытия wxEVT_STC_DWELLSTART;
        public static ТипСобытия wxEVT_STC_DWELLEND;
        public static ТипСобытия СОБ_СТК_НАЧАЛО_ТЯГА;
        public static ТипСобытия СОБ_СТК_КОНЕЦ_ТЯГА;
        public static ТипСобытия СОБ_СТК_БРОСЬ_ДРОП;
        public static ТипСобытия СОБ_СТК_ЗУМ;
        public static ТипСобытия wxEVT_STC_HOTSPOT_CLICK;
        public static ТипСобытия wxEVT_STC_HOTSPOT_DCLICK;
        public static ТипСобытия wxEVT_STC_CALLTIP_CLICK;

        //-----------------------------------------------------------------------------

        public const цел wxSTC_INVALID_POSITION = -1;

        // Define старт of Scintilla messages до be greater than all edit (EM_*) messages
        // as many EM_ messages can be used although that use is deprecated.
        public const цел wxSTC_START = 2000;
        public const цел wxSTC_OPTIONAL_START = 3000;
        public const цел wxSTC_LEXER_START = 4000;
        public const цел wxSTC_WS_INVISIBLE = 0;
        public const цел wxSTC_WS_VISIBLEALWAYS = 1;
        public const цел wxSTC_WS_VISIBLEAFTERINDENT = 2;
        public const цел wxSTC_EOL_CRLF = 0;
        public const цел wxSTC_EOL_CR = 1;
        public const цел wxSTC_EOL_LF = 2;

        // The SC_CP_UTF8 значение can be used до enter Unicode режим.
        // This is the same значение as CP_UTF8 in Windows
        public const цел wxSTC_CP_UTF8 = 65001;

        // The SC_CP_DBCS значение can be used до indicate a DBCS режим for GTK+.
        public const цел wxSTC_CP_DBCS = 1;
        public const цел wxSTC_MARKER_MAX = 31;
        public const цел wxSTC_MARK_CIRCLE = 0;
        public const цел wxSTC_MARK_ROUNDRECT = 1;
        public const цел wxSTC_MARK_ARROW = 2;
        public const цел wxSTC_MARK_SMALLRECT = 3;
        public const цел wxSTC_MARK_SHORTARROW = 4;
        public const цел wxSTC_MARK_EMPTY = 5;
        public const цел wxSTC_MARK_ARROWDOWN = 6;
        public const цел wxSTC_MARK_MINUS = 7;
        public const цел wxSTC_MARK_PLUS = 8;

        // Shapes used for outlining колонка.
        public const цел wxSTC_MARK_VLINE = 9;
        public const цел wxSTC_MARK_LCORNER = 10;
        public const цел wxSTC_MARK_TCORNER = 11;
        public const цел wxSTC_MARK_BOXPLUS = 12;
        public const цел wxSTC_MARK_BOXPLUSCONNECTED = 13;
        public const цел wxSTC_MARK_BOXMINUS = 14;
        public const цел wxSTC_MARK_BOXMINUSCONNECTED = 15;
        public const цел wxSTC_MARK_LCORNERCURVE = 16;
        public const цел wxSTC_MARK_TCORNERCURVE = 17;
        public const цел wxSTC_MARK_CIRCLEPLUS = 18;
        public const цел wxSTC_MARK_CIRCLEPLUSCONNECTED = 19;
        public const цел wxSTC_MARK_CIRCLEMINUS = 20;
        public const цел wxSTC_MARK_CIRCLEMINUSCONNECTED = 21;

        // Invisible mark that only sets the строка заднийПлан цв.
        public const цел wxSTC_MARK_BACKGROUND = 22;
        public const цел wxSTC_MARK_DOTDOTDOT = 23;
        public const цел wxSTC_MARK_ARROWS = 24;
        public const цел wxSTC_MARK_PIXMAP = 25;
        public const цел wxSTC_MARK_CHARACTER = 10000;

        // Markers used for outlining колонка.
        public const цел wxSTC_MARKNUM_FOLDEREND = 25;
        public const цел wxSTC_MARKNUM_FOLDEROPENMID = 26;
        public const цел wxSTC_MARKNUM_FOLDERMIDTAIL = 27;
        public const цел wxSTC_MARKNUM_FOLDERTAIL = 28;
        public const цел wxSTC_MARKNUM_FOLDERSUB = 29;
        public const цел wxSTC_MARKNUM_FOLDER = 30;
        public const цел wxSTC_MARKNUM_FOLDEROPEN = 31;
        public const цел wxSTC_MASK_FOLDERS = -1;
        public const цел wxSTC_MARGIN_SYMBOL = 0;
        public const цел wxSTC_MARGIN_NUMBER = 1;

        // Styles in диапазон 32..37 are predefined for parts of the UI and are not used as normal styles.
        // Styles 38 and 39 are for future use.
        public const цел wxSTC_STYLE_Дефолт = 32;
        public const цел wxSTC_STYLE_LINENUMBER = 33;
        public const цел wxSTC_STYLE_BRACELIGHT = 34;
        public const цел wxSTC_STYLE_BRACEBAD = 35;
        public const цел wxSTC_STYLE_CONTROLCHAR = 36;
        public const цел wxSTC_STYLE_INDENTGUIDE = 37;
        public const цел wxSTC_STYLE_LASTPREDEFINED = 39;
        public const цел wxSTC_STYLE_MAX = 127;

        // Character set identifiers are used in StyleSetCharacterSet.
        // The values are the same as the Windows *_CHARSET values.
        public const цел wxSTC_CHARSET_ANSI = 0;
        public const цел wxSTC_CHARSET_Дефолт = 1;
        public const цел wxSTC_CHARSET_BALTIC = 186;
        public const цел wxSTC_CHARSET_CHINESEBIG5 = 136;
        public const цел wxSTC_CHARSET_EASTEUROPE = 238;
        public const цел wxSTC_CHARSET_GB2312 = 134;
        public const цел wxSTC_CHARSET_GREEK = 161;
        public const цел wxSTC_CHARSET_HANGUL = 129;
        public const цел wxSTC_CHARSET_MAC = 77;
        public const цел wxSTC_CHARSET_OEM = 255;
        public const цел wxSTC_CHARSET_RUSSIAN = 204;
        public const цел wxSTC_CHARSET_SHIFTJIS = 128;
        public const цел wxSTC_CHARSET_SYMBOL = 2;
        public const цел wxSTC_CHARSET_TURKISH = 162;
        public const цел wxSTC_CHARSET_JOHAB = 130;
        public const цел wxSTC_CHARSET_HEBREW = 177;
        public const цел wxSTC_CHARSET_ARABIC = 178;
        public const цел wxSTC_CHARSET_VIETNAMESE = 163;
        public const цел wxSTC_CHARSET_THAI = 222;
        public const цел wxSTC_CASE_MIXED = 0;
        public const цел wxSTC_CASE_UPPER = 1;
        public const цел wxSTC_CASE_LOWER = 2;
        public const цел wxSTC_INDIC_MAX = 7;
        public const цел wxSTC_INDIC_PLAIN = 0;
        public const цел wxSTC_INDIC_SQUIGGLE = 1;
        public const цел wxSTC_INDIC_TT = 2;
        public const цел wxSTC_INDIC_DIAGONAL = 3;
        public const цел wxSTC_INDIC_STRIKE = 4;
        public const цел wxSTC_INDIC0_MASK = 0x20;
        public const цел wxSTC_INDIC1_MASK = 0x40;
        public const цел wxSTC_INDIC2_MASK = 0x80;
        public const цел wxSTC_INDICS_MASK = 0xE0;

        // режимЦветнойПечати - use same colours as screen.
        public const цел wxSTC_PRINT_NORMAL = 0;

        // режимЦветнойПечати - invert the light значение of each стиль for printing.
        public const цел wxSTC_PRINT_INVERTLIGHT = 1;

        // режимЦветнойПечати - сила black текст on white заднийПлан for printing.
        public const цел wxSTC_PRINT_BLACKONWHITE = 2;

        // режимЦветнойПечати - текст stays coloured, кноп all заднийПлан is forced до be white for printing.
        public const цел wxSTC_PRINT_COLOURONWHITE = 3;

        // режимЦветнойПечати - only the default-заднийПлан is forced до be white for printing.
        public const цел wxSTC_PRINT_COLOURONWHITEДефолтBG = 4;
        public const цел wxSTC_FIND_WHOLEWORD = 2;
        public const цел wxSTC_FIND_MATCHCASE = 4;
        public const цел wxSTC_FIND_WORDSTART = 0x00100000;
        public const цел wxSTC_FIND_REGEXP = 0x00200000;
        public const цел wxSTC_FIND_POSIX = 0x00400000;
        public const цел wxSTC_FOLDLEVELBASE = 0x400;
        public const цел wxSTC_FOLDLEVELWHITEFLAG = 0x1000;
        public const цел wxSTC_FOLDLEVELHEADERFLAG = 0x2000;
        public const цел wxSTC_FOLDLEVELBOXHEADERFLAG = 0x4000;
        public const цел wxSTC_FOLDLEVELBOXFOOTERFLAG = 0x8000;
        public const цел wxSTC_FOLDLEVELCONTRACTED = 0x10000;
        public const цел wxSTC_FOLDLEVELUNINDENT = 0x20000;
        public const цел wxSTC_FOLDLEVELNUMBERMASK = 0x0FFF;
        public const цел wxSTC_FOLDFLAG_LINEBEFORE_EXPANDED = 0x0002;
        public const цел wxSTC_FOLDFLAG_LINEBEFORE_CONTRACTED = 0x0004;
        public const цел wxSTC_FOLDFLAG_LINEAFTER_EXPANDED = 0x0008;
        public const цел wxSTC_FOLDFLAG_LINEAFTER_CONTRACTED = 0x0010;
        public const цел wxSTC_FOLDFLAG_LEVELNUMBERS = 0x0040;
        public const цел wxSTC_FOLDFLAG_BOX = 0x0001;
        public const цел wxSTC_TIME_FOREVER = 10000000;
        public const цел wxSTC_WRAP_Нет = 0;
        public const цел wxSTC_WRAP_WORD = 1;
        public const цел wxSTC_CACHE_Нет = 0;
        public const цел wxSTC_CACHE_CARET = 1;
        public const цел wxSTC_CACHE_PAGE = 2;
        public const цел wxSTC_CACHE_DOCUMENT = 3;
        public const цел wxSTC_EDGE_Нет = 0;
        public const цел wxSTC_EDGE_LINE = 1;
        public const цел wxSTC_EDGE_BACKGROUND = 2;
        public const цел wxSTC_CURSORNORMAL = -1;
        public const цел wxSTC_CURSORWAIT = 4;

        // Constants for use with SetVisiblePolicy, similar до SetCaretPolicy.
        public const цел wxSTC_VISIBLE_SLOP = 0x01;
        public const цел wxSTC_VISIBLE_STRICT = 0x04;

        // Каретка policy, used by SetXCaretPolicy and SetYCaretPolicy.
        // If CARET_SLOP is set, we can define a slop значение: caretSlop.
        // This значение defines an unwanted zone (UZ) where the каретка is... unwanted.
        // This zone is defined as a число of pixels near the vertical margins,
        // and as a число of строки near the horizontal margins.
        // By keeping the каретка away от the edges, it is seen within its context,
        // so it is likely that the identifier that the каретка is on can be completely seen,
        // and that the current строка is seen with some of the строки following it который are
        // often dependent on that строка.
        public const цел wxSTC_CARET_SLOP = 0x01;

        // If CARET_STRICT is set, the policy is enforced... strictly.
        // The каретка is centred on the display if slop is not set,
        // and cannot go in the UZ if slop is set.
        public const цел wxSTC_CARET_STRICT = 0x04;

        // If CARET_JUMPS is set, the display is moved more energetically
        // so the каретка can move in the same направление longer перед the policy is applied again.
        public const цел wxSTC_CARET_JUMPS = 0x10;

        // If CARET_EVEN is not set, instead of having symmetrical UZs,
        // the left and bottom UZs are extended up до right and top UZs respectively.
        // This way, we favour the displaying of useful information: the begining of строки,
        // where most код reside, and the строки after the каретка, eg. the body of a function.
        public const цел wxSTC_CARET_EVEN = 0x08;

        // Notifications
        // тип of modification and the action который caused the modification.
        // These are defined as a bit маска до make it easy до specify который notifications are wanted.
        // One bit is set от each of SC_MOD_* and SC_PERFORMED_*.
        public const цел wxSTC_MOD_INSERTTEXT = 0x1;
        public const цел wxSTC_MOD_DELETETEXT = 0x2;
        public const цел wxSTC_MOD_CHANGESTYLE = 0x4;
        public const цел wxSTC_MOD_CHANGEFOLD = 0x8;
        public const цел wxSTC_PERFORMED_USER = 0x10;
        public const цел wxSTC_PERFORMED_UNDO = 0x20;
        public const цел wxSTC_PERFORMED_REDO = 0x40;
        public const цел wxSTC_LASTSTEPINUNDOREDO = 0x100;
        public const цел wxSTC_MOD_CHANGEMARKER = 0x200;
        public const цел wxSTC_MOD_BEFOREINSERT = 0x400;
        public const цел wxSTC_MOD_BEFOREDELETE = 0x800;
        public const цел wxSTC_MODEVENTMASKALL = 0xF77;

        // Symbolic ключ codes and modifier флаги.
        // ASCII and другой printable characters below 256.
        // Extended keys above 300.
        public const цел wxSTC_KEY_DOWN = 300;
        public const цел wxSTC_KEY_UP = 301;
        public const цел wxSTC_KEY_LEFT = 302;
        public const цел wxSTC_KEY_RIGHT = 303;
        public const цел wxSTC_KEY_HOME = 304;
        public const цел wxSTC_KEY_END = 305;
        public const цел wxSTC_KEY_PRIOR = 306;
        public const цел wxSTC_KEY_NEXT = 307;
        public const цел wxSTC_KEY_DELETE = 308;
        public const цел wxSTC_KEY_INSERT = 309;
        public const цел wxSTC_KEY_ESCAPE = 7;
        public const цел wxSTC_KEY_BACK = 8;
        public const цел wxSTC_KEY_TAB = 9;
        public const цел wxSTC_KEY_RETURN = 13;
        public const цел wxSTC_KEY_ADD = 310;
        public const цел wxSTC_KEY_SUBTRACT = 311;
        public const цел wxSTC_KEY_DIVIDE = 312;
        public const цел wxSTC_SCMOD_SHIFT = 1;
        public const цел wxSTC_SCMOD_CTRL = 2;
        public const цел wxSTC_SCMOD_ALT = 4;

        // For SciLexer.h
        public const цел wxSTC_LEX_CONTAINER = 0;
        public const цел wxSTC_LEX_NULL = 1;
        public const цел wxSTC_LEX_PYTHON = 2;
        public const цел wxSTC_LEX_CPP = 3;
        public const цел wxSTC_LEX_HTML = 4;
        public const цел wxSTC_LEX_XML = 5;
        public const цел wxSTC_LEX_PERL = 6;
        public const цел wxSTC_LEX_SQL = 7;
        public const цел wxSTC_LEX_VB = 8;
        public const цел wxSTC_LEX_PROPERTIES = 9;
        public const цел wxSTC_LEX_ERRORLIST = 10;
        public const цел wxSTC_LEX_MAKEFILE = 11;
        public const цел wxSTC_LEX_BATCH = 12;
        public const цел wxSTC_LEX_XCODE = 13;
        public const цел wxSTC_LEX_LATEX = 14;
        public const цел wxSTC_LEX_LUA = 15;
        public const цел wxSTC_LEX_DIFF = 16;
        public const цел wxSTC_LEX_CONF = 17;
        public const цел wxSTC_LEX_PASCAL = 18;
        public const цел wxSTC_LEX_AVE = 19;
        public const цел wxSTC_LEX_ADA = 20;
        public const цел wxSTC_LEX_LISP = 21;
        public const цел wxSTC_LEX_RUBY = 22;
        public const цел wxSTC_LEX_EIFFEL = 23;
        public const цел wxSTC_LEX_EIFFELKW = 24;
        public const цел wxSTC_LEX_TCL = 25;
        public const цел wxSTC_LEX_NNCRONTAB = 26;
        public const цел wxSTC_LEX_BULLANT = 27;
        public const цел wxSTC_LEX_VBSCRIPT = 28;
        public const цел wxSTC_LEX_ASP = 29;
        public const цел wxSTC_LEX_PHP = 30;
        public const цел wxSTC_LEX_BAAN = 31;
        public const цел wxSTC_LEX_MATLAB = 32;
        public const цел wxSTC_LEX_SCRIPTOL = 33;
        public const цел wxSTC_LEX_ASM = 34;
        public const цел wxSTC_LEX_CPPNOCASE = 35;
        public const цел wxSTC_LEX_FORTRAN = 36;
        public const цел wxSTC_LEX_F77 = 37;
        public const цел wxSTC_LEX_CSS = 38;
        public const цел wxSTC_LEX_POV = 39;

        // When a lexer specifies its язык as SCLEX_AUTOMATIC it receives a
        // значение assigned in sequence от SCLEX_AUTOMATIC+1.
        public const цел wxSTC_LEX_AUTOMATIC = 1000;

        // Lexical states for SCLEX_PYTHON
        public const цел wxSTC_P_Дефолт = 0;
        public const цел wxSTC_P_COMMENTLINE = 1;
        public const цел wxSTC_P_NUMBER = 2;
        public const цел wxSTC_P_STRING = 3;
        public const цел wxSTC_P_CHARACTER = 4;
        public const цел wxSTC_P_WORD = 5;
        public const цел wxSTC_P_TRIPLE = 6;
        public const цел wxSTC_P_TRIPLEDOUBLE = 7;
        public const цел wxSTC_P_CLASSNAME = 8;
        public const цел wxSTC_P_DEFNAME = 9;
        public const цел wxSTC_P_OPERATOR = 10;
        public const цел wxSTC_P_IDENTIFIER = 11;
        public const цел wxSTC_P_COMMENTBLOCK = 12;
        public const цел wxSTC_P_STRINGEOL = 13;

        // Lexical states for SCLEX_CPP
        public const цел wxSTC_C_Дефолт = 0;
        public const цел wxSTC_C_COMMENT = 1;
        public const цел wxSTC_C_COMMENTLINE = 2;
        public const цел wxSTC_C_COMMENTDOC = 3;
        public const цел wxSTC_C_NUMBER = 4;
        public const цел wxSTC_C_WORD = 5;
        public const цел wxSTC_C_STRING = 6;
        public const цел wxSTC_C_CHARACTER = 7;
        public const цел wxSTC_C_UUID = 8;
        public const цел wxSTC_C_PREPROCESSOR = 9;
        public const цел wxSTC_C_OPERATOR = 10;
        public const цел wxSTC_C_IDENTIFIER = 11;
        public const цел wxSTC_C_STRINGEOL = 12;
        public const цел wxSTC_C_VERBATIM = 13;
        public const цел wxSTC_C_REGEX = 14;
        public const цел wxSTC_C_COMMENTLINEDOC = 15;
        public const цел wxSTC_C_WORD2 = 16;
        public const цел wxSTC_C_COMMENTDOCKEYWORD = 17;
        public const цел wxSTC_C_COMMENTDOCKEYWORDERROR = 18;

        // Lexical states for SCLEX_HTML, SCLEX_XML
        public const цел wxSTC_H_Дефолт = 0;
        public const цел wxSTC_H_TAG = 1;
        public const цел wxSTC_H_TAGUNKNOWN = 2;
        public const цел wxSTC_H_ATTRIBUTE = 3;
        public const цел wxSTC_H_ATTRIBUTEUNKNOWN = 4;
        public const цел wxSTC_H_NUMBER = 5;
        public const цел wxSTC_H_DOUBLESTRING = 6;
        public const цел wxSTC_H_SINGLESTRING = 7;
        public const цел wxSTC_H_OTHER = 8;
        public const цел wxSTC_H_COMMENT = 9;
        public const цел wxSTC_H_ENTITY = 10;

        // XML and ASP
        public const цел wxSTC_H_TAGEND = 11;
        public const цел wxSTC_H_XMLSTART = 12;
        public const цел wxSTC_H_XMLEND = 13;
        public const цел wxSTC_H_SCRIPT = 14;
        public const цел wxSTC_H_ASP = 15;
        public const цел wxSTC_H_ASPAT = 16;
        public const цел wxSTC_H_CDATA = 17;
        public const цел wxSTC_H_QUESTION = 18;

        // More HTML
        public const цел wxSTC_H_VALUE = 19;

        // Х-Code
        public const цел wxSTC_H_XCCOMMENT = 20;

        // SGML
        public const цел wxSTC_H_SGML_Дефолт = 21;
        public const цел wxSTC_H_SGML_COMMAND = 22;
        public const цел wxSTC_H_SGML_1ST_PARAM = 23;
        public const цел wxSTC_H_SGML_DOUBLESTRING = 24;
        public const цел wxSTC_H_SGML_SIMPLESTRING = 25;
        public const цел wxSTC_H_SGML_ERROR = 26;
        public const цел wxSTC_H_SGML_SPECIAL = 27;
        public const цел wxSTC_H_SGML_ENTITY = 28;
        public const цел wxSTC_H_SGML_COMMENT = 29;
        public const цел wxSTC_H_SGML_1ST_PARAM_COMMENT = 30;
        public const цел wxSTC_H_SGML_BLOCK_Дефолт = 31;

        // Embedded Javascript
        public const цел wxSTC_HJ_START = 40;
        public const цел wxSTC_HJ_Дефолт = 41;
        public const цел wxSTC_HJ_COMMENT = 42;
        public const цел wxSTC_HJ_COMMENTLINE = 43;
        public const цел wxSTC_HJ_COMMENTDOC = 44;
        public const цел wxSTC_HJ_NUMBER = 45;
        public const цел wxSTC_HJ_WORD = 46;
        public const цел wxSTC_HJ_KEYWORD = 47;
        public const цел wxSTC_HJ_DOUBLESTRING = 48;
        public const цел wxSTC_HJ_SINGLESTRING = 49;
        public const цел wxSTC_HJ_SYMBOLS = 50;
        public const цел wxSTC_HJ_STRINGEOL = 51;
        public const цел wxSTC_HJ_REGEX = 52;

        // ASP Javascript
        public const цел wxSTC_HJA_START = 55;
        public const цел wxSTC_HJA_Дефолт = 56;
        public const цел wxSTC_HJA_COMMENT = 57;
        public const цел wxSTC_HJA_COMMENTLINE = 58;
        public const цел wxSTC_HJA_COMMENTDOC = 59;
        public const цел wxSTC_HJA_NUMBER = 60;
        public const цел wxSTC_HJA_WORD = 61;
        public const цел wxSTC_HJA_KEYWORD = 62;
        public const цел wxSTC_HJA_DOUBLESTRING = 63;
        public const цел wxSTC_HJA_SINGLESTRING = 64;
        public const цел wxSTC_HJA_SYMBOLS = 65;
        public const цел wxSTC_HJA_STRINGEOL = 66;
        public const цел wxSTC_HJA_REGEX = 67;

        // Embedded VBScript
        public const цел wxSTC_HB_START = 70;
        public const цел wxSTC_HB_Дефолт = 71;
        public const цел wxSTC_HB_COMMENTLINE = 72;
        public const цел wxSTC_HB_NUMBER = 73;
        public const цел wxSTC_HB_WORD = 74;
        public const цел wxSTC_HB_STRING = 75;
        public const цел wxSTC_HB_IDENTIFIER = 76;
        public const цел wxSTC_HB_STRINGEOL = 77;

        // ASP VBScript
        public const цел wxSTC_HBA_START = 80;
        public const цел wxSTC_HBA_Дефолт = 81;
        public const цел wxSTC_HBA_COMMENTLINE = 82;
        public const цел wxSTC_HBA_NUMBER = 83;
        public const цел wxSTC_HBA_WORD = 84;
        public const цел wxSTC_HBA_STRING = 85;
        public const цел wxSTC_HBA_IDENTIFIER = 86;
        public const цел wxSTC_HBA_STRINGEOL = 87;

        // Embedded Python
        public const цел wxSTC_HP_START = 90;
        public const цел wxSTC_HP_Дефолт = 91;
        public const цел wxSTC_HP_COMMENTLINE = 92;
        public const цел wxSTC_HP_NUMBER = 93;
        public const цел wxSTC_HP_STRING = 94;
        public const цел wxSTC_HP_CHARACTER = 95;
        public const цел wxSTC_HP_WORD = 96;
        public const цел wxSTC_HP_TRIPLE = 97;
        public const цел wxSTC_HP_TRIPLEDOUBLE = 98;
        public const цел wxSTC_HP_CLASSNAME = 99;
        public const цел wxSTC_HP_DEFNAME = 100;
        public const цел wxSTC_HP_OPERATOR = 101;
        public const цел wxSTC_HP_IDENTIFIER = 102;

        // ASP Python
        public const цел wxSTC_HPA_START = 105;
        public const цел wxSTC_HPA_Дефолт = 106;
        public const цел wxSTC_HPA_COMMENTLINE = 107;
        public const цел wxSTC_HPA_NUMBER = 108;
        public const цел wxSTC_HPA_STRING = 109;
        public const цел wxSTC_HPA_CHARACTER = 110;
        public const цел wxSTC_HPA_WORD = 111;
        public const цел wxSTC_HPA_TRIPLE = 112;
        public const цел wxSTC_HPA_TRIPLEDOUBLE = 113;
        public const цел wxSTC_HPA_CLASSNAME = 114;
        public const цел wxSTC_HPA_DEFNAME = 115;
        public const цел wxSTC_HPA_OPERATOR = 116;
        public const цел wxSTC_HPA_IDENTIFIER = 117;

        // PHP
        public const цел wxSTC_HPHP_Дефолт = 118;
        public const цел wxSTC_HPHP_HSTRING = 119;
        public const цел wxSTC_HPHP_SIMPLESTRING = 120;
        public const цел wxSTC_HPHP_WORD = 121;
        public const цел wxSTC_HPHP_NUMBER = 122;
        public const цел wxSTC_HPHP_VARIABLE = 123;
        public const цел wxSTC_HPHP_COMMENT = 124;
        public const цел wxSTC_HPHP_COMMENTLINE = 125;
        public const цел wxSTC_HPHP_HSTRING_VARIABLE = 126;
        public const цел wxSTC_HPHP_OPERATOR = 127;

        // Lexical states for SCLEX_PERL
        public const цел wxSTC_PL_Дефолт = 0;
        public const цел wxSTC_PL_ERROR = 1;
        public const цел wxSTC_PL_COMMENTLINE = 2;
        public const цел wxSTC_PL_POD = 3;
        public const цел wxSTC_PL_NUMBER = 4;
        public const цел wxSTC_PL_WORD = 5;
        public const цел wxSTC_PL_STRING = 6;
        public const цел wxSTC_PL_CHARACTER = 7;
        public const цел wxSTC_PL_PUNCTUATION = 8;
        public const цел wxSTC_PL_PREPROCESSOR = 9;
        public const цел wxSTC_PL_OPERATOR = 10;
        public const цел wxSTC_PL_IDENTIFIER = 11;
        public const цел wxSTC_PL_SCALAR = 12;
        public const цел wxSTC_PL_ARRAY = 13;
        public const цел wxSTC_PL_HASH = 14;
        public const цел wxSTC_PL_SYMBOLTABLE = 15;
        public const цел wxSTC_PL_REGEX = 17;
        public const цел wxSTC_PL_REGSUBST = 18;
        public const цел wxSTC_PL_LONGQUOTE = 19;
        public const цел wxSTC_PL_BACKTICKS = 20;
        public const цел wxSTC_PL_DATASECTION = 21;
        public const цел wxSTC_PL_HERE_DELIM = 22;
        public const цел wxSTC_PL_HERE_Q = 23;
        public const цел wxSTC_PL_HERE_QQ = 24;
        public const цел wxSTC_PL_HERE_QX = 25;
        public const цел wxSTC_PL_STRING_Q = 26;
        public const цел wxSTC_PL_STRING_QQ = 27;
        public const цел wxSTC_PL_STRING_QX = 28;
        public const цел wxSTC_PL_STRING_QR = 29;
        public const цел wxSTC_PL_STRING_QW = 30;

        // Lexical states for SCLEX_VB, SCLEX_VBSCRIPT
        public const цел wxSTC_B_Дефолт = 0;
        public const цел wxSTC_B_COMMENT = 1;
        public const цел wxSTC_B_NUMBER = 2;
        public const цел wxSTC_B_KEYWORD = 3;
        public const цел wxSTC_B_STRING = 4;
        public const цел wxSTC_B_PREPROCESSOR = 5;
        public const цел wxSTC_B_OPERATOR = 6;
        public const цел wxSTC_B_IDENTIFIER = 7;
        public const цел wxSTC_B_DATE = 8;

        // Lexical states for SCLEX_PROPERTIES
        public const цел wxSTC_PROPS_Дефолт = 0;
        public const цел wxSTC_PROPS_COMMENT = 1;
        public const цел wxSTC_PROPS_SECTION = 2;
        public const цел wxSTC_PROPS_ASSIGNMENT = 3;
        public const цел wxSTC_PROPS_DEFVAL = 4;

        // Lexical states for SCLEX_LATEX
        public const цел wxSTC_L_Дефолт = 0;
        public const цел wxSTC_L_COMMAND = 1;
        public const цел wxSTC_L_TAG = 2;
        public const цел wxSTC_L_MATH = 3;
        public const цел wxSTC_L_COMMENT = 4;

        // Lexical states for SCLEX_LUA
        public const цел wxSTC_LUA_Дефолт = 0;
        public const цел wxSTC_LUA_COMMENT = 1;
        public const цел wxSTC_LUA_COMMENTLINE = 2;
        public const цел wxSTC_LUA_COMMENTDOC = 3;
        public const цел wxSTC_LUA_NUMBER = 4;
        public const цел wxSTC_LUA_WORD = 5;
        public const цел wxSTC_LUA_STRING = 6;
        public const цел wxSTC_LUA_CHARACTER = 7;
        public const цел wxSTC_LUA_LITERALSTRING = 8;
        public const цел wxSTC_LUA_PREPROCESSOR = 9;
        public const цел wxSTC_LUA_OPERATOR = 10;
        public const цел wxSTC_LUA_IDENTIFIER = 11;
        public const цел wxSTC_LUA_STRINGEOL = 12;
        public const цел wxSTC_LUA_WORD2 = 13;
        public const цел wxSTC_LUA_WORD3 = 14;
        public const цел wxSTC_LUA_WORD4 = 15;
        public const цел wxSTC_LUA_WORD5 = 16;
        public const цел wxSTC_LUA_WORD6 = 17;

        // Lexical states for SCLEX_ERRORLIST
        public const цел wxSTC_ERR_Дефолт = 0;
        public const цел wxSTC_ERR_PYTHON = 1;
        public const цел wxSTC_ERR_GCC = 2;
        public const цел wxSTC_ERR_MS = 3;
        public const цел wxSTC_ERR_CMD = 4;
        public const цел wxSTC_ERR_BORLAND = 5;
        public const цел wxSTC_ERR_PERL = 6;
        public const цел wxSTC_ERR_NET = 7;
        public const цел wxSTC_ERR_LUA = 8;
        public const цел wxSTC_ERR_CTAG = 9;
        public const цел wxSTC_ERR_DIFF_CHANGED = 10;
        public const цел wxSTC_ERR_DIFF_ADDITION = 11;
        public const цел wxSTC_ERR_DIFF_DELETION = 12;
        public const цел wxSTC_ERR_DIFF_MESSAGE = 13;
        public const цел wxSTC_ERR_PHP = 14;
        public const цел wxSTC_ERR_ELF = 15;
        public const цел wxSTC_ERR_IFC = 16;

        // Lexical states for SCLEX_BATCH
        public const цел wxSTC_BAT_Дефолт = 0;
        public const цел wxSTC_BAT_COMMENT = 1;
        public const цел wxSTC_BAT_WORD = 2;
        public const цел wxSTC_BAT_LABEL = 3;
        public const цел wxSTC_BAT_HIDE = 4;
        public const цел wxSTC_BAT_COMMAND = 5;
        public const цел wxSTC_BAT_IDENTIFIER = 6;
        public const цел wxSTC_BAT_OPERATOR = 7;

        // Lexical states for SCLEX_MAKEFILE
        public const цел wxSTC_MAKE_Дефолт = 0;
        public const цел wxSTC_MAKE_COMMENT = 1;
        public const цел wxSTC_MAKE_PREPROCESSOR = 2;
        public const цел wxSTC_MAKE_IDENTIFIER = 3;
        public const цел wxSTC_MAKE_OPERATOR = 4;
        public const цел wxSTC_MAKE_TARGET = 5;
        public const цел wxSTC_MAKE_IDEOL = 9;

        // Lexical states for SCLEX_DIFF
        public const цел wxSTC_DIFF_Дефолт = 0;
        public const цел wxSTC_DIFF_COMMENT = 1;
        public const цел wxSTC_DIFF_COMMAND = 2;
        public const цел wxSTC_DIFF_HEADER = 3;
        public const цел wxSTC_DIFF_POSITION = 4;
        public const цел wxSTC_DIFF_DELETED = 5;
        public const цел wxSTC_DIFF_ADDED = 6;

        // Lexical states for SCLEX_CONF (Apache Configuration Files Lexer)
        public const цел wxSTC_CONF_Дефолт = 0;
        public const цел wxSTC_CONF_COMMENT = 1;
        public const цел wxSTC_CONF_NUMBER = 2;
        public const цел wxSTC_CONF_IDENTIFIER = 3;
        public const цел wxSTC_CONF_EXTENSION = 4;
        public const цел wxSTC_CONF_PARAMETER = 5;
        public const цел wxSTC_CONF_STRING = 6;
        public const цел wxSTC_CONF_OPERATOR = 7;
        public const цел wxSTC_CONF_IP = 8;
        public const цел wxSTC_CONF_DIRECTIVE = 9;

        // Lexical states for SCLEX_AVE, Avenue
        public const цел wxSTC_AVE_Дефолт = 0;
        public const цел wxSTC_AVE_COMMENT = 1;
        public const цел wxSTC_AVE_NUMBER = 2;
        public const цел wxSTC_AVE_WORD = 3;
        public const цел wxSTC_AVE_STRING = 6;
        public const цел wxSTC_AVE_ENUM = 7;
        public const цел wxSTC_AVE_STRINGEOL = 8;
        public const цел wxSTC_AVE_IDENTIFIER = 9;
        public const цел wxSTC_AVE_OPERATOR = 10;
        public const цел wxSTC_AVE_WORD1 = 11;
        public const цел wxSTC_AVE_WORD2 = 12;
        public const цел wxSTC_AVE_WORD3 = 13;
        public const цел wxSTC_AVE_WORD4 = 14;
        public const цел wxSTC_AVE_WORD5 = 15;
        public const цел wxSTC_AVE_WORD6 = 16;

        // Lexical states for SCLEX_ADA
        public const цел wxSTC_ADA_Дефолт = 0;
        public const цел wxSTC_ADA_WORD = 1;
        public const цел wxSTC_ADA_IDENTIFIER = 2;
        public const цел wxSTC_ADA_NUMBER = 3;
        public const цел wxSTC_ADA_DELIMITER = 4;
        public const цел wxSTC_ADA_CHARACTER = 5;
        public const цел wxSTC_ADA_CHARACTEREOL = 6;
        public const цел wxSTC_ADA_STRING = 7;
        public const цел wxSTC_ADA_STRINGEOL = 8;
        public const цел wxSTC_ADA_LABEL = 9;
        public const цел wxSTC_ADA_COMMENTLINE = 10;
        public const цел wxSTC_ADA_ILLEGAL = 11;

        // Lexical states for SCLEX_BAAN
        public const цел wxSTC_BAAN_Дефолт = 0;
        public const цел wxSTC_BAAN_COMMENT = 1;
        public const цел wxSTC_BAAN_COMMENTDOC = 2;
        public const цел wxSTC_BAAN_NUMBER = 3;
        public const цел wxSTC_BAAN_WORD = 4;
        public const цел wxSTC_BAAN_STRING = 5;
        public const цел wxSTC_BAAN_PREPROCESSOR = 6;
        public const цел wxSTC_BAAN_OPERATOR = 7;
        public const цел wxSTC_BAAN_IDENTIFIER = 8;
        public const цел wxSTC_BAAN_STRINGEOL = 9;
        public const цел wxSTC_BAAN_WORD2 = 10;

        // Lexical states for SCLEX_LISP
        public const цел wxSTC_LISP_Дефолт = 0;
        public const цел wxSTC_LISP_COMMENT = 1;
        public const цел wxSTC_LISP_NUMBER = 2;
        public const цел wxSTC_LISP_KEYWORD = 3;
        public const цел wxSTC_LISP_STRING = 6;
        public const цел wxSTC_LISP_STRINGEOL = 8;
        public const цел wxSTC_LISP_IDENTIFIER = 9;
        public const цел wxSTC_LISP_OPERATOR = 10;

        // Lexical states for SCLEX_EIFFEL and SCLEX_EIFFELKW
        public const цел wxSTC_EIFFEL_Дефолт = 0;
        public const цел wxSTC_EIFFEL_COMMENTLINE = 1;
        public const цел wxSTC_EIFFEL_NUMBER = 2;
        public const цел wxSTC_EIFFEL_WORD = 3;
        public const цел wxSTC_EIFFEL_STRING = 4;
        public const цел wxSTC_EIFFEL_CHARACTER = 5;
        public const цел wxSTC_EIFFEL_OPERATOR = 6;
        public const цел wxSTC_EIFFEL_IDENTIFIER = 7;
        public const цел wxSTC_EIFFEL_STRINGEOL = 8;

        // Lexical states for SCLEX_NNCRONTAB (nnCron crontab Lexer)
        public const цел wxSTC_NNCRONTAB_Дефолт = 0;
        public const цел wxSTC_NNCRONTAB_COMMENT = 1;
        public const цел wxSTC_NNCRONTAB_TASK = 2;
        public const цел wxSTC_NNCRONTAB_SECTION = 3;
        public const цел wxSTC_NNCRONTAB_KEYWORD = 4;
        public const цел wxSTC_NNCRONTAB_MODIFIER = 5;
        public const цел wxSTC_NNCRONTAB_ASTERISK = 6;
        public const цел wxSTC_NNCRONTAB_NUMBER = 7;
        public const цел wxSTC_NNCRONTAB_STRING = 8;
        public const цел wxSTC_NNCRONTAB_ENVIRONMENT = 9;
        public const цел wxSTC_NNCRONTAB_IDENTIFIER = 10;

        // Lexical states for SCLEX_MATLAB
        public const цел wxSTC_MATLAB_Дефолт = 0;
        public const цел wxSTC_MATLAB_COMMENT = 1;
        public const цел wxSTC_MATLAB_COMMAND = 2;
        public const цел wxSTC_MATLAB_NUMBER = 3;
        public const цел wxSTC_MATLAB_KEYWORD = 4;
        public const цел wxSTC_MATLAB_STRING = 5;
        public const цел wxSTC_MATLAB_OPERATOR = 6;
        public const цел wxSTC_MATLAB_IDENTIFIER = 7;

        // Lexical states for SCLEX_SCRIPTOL
        public const цел wxSTC_SCRIPTOL_Дефолт = 0;
        public const цел wxSTC_SCRIPTOL_COMMENT = 1;
        public const цел wxSTC_SCRIPTOL_COMMENTLINE = 2;
        public const цел wxSTC_SCRIPTOL_COMMENTDOC = 3;
        public const цел wxSTC_SCRIPTOL_NUMBER = 4;
        public const цел wxSTC_SCRIPTOL_WORD = 5;
        public const цел wxSTC_SCRIPTOL_STRING = 6;
        public const цел wxSTC_SCRIPTOL_CHARACTER = 7;
        public const цел wxSTC_SCRIPTOL_UUID = 8;
        public const цел wxSTC_SCRIPTOL_PREPROCESSOR = 9;
        public const цел wxSTC_SCRIPTOL_OPERATOR = 10;
        public const цел wxSTC_SCRIPTOL_IDENTIFIER = 11;
        public const цел wxSTC_SCRIPTOL_STRINGEOL = 12;
        public const цел wxSTC_SCRIPTOL_VERBATIM = 13;
        public const цел wxSTC_SCRIPTOL_REGEX = 14;
        public const цел wxSTC_SCRIPTOL_COMMENTLINEDOC = 15;
        public const цел wxSTC_SCRIPTOL_WORD2 = 16;
        public const цел wxSTC_SCRIPTOL_COMMENTDOCKEYWORD = 17;
        public const цел wxSTC_SCRIPTOL_COMMENTDOCKEYWORDERROR = 18;
        public const цел wxSTC_SCRIPTOL_COMMENTBASIC = 19;

        // Lexical states for SCLEX_ASM
        public const цел wxSTC_ASM_Дефолт = 0;
        public const цел wxSTC_ASM_COMMENT = 1;
        public const цел wxSTC_ASM_NUMBER = 2;
        public const цел wxSTC_ASM_STRING = 3;
        public const цел wxSTC_ASM_OPERATOR = 4;
        public const цел wxSTC_ASM_IDENTIFIER = 5;
        public const цел wxSTC_ASM_CPUINSTRUCTION = 6;
        public const цел wxSTC_ASM_MATHINSTRUCTION = 7;
        public const цел wxSTC_ASM_REGISTER = 8;
        public const цел wxSTC_ASM_DIRECTIVE = 9;
        public const цел wxSTC_ASM_DIRECTIVEOPERAND = 10;

        // Lexical states for SCLEX_FORTRAN
        public const цел wxSTC_F_Дефолт = 0;
        public const цел wxSTC_F_COMMENT = 1;
        public const цел wxSTC_F_NUMBER = 2;
        public const цел wxSTC_F_STRING1 = 3;
        public const цел wxSTC_F_STRING2 = 4;
        public const цел wxSTC_F_STRINGEOL = 5;
        public const цел wxSTC_F_OPERATOR = 6;
        public const цел wxSTC_F_IDENTIFIER = 7;
        public const цел wxSTC_F_WORD = 8;
        public const цел wxSTC_F_WORD2 = 9;
        public const цел wxSTC_F_WORD3 = 10;
        public const цел wxSTC_F_PREPROCESSOR = 11;
        public const цел wxSTC_F_OPERATOR2 = 12;
        public const цел wxSTC_F_LABEL = 13;
        public const цел wxSTC_F_CONTINUATION = 14;

        // Lexical states for SCLEX_CSS
        public const цел wxSTC_CSS_Дефолт = 0;
        public const цел wxSTC_CSS_TAG = 1;
        public const цел wxSTC_CSS_CLASS = 2;
        public const цел wxSTC_CSS_PSEUDOCLASS = 3;
        public const цел wxSTC_CSS_UNKNOWN_PSEUDOCLASS = 4;
        public const цел wxSTC_CSS_OPERATOR = 5;
        public const цел wxSTC_CSS_IDENTIFIER = 6;
        public const цел wxSTC_CSS_UNKNOWN_IDENTIFIER = 7;
        public const цел wxSTC_CSS_VALUE = 8;
        public const цел wxSTC_CSS_COMMENT = 9;
        public const цел wxSTC_CSS_ID = 10;
        public const цел wxSTC_CSS_IMPORTANT = 11;
        public const цел wxSTC_CSS_DIRECTIVE = 12;
        public const цел wxSTC_CSS_DOUBLESTRING = 13;
        public const цел wxSTC_CSS_SINGLESTRING = 14;

        // Lexical states for SCLEX_POV
        public const цел wxSTC_POV_Дефолт = 0;
        public const цел wxSTC_POV_COMMENT = 1;
        public const цел wxSTC_POV_COMMENTLINE = 2;
        public const цел wxSTC_POV_COMMENTDOC = 3;
        public const цел wxSTC_POV_NUMBER = 4;
        public const цел wxSTC_POV_WORD = 5;
        public const цел wxSTC_POV_STRING = 6;
        public const цел wxSTC_POV_OPERATOR = 7;
        public const цел wxSTC_POV_IDENTIFIER = 8;
        public const цел wxSTC_POV_BRACE = 9;
        public const цел wxSTC_POV_WORD2 = 10;


        //-----------------------------------------
        // Commands that can be bound до keystrokes

        // Redoes the next action on the undo history.
        public const цел wxSTC_CMD_REDO = 2011;

        // выдели all the текст in the document.
        public const цел wxSTC_CMD_SELECTALL = 2013;

        // отмениСделанное one action in the undo history.
        public const цел wxSTC_CMD_UNDO = 2176;

        // вырежи the selection до the буфОб.
        public const цел wxSTC_CMD_CUT = 2177;

        // копируй the selection до the буфОб.
        public const цел wxSTC_CMD_COPY = 2178;

        // вставь the contents of the буфОб into the document replacing the selection.
        public const цел wxSTC_CMD_PASTE = 2179;

        // очисть the selection.
        public const цел wxSTC_CMD_CLEAR = 2180;

        // сдвинь каретка down one строка.
        public const цел wxSTC_CMD_LINEDOWN = 2300;

        // сдвинь каретка down one строка extending selection до new каретка позиция.
        public const цел wxSTC_CMD_LINEDOWNEXTEND = 2301;

        // сдвинь каретка up one строка.
        public const цел wxSTC_CMD_LINEUP = 2302;

        // сдвинь каретка up one строка extending selection до new каретка позиция.
        public const цел wxSTC_CMD_LINEUPEXTEND = 2303;

        // сдвинь каретка left one character.
        public const цел wxSTC_CMD_CHARLEFT = 2304;

        // сдвинь каретка left one character extending selection до new каретка позиция.
        public const цел wxSTC_CMD_CHARLEFTEXTEND = 2305;

        // сдвинь каретка right one character.
        public const цел wxSTC_CMD_CHARRIGHT = 2306;

        // сдвинь каретка right one character extending selection до new каретка позиция.
        public const цел wxSTC_CMD_CHARRIGHTEXTEND = 2307;

        // сдвинь каретка left one слово.
        public const цел wxSTC_CMD_WORDLEFT = 2308;

        // сдвинь каретка left one слово extending selection до new каретка позиция.
        public const цел wxSTC_CMD_WORDLEFTEXTEND = 2309;

        // сдвинь каретка right one слово.
        public const цел wxSTC_CMD_WORDRIGHT = 2310;

        // сдвинь каретка right one слово extending selection до new каретка позиция.
        public const цел wxSTC_CMD_WORDRIGHTEXTEND = 2311;

        // сдвинь каретка до first позиция on строка.
        public const цел wxSTC_CMD_HOME = 2312;

        // сдвинь каретка до first позиция on строка extending selection до new каретка позиция.
        public const цел wxSTC_CMD_HOMEEXTEND = 2313;

        // сдвинь каретка до last позиция on строка.
        public const цел wxSTC_CMD_LINEEND = 2314;

        // сдвинь каретка до last позиция on строка extending selection до new каретка позиция.
        public const цел wxSTC_CMD_LINEENDEXTEND = 2315;

        // сдвинь каретка до first позиция in document.
        public const цел wxSTC_CMD_DOCUMENTSTART = 2316;

        // сдвинь каретка до first позиция in document extending selection до new каретка позиция.
        public const цел wxSTC_CMD_DOCUMENTSTARTEXTEND = 2317;

        // сдвинь каретка до last позиция in document.
        public const цел wxSTC_CMD_DOCUMENTEND = 2318;

        // сдвинь каретка до last позиция in document extending selection до new каретка позиция.
        public const цел wxSTC_CMD_DOCUMENTENDEXTEND = 2319;

        // сдвинь каретка one страница up.
        public const цел wxSTC_CMD_PAGEUP = 2320;

        // сдвинь каретка one страница up extending selection до new каретка позиция.
        public const цел wxSTC_CMD_PAGEUPEXTEND = 2321;

        // сдвинь каретка one страница down.
        public const цел wxSTC_CMD_PAGEDOWN = 2322;

        // сдвинь каретка one страница down extending selection до new каретка позиция.
        public const цел wxSTC_CMD_PAGEDOWNEXTEND = 2323;

        // Switch от insert до overtype режим or the reverse.
        public const цел wxSTC_CMD_EDITTOGGLEOVERTYPE = 2324;

        // Cancel any режимы such as call подсказка or auto-completion list display.
        public const цел wxSTC_CMD_CANCEL = 2325;

        // удали the selection or if no selection, the character перед the каретка.
        public const цел wxSTC_CMD_DELETEBACK = 2326;

        // If selection is empty or all on one строка replace the selection with a tab character.
        // If more than one строка selected, indent the строки.
        public const цел wxSTC_CMD_TAB = 2327;

        // Dedent the selected строки.
        public const цел wxSTC_CMD_BACKTAB = 2328;

        // вставь a new строка, may use a CRLF, CR or LF depending on EOL режим.
        public const цел wxSTC_CMD_NEWLINE = 2329;

        // вставь a Form Feed character.
        public const цел wxSTC_CMD_FORMFEED = 2330;

        // сдвинь каретка до перед first видим character on строка.
        // If already there move до first character on строка.
        public const цел wxSTC_CMD_VCHOME = 2331;

        // Like VCHome кноп extending selection до new каретка позиция.
        public const цел wxSTC_CMD_VCHOMEEXTEND = 2332;

        // Magnify the displayed текст by increasing the размы by 1 Точка.
        public const цел wxSTC_CMD_ZOOMIN = 2333;

        // Make the displayed текст smaller by decreasing the размы by 1 Точка.
        public const цел wxSTC_CMD_ZOOMOUT = 2334;

        // удали the слово до the left of the каретка.
        public const цел wxSTC_CMD_DELWORDLEFT = 2335;

        // удали the слово до the right of the каретка.
        public const цел wxSTC_CMD_DELWORDRIGHT = 2336;

        // вырежи the строка containing the каретка.
        public const цел wxSTC_CMD_LINECUT = 2337;

        // удали the строка containing the каретка.
        public const цел wxSTC_CMD_LINEDELETE = 2338;

        // Switch the current строка with the предш.
        public const цел wxSTC_CMD_LINETRANSPOSE = 2339;

        // Duplicate the current строка.
        public const цел wxSTC_CMD_LINEDUPLICATE = 2404;

        // Transform the selection до lower case.
        public const цел wxSTC_CMD_LOWERCASE = 2340;

        // Transform the selection до upper case.
        public const цел wxSTC_CMD_UPPERCASE = 2341;

        // Scroll the document down, keeping the каретка видим.
        public const цел wxSTC_CMD_LINESCROLLDOWN = 2342;

        // Scroll the document up, keeping the каретка видим.
        public const цел wxSTC_CMD_LINESCROLLUP = 2343;

        // удали the selection or if no selection, the character перед the каретка.
        // Will not delete the character перед at the старт of a строка.
        public const цел wxSTC_CMD_DELETEBACKNOTLINE = 2344;

        // сдвинь каретка до first позиция on display строка.
        public const цел wxSTC_CMD_HOMEDISPLAY = 2345;

        // сдвинь каретка до first позиция on display строка extending selection до
        // new каретка позиция.
        public const цел wxSTC_CMD_HOMEDISPLAYEXTEND = 2346;

        // сдвинь каретка до last позиция on display строка.
        public const цел wxSTC_CMD_LINEENDDISPLAY = 2347;

        // сдвинь каретка до last позиция on display строка extending selection до new
        // каретка позиция.
        public const цел wxSTC_CMD_LINEENDDISPLAYEXTEND = 2348;

        // These are like their namesakes Home(Extend)?, LineEnd(Extend)?, VCHome(Extend)?
        // except they behave differently when слово-wrap is enabled:
        // They go first до the старт / конец of the display строка, like (Home|LineEnd)дисплей
        // The difference is that, the курсор is already at the Точка, it goes on до the старт
        // or конец of the document строка, as appropriate for (Home|LineEnd|VCHome)Extend.
        public const цел wxSTC_CMD_HOMEWRAP = 2349;
        public const цел wxSTC_CMD_HOMEWRAPEXTEND = 2450;
        public const цел wxSTC_CMD_LINEENDWRAP = 2451;
        public const цел wxSTC_CMD_LINEENDWRAPEXTEND = 2452;
        public const цел wxSTC_CMD_VCHOMEWRAP = 2453;
        public const цел wxSTC_CMD_VCHOMEWRAPEXTEND = 2454;

        // сдвинь до the предш change in capitalisation.
        public const цел wxSTC_CMD_WORDPARTLEFT = 2390;

        // сдвинь до the предш change in capitalisation extending selection
        // до new каретка позиция.
        public const цел wxSTC_CMD_WORDPARTLEFTEXTEND = 2391;

        // сдвинь до the change next in capitalisation.
        public const цел wxSTC_CMD_WORDPARTRIGHT = 2392;

        // сдвинь до the next change in capitalisation extending selection
        // до new каретка позиция.
        public const цел wxSTC_CMD_WORDPARTRIGHTEXTEND = 2393;

        // удали зад от the current позиция до the старт of the строка.
        public const цел wxSTC_CMD_DELLINELEFT = 2395;

        // удали forwards от the current позиция до the конец of the строка.
        public const цел wxSTC_CMD_DELLINERIGHT = 2396;

        // сдвинь каретка between paragraphs (delimited by empty строки)
        public const цел wxSTC_CMD_PARADOWN = 2413;
        public const цел wxSTC_CMD_PARADOWNEXTEND = 2414;
        public const цел wxSTC_CMD_PARAUP = 2415;
        public const цел wxSTC_CMD_PARAUPEXTEND = 2416;

        //-----------------------------------------------------------------------------

        static this()
        {
            СОБ_СТК_ИЗМЕНЕНИЕ = wxStyledTextCtrl_собСТКИзменение();
            СОБ_СТК_НУЖНЫЙСТИЛЬ = wxStyledTextCtrl_собСТКНуженСтиль();
            СОБ_СТК_ДОБАВЛЕНСИМ = wxStyledTextCtrl_собСТКДобавленСим();
            СОБ_СТК_ДОСТИГНУТАТОЧКАСОХРАНЕНИЯ = wxStyledTextCtrl_собСТКДостигнутаТочкаСохранения();
            СОБ_СТК_ПОКИНУТАТОЧКАСОХРАНЕНИЯ = wxStyledTextCtrl_собСТКПокинутаТочкаСохранения();
            wxEVT_STC_ROMODIFYATTEMPT = wxStyledTextCtrl_EVT_STC_ROMODIFYATTEMPT();
            СОБ_СТК_КЛАВИША = wxStyledTextCtrl_собСТККлавиша();
            СОБ_СТК_ДНАЖАТИЕ = wxStyledTextCtrl_собСТКДНажатие();
            СОБ_СТК_ОБНОВИТЬИП = wxStyledTextCtrl_собСТКОбновитьИП();
            СОБ_СТК_МОДИФИЦИРОВАН = wxStyledTextCtrl_собСТКМодифицирован();
            СОБ_СТК_ЗАПИСЬМАКРОСА = wxStyledTextCtrl_собСТКЗаписьМакроса();
            СОБ_СТК_НАЖАТМАРЖИН = wxStyledTextCtrl_собСТКНажатМаржин();
            СОБ_СТК_НУЖЕНПОКАЗ = wxStyledTextCtrl_собСТКНуженПоказ();
            //	 wxEVT_STC_POSCHANGED = wxStyledTextCtrl_EVT_STC_POSCHANGED();
            СОБ_СТК_ОТРИСОВАН = wxStyledTextCtrl_собСТКОтрисован();
            СОБ_СТК_ВЫДЕЛЕНИЕПОЛЬЗОВАТЕЛЕМСПИСКА = wxStyledTextCtrl_собСТКВыделениеПользователемСписка();
            СОБ_СТК_БРОШЕНУИР = wxStyledTextCtrl_собСТКБрошенУИР();
            wxEVT_STC_DWELLSTART = wxStyledTextCtrl_EVT_STC_DWELLSTART();
            wxEVT_STC_DWELLEND = wxStyledTextCtrl_EVT_STC_DWELLEND();
            СОБ_СТК_НАЧАЛО_ТЯГА = wxStyledTextCtrl_собСТКНачалоТяга();
            СОБ_СТК_КОНЕЦ_ТЯГА = wxStyledTextCtrl_собСТККонецТяга();
            СОБ_СТК_БРОСЬ_ДРОП = wxStyledTextCtrl_собСТКДелайБрос();
            СОБ_СТК_ЗУМ = wxStyledTextCtrl_собСТКЗум();
            wxEVT_STC_HOTSPOT_CLICK = wxStyledTextCtrl_EVT_STC_HOTSPOT_CLICK();
            wxEVT_STC_HOTSPOT_DCLICK = wxStyledTextCtrl_EVT_STC_HOTSPOT_DCLICK();
            wxEVT_STC_CALLTIP_CLICK = wxStyledTextCtrl_EVT_STC_CALLTIP_CLICK();

            Событие.Тип.добавьТипСоб(СОБ_СТК_ИЗМЕНЕНИЕ,               &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(СОБ_СТК_НУЖНЫЙСТИЛЬ,          &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(СОБ_СТК_ДОБАВЛЕНСИМ,            &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(СОБ_СТК_ДОСТИГНУТАТОЧКАСОХРАНЕНИЯ,     &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(СОБ_СТК_ПОКИНУТАТОЧКАСОХРАНЕНИЯ,        &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(wxEVT_STC_ROMODIFYATTEMPT,      &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(СОБ_СТК_КЛАВИША,                  &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(СОБ_СТК_ДНАЖАТИЕ,          &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(СОБ_СТК_ОБНОВИТЬИП,             &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(СОБ_СТК_МОДИФИЦИРОВАН,             &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(СОБ_СТК_ЗАПИСЬМАКРОСА,          &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(СОБ_СТК_НАЖАТМАРЖИН,          &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(СОБ_СТК_НУЖЕНПОКАЗ,            &СобытиеСтильногоТекста.Нов);
            //Событие.Тип.добавьТипСоб(wxEVT_STC_POSCHANGED,           &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(СОБ_СТК_ОТРИСОВАН,              &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(СОБ_СТК_ВЫДЕЛЕНИЕПОЛЬЗОВАТЕЛЕМСПИСКА,    &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(СОБ_СТК_БРОШЕНУИР,           &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(wxEVT_STC_DWELLSTART,           &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(wxEVT_STC_DWELLEND,             &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(СОБ_СТК_НАЧАЛО_ТЯГА,           &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(СОБ_СТК_КОНЕЦ_ТЯГА,            &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(СОБ_СТК_БРОСЬ_ДРОП,              &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(СОБ_СТК_ЗУМ,                 &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(wxEVT_STC_HOTSPOT_CLICK,        &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(wxEVT_STC_HOTSPOT_DCLICK,       &СобытиеСтильногоТекста.Нов);
            Событие.Тип.добавьТипСоб(wxEVT_STC_CALLTIP_CLICK,        &СобытиеСтильногоТекста.Нов);
        }

        //-----------------------------------------------------------------------------
        public const ткст стрИмениСТК = "stcwindow";

        export this(ЦелУкз вхобъ)
        {
            super (вхобъ);
        }

        export  this(Окно родитель, цел ид /*= ЛЮБОЙ*/, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль =0, ткст имя = стрИмениСТК)
        {
            this(wxStyledTextCtrl_ctor(ВизОбъект.безопУк(родитель), ид, поз, размер, cast(бцел)стиль, имя));
        }

        export static ВизОбъект Нов(ЦелУкз вхобъ)
        {
            return new СтильныйТекстКтрл(вхобъ);
        }

        //---------------------------------------------------------------------
        // ctors with сам created ид

        export  this(Окно родитель, Точка поз = ДЕФПОЗ, Размер размер = ДЕФРАЗМ, цел стиль =0, ткст имя = стрИмениСТК)
        {
            this(родитель, Окно.уникИд, поз, размер, стиль, имя);
        }

        //-----------------------------------------------------------------------------

        export проц добавьТекст(ткст текст)
        {
            wxStyledTextCtrl_AddText(вхобъ, текст);
        }

        /*export проц AddStyledText(MemoryBuffer данные)
        {
            wxStyledTextCtrl_AddStyledText(вхобъ, ВизОбъект.безопУк(данные));
        }*/

        export проц вставьТекст(цел поз, ткст текст)
        {
            wxStyledTextCtrl_InsertText(вхобъ, поз, текст);
        }

        //-----------------------------------------------------------------------------

        export проц очистьВсё()
        {
            wxStyledTextCtrl_ClearAll(вхобъ);
        }

        export проц очистьСтильДокумента()
        {
            wxStyledTextCtrl_ClearDocumentStyle(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export цел длина()
        {
            return wxStyledTextCtrl_GetLength(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export цел дайСимВПоз(цел поз)
        {
            return wxStyledTextCtrl_GetCharAt(вхобъ, поз);
        }

        //-----------------------------------------------------------------------------

        export цел текущПоз()
        {
            return wxStyledTextCtrl_GetCurrentPos(вхобъ);
        }
        export проц текущПоз(цел значение)
        {
            wxStyledTextCtrl_SetCurrentPos(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export цел якорь()
        {
            return wxStyledTextCtrl_GetAnchor(вхобъ);
        }
        export проц якорь(цел значение)
        {
            wxStyledTextCtrl_SetAnchor(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export цел дайСтильВПоз(цел поз)
        {
            return wxStyledTextCtrl_GetStyleAt(вхобъ, поз);
        }

        //-----------------------------------------------------------------------------

        export проц верниСделанное()
        {
            wxStyledTextCtrl_Redo(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export бул UndoCollection()
        {
            return wxStyledTextCtrl_GetUndoCollection(вхобъ);
        }
        export проц UndoCollection(бул значение)
        {
            wxStyledTextCtrl_SetUndoCollection(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export проц выделиВсе()
        {
            wxStyledTextCtrl_SelectAll(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц устТочкуСохр()
        {
            wxStyledTextCtrl_SetSavePoint(вхобъ);
        }

        //-----------------------------------------------------------------------------

        /*export MemoryBuffer GetStyledText(цел стартПоз, цел конПоз)
        {
            return wxStyledTextCtrl_GetStyledText(вхобъ, стартПоз, конПоз);
        }*/

        //-----------------------------------------------------------------------------

        export бул можноВернутьСделанное()
        {
            return wxStyledTextCtrl_CanRedo(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export цел MarkerLineFromHandle(цел handle)
        {
            return wxStyledTextCtrl_MarkerLineFromHandle(вхобъ, handle);
        }

        export проц MarkerDeleteHandle(цел handle)
        {
            wxStyledTextCtrl_MarkerDeleteHandle(вхобъ, handle);
        }

        //-----------------------------------------------------------------------------

        export цел ViewWhiteSpace()
        {
            return wxStyledTextCtrl_GetViewWhiteSpace(вхобъ);
        }
        export проц ViewWhiteSpace(цел значение)
        {
            wxStyledTextCtrl_SetViewWhiteSpace(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export цел позИзТочки(Точка тчк)
        {
            return wxStyledTextCtrl_PositionFromPoint(вхобъ, тчк);
        }

        export цел PositionFromPointClose(цел x, цел y)
        {
            return wxStyledTextCtrl_PositionFromPointClose(вхобъ, x, y);
        }

        //-----------------------------------------------------------------------------

        export проц идиКСтроке(цел строка)
        {
            wxStyledTextCtrl_GotoLine(вхобъ, строка);
        }

        //-----------------------------------------------------------------------------

        export проц идиВПоз(цел поз)
        {
            wxStyledTextCtrl_GotoPos(вхобъ, поз);
        }

        //-----------------------------------------------------------------------------

        export ткст текущСтрока()
        {
            цел i;
            return дайТекущСтроку(i);
        }

        export ткст дайТекущСтроку(out цел позВСтроке)
        {
            return cast(ткст) new ВизТкст(wxStyledTextCtrl_GetCurLine(вхобъ, позВСтроке), да);
        }

        //-----------------------------------------------------------------------------

        export цел EndStyled()
        {
            return wxStyledTextCtrl_GetEndStyled(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц ConvertEOLs(цел eolMode)
        {
            wxStyledTextCtrl_ConvertEOLs(вхобъ, eolMode);
        }

        //-----------------------------------------------------------------------------

        export цел EOLMode()
        {
            return wxStyledTextCtrl_GetEOLMode(вхобъ);
        }
        export проц EOLMode(цел значение)
        {
            wxStyledTextCtrl_SetEOLMode(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export проц начниСтилизацию(цел поз, цел маска)
        {
            wxStyledTextCtrl_StartStyling(вхобъ, поз, маска);
        }

        //-----------------------------------------------------------------------------

        export проц устСтилизацию(цел length, цел стиль)
        {
            wxStyledTextCtrl_SetStyling(вхобъ, length, стиль);
        }

        //-----------------------------------------------------------------------------

        export бул буфРис()
        {
            return wxStyledTextCtrl_GetBufferedDraw(вхобъ);
        }
        export проц буфРис(бул значение)
        {
            wxStyledTextCtrl_SetBufferedDraw(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export цел ширинаТаб()
        {
            return wxStyledTextCtrl_GetTabWidth(вхобъ);
        }
        export проц ширинаТаб(цел значение)
        {
            wxStyledTextCtrl_SetTabWidth(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export цел кодПейдж()
        {
            return wxStyledTextCtrl_GetCodePage(вхобъ);
        }
        export проц кодПейдж(цел значение)
        {
            wxStyledTextCtrl_SetCodePage(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export проц определиМаркер(цел номерМаркера, цел символМаркера, Цвет переднийПлан, Цвет заднийПлан)
        {
            wxStyledTextCtrl_MarkerDefine(вхобъ, номерМаркера, символМаркера, ВизОбъект.безопУк(переднийПлан), ВизОбъект.безопУк(заднийПлан));
        }

        export проц устППМаркера(цел номерМаркера, Цвет перед)
        {
            wxStyledTextCtrl_MarkerSetForeground(вхобъ, номерМаркера, ВизОбъект.безопУк(перед));
        }

        export проц устЗПМаркера(цел номерМаркера, Цвет зад)
        {
            wxStyledTextCtrl_MarkerSetBackground(вхобъ, номерМаркера, ВизОбъект.безопУк(зад));
        }

        export цел добавьМаркер(цел строка, цел номерМаркера)
        {
            return wxStyledTextCtrl_MarkerAdd(вхобъ, строка, номерМаркера);
        }

        export проц удалиМаркер(цел строка, цел номерМаркера)
        {
            wxStyledTextCtrl_MarkerDelete(вхобъ, строка, номерМаркера);
        }

        export проц удалиВсеМаркеры(цел номерМаркера)
        {
            wxStyledTextCtrl_MarkerDeleteAll(вхобъ, номерМаркера);
        }

        export цел дайМаркер(цел строка)
        {
            return wxStyledTextCtrl_MarkerGet(вхобъ, строка);
        }

        export цел следщМаркер(цел началоСтроки, цел маскаМаркера)
        {
            return wxStyledTextCtrl_MarkerNext(вхобъ, началоСтроки, маскаМаркера);
        }

        export цел предшМаркер(цел началоСтроки, цел маскаМаркера)
        {
            return wxStyledTextCtrl_MarkerPrevious(вхобъ, началоСтроки, маскаМаркера);
        }

        export проц MarkerDefineBitmap(цел номерМаркера, Битмап бмп)
        {
            wxStyledTextCtrl_MarkerDefineBitmap(вхобъ, номерМаркера, ВизОбъект.безопУк(бмп));
        }

        //-----------------------------------------------------------------------------

        export проц SetMarginType(цел маржин, цел marginType)
        {
            wxStyledTextCtrl_SetMarginType(вхобъ, маржин, marginType);
        }

        export цел GetMarginType(цел маржин)
        {
            return wxStyledTextCtrl_GetMarginType(вхобъ, маржин);
        }

        //-----------------------------------------------------------------------------

        export проц SetMarginWidth(цел маржин, цел pixelWidth)
        {
            wxStyledTextCtrl_SetMarginWidth(вхобъ, маржин, pixelWidth);
        }

        export цел GetMarginWidth(цел маржин)
        {
            return wxStyledTextCtrl_GetMarginWidth(вхобъ, маржин);
        }

        //-----------------------------------------------------------------------------

        export проц SetMarginMask(цел маржин, цел маска)
        {
            wxStyledTextCtrl_SetMarginMask(вхобъ, маржин, маска);
        }

        export цел GetMarginMask(цел маржин)
        {
            return wxStyledTextCtrl_GetMarginMask(вхобъ, маржин);
        }

        //-----------------------------------------------------------------------------

        export проц SetMarginSensitive(цел маржин, бул sensitive)
        {
            wxStyledTextCtrl_SetMarginSensitive(вхобъ, маржин, sensitive);
        }

        export бул GetMarginSensitive(цел маржин)
        {
            return wxStyledTextCtrl_GetMarginSensitive(вхобъ, маржин);
        }

        //-----------------------------------------------------------------------------

        export проц StyleClearAll()
        {
            wxStyledTextCtrl_StyleClearAll(вхобъ);
        }

        export проц StyleSetForeground(цел стиль, Цвет перед)
        {
            wxStyledTextCtrl_StyleSetForeground(вхобъ, стиль, ВизОбъект.безопУк(перед));
        }

        export проц StyleSetBackground(цел стиль, Цвет зад)
        {
            wxStyledTextCtrl_StyleSetBackground(вхобъ, стиль, ВизОбъект.безопУк(зад));
        }

        export проц StyleSetBold(цел стиль, бул полужирный)
        {
            wxStyledTextCtrl_StyleSetBold(вхобъ, стиль, полужирный);
        }

        export проц StyleSetItalic(цел стиль, бул italic)
        {
            wxStyledTextCtrl_StyleSetItalic(вхобъ, стиль, italic);
        }

        export проц StyleSetSize(цел стиль, цел sizePoints)
        {
            wxStyledTextCtrl_StyleSetSize(вхобъ, стиль, sizePoints);
        }

        export проц StyleSetFaceName(цел стиль, ткст fontName)
        {
            wxStyledTextCtrl_StyleSetFaceName(вхобъ, стиль, fontName);
        }

        export проц StyleSetEOLFilled(цел стиль, бул filled)
        {
            wxStyledTextCtrl_StyleSetEOLFilled(вхобъ, стиль, filled);
        }

        export проц StyleResetDefault()
        {
            wxStyledTextCtrl_StyleResetDefault(вхобъ);
        }

        export проц StyleSetUnderline(цел стиль, бул подчеркни)
        {
            wxStyledTextCtrl_StyleSetUnderline(вхобъ, стиль, подчеркни);
        }

        export проц StyleSetCase(цел стиль, цел caseForce)
        {
            wxStyledTextCtrl_StyleSetCase(вхобъ, стиль, caseForce);
        }

        export проц StyleSetCharacterSet(цел стиль, цел characterSet)
        {
            wxStyledTextCtrl_StyleSetCharacterSet(вхобъ, стиль, characterSet);
        }

        export проц StyleSetHotSpot(цел стиль, бул hotspot)
        {
            wxStyledTextCtrl_StyleSetHotSpot(вхобъ, стиль, hotspot);
        }

        export проц StyleSetVisible(цел стиль, бул видим)
        {
            wxStyledTextCtrl_StyleSetVisible(вхобъ, стиль, видим);
        }

        export проц StyleSetChangeable(цел стиль, бул changeable)
        {
            wxStyledTextCtrl_StyleSetChangeable(вхобъ, стиль, changeable);
        }

        //-----------------------------------------------------------------------------

        export проц SetSelForeground(бул useSetting, Цвет перед)
        {
            wxStyledTextCtrl_SetSelForeground(вхобъ, useSetting, ВизОбъект.безопУк(перед));
        }

        export проц SetSelBackground(бул useSetting, Цвет зад)
        {
            wxStyledTextCtrl_SetSelBackground(вхобъ, useSetting, ВизОбъект.безопУк(зад));
        }

        //-----------------------------------------------------------------------------

        export Цвет CaretForeground()
        {
            return new Цвет(wxStyledTextCtrl_GetCaretForeground(вхобъ), да);
        }
        export проц CaretForeground(Цвет значение)
        {
            wxStyledTextCtrl_SetCaretForeground(вхобъ, ВизОбъект.безопУк(значение));
        }

        //-----------------------------------------------------------------------------

        export проц CmdKeyAssign(цел ключ, цел modifiers, цел кмд)
        {
            wxStyledTextCtrl_CmdKeyAssign(вхобъ, ключ, modifiers, кмд);
        }

        export проц CmdKeyClear(цел ключ, цел modifiers)
        {
            wxStyledTextCtrl_CmdKeyClear(вхобъ, ключ, modifiers);
        }

        export проц CmdKeyClearAll()
        {
            wxStyledTextCtrl_CmdKeyClearAll(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц SetStyleBytes(ббайт[] styleBytes)
        {
            wxStyledTextCtrl_SetStyleBytes(вхобъ, styleBytes.length, styleBytes.ptr);
        }

        //-----------------------------------------------------------------------------

        export цел периодКаретки()
        {
            return wxStyledTextCtrl_GetCaretPeriod(вхобъ);
        }
        export проц периодКаретки(цел значение)
        {
            wxStyledTextCtrl_SetCaretPeriod(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export проц SetWordChars(ткст characters)
        {
            wxStyledTextCtrl_SetWordChars(вхобъ, characters);
        }

        //-----------------------------------------------------------------------------

        export проц BeginUndoAction()
        {
            wxStyledTextCtrl_BeginUndoAction(вхобъ);
        }

        export проц EndUndoAction()
        {
            wxStyledTextCtrl_EndUndoAction(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц IndicatorSetStyle(цел indic, цел стиль)
        {
            wxStyledTextCtrl_IndicatorSetStyle(вхобъ, indic, стиль);
        }

        export цел IndicatorGetStyle(цел indic)
        {
            return wxStyledTextCtrl_IndicatorGetStyle(вхобъ, indic);
        }

        export проц IndicatorSetForeground(цел indic, Цвет перед)
        {
            wxStyledTextCtrl_IndicatorSetForeground(вхобъ, indic, ВизОбъект.безопУк(перед));
        }

        export Цвет IndicatorGetForeground(цел indic)
        {
            return new Цвет(wxStyledTextCtrl_IndicatorGetForeground(вхобъ, indic), да);
        }

        //-----------------------------------------------------------------------------

        export проц SetWhitespaceForeground(бул useSetting, Цвет перед)
        {
            wxStyledTextCtrl_SetWhitespaceForeground(вхобъ, useSetting, ВизОбъект.безопУк(перед));
        }

        export проц SetWhitespaceBackground(бул useSetting, Цвет зад)
        {
            wxStyledTextCtrl_SetWhitespaceBackground(вхобъ, useSetting, ВизОбъект.безопУк(зад));
        }

        //-----------------------------------------------------------------------------

        export цел битыСтиля()
        {
            return wxStyledTextCtrl_GetStyleBits(вхобъ);
        }
        export проц битыСтиля(цел значение)
        {
            wxStyledTextCtrl_SetStyleBits(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export проц SetLineState(цел строка, цел состояние)
        {
            wxStyledTextCtrl_SetLineState(вхобъ, строка, состояние);
        }

        export цел GetLineState(цел строка)
        {
            return wxStyledTextCtrl_GetLineState(вхобъ, строка);
        }

        //-----------------------------------------------------------------------------

        export цел MaxLineState()
        {
            return wxStyledTextCtrl_GetMaxLineState(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export бул CaretLineVisible()
        {
            return wxStyledTextCtrl_GetCaretLineVisible(вхобъ);
        }
        export проц CaretLineVisible(бул значение)
        {
            wxStyledTextCtrl_SetCaretLineVisible(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export Цвет CaretLineBack()
        {
            return new Цвет(wxStyledTextCtrl_GetCaretLineBack(вхобъ), да);
        }
        export проц CaretLineBack(Цвет значение)
        {
            wxStyledTextCtrl_SetCaretLineBack(вхобъ, ВизОбъект.безопУк(значение));
        }

        //-----------------------------------------------------------------------------

        export проц AutoCompShow(цел lenEntered, ткст списЭлтов)
        {
            wxStyledTextCtrl_AutoCompShow(вхобъ, lenEntered, списЭлтов);
        }

        export проц AutoCompCancel()
        {
            wxStyledTextCtrl_AutoCompCancel(вхобъ);
        }

        export бул AutoCompActive()
        {
            return wxStyledTextCtrl_AutoCompActive(вхобъ);
        }

        export цел AutoCompPosStart()
        {
            return wxStyledTextCtrl_AutoCompPosStart(вхобъ);
        }

        export проц AutoCompComplete()
        {
            wxStyledTextCtrl_AutoCompComplete(вхобъ);
        }

        export проц AutoCompStops(ткст значение)
        {
            wxStyledTextCtrl_AutoCompStops(вхобъ, значение);
        }

        export char AutoCompSeparator()
        {
            return cast(char)wxStyledTextCtrl_AutoCompGetSeparator(вхобъ);
        }
        export проц AutoCompSeparator(char значение)
        {
            wxStyledTextCtrl_AutoCompSetSeparator(вхобъ, cast(цел)значение);
        }

        export проц AutoCompSelect(ткст текст)
        {
            wxStyledTextCtrl_AutoCompSelect(вхобъ, текст);
        }

        export бул AutoCompCancelAtStart()
        {
            return wxStyledTextCtrl_AutoCompGetCancelAtStart(вхобъ);
        }
        export проц AutoCompCancelAtStart(бул значение)
        {
            wxStyledTextCtrl_AutoCompSetCancelAtStart(вхобъ, значение);
        }

        export проц AutoCompFillUps(ткст значение)
        {
            wxStyledTextCtrl_AutoCompSetFillUps(вхобъ, значение);
        }

        export бул AutoCompChooseSingle()
        {
            return wxStyledTextCtrl_AutoCompGetChooseSingle(вхобъ);
        }
        export проц AutoCompChooseSingle(бул значение)
        {
            wxStyledTextCtrl_AutoCompSetChooseSingle(вхобъ, значение);
        }

        export бул AutoCompIgnoreCase()
        {
            return wxStyledTextCtrl_AutoCompGetIgnoreCase(вхобъ);
        }
        export проц AutoCompIgnoreCase(бул значение)
        {
            wxStyledTextCtrl_AutoCompSetIgnoreCase(вхобъ, значение);
        }

        export проц AutoCompAutoHide(бул значение)
        {
            wxStyledTextCtrl_AutoCompSetAutoHide(вхобъ, значение);
        }
        export бул AutoCompAutoHide()
        {
            return wxStyledTextCtrl_AutoCompGetAutoHide(вхобъ);
        }

        export проц AutoCompDropRestOfWord(бул значение)
        {
            wxStyledTextCtrl_AutoCompSetDropRestOfWord(вхобъ, значение);
        }
        export бул AutoCompDropRestOfWord()
        {
            return wxStyledTextCtrl_AutoCompGetDropRestOfWord(вхобъ);
        }

        export цел AutoCompTypeSeparator()
        {
            return wxStyledTextCtrl_AutoCompGetTypeSeparator(вхобъ);
        }
        export проц AutoCompTypeSeparator(цел значение)
        {
            wxStyledTextCtrl_AutoCompSetTypeSeparator(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export проц UserListShow(цел типСписка, ткст списЭлтов)
        {
            wxStyledTextCtrl_UserListShow(вхобъ, типСписка, списЭлтов);
        }

        //-----------------------------------------------------------------------------

        export проц регистрируйРисунок(цел тип, Битмап бмп)
        {
            wxStyledTextCtrl_RegisterImage(вхобъ, тип, ВизОбъект.безопУк(бмп));
        }

        export проц удалиЗарегРисунки()
        {
            wxStyledTextCtrl_ClearRegisteredImages(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export цел отступ()
        {
            return wxStyledTextCtrl_GetIndent(вхобъ);
        }
        export проц отступ(цел значение)
        {
            wxStyledTextCtrl_SetIndent(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export бул использоватьТабы()
        {
            return wxStyledTextCtrl_GetUseTabs(вхобъ);
        }
        export проц использоватьТабы(бул значение)
        {
            wxStyledTextCtrl_SetUseTabs(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export проц устОтступСтроки(цел строка, цел размОтступа)
        {
            wxStyledTextCtrl_SetLineIndentation(вхобъ, строка, размОтступа);
        }

        export цел дайОтступСтроки(цел строка)
        {
            return wxStyledTextCtrl_GetLineIndentation(вхобъ, строка);
        }

        //-----------------------------------------------------------------------------

        export цел дайПозОтступаСтр(цел строка)
        {
            return wxStyledTextCtrl_GetLineIndentPosition(вхобъ, строка);
        }

        //-----------------------------------------------------------------------------

        export цел дайКолонку(цел поз)
        {
            return wxStyledTextCtrl_GetColumn(вхобъ, поз);
        }

        //-----------------------------------------------------------------------------

        export проц использоватьГоризПолосуПрокрутки(бул значение)
        {
            wxStyledTextCtrl_SetUseHorizontalScrollBar(вхобъ, значение);
        }
        export бул использоватьГоризПолосуПрокрутки()
        {
            return wxStyledTextCtrl_GetUseHorizontalScrollBar(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц IndentationGuides(бул значение)
        {
            wxStyledTextCtrl_SetIndentationGuides(вхобъ, значение);
        }
        export бул IndentationGuides()
        {
            return wxStyledTextCtrl_GetIndentationGuides(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export цел HighlightGuide()
        {
            return wxStyledTextCtrl_GetHighlightGuide(вхобъ);
        }
        export проц HighlightGuide(цел значение)
        {
            wxStyledTextCtrl_SetHighlightGuide(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export цел дайПозКонцаСтр(цел строка)
        {
            return wxStyledTextCtrl_GetLineEndPosition(вхобъ, строка);
        }

        //-----------------------------------------------------------------------------

        export бул толькоЧтение()
        {
            return wxStyledTextCtrl_GetReadOnly(вхобъ);
        }
        export проц толькоЧтение(бул значение)
        {
            wxStyledTextCtrl_SetReadOnly(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export цел начниВыделение()
        {
            return wxStyledTextCtrl_GetSelectionStart(вхобъ);
        }
        export проц начниВыделение(цел значение)
        {
            wxStyledTextCtrl_SetSelectionStart(вхобъ, значение);
        }

        export цел завершиВыделение()
        {
            return wxStyledTextCtrl_GetSelectionEnd(вхобъ);
        }
        export проц завершиВыделение(цел значение)
        {
            wxStyledTextCtrl_SetSelectionEnd(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export цел увеличьПечать()
        {
            return wxStyledTextCtrl_GetPrintMagnification(вхобъ);
        }
        export проц увеличьПечать(цел значение)
        {
            wxStyledTextCtrl_SetPrintMagnification(вхобъ, значение);
        }

        export цел режимЦветнойПечати()
        {
            return wxStyledTextCtrl_GetPrintColourMode(вхобъ);
        }
        export проц режимЦветнойПечати(цел значение)
        {
            wxStyledTextCtrl_SetPrintColourMode(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export цел найдиТекст(цел минПоз, цел максПоз, ткст текст, цел флаги)
        {
            return wxStyledTextCtrl_FindText(вхобъ, минПоз, максПоз, текст, флаги);
        }

        //-----------------------------------------------------------------------------

        export цел форматируйДиапазон(бул doDraw, цел стартПоз, цел конПоз, КонтекстSetройства draw, КонтекстSetройства цель, Прямоугольник renderRect, Прямоугольник pageRect)
        {
            return wxStyledTextCtrl_FormatRange(вхобъ, doDraw, стартПоз, конПоз, ВизОбъект.безопУк(draw), ВизОбъект.безопУк(цель), renderRect, pageRect);
        }

        //-----------------------------------------------------------------------------

        export цел первВидимаяСтрока()
        {
            return wxStyledTextCtrl_GetFirstVisibleLine(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export ткст дайСтроку(цел строка)
        {
            return cast(ткст) new ВизТкст(wxStyledTextCtrl_GetLine(вхобъ, строка), да);
        }

        //-----------------------------------------------------------------------------

        export цел члоСтрок()
        {
            return wxStyledTextCtrl_GetLineCount(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export цел левоМаржина()
        {
            return wxStyledTextCtrl_GetMarginLeft(вхобъ);
        }
        export проц левоМаржина(цел значение)
        {
            wxStyledTextCtrl_SetMarginLeft(вхобъ, значение);
        }

        export цел правоМаржина()
        {
            return wxStyledTextCtrl_GetMarginRight(вхобъ);
        }
        export проц правоМаржина(цел значение)
        {
            wxStyledTextCtrl_SetMarginRight(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export бул модифицируй()
        {
            return wxStyledTextCtrl_GetModify(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц устВыделение(цел старт, цел конец)
        {
            wxStyledTextCtrl_SetSelection(вхобъ, старт, конец);
        }

        export ткст выделенныйТекст()
        {
            return cast(ткст) new ВизТкст(wxStyledTextCtrl_GetSelectedText(вхобъ), да);
        }

        //-----------------------------------------------------------------------------

        export ткст дайДиапазонТекста(цел стартПоз, цел конПоз)
        {
            return cast(ткст) new ВизТкст(wxStyledTextCtrl_GetTextRange(вхобъ, стартПоз, конПоз), да);
        }

        //-----------------------------------------------------------------------------

        export проц спрячьВыделение(бул значение)
        {
            wxStyledTextCtrl_HideSelection(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export цел строкаИзПозиции(цел поз)
        {
            return wxStyledTextCtrl_LineFromPosition(вхобъ, поз);
        }

        export цел позицияИзСтроки(цел строка)
        {
            return wxStyledTextCtrl_PositionFromLine(вхобъ, строка);
        }

        //-----------------------------------------------------------------------------

        export проц прокруткаСтроки(цел колонки, цел строки)
        {
            wxStyledTextCtrl_LineScroll(вхобъ, колонки, строки);
        }

        //-----------------------------------------------------------------------------

        export проц кареткаВиднаОбязательно()
        {
            wxStyledTextCtrl_EnsureCaretVisible(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц замениВыделение(ткст текст)
        {
            wxStyledTextCtrl_ReplaceSelection(вхобъ, текст);
        }

        //-----------------------------------------------------------------------------

        export бул можноВставлять()
        {
            return wxStyledTextCtrl_CanPaste(вхобъ);
        }

        export бул можноОтменитьСделанное()
        {
            return wxStyledTextCtrl_CanUndo(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц опорожниБуферАнду()
        {
            wxStyledTextCtrl_EmptyUndoBuffer(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц отмениСделанное()
        {
            wxStyledTextCtrl_Undo(вхобъ);
        }

        export проц вырежи()
        {
            wxStyledTextCtrl_Cut(вхобъ);
        }

        export проц копируй()
        {
            wxStyledTextCtrl_Copy(вхобъ);
        }

        export проц вставь()
        {
            wxStyledTextCtrl_Paste(вхобъ);
        }

        export проц очисть()
        {
            wxStyledTextCtrl_Clear(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц текст(ткст значение)
        {
            wxStyledTextCtrl_SetText(вхобъ, значение);
        }
        export ткст текст()
        {
            return cast(ткст) new ВизТкст(wxStyledTextCtrl_GetText(вхобъ), да);
        }

        //-----------------------------------------------------------------------------

        export цел длинаТекста()
        {
            return wxStyledTextCtrl_GetTextLength(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export бул Overtype()
        {
            return wxStyledTextCtrl_GetOvertype(вхобъ);
        }
        export проц Overtype(бул значение)
        {
            wxStyledTextCtrl_SetOvertype(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export цел ширинаКаретки()
        {
            return wxStyledTextCtrl_GetCaretWidth(вхобъ);
        }
        export проц ширинаКаретки(цел значение)
        {
            wxStyledTextCtrl_SetCaretWidth(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export цел стартЦели()
        {
            return wxStyledTextCtrl_GetTargetStart(вхобъ);
        }
        export проц стартЦели(цел значение)
        {
            wxStyledTextCtrl_SetTargetStart(вхобъ, значение);
        }

        export цел конецЦели()
        {
            return wxStyledTextCtrl_GetTargetEnd(вхобъ);
        }
        export проц конецЦели(цел значение)
        {
            wxStyledTextCtrl_SetTargetEnd(вхобъ, значение);
        }

        export цел замениЦель(ткст текст)
        {
            return wxStyledTextCtrl_ReplaceTarget(вхобъ, текст);
        }

        export цел замениРВЦели(ткст текст)
        {
            return wxStyledTextCtrl_ReplaceTargetRE(вхобъ, текст);
        }

        export цел поискВЦели(ткст текст)
        {
            return wxStyledTextCtrl_SearchInTarget(вхобъ, текст);
        }

        //-----------------------------------------------------------------------------

        export цел устФлагиПоиска()
        {
            return wxStyledTextCtrl_GetSearchФлаги(вхобъ);
        }
        export проц устФлагиПоиска(цел значение)
        {
            wxStyledTextCtrl_SetSearchФлаги(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export проц CallTipShow(цел поз, ткст definition)
        {
            wxStyledTextCtrl_CallTipShow(вхобъ, поз, definition);
        }

        export проц CallTipCancel()
        {
            wxStyledTextCtrl_CallTipCancel(вхобъ);
        }

        export бул CallTipActive()
        {
            return wxStyledTextCtrl_CallTipActive(вхобъ);
        }

        export цел CallTipPosAtStart()
        {
            return wxStyledTextCtrl_CallTipPosAtStart(вхобъ);
        }

        export проц CallTipSetHighlight(цел старт, цел конец)
        {
            wxStyledTextCtrl_CallTipSetHighlight(вхобъ, старт, конец);
        }

        export проц CallTipBackground(Цвет значение)
        {
            wxStyledTextCtrl_CallTipSetBackground(вхобъ, ВизОбъект.безопУк(значение));
        }

        export проц CallTipForeground(Цвет значение)
        {
            wxStyledTextCtrl_CallTipSetForeground(вхобъ, ВизОбъект.безопУк(значение));
        }

        export проц CallTipForegroundHighlight(Цвет значение)
        {
            wxStyledTextCtrl_CallTipSetForegroundHighlight(вхобъ, ВизОбъект.безопУк(значение));
        }

        //-----------------------------------------------------------------------------

        export цел VisibleFromDocLine(цел строка)
        {
            return wxStyledTextCtrl_VisibleFromDocLine(вхобъ, строка);
        }

        export цел DocLineFromVisible(цел lineDisplay)
        {
            return wxStyledTextCtrl_DocLineFromVisible(вхобъ, lineDisplay);
        }

        //-----------------------------------------------------------------------------

        export проц SetFoldLevel(цел строка, цел level)
        {
            wxStyledTextCtrl_SetFoldLevel(вхобъ, строка, level);
        }

        export цел GetFoldLevel(цел строка)
        {
            return wxStyledTextCtrl_GetFoldLevel(вхобъ, строка);
        }

        export цел дайПоследнОтпрыск(цел строка, цел level)
        {
            return wxStyledTextCtrl_GetLastChild(вхобъ, строка, level);
        }

        export цел GetFoldParent(цел строка)
        {
            return wxStyledTextCtrl_GetFoldParent(вхобъ, строка);
        }

        //-----------------------------------------------------------------------------

        export проц ShowLines(цел началоСтроки, цел lineEnd)
        {
            wxStyledTextCtrl_ShowLines(вхобъ, началоСтроки, lineEnd);
        }

        export проц HideLines(цел началоСтроки, цел lineEnd)
        {
            wxStyledTextCtrl_HideLines(вхобъ, началоСтроки, lineEnd);
        }

        export бул GetLineVisible(цел строка)
        {
            return wxStyledTextCtrl_GetLineVisible(вхобъ, строка);
        }

        //-----------------------------------------------------------------------------

        export проц SetFoldExpanded(цел строка, бул expanded)
        {
            wxStyledTextCtrl_SetFoldExpanded(вхобъ, строка, expanded);
        }

        export бул GetFoldExpanded(цел строка)
        {
            return wxStyledTextCtrl_GetFoldExpanded(вхобъ, строка);
        }

        export проц ToggleFold(цел строка)
        {
            wxStyledTextCtrl_ToggleFold(вхобъ, строка);
        }

        export проц убедисьЧтоВиден(цел строка)
        {
            wxStyledTextCtrl_EnsureVisible(вхобъ, строка);
        }

        //-----------------------------------------------------------------------------

        export проц FoldФлаги(цел значение)
        {
            wxStyledTextCtrl_SetFoldФлаги(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export проц EnsureVisibleEnforcePolicy(цел строка)
        {
            wxStyledTextCtrl_EnsureVisibleEnforcePolicy(вхобъ, строка);
        }

        //-----------------------------------------------------------------------------

        export бул табОтступы()
        {
            return wxStyledTextCtrl_GetTabIndents(вхобъ);
        }
        export проц табОтступы(бул значение)
        {
            wxStyledTextCtrl_SetTabIndents(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export бул BackSpaceUnIndents()
        {
            return wxStyledTextCtrl_GetBackSpaceUnIndents(вхобъ);
        }
        export проц BackSpaceUnIndents(бул значение)
        {
            wxStyledTextCtrl_SetBackSpaceUnIndents(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export проц MouseDwellTime(цел значение)
        {
            wxStyledTextCtrl_SetMouseDwellTime(вхобъ, значение);
        }
        export цел MouseDwellTime()
        {
            return wxStyledTextCtrl_GetMouseDwellTime(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export цел WordStartPosition(цел поз, бул onlyWordCharacters)
        {
            return wxStyledTextCtrl_WordStartPosition(вхобъ, поз, onlyWordCharacters);
        }

        export цел WordEndPosition(цел поз, бул onlyWordCharacters)
        {
            return wxStyledTextCtrl_WordEndPosition(вхобъ, поз, onlyWordCharacters);
        }

        //-----------------------------------------------------------------------------

        export цел WrapMode()
        {
            return wxStyledTextCtrl_GetWrapMode(вхобъ);
        }
        export проц WrapMode(цел значение)
        {
            wxStyledTextCtrl_SetWrapMode(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export проц LayoutCache(цел значение)
        {
            wxStyledTextCtrl_SetLayoutCache(вхобъ, значение);
        }
        export цел LayoutCache()
        {
            return wxStyledTextCtrl_GetLayoutCache(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export цел ScrollWidth()
        {
            return wxStyledTextCtrl_GetScrollWidth(вхобъ);
        }
        export проц ScrollWidth(цел значение)
        {
            wxStyledTextCtrl_SetScrollWidth(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export цел TextWidth(цел стиль, ткст текст)
        {
            return wxStyledTextCtrl_TextWidth(вхобъ, стиль, текст);
        }

        //-----------------------------------------------------------------------------

        export бул EndAtLastLine()
        {
            return cast(бул)wxStyledTextCtrl_GetEndAtLastLine(вхобъ);
        }
        export проц EndAtLastLine(бул значение)
        {
            wxStyledTextCtrl_SetEndAtLastLine(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export цел TextHeight(цел строка)
        {
            return wxStyledTextCtrl_TextHeight(вхобъ, строка);
        }

        //-----------------------------------------------------------------------------

        export бул UseVerticalScrollBar()
        {
            return wxStyledTextCtrl_GetUseVerticalScrollBar(вхобъ);
        }
        export проц UseVerticalScrollBar(бул значение)
        {
            wxStyledTextCtrl_SetUseVerticalScrollBar(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export проц приставьТекст(цел length, ткст текст)
        {
            wxStyledTextCtrl_AppendText(вхобъ, length, текст);
        }

        //-----------------------------------------------------------------------------

        export бул TwoPhaseDraw()
        {
            return wxStyledTextCtrl_GetTwoPhaseDraw(вхобъ);
        }
        export проц TwoPhaseDraw(бул значение)
        {
            wxStyledTextCtrl_SetTwoPhaseDraw(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export проц TargetFromSelection()
        {
            wxStyledTextCtrl_TargetFromSelection(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц LinesJoin()
        {
            wxStyledTextCtrl_LinesJoin(вхобъ);
        }

        export проц LinesSplit(цел pixelWidth)
        {
            wxStyledTextCtrl_LinesSplit(вхобъ, pixelWidth);
        }

        //-----------------------------------------------------------------------------

        export проц SetFoldMarginColour(бул useSetting, Цвет зад)
        {
            wxStyledTextCtrl_SetFoldMarginColour(вхобъ, useSetting, ВизОбъект.безопУк(зад));
        }

        export проц SetFoldMarginHiColour(бул useSetting, Цвет перед)
        {
            wxStyledTextCtrl_SetFoldMarginHiColour(вхобъ, useSetting, ВизОбъект.безопУк(перед));
        }

        //-----------------------------------------------------------------------------

        export проц LineDuplicate()
        {
            wxStyledTextCtrl_LineDuplicate(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц HomeDisplay()
        {
            wxStyledTextCtrl_HomeDisplay(вхобъ);
        }

        export проц HomeDisplayExtend()
        {
            wxStyledTextCtrl_HomeDisplayExtend(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц LineEndDisplay()
        {
            wxStyledTextCtrl_LineEndDisplay(вхобъ);
        }

        export проц LineEndDisplayExtend()
        {
            wxStyledTextCtrl_LineEndDisplayExtend(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц MoveCaretInsideView()
        {
            wxStyledTextCtrl_MoveCaretInsideView(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export цел длинаСтроки(цел строка)
        {
            return wxStyledTextCtrl_LineLength(вхобъ, строка);
        }

        //-----------------------------------------------------------------------------

        export проц BraceHighlight(цел pos1, цел pos2)
        {
            wxStyledTextCtrl_BraceHighlight(вхобъ, pos1, pos2);
        }

        export проц BraceBadLight(цел поз)
        {
            wxStyledTextCtrl_BraceBadLight(вхобъ, поз);
        }

        export цел BraceMatch(цел поз)
        {
            return wxStyledTextCtrl_BraceMatch(вхобъ, поз);
        }

        //-----------------------------------------------------------------------------

        export бул ViewEOL()
        {
            return wxStyledTextCtrl_GetViewEOL(вхобъ);
        }
        export проц ViewEOL(бул значение)
        {
            wxStyledTextCtrl_SetViewEOL(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        // Not really usable yet, unless sharing documents between styled
        // текст controls (?)

        export ВизОбъект DocPointer()
        {
            return найдиОбъект(wxStyledTextCtrl_GetDocPointer(вхобъ));
        }
        export проц DocPointer(ВизОбъект значение)
        {
            wxStyledTextCtrl_SetDocPointer(вхобъ, ВизОбъект.безопУк(значение));
        }

        //-----------------------------------------------------------------------------

        export цел ModEventMask()
        {
            return wxStyledTextCtrl_GetModEventMask(вхобъ);
        }
        export проц ModEventMask(цел значение)
        {
            wxStyledTextCtrl_SetModEventMask(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export цел EdgeColumn()
        {
            return wxStyledTextCtrl_GetEdgeColumn(вхобъ);
        }
        export проц EdgeColumn(цел значение)
        {
            wxStyledTextCtrl_SetEdgeColumn(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export цел EdgeMode()
        {
            return wxStyledTextCtrl_GetEdgeMode(вхобъ);
        }
        export проц EdgeMode(цел значение)
        {
            wxStyledTextCtrl_SetEdgeMode(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export Цвет EdgeColour()
        {
            return new Цвет(wxStyledTextCtrl_GetEdgeColour(вхобъ), да);
        }
        export проц EdgeColour(Цвет значение)
        {
            wxStyledTextCtrl_SetEdgeColour(вхобъ, ВизОбъект.безопУк(значение));
        }

        //-----------------------------------------------------------------------------

        export проц SearchAnchor()
        {
            wxStyledTextCtrl_SearchAnchor(вхобъ);
        }

        export цел SearchNext(цел флаги, ткст текст)
        {
            return wxStyledTextCtrl_SearchNext(вхобъ, флаги, текст);
        }

        export цел SearchPrev(цел флаги, ткст текст)
        {
            return wxStyledTextCtrl_SearchPrev(вхобъ, флаги, текст);
        }

        //-----------------------------------------------------------------------------

        export цел LinesOnScreen()
        {
            return wxStyledTextCtrl_LinesOnScreen(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц UsePopUp(бул значение)
        {
            wxStyledTextCtrl_UsePopUp(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export бул SelectionIsRectangle()
        {
            return wxStyledTextCtrl_SelectionIsRectangle(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export цел Zoom()
        {
            return wxStyledTextCtrl_GetZoom(вхобъ);
        }
        export проц Zoom(цел значение)
        {
            wxStyledTextCtrl_SetZoom(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export проц CreateDocument()
        {
            wxStyledTextCtrl_CreateDocument(вхобъ);
        }

        export проц AddRefDocument(ВизОбъект docPointer)
        {
            wxStyledTextCtrl_AddRefDocument(вхобъ, ВизОбъект.безопУк(docPointer));
        }

        export проц ReleaseDocument(ВизОбъект docPointer)
        {
            wxStyledTextCtrl_ReleaseDocument(вхобъ, ВизОбъект.безопУк(docPointer));
        }

        //-----------------------------------------------------------------------------

        export бул STCFocus()
        {
            return wxStyledTextCtrl_GetSTCFocus(вхобъ);
        }
        export проц STCFocus(бул значение)
        {
            wxStyledTextCtrl_SetSTCFocus(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export цел Status()
        {
            return wxStyledTextCtrl_GetStatus(вхобъ);
        }
        export проц Status(цел значение)
        {
            wxStyledTextCtrl_SetStatus(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export бул MouseDownCaptures()
        {
            return wxStyledTextCtrl_GetMouseDownCaptures(вхобъ);
        }
        export проц MouseDownCaptures(бул значение)
        {
            wxStyledTextCtrl_SetMouseDownCaptures(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export проц STCCursor(цел значение)
        {
            wxStyledTextCtrl_SetSTCCursor(вхобъ, значение);
        }
        export цел STCCursor()
        {
            return wxStyledTextCtrl_GetSTCCursor(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц ControlCharSymbol(цел значение)
        {
            wxStyledTextCtrl_SetControlCharSymbol(вхобъ, значение);
        }
        export цел ControlCharSymbol()
        {
            return wxStyledTextCtrl_GetControlCharSymbol(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц WordPartLeft()
        {
            wxStyledTextCtrl_WordPartLeft(вхобъ);
        }

        export проц WordPartLeftExtend()
        {
            wxStyledTextCtrl_WordPartLeftExtend(вхобъ);
        }

        export проц WordPartRight()
        {
            wxStyledTextCtrl_WordPartRight(вхобъ);
        }

        export проц WordPartRightExtend()
        {
            wxStyledTextCtrl_WordPartRightExtend(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц SetVisiblePolicy(цел visiblePolicy, цел visibleSlop)
        {
            wxStyledTextCtrl_SetVisiblePolicy(вхобъ, visiblePolicy, visibleSlop);
        }

        //-----------------------------------------------------------------------------

        export проц DelLineLeft()
        {
            wxStyledTextCtrl_DelLineLeft(вхобъ);
        }

        export проц DelLineRight()
        {
            wxStyledTextCtrl_DelLineRight(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц XOffset(цел значение)
        {
            wxStyledTextCtrl_SetXOffset(вхобъ, значение);
        }
        export цел XOffset()
        {
            return wxStyledTextCtrl_GetXOffset(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц ChooseCaretX()
        {
            wxStyledTextCtrl_ChooseCaretX(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц SetXCaretPolicy(цел caretPolicy, цел caretSlop)
        {
            wxStyledTextCtrl_SetXCaretPolicy(вхобъ, caretPolicy, caretSlop);
        }

        export проц SetYCaretPolicy(цел caretPolicy, цел caretSlop)
        {
            wxStyledTextCtrl_SetYCaretPolicy(вхобъ, caretPolicy, caretSlop);
        }

        //-----------------------------------------------------------------------------

        export проц PrintWrapMode(цел значение)
        {
            wxStyledTextCtrl_SetPrintWrapMode(вхобъ, значение);
        }
        export цел PrintWrapMode()
        {
            return wxStyledTextCtrl_GetPrintWrapMode(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц SetHotspotActiveForeground(бул useSetting, Цвет перед)
        {
            wxStyledTextCtrl_SetHotspotActiveForeground(вхобъ, useSetting, ВизОбъект.безопУк(перед));
        }

        export проц SetHotspotActiveBackground(бул useSetting, Цвет зад)
        {
            wxStyledTextCtrl_SetHotspotActiveBackground(вхобъ, useSetting, ВизОбъект.безопУк(зад));
        }

        export проц SetHotspotActiveUnderline(бул подчеркни)
        {
            wxStyledTextCtrl_SetHotspotActiveUnderline(вхобъ, подчеркни);
        }

        //-----------------------------------------------------------------------------

        export проц StartRecord()
        {
            wxStyledTextCtrl_StartRecord(вхобъ);
        }

        export проц StopRecord()
        {
            wxStyledTextCtrl_StopRecord(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц лексер(цел значение)
        {
            wxStyledTextCtrl_SetLexer(вхобъ, значение);
        }
        export цел лексер()
        {
            return wxStyledTextCtrl_GetLexer(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц окрась(цел старт, цел конец)
        {
            wxStyledTextCtrl_Colourise(вхобъ, старт, конец);
        }

        //-----------------------------------------------------------------------------

        export проц SetProperty(ткст ключ, ткст значение)
        {
            wxStyledTextCtrl_SetProperty(вхобъ, ключ, значение);
        }

        //-----------------------------------------------------------------------------

        export проц SetKeyWords(цел keywordSet, ткст keyWords)
        {
            wxStyledTextCtrl_SetKeyWords(вхобъ, keywordSet, keyWords);
        }

        //-----------------------------------------------------------------------------

        export проц LexerLanguage(ткст значение)
        {
            wxStyledTextCtrl_SetLexerLanguage(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export цел текущСтрока()
        {
            return wxStyledTextCtrl_GetCurrentLine(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц StyleSetSpec(цел styleNum, ткст spec)
        {
            wxStyledTextCtrl_StyleSetSpec(вхобъ, styleNum, spec);
        }

        export проц StyleSetFont(цел styleNum, Шрифт шрифт)
        {
            wxStyledTextCtrl_StyleSetFont(вхобъ, styleNum, ВизОбъект.безопУк(шрифт));
        }

        export проц StyleSetFontAttr(цел styleNum, цел размер, ткст имяФас, бул полужирный, бул italic, бул подчеркни)
        {
            wxStyledTextCtrl_StyleSetFontAttr(вхобъ, styleNum, размер, имяФас, полужирный, italic, подчеркни);
        }

        //-----------------------------------------------------------------------------

        export проц CmdKeyExecute(цел кмд)
        {
            wxStyledTextCtrl_CmdKeyExecute(вхобъ, кмд);
        }

        //-----------------------------------------------------------------------------

        export проц SetMargins(цел left, цел right)
        {
            wxStyledTextCtrl_SetMargins(вхобъ, left, right);
        }

        //-----------------------------------------------------------------------------

        export проц дайВыделение(out цел стартПоз, out цел конПоз)
        {
            wxStyledTextCtrl_GetSelection(вхобъ, стартПоз, конПоз);
        }

        //-----------------------------------------------------------------------------

        export Точка PointFromPosition(цел поз)
        {
            Точка тчк;
            wxStyledTextCtrl_PointFromPosition(вхобъ, поз, тчк);
            return тчк;
        }

        //-----------------------------------------------------------------------------

        export проц ScrollToLine(цел строка)
        {
            wxStyledTextCtrl_ScrollToLine(вхобъ, строка);
        }

        //-----------------------------------------------------------------------------

        export проц ScrollToColumn(цел колонка)
        {
            wxStyledTextCtrl_ScrollToColumn(вхобъ, колонка);
        }

        //-----------------------------------------------------------------------------

        /*export цел SendMsg(цел сооб, цел wp, цел lp)
        {
            return wxStyledTextCtrl_SendMsg(вхобъ, сооб, wp, lp);
        }*/

        //-----------------------------------------------------------------------------

        /*export ПолосаПрокрутки VScrollBar
        {
            set { wxStyledTextCtrl_SetVScrollBar(вхобъ, ВизОбъект.безопУк(значение)); }
        }*/

        //-----------------------------------------------------------------------------

        /*export ПолосаПрокрутки SetHScrollBar
        {
            set { wxStyledTextCtrl_SetHScrollBar(вхобъ, ВизОбъект.безопУк(значение)); }
        }*/

        //-----------------------------------------------------------------------------

        export бул LastKeydownProcessed()
        {
            return wxStyledTextCtrl_GetLastKeydownProcessed(вхобъ);
        }
        export проц LastKeydownProcessed(бул значение)
        {
            wxStyledTextCtrl_SetLastKeydownProcessed(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export бул сохраниФайл(ткст имяф)
        {
            return wxStyledTextCtrl_SaveFile(вхобъ, имяф);
        }

        export бул загрузиФайл(ткст имяф)
        {
            return wxStyledTextCtrl_LoadFile(вхобъ, имяф);
        }

        //-----------------------------------------------------------------------------

        export проц Change_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(СОБ_СТК_ИЗМЕНЕНИЕ, ид, значение, this);
        }
        export проц Change_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        export проц StyleNeeded_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(СОБ_СТК_НУЖНЫЙСТИЛЬ, ид, значение, this);
        }
        export проц StyleNeeded_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        export проц CharAdded_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(СОБ_СТК_ДОБАВЛЕНСИМ, ид, значение, this);
        }
        export проц CharAdded_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        export проц SavePointReached_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(СОБ_СТК_ДОСТИГНУТАТОЧКАСОХРАНЕНИЯ, ид, значение, this);
        }
        export проц SavePointReached_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        export проц SavePointLeft_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(СОБ_СТК_ПОКИНУТАТОЧКАСОХРАНЕНИЯ, ид, значение, this);
        }
        export проц SavePointLeft_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        export проц ROModifyAttempt_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(wxEVT_STC_ROMODIFYATTEMPT, ид, значение, this);
        }
        export проц ROModifyAttempt_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        export проц Key_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(СОБ_СТК_КЛАВИША, ид, значение, this);
        }
        export проц Key_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        export проц добавьДНажатие(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(СОБ_СТК_ДНАЖАТИЕ, ид, значение, this);
        }
        export проц удалиДНажатие(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        export проц UpdateUI_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(СОБ_СТК_ОБНОВИТЬИП, ид, значение, this);
        }
        export проц UpdateUI_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        export проц Modified_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(СОБ_СТК_МОДИФИЦИРОВАН, ид, значение, this);
        }
        export проц Modified_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        export проц MacroRecord_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(СОБ_СТК_ЗАПИСЬМАКРОСА, ид, значение, this);
        }
        export проц MacroRecord_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        export проц MarginClick_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(СОБ_СТК_НАЖАТМАРЖИН, ид, значение, this);
        }
        export проц MarginClick_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        export проц NeedShown_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(СОБ_СТК_НУЖЕНПОКАЗ, ид, значение, this);
        }
        export проц NeedShown_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        /*export событие ДатчикСобытий PositionChanged
        {
        	добавить { добавьДатчикКоманд(wxEVT_STC_POSCHANGED, ид, значение, this); }
        	remove { удалиОбработчик(значение, this); }
        }*/

        export проц Paint_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(СОБ_СТК_ОТРИСОВАН, ид, значение, this);
        }
        export проц Paint_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        export проц UserListSelection_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(СОБ_СТК_ВЫДЕЛЕНИЕПОЛЬЗОВАТЕЛЕМСПИСКА, ид, значение, this);
        }
        export проц UserListSelection_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        export проц URIDropped_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(СОБ_СТК_БРОШЕНУИР, ид, значение, this);
        }
        export проц URIDropped_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        export проц DwellStart_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(wxEVT_STC_DWELLSTART, ид, значение, this);
        }
        export проц DwellStart_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        export проц DwellEnd_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(wxEVT_STC_DWELLEND, ид, значение, this);
        }
        export проц DwellEnd_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        export проц StartDrag_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(СОБ_СТК_НАЧАЛО_ТЯГА, ид, значение, this);
        }
        export проц StartDrag_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        export проц DragOver_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(СОБ_СТК_КОНЕЦ_ТЯГА, ид, значение, this);
        }
        export проц DragOver_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        export проц DoDrop_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(СОБ_СТК_БРОСЬ_ДРОП, ид, значение, this);
        }
        export проц DoDrop_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        export проц Zoomed_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(СОБ_СТК_ЗУМ, ид, значение, this);
        }
        export проц Zoomed_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        export проц HotspotClick_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(wxEVT_STC_HOTSPOT_CLICK, ид, значение, this);
        }
        export проц HotspotClick_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        export проц HotspotDoubleClick_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(wxEVT_STC_HOTSPOT_DCLICK, ид, значение, this);
        }
        export проц HotspotDoubleClick_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }

        export проц CalltipClick_Add(ДатчикСобытий значение)
        {
            добавьДатчикКоманд(wxEVT_STC_CALLTIP_CLICK, ид, значение, this);
        }
        export проц CalltipClick_Remove(ДатчикСобытий значение)
        {
            удалиОбработчик(значение, this);
        }
    }

    //! \cond EXTERN
    extern (C) ЦелУкз wxStyledTextEvent_ctor(цел типКоманды, цел ид);
    extern (C) проц   wxStyledTextEvent_SetPosition(ЦелУкз сам, цел поз);
    extern (C) проц   wxStyledTextEvent_SetKey(ЦелУкз сам, цел k);
    extern (C) проц   wxStyledTextEvent_SetModifiers(ЦелУкз сам, цел m);
    extern (C) проц   wxStyledTextEvent_SetModificationType(ЦелУкз сам, цел t);
    extern (C) проц   wxStyledTextEvent_SetText(ЦелУкз сам, ткст t);
    extern (C) проц   wxStyledTextEvent_SetLength(ЦелУкз сам, цел len);
    extern (C) проц   wxStyledTextEvent_SetLinesAdded(ЦелУкз сам, цел чис);
    extern (C) проц   wxStyledTextEvent_SetLine(ЦелУкз сам, цел знач);
    extern (C) проц   wxStyledTextEvent_SetFoldLevelNow(ЦелУкз сам, цел знач);
    extern (C) проц   wxStyledTextEvent_SetFoldLevelPrev(ЦелУкз сам, цел знач);
    extern (C) проц   wxStyledTextEvent_SetMargin(ЦелУкз сам, цел знач);
    extern (C) проц   wxStyledTextEvent_SetMessage(ЦелУкз сам, цел знач);
    extern (C) проц   wxStyledTextEvent_SetWParam(ЦелУкз сам, цел знач);
    extern (C) проц   wxStyledTextEvent_SetLParam(ЦелУкз сам, цел знач);
    extern (C) проц   wxStyledTextEvent_SetListType(ЦелУкз сам, цел знач);
    extern (C) проц   wxStyledTextEvent_SetX(ЦелУкз сам, цел знач);
    extern (C) проц   wxStyledTextEvent_SetY(ЦелУкз сам, цел знач);
    extern (C) проц   wxStyledTextEvent_SetDragText(ЦелУкз сам, ткст знач);
    extern (C) проц   wxStyledTextEvent_SetDragAllowMove(ЦелУкз сам, бул знач);
    //extern (C) проц   wxStyledTextEvent_SetDragResult(ЦелУкз сам, wxDragResult знач);
    extern (C) цел    wxStyledTextEvent_GetPosition(ЦелУкз сам);
    extern (C) цел    wxStyledTextEvent_GetKey(ЦелУкз сам);
    extern (C) цел    wxStyledTextEvent_GetModifiers(ЦелУкз сам);
    extern (C) цел    wxStyledTextEvent_GetModificationType(ЦелУкз сам);
    extern (C) ЦелУкз wxStyledTextEvent_GetText(ЦелУкз сам);
    extern (C) цел    wxStyledTextEvent_GetLength(ЦелУкз сам);
    extern (C) цел    wxStyledTextEvent_GetLinesAdded(ЦелУкз сам);
    extern (C) цел    wxStyledTextEvent_GetLine(ЦелУкз сам);
    extern (C) цел    wxStyledTextEvent_GetFoldLevelNow(ЦелУкз сам);
    extern (C) цел    wxStyledTextEvent_GetFoldLevelPrev(ЦелУкз сам);
    extern (C) цел    wxStyledTextEvent_GetMargin(ЦелУкз сам);
    extern (C) цел    wxStyledTextEvent_GetMessage(ЦелУкз сам);
    extern (C) цел    wxStyledTextEvent_GetWParam(ЦелУкз сам);
    extern (C) цел    wxStyledTextEvent_GetLParam(ЦелУкз сам);
    extern (C) цел    wxStyledTextEvent_GetListType(ЦелУкз сам);
    extern (C) цел    wxStyledTextEvent_GetX(ЦелУкз сам);
    extern (C) цел    wxStyledTextEvent_GetY(ЦелУкз сам);
    extern (C) ЦелУкз wxStyledTextEvent_GetDragText(ЦелУкз сам);
    extern (C) бул   wxStyledTextEvent_GetDragAllowMove(ЦелУкз сам);
    //extern (C) ЦелУкз wxStyledTextEvent_GetDragResult(ЦелУкз сам);
    extern (C) бул   wxStyledTextEvent_GetShift(ЦелУкз сам);
    extern (C) бул   wxStyledTextEvent_GetControl(ЦелУкз сам);
    extern (C) бул   wxStyledTextEvent_GetAlt(ЦелУкз сам);
    //! \endcond

    //-----------------------------------------------------------------------------

    export class СобытиеСтильногоТекста : СобытиеКоманды
    {
        export this(ЦелУкз вхобъ)
        {
            super(вхобъ);
        }

        export  this(цел типКоманды, цел ид)
        {
            super(wxStyledTextEvent_ctor(типКоманды, ид));
        }

        //-----------------------------------------------------------------------------

        export цел позиция()
        {
            return wxStyledTextEvent_GetPosition(вхобъ);
        }
        export проц позиция(цел значение)
        {
            wxStyledTextEvent_SetPosition(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export цел клавиша()
        {
            return wxStyledTextEvent_GetKey(вхобъ);
        }
        export проц клавиша(цел значение)
        {
            wxStyledTextEvent_SetKey(вхобъ, значение);
        }

        //-----------------------------------------------------------------------------

        export проц модификаторы(цел значение)
        {
            wxStyledTextEvent_SetModifiers(вхобъ, значение);
        }
        export цел модификаторы()
        {
            return wxStyledTextEvent_GetModifiers(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц типМодификации(цел значение)
        {
            wxStyledTextEvent_SetModificationType(вхобъ, значение);
        }
        export цел типМодификации()
        {
            return wxStyledTextEvent_GetModificationType(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц текст(ткст значение)
        {
            wxStyledTextEvent_SetText(вхобъ, значение);
        }
        export ткст текст()
        {
            return cast(ткст) new ВизТкст(wxStyledTextEvent_GetText(вхобъ), да);
        }

        //-----------------------------------------------------------------------------

        export проц длина(цел значение)
        {
            wxStyledTextEvent_SetLength(вхобъ, значение);
        }
        export цел длина()
        {
            return wxStyledTextEvent_GetLength(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц строкДобавлено(цел значение)
        {
            wxStyledTextEvent_SetLinesAdded(вхобъ, значение);
        }
        export цел строкДобавлено()
        {
            return wxStyledTextEvent_GetLinesAdded(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц строка(цел значение)
        {
            wxStyledTextEvent_SetLine(вхобъ, значение);
        }
        export цел строка()
        {
            return wxStyledTextEvent_GetLine(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц FoldLevelNow(цел значение)
        {
            wxStyledTextEvent_SetFoldLevelNow(вхобъ, значение);
        }
        export цел FoldLevelNow()
        {
            return wxStyledTextEvent_GetFoldLevelNow(вхобъ);
        }

        export проц FoldLevelPrev(цел значение)
        {
            wxStyledTextEvent_SetFoldLevelPrev(вхобъ, значение);
        }
        export цел FoldLevelPrev()
        {
            return wxStyledTextEvent_GetFoldLevelPrev(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц маржин(цел значение)
        {
            wxStyledTextEvent_SetMargin(вхобъ, значение);
        }
        export цел маржин()
        {
            return wxStyledTextEvent_GetMargin(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц сообщение(цел значение)
        {
            wxStyledTextEvent_SetMessage(вхобъ, значение);
        }
        export цел сообщение()
        {
            return wxStyledTextEvent_GetMessage(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц парамВ(цел значение)
        {
            wxStyledTextEvent_SetWParam(вхобъ, значение);
        }
        export цел парамВ()
        {
            return wxStyledTextEvent_GetWParam(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц парамЛ(цел значение)
        {
            wxStyledTextEvent_SetLParam(вхобъ, значение);
        }
        export цел парамЛ()
        {
            return wxStyledTextEvent_GetLParam(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц типСписка(цел значение)
        {
            wxStyledTextEvent_SetListType(вхобъ, значение);
        }
        export цел типСписка()
        {
            return wxStyledTextEvent_GetListType(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц Х(цел значение)
        {
            wxStyledTextEvent_SetX(вхобъ, значение);
        }
        export цел Х()
        {
            return wxStyledTextEvent_GetX(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц У(цел значение)
        {
            wxStyledTextEvent_SetY(вхобъ, значение);
        }
        export цел У()
        {
            return wxStyledTextEvent_GetY(вхобъ);
        }

        //-----------------------------------------------------------------------------

        export проц тяниТекст(ткст значение)
        {
            wxStyledTextEvent_SetDragText(вхобъ, значение);
        }
        export ткст тяниТекст()
        {
            return cast(ткст) new ВизТкст(wxStyledTextEvent_GetDragText(вхобъ), да);
        }

        //-----------------------------------------------------------------------------

        export проц DragAllowMove(бул значение)
        {
            wxStyledTextEvent_SetDragAllowMove(вхобъ, значение);
        }
        export бул DragAllowMove()
        {
            return wxStyledTextEvent_GetDragAllowMove(вхобъ);
        }

        //-----------------------------------------------------------------------------

        /*export ПРезультатТяга ПРезультатТяга
        {
            set { wxStyledTextEvent_SetDragResult(вхобъ, ВизОбъект.безопУк(значение)); }
            get { return wxStyledTextEvent_GetDragResult(вхобъ); }
        }*/

        //-----------------------------------------------------------------------------

        export бул шифт()
        {
            return wxStyledTextEvent_GetShift(вхобъ);
        }

        export бул контрол()
        {
            return wxStyledTextEvent_GetControl(вхобъ);
        }

        export бул альт()
        {
            return wxStyledTextEvent_GetAlt(вхобъ);
        }

        private static Событие Нов(ЦелУкз объ)
        {
            return new СобытиеСтильногоТекста(объ);
        }
    }

//! \cond VERSION
} // version(WXD_STYLEDTEXTCTRL)
//! \endcond
