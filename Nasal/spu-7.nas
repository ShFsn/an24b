setprop("an24/SPU-7/lc_source", 0.0);
setprop("an24/SPU-7/rc_source", 0.0);
setprop("an24/SPU-7/eng_source", 0.0);
setprop("an24/SPU-7/nav_source", 0.0);
setprop("an24/SPU-7/listen_viewnr0", 0.0);
setprop("an24/SPU-7/listen_viewnr8", 0.0);
setprop("an24/SPU-7/listen_viewnr9", 0.0);
setprop("an24/SPU-7/listen_viewnr10", 0.0);
setprop("an24/SPU-7/general_viewnr0", 0.0);
setprop("an24/SPU-7/general_viewnr8", 0.0);
setprop("an24/SPU-7/general_viewnr9", 0.0);
setprop("an24/SPU-7/general_viewnr10", 0.0);

#########################################################################
# R-802 No.1
#########################################################################
setprop("an24/AZS/sw0509", 0.0);
var r8021audible = func {
	var viewnr = getprop("/sim/current-view/view-number");
	if ( getprop("an24/SPU-7/spu_radio_viewnr" ~ viewnr ~ "") == 1.0 ) {
	var volumeknob = getprop("an24/SPU-7/listen_viewnr" ~ viewnr ~ "")
	}
	else {
	var volumeknob = getprop("an24/SPU-7/general_viewnr" ~ viewnr ~ "")
	}
	if ( (getprop("an24/SPU-7/lc_source") == 0.0 and viewnr == 0 ) or (getprop("an24/SPU-7/rc_source") == 0.0 and viewnr == 8 ) or (getprop("an24/SPU-7/eng_source") == 0.0 and viewnr == 9 ) or (getprop("an24/SPU-7/nav_source") == 0.0 and viewnr == 10 ) ) {
	var toheadset = volumeknob * getprop("an24/R-802/volume-1") * getprop("an24/AZS/sw0509") * getprop("an24/R-802/power-1") ;
	interpolate("/instrumentation/comm[0]/volume", toheadset, 0.2 );
	}
	else {
	interpolate("/instrumentation/comm[0]/volume", 0.0, 0.2 );
	}
}
 setlistener("/sim/current-view/view-number", r8021audible);
 setlistener("an24/R-802/volume-1", r8021audible);
 setlistener("an24/R-802/power-1", r8021audible);
 setlistener("an24/SPU-7/general_viewnr0", r8021audible);
 setlistener("an24/SPU-7/listen_viewnr0", r8021audible);
 setlistener("an24/SPU-7/general_viewnr8", r8021audible);
 setlistener("an24/SPU-7/listen_viewnr8", r8021audible);
 setlistener("an24/SPU-7/general_viewnr9", r8021audible);
 setlistener("an24/SPU-7/listen_viewnr9", r8021audible);
 setlistener("an24/SPU-7/general_viewnr10", r8021audible);
 setlistener("an24/SPU-7/listen_viewnr10", r8021audible);
 setlistener("an24/SPU-7/spu_radio_viewnr0", r8021audible);
 setlistener("an24/SPU-7/spu_radio_viewnr8", r8021audible);
 setlistener("an24/SPU-7/spu_radio_viewnr9", r8021audible);
 setlistener("an24/SPU-7/spu_radio_viewnr10", r8021audible);
 setlistener("an24/SPU-7/lc_source", r8021audible);
 setlistener("an24/SPU-7/rc_source", r8021audible);
 setlistener("an24/SPU-7/eng_source", r8021audible);
 setlistener("an24/SPU-7/nav_source", r8021audible);
 setlistener("an24/AZS/sw0509", r8021audible);

