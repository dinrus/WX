module wx.NumberDialog;
public import wx.common;
public import wx.Dialog;

//! \cond EXTERN
static extern (C) IntPtr wxNumberEntryDialog_ctor(IntPtr parent, string message, string prompt, string caption, int value, int min, int max, inout Point pos);
static extern (C) void wxNumberEntryDialog_dtor(IntPtr self);
static extern (C) int wxNumberEntryDialog_GetValue(IntPtr self);
static extern (C) int wxNumberEntryDialog_ShowModal(IntPtr self);
//! \endcond

//-----------------------------------------------------------------------------

alias NumberEntryDialog wxNumberEntryDialog;
public class NumberEntryDialog : Dialog
{
    public const int wxNumberEntryDialogStyle = (Dialog.wxOK | Dialog.wxCANCEL | Dialog.wxCENTRE );

    public this(IntPtr wxobj);
    public  this(Window parent, string message, string prompt, string caption, int value, int min, int max, Point pos = wxDefaultPosition);
    public int Value() ;
    public override int ShowModal();
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) int wxGetNumberFromUser_func(string message, string prompt, string caption, int value, int min, int max, IntPtr parent, inout Point pos);
//! \endcond

//-----------------------------------------------------------------------------

public int GetNumberFromUser(string message, string prompt, string caption, int value = 0, int min = 0, int max = 100, Window parent = null, Point pos = Dialog.wxDefaultPosition);
