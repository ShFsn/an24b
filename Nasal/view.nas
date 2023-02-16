# Derived from Yurik V. Nikiforoff's view.nas for the tu154b

var forceView = func{
	var n = arg[0];
	var offset = getprop("an24/view-offset");
	if( n > 0 ) n = n + offset;
	setprop("sim/current-view/view-number", n);
	gui.popupTip(views[n].getNode("name").getValue());
};

var init_offset = func{
if( props.globals.getNode("/sim/view[8]") != nil )
  setprop("/an24/view-offset", 8 );
else setprop("/an24/view-offset", 7 );
}
 init_offset();