#########################################################################
# R-802 No.2
#########################################################################
setprop("an24/AZS/sw0508", 0.0);
var r8022audible = func {
	var viewnr = getprop("/sim/current-view/view-number");
	if ( getprop("an24/SPU-7/spu_radio_viewnr" ~ viewnr ~ "") == 1.0 ) {
	var volumeknob = getprop("an24/SPU-7/listen_viewnr" ~ viewnr ~ "")
	}
	else {
	var volumeknob = getprop("an24/SPU-7/general_viewnr" ~ viewnr ~ "")
	}
	if ( (getprop("an24/SPU-7/lc_source") == 3.0 and viewnr == 0 ) or (getprop("an24/SPU-7/rc_source") == 3.0 and viewnr == 8 ) or (getprop("an24/SPU-7/eng_source") == 3.0 and viewnr == 9 ) or (getprop("an24/SPU-7/nav_source") == 3.0 and viewnr == 10 ) ) {
	var toheadset = volumeknob * getprop("an24/R-802/volume-2") * getprop("an24/AZS/sw0508") * getprop("an24/R-802/power-2") ;
	interpolate("/instrumentation/comm[1]/volume", toheadset, 0.2 );
	}
	else {
	interpolate("/instrumentation/comm[1]/volume", 0.0, 0.2 );
	}
}
 setlistener("/sim/current-view/view-number", r8022audible);
 setlistener("an24/R-802/volume-2", r8022audible);
 setlistener("an24/R-802/power-2", r8022audible);
 setlistener("an24/SPU-7/general_viewnr0", r8022audible);
 setlistener("an24/SPU-7/listen_viewnr0", r8022audible);
 setlistener("an24/SPU-7/general_viewnr8", r8022audible);
 setlistener("an24/SPU-7/listen_viewnr8", r8022audible);
 setlistener("an24/SPU-7/general_viewnr9", r8022audible);
 setlistener("an24/SPU-7/listen_viewnr9", r8022audible);
 setlistener("an24/SPU-7/general_viewnr10", r8022audible);
 setlistener("an24/SPU-7/listen_viewnr10", r8022audible);
 setlistener("an24/SPU-7/spu_radio_viewnr0", r8022audible);
 setlistener("an24/SPU-7/spu_radio_viewnr8", r8022audible);
 setlistener("an24/SPU-7/spu_radio_viewnr9", r8022audible);
 setlistener("an24/SPU-7/spu_radio_viewnr10", r8022audible);
 setlistener("an24/SPU-7/lc_source", r8022audible);
 setlistener("an24/SPU-7/rc_source", r8022audible);
 setlistener("an24/SPU-7/eng_source", r8022audible);
 setlistener("an24/SPU-7/nav_source", r8022audible);
 setlistener("an24/AZS/sw0508", r8022audible);

#########################################################################
# ARK-11 No.1
#########################################################################
var ark1audible = func {
	var viewnr = getprop("/sim/current-view/view-number");
	if ( getprop("an24/SPU-7/spu_radio_viewnr" ~ viewnr ~ "") == 1.0 ) {
	var volumeknob = getprop("an24/SPU-7/listen_viewnr" ~ viewnr ~ "")
	}
	else {
	var volumeknob = getprop("an24/SPU-7/general_viewnr" ~ viewnr ~ "")
	}
	if ( getprop("an24/Kurs-MP/vor1-ark1") == -1.0 and ((getprop("an24/SPU-7/lc_source") == 4.0 and viewnr == 0 ) or (getprop("an24/SPU-7/rc_source") == 4.0 and viewnr == 8 ) or (getprop("an24/SPU-7/eng_source") == 4.0 and viewnr == 9 ) or (getprop("an24/SPU-7/nav_source") == 4.0 and viewnr == 10 )) ) {
	var toheadset = volumeknob * getprop("an24/ARK-11/vol-1");
	interpolate("/instrumentation/adf[0]/volume-norm", toheadset, 0.2 );
	interpolate("/instrumentation/adf[2]/volume-norm", toheadset, 0.2 );
	}
	else {
	interpolate("/instrumentation/adf[0]/volume-norm", 0.0, 0.2 );
	interpolate("/instrumentation/adf[2]/volume-norm", 0.0, 0.2 );
	}
}
 setlistener("/sim/current-view/view-number", ark1audible);
 setlistener("an24/ARK-11/vol-1", ark1audible);
 setlistener("an24/ARK-11/mode-1", ark1audible);
 setlistener("an24/ARK-11/mode-oh", ark1audible);
 setlistener("an24/SPU-7/listen_viewnr0", ark1audible);
 setlistener("an24/SPU-7/listen_viewnr8", ark1audible);
 setlistener("an24/SPU-7/listen_viewnr9", ark1audible);
 setlistener("an24/SPU-7/listen_viewnr10", ark1audible);
 setlistener("an24/SPU-7/general_viewnr0", ark1audible);
 setlistener("an24/SPU-7/general_viewnr8", ark1audible);
 setlistener("an24/SPU-7/general_viewnr9", ark1audible);
 setlistener("an24/SPU-7/general_viewnr10", ark1audible);
 setlistener("an24/SPU-7/spu_radio_viewnr0", ark1audible);
 setlistener("an24/SPU-7/spu_radio_viewnr8", ark1audible);
 setlistener("an24/SPU-7/spu_radio_viewnr9", ark1audible);
 setlistener("an24/SPU-7/spu_radio_viewnr10", ark1audible);
 setlistener("an24/SPU-7/lc_source", ark1audible);
 setlistener("an24/SPU-7/rc_source", ark1audible);
 setlistener("an24/SPU-7/eng_source", ark1audible);
 setlistener("an24/SPU-7/nav_source", ark1audible);
