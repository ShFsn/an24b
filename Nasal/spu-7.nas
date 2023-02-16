#########################################################################
# Volume to headset
#########################################################################
var spu7_to_headset = func {
	var viewnr = getprop("/sim/current-view/view-number-raw");
	var source = getprop("an24/SPU-7/source_viewnr" ~ viewnr ~ "");
# "General" ("Radio") or "Listen" ("SPU") volume
	if ( getprop("an24/SPU-7/spu_radio_viewnr" ~ viewnr ~ "") == 1.0 ) {
	var volumeknob = getprop("an24/SPU-7/listen_viewnr" ~ viewnr ~ "")
	}
	else {
	var volumeknob = getprop("an24/SPU-7/general_viewnr" ~ viewnr ~ "")
	}
# R-802 No.1
	if ( source == 0.0 ) {
	interpolate("instrumentation/comm[0]/volume", volumeknob * getprop("an24/R-802/output-vol-1"), 0.2 );
	}
	else {
	interpolate("instrumentation/comm[0]/volume", 0.0, 0.2 );
	}
# R-802 No.2
	if ( source == 3.0 ) {
	interpolate("instrumentation/comm[1]/volume", volumeknob * getprop("an24/R-802/output-vol-2"), 0.2 );
	}
	else {
	interpolate("instrumentation/comm[1]/volume", 0.0, 0.2 );
	}
# ARK-11 No.1/ Kurs-MP No.1
	if ( source == 4.0 ) {
		if ( getprop("an24/Kurs-MP/vor1-ark1") == -1.0 ) {
		interpolate("instrumentation/adf[0]/volume-norm", volumeknob * getprop("an24/ARK-11/output-vol-1"), 0.2 );
		interpolate("instrumentation/adf[2]/volume-norm", volumeknob * getprop("an24/ARK-11/output-vol-1"), 0.2 );
		interpolate("instrumentation/nav[0]/volume", 0.0, 0.2 );
		}
		else {
		interpolate("instrumentation/nav[0]/volume", volumeknob * getprop("instrumentation/nav[0]/serviceable"), 0.2 );
		interpolate("instrumentation/adf[0]/volume-norm", 0.0, 0.2 );
		interpolate("instrumentation/adf[2]/volume-norm", 0.0, 0.2 );
		}
	}
	else {
	interpolate("instrumentation/nav[0]/volume",  0.0, 0.2 );
	interpolate("instrumentation/adf[0]/volume-norm", 0.0, 0.2 );
	interpolate("instrumentation/adf[2]/volume-norm", 0.0, 0.2 );
	}
# ARK-11 No.2/ Kurs-MP No.2
	if ( source == 5.0 ) {
		if ( getprop("an24/Kurs-MP/vor2-ark2") == -1.0 ) {
		interpolate("instrumentation/adf[1]/volume-norm", volumeknob * getprop("an24/ARK-11/output-vol-2"), 0.2 );
		interpolate("instrumentation/adf[3]/volume-norm", volumeknob * getprop("an24/ARK-11/output-vol-2"), 0.2 );
		interpolate("instrumentation/nav[1]/volume", 0.0, 0.2 );
		}
		else {
		interpolate("instrumentation/nav[1]/volume", volumeknob * getprop("instrumentation/nav[1]/serviceable"), 0.2 );
		interpolate("instrumentation/adf[1]/volume-norm", 0.0, 0.2 );
		interpolate("instrumentation/adf[3]/volume-norm", 0.0, 0.2 );
		}
	}
	else {
	interpolate("instrumentation/nav[1]/volume",  0.0, 0.2 );
	interpolate("instrumentation/adf[1]/volume-norm", 0.0, 0.2 );
	interpolate("instrumentation/adf[3]/volume-norm", 0.0, 0.2 );
	}
}
 setlistener("/sim/current-view/view-number-raw", spu7_to_headset, 0, 0 );
# R-802
 setlistener("an24/R-802/output-vol-1", spu7_to_headset, 0, 0 );
 setlistener("an24/R-802/output-vol-2", spu7_to_headset, 0, 0 );
# ARK-11 /Kurs-MP
 setlistener("an24/Kurs-MP/vor1-ark1", spu7_to_headset, 0, 0 );
 setlistener("an24/Kurs-MP/vor2-ark2", spu7_to_headset, 0, 0 );
 setlistener("an24/ARK-11/output-vol-1", spu7_to_headset, 0, 0 );
 setlistener("an24/ARK-11/output-vol-2", spu7_to_headset, 0, 0 );
 setlistener("instrumentation/nav[0]/serviceable", spu7_to_headset, 0, 0 );
 setlistener("instrumentation/nav[1]/serviceable", spu7_to_headset, 0, 0 );
# SPU-7
 setlistener("an24/SPU-7/general_viewnr0", spu7_to_headset, 0, 0 );
 setlistener("an24/SPU-7/general_viewnr101", spu7_to_headset, 0, 0 );
 setlistener("an24/SPU-7/general_viewnr102", spu7_to_headset, 0, 0 );
 setlistener("an24/SPU-7/general_viewnr103", spu7_to_headset, 0, 0 );
 setlistener("an24/SPU-7/listen_viewnr0", spu7_to_headset, 0, 0 );
 setlistener("an24/SPU-7/listen_viewnr101", spu7_to_headset, 0, 0 );
 setlistener("an24/SPU-7/listen_viewnr102", spu7_to_headset, 0, 0 );
 setlistener("an24/SPU-7/listen_viewnr103", spu7_to_headset, 0, 0 );

 setlistener("an24/SPU-7/spu_radio_viewnr0", spu7_to_headset, 0, 0 );
 setlistener("an24/SPU-7/spu_radio_viewnr101", spu7_to_headset, 0, 0 );
 setlistener("an24/SPU-7/spu_radio_viewnr102", spu7_to_headset, 0, 0 );
 setlistener("an24/SPU-7/spu_radio_viewnr103", spu7_to_headset, 0, 0 );
 setlistener("an24/SPU-7/source_viewnr0", spu7_to_headset, 0, 0 );
 setlistener("an24/SPU-7/source_viewnr101", spu7_to_headset, 0, 0 );
 setlistener("an24/SPU-7/source_viewnr102", spu7_to_headset, 0, 0 );
 setlistener("an24/SPU-7/source_viewnr103", spu7_to_headset, 0, 0 );
