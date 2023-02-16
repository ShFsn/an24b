####################################################################
# Reset radio settings when swapping SP-50 <-> Kurs-MP
####################################################################
var resetradios = func {
	setprop("an24/SP-50/on", 0.0 );
	setprop("instrumentation/nav/serviceable", 0.0 );
	setprop("instrumentation/nav[1]/serviceable", 0.0 );
	setprop("instrumentation/nav/cdi/serviceable", 0.0 );
	setprop("instrumentation/nav/gs/serviceable", 0.0 );
	setprop("an24/Kurs-MP/vor1-ark1", -1.0 );
	setprop("an24/Kurs-MP/vor2-ark2", -1.0 );
	setprop("an24/Kurs-MP/sw_vor1on", 0.0 );
	setprop("an24/Kurs-MP/sw_vor2on", 0.0 );
	setprop("an24/Kurs-MP/signalisation", 0.0 );
}
 setlistener("an24/radio-equip", resetradios);

#####################################################################
# Kurs-MP No.1
#####################################################################
var mp1freq = func {
 var mhz1 = getprop("an24/Kurs-MP/mhz1");
 var dec1 = getprop("an24/Kurs-MP/dec1");
 var finalmp1freq = 108 + mhz1 + dec1;
 setprop("/instrumentation/nav[0]/frequencies/selected-mhz", finalmp1freq);
}
 setlistener("an24/Kurs-MP/mhz1", mp1freq);
 setlistener("an24/Kurs-MP/dec1", mp1freq);

var mp1azimut = func {
 var azim1 = getprop("instrumentation/nav/radials/selected-deg");
 var finalmp1azim10 = int(azim1/10);
 interpolate("an24/Kurs-MP/azim1_10", finalmp1azim10, 0.1);
 interpolate("an24/Kurs-MP/azim1_100", int(finalmp1azim10/10), 0.1);
}
 setlistener("instrumentation/nav/radials/selected-deg", mp1azimut);
 setlistener("sim/signals/fdm-initialized", mp1azimut);

#####################################################################
# Kurs-MP No.2
#####################################################################
var mp2freq = func {
 var mhz2 = getprop("an24/Kurs-MP/mhz2");
	if ( mhz2 == 10.0 ) mhz2 = 0.0;
 var dec2 = getprop("an24/Kurs-MP/dec2");
	if ( dec2 == 1.0 ) dec2 = 0.0;
 var finalmp2freq = 108 + mhz2 + dec2;
 setprop("/instrumentation/nav[1]/frequencies/selected-mhz", finalmp2freq);
}
 setlistener("an24/Kurs-MP/mhz2", mp2freq);
 setlistener("an24/Kurs-MP/dec2", mp2freq);

var mp2azimut = func {
 var azim2 = getprop("instrumentation/nav[1]/radials/selected-deg");
 var finalmp2azim10 = int(azim2/10);
 interpolate("an24/Kurs-MP/azim2_10", finalmp2azim10, 0.1);
 interpolate("an24/Kurs-MP/azim2_100", int(finalmp2azim10/10), 0.1);
}
 setlistener("instrumentation/nav[1]/radials/selected-deg", mp2azimut);
 setlistener("sim/signals/fdm-initialized", mp2azimut);