# setlistener("an24/AZS/sw0512", ark1audible);
# setlistener("an24/AZS/sw0513", ark1audible);
 setlistener("an24/Kurs-MP/vor1-ark1", ark1audible);

#########################################################################
# ARK-11 No.2
#########################################################################
var ark2audible = func {
	var viewnr = getprop("/sim/current-view/view-number");
	if ( getprop("an24/SPU-7/spu_radio_viewnr" ~ viewnr ~ "") == 1.0 ) {
	var volumeknob = getprop("an24/SPU-7/listen_viewnr" ~ viewnr ~ "")
	}
	else {
	var volumeknob = getprop("an24/SPU-7/general_viewnr" ~ viewnr ~ "")
	}
	if ( getprop("an24/Kurs-MP/vor2-ark2") == -1.0 and ((getprop("an24/SPU-7/lc_source") == 5.0 and viewnr == 0 ) or (getprop("an24/SPU-7/rc_source") == 5.0 and viewnr == 8 ) or (getprop("an24/SPU-7/eng_source") == 5.0 and viewnr == 9 ) or (getprop("an24/SPU-7/nav_source") == 5.0 and viewnr == 10 )) ) {
	var toheadset = volumeknob;
	interpolate("/instrumentation/adf[1]/volume-norm", toheadset, 0.2 );
	interpolate("/instrumentation/adf[3]/volume-norm", toheadset, 0.2 );
	}
	else {
	interpolate("/instrumentation/adf[1]/volume-norm", 0.0, 0.2 );
	interpolate("/instrumentation/adf[3]/volume-norm", 0.0, 0.2 );
	}
}
 setlistener("/sim/current-view/view-number", ark2audible);
 setlistener("an24/ARK-11/vol-2", ark2audible);
 setlistener("an24/SPU-7/listen_viewnr0", ark2audible);
 setlistener("an24/SPU-7/listen_viewnr8", ark2audible);
 setlistener("an24/SPU-7/listen_viewnr9", ark2audible);
 setlistener("an24/SPU-7/listen_viewnr10", ark2audible);
 setlistener("an24/SPU-7/general_viewnr0", ark2audible);
 setlistener("an24/SPU-7/general_viewnr8", ark2audible);
 setlistener("an24/SPU-7/general_viewnr9", ark2audible);
 setlistener("an24/SPU-7/general_viewnr10", ark2audible);
 setlistener("an24/SPU-7/spu_radio_viewnr0", ark2audible);
 setlistener("an24/SPU-7/spu_radio_viewnr8", ark2audible);
 setlistener("an24/SPU-7/spu_radio_viewnr9", ark2audible);
 setlistener("an24/SPU-7/spu_radio_viewnr10", ark2audible);
 setlistener("an24/SPU-7/lc_source", ark2audible);
 setlistener("an24/SPU-7/rc_source", ark2audible);
 setlistener("an24/SPU-7/eng_source", ark2audible);
 setlistener("an24/SPU-7/nav_source", ark2audible);
# setlistener("an24/AZS/sw0514", ark2audible);
# setlistener("an24/AZS/sw0515", ark2audible);
 setlistener("an24/Kurs-MP/vor2-ark2", ark2audible);

