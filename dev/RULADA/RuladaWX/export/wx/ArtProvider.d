module wx.ArtProvider;
public import wx.common;
public import wx.Bitmap;
public import wx.Icon;
public import wx.Window;

public enum ArtID
{
    wxART_ADD_BOOKMARK = 1,
    wxART_DEL_BOOKMARK,
    wxART_HELP_SIDE_PANEL,
    wxART_HELP_SETTINGS,
    wxART_HELP_BOOK,
    wxART_HELP_FOLDER,
    wxART_HELP_PAGE,
    wxART_GO_BACK,
    wxART_GO_FORWARD,
    wxART_GO_UP,
    wxART_GO_DOWN,
    wxART_GO_TO_PARENT,
    wxART_GO_HOME,
    wxART_FILE_OPEN,
    wxART_PRINT,
    wxART_HELP,
    wxART_TIP,
    wxART_REPORT_VIEW,
    wxART_LIST_VIEW,
    wxART_NEW_DIR,
    wxART_FOLDER,
    wxART_GO_DIR_UP,
    wxART_EXECUTABLE_FILE,
    wxART_NORMAL_FILE,
    wxART_TICK_MARK,
    wxART_CROSS_MARK,
    wxART_ERROR,
    wxART_QUESTION,
    wxART_WARNING,
    wxART_INFORMATION,
    wxART_MISSING_IMAGE
}

//---------------------------------------------------------------------

public enum ArtClient
{
    wxART_TOOLBAR = 1,
    wxART_MENU,
    wxART_FRAME_ICON,
    wxART_CMN_DIALOG,
    wxART_HELP_BROWSER,
    wxART_MESSAGE_BOX,
    wxART_BUTTON,
    wxART_OTHER
}

//---------------------------------------------------------------------

//! \cond EXTERN
static extern (C) IntPtr wxArtProvider_GetBitmap(int artid, int artclient, inout Size size);
static extern (C) IntPtr wxArtProvider_GetIcon(int artid, int artclient, inout Size size);
//! \endcond

//---------------------------------------------------------------------

alias ArtProvider wxArtProvider;
public class ArtProvider
{
    public static Bitmap GetBitmap(ArtID id);
    public static Bitmap GetBitmap(ArtID id, ArtClient client);
    public static Bitmap GetBitmap(ArtID id, ArtClient client, Size size);
    public static Icon GetIcon(ArtID id);
    public static Icon GetIcon(ArtID id, ArtClient client);
    public static Icon GetIcon(ArtID id, ArtClient client, Size size);
}
