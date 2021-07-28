#
# Makefile : Builds wxWindows samples for Unix.
#

SAMPLES_SUBDIRS=animate artprov aui calendar caret checklst collpane combo config console controls dialogs dialup display dnd docview docvwmdi dragimag drawing dynamic erase event except exec font grid help htlbox html html/about html/help html/helpview html/printing html/test html/virtual html/widget html/zip image internat ipc joytest keyboard layout listbox listctrl mdi menu minifram minimal mobile mobile/styles mobile/wxedit multimon nativdlg notebook oleauto ownerdrw png popup printing propsize regtest render richtext rotate sashtest scroll scrollsub shaped sockets sound splash splitter statbar taskbar text thread toolbar treectrl typetest validate vscroll widgets wizard xrc 

all:
	@for d in $(SAMPLES_SUBDIRS); do (cd $$d && $(MAKE)); done

clean:
	@for d in $(SAMPLES_SUBDIRS); do (cd $$d && $(MAKE) clean); done