#########################################################################
# KURS-MP No.1
#########################################################################
var kursmp1audible = func {
	var viewnr = getprop("/sim/current-view/view-number");
	if ( getprop("an24/SPU-7/spu_radio_viewnr" ~ viewnr ~ "") == 1.0 ) {
	var volumeknob = getprop("an24/SPU-7/listen_viewnr" ~ viewnr ~ "")
	}
	else {
	var volumeknob = getprop("an24/SPU-7/general_viewnr" ~ viewnr ~ "")
	}
	if ( getprop("an24/Kurs-MP/vor1-ark1") == 1.0 and ((getprop("an24/SPU-7/lc_source") == 4.0 and viewnr == 0 ) or (getprop("an24/SPU-7/rc_source") == 4.0 and viewnr == 8 ) or (getprop("an24/SPU-7/eng_source") == 4.0 and viewnr == 9 ) or (getprop("an24/SPU-7/nav_source") == 4.0 and viewnr == 10 )) ) {
	var toheadset = volumeknob * getprop("instrumentation/nav[0]/serviceable") ;
	interpolate("/instrumentation/nav[0]/volume", toheadset, 0.2 );
	}
	else {
	interpolate("/instrumentation/nav[0]/volume", 0.0, 0.2 );
	}
}
 setlistener("/sim/current-view/view-number", kursmp1audible);
 setlistener("an24/SPU-7/general_viewnr0", kursmp1audible);
 setlistener("an24/SPU-7/listen_viewnr0", kursmp1audible);
 setlistener("an24/SPU-7/general_viewnr8", kursmp1audible);
 setlistener("an24/SPU-7/listen_viewnr8", kursmp1audible);
 setlistener("an24/SPU-7/general_viewnr9", kursmp1audible);
 setlistener("an24/SPU-7/listen_viewnr9", kursmp1audible);
 setlistener("an24/SPU-7/general_viewnr10", kursmp1audible);
 setlistener("an24/SPU-7/listen_viewnr10", kursmp1audible);
 setlistener("an24/SPU-7/spu_radio_viewnr0", kursmp1audible);
 setlistener("an24/SPU-7/spu_radio_viewnr8", kursmp1audible);
 setlistener("an24/SPU-7/spu_radio_viewnr9", kursmp1audible);
 setlistener("an24/SPU-7/spu_radio_viewnr10", kursmp1audible);
 setlistener("an24/SPU-7/lc_source", kursmp1audible);
 setlistener("an24/SPU-7/rc_source", kursmp1audible);
 setlistener("an24/SPU-7/eng_source", kursmp1audible);
 setlistener("an24/SPU-7/nav_source", kursmp1audible);
 setlistener("an24/Kurs-MP/vor1-ark1", kursmp1audible);
 setlistener("instrumentation/nav[0]/serviceable", kursmp1audible);

#########################################################################
# KURS-MP No.2
#########################################################################
var kursmp2audible = func {
	var viewnr = getprop("/sim/current-view/view-number");
	if ( getprop("an24/SPU-7/spu_radio_viewnr" ~ viewnr ~ "") == 1.0 ) {
	var volumeknob = getprop("an24/SPU-7/listen_viewnr" ~ viewnr ~ "")
	}
	else {
	var volumeknob = getprop("an24/SPU-7/general_viewnr" ~ viewnr ~ "")
	}
	if ( getprop("an24/Kurs-MP/vor2-ark2") == 1.0 and ((getprop("an24/SPU-7/lc_source") == 5.0 and viewnr == 0 ) or (getprop("an24/SPU-7/rc_source") == 5.0 and viewnr == 8 ) or (getprop("an24/SPU-7/eng_source") == 5.0 and viewnr == 9 ) or (getprop("an24/SPU-7/nav_source") == 5.0 and viewnr == 10 )) ) {
	var toheadset = volumeknob * getprop("instrumentation/nav[1]/serviceable") ;
	interpolate("/instrumentation/nav[1]/volume", toheadset, 0.2 );
	}
	else {
	interpolate("/instrumentation/nav[1]/volume", 0.0, 0.2 );
	}
}
 setlistener("/sim/current-view/view-number", kursmp2audible);
 setlistener("an24/SPU-7/general_viewnr0", kursmp2audible);
 setlistener("an24/SPU-7/listen_viewnr0", kursmp2audible);
 setlistener("an24/SPU-7/general_viewnr8", kursmp2audible);
 setlistener("an24/SPU-7/listen_viewnr8", kursmp2audible);
 setlistener("an24/SPU-7/general_viewnr9", kursmp2audible);
 setlistener("an24/SPU-7/listen_viewnr9", kursmp2audible);
 setlistener("an24/SPU-7/general_viewnr10", kursmp2audible);
 setlistener("an24/SPU-7/listen_viewnr10", kursmp2audible);
 setlistener("an24/SPU-7/spu_radio_viewnr0", kursmp2audible);
 setlistener("an24/SPU-7/spu_radio_viewnr8", kursmp2audible);
 setlistener("an24/SPU-7/spu_radio_viewnr9", kursmp2audible);
 setlistener("an24/SPU-7/spu_radio_viewnr10", kursmp2audible);
 setlistener("an24/SPU-7/lc_source", kursmp2audible);
 setlistener("an24/SPU-7/rc_source", kursmp2audible);
 setlistener("an24/SPU-7/eng_source", kursmp2audible);
 setlistener("an24/SPU-7/nav_source", kursmp2audible);
 setlistener("an24/Kurs-MP/vor2-ark2", kursmp2audible);
 setlistener("instrumentation/nav[1]/serviceable", kursmp2audible);
