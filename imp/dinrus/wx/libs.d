module wx.libs;
/* this gets set to a pragma(link) for version(build) */
/+
version (build) { pragma(msg, "run make build first");
pragma(link,"wxbase28d.lib");
pragma(link, "wxbase28d_net.lib");
pragma(link, "wxbase28d_odbc.lib");
pragma(link, "wxbase28d_xml.lib");
pragma(link, "wxexpatd.lib");
pragma(link, "wxjpegd.lib");
pragma(link, "wxmsw28d_adv.lib");
pragma(link, "wxmsw28d_aui.lib");
pragma(link, "wxmsw28d_core.lib");
pragma(link, "wxmsw28d_dbgrid.lib");
pragma(link, "wxmsw28d_depricated.lib");
pragma(link, "wxmsw28d_fl.lib");
pragma(link, "wxmsw28d_foldbar.lib");
pragma(link, "wxmsw28d_gizmos.lib");
pragma(link, "wxmsw28d_gizmos_xrc.lib");
pragma(link, "wxmsw28d_html.lib");
pragma(link, "wxmsw28d_media.lib");
pragma(link, "wxmsw28d_mmedia.lib");
pragma(link, "wxmsw28d_netutils.lib");
pragma(link, "wxmsw28d_ogl.lib");
pragma(link, "wxmsw28d_plot.lib");
pragma(link, "wxmsw28d_qa.lib");
pragma(link, "wxmsw28d_richtext.lib");
pragma(link, "wxmsw28d_stc.lib");
pragma(link, "wxmsw28d_svg.lib");
pragma(link, "wxmsw28d_xrc.lib");
pragma(link, "wxpngd.lib");
pragma(link, "wxregexd.lib");
pragma(link, "wxtiffd.lib");
pragma(link, "wxzlibd.lib");}
+/