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

#var fgcomstuff = func {
#	var viewnr = getprop("/sim/current-view/view-number");
#	setprop("controls/radios/comm-radio-selected", getprop("an24/SPU-7/source_viewnr" ~ viewnr ~ "") );
# R-802 I (Comm 1)
#	if (getprop("controls/radios/comm-radio-selected") == 0 ) {
#	setprop("sim/multiplay/comm-transmit-frequency-hz", getprop("instrumentation/comm[0]/frequencies/selected-mhz") );
#	setprop("sim/multiplay/comm-transmit-power-norm", getprop("an24/R-802/transmit-power-w_1")/100 );
#	}
# US-8K Receiver/SVB-5 Transmitter
#	if (getprop("controls/radios/comm-radio-selected") == 1 ) {
#	setprop("sim/multiplay/comm-transmit-frequency-hz", getprop("an24/US-8K/band") );
#	setprop("sim/multiplay/comm-transmit-power-norm", getprop("an24/SVB-5/transmit-power-w")/100 );
#	}
# R-836; operator 0 = radio op, operator 1 = F/O
#	if (getprop("controls/radios/comm-radio-selected") == 2 ) {
#		if (getprop("an24/R-836/oprator") == 0 ) {
#		setprop("sim/multiplay/comm-transmit-frequency-hz", getprop("an24/R-836/channel_viewnr9") );
#		}
#		else {
#		setprop("sim/multiplay/comm-transmit-frequency-hz", getprop("an24/R-836/channel_viewnr8") );
#		}
#	setprop("sim/multiplay/comm-transmit-power-norm", getprop("an24/R-836/transmit-power-w")/100 );
#	}
# R-802 II (Comm 2)
#	if (getprop("controls/radios/comm-radio-selected") == 3 ) {
#	setprop("sim/multiplay/comm-transmit-frequency-hz", getprop("instrumentation/comm[1]/frequencies/selected-mhz") );
#	setprop("sim/multiplay/comm-transmit-power-norm", getprop("an24/R-802/transmit-power-w_2")/100 );
#	}
# ARK I Receiver (ADF 1)
#	if (getprop("controls/radios/comm-radio-selected") == 4 ) {
#	setprop("sim/multiplay/comm-transmit-frequency-hz", getprop("instrumentation/adf[0]/frequencies/selected-khz") );
#	setprop("sim/multiplay/comm-transmit-power-norm", 0.0 );
#	}
# ARK II Receiver (ADF 2)
#	if (getprop("controls/radios/comm-radio-selected") == 5 ) {
#	setprop("sim/multiplay/comm-transmit-frequency-hz", getprop("instrumentation/adf[1]/frequencies/selected-khz") );
#	setprop("sim/multiplay/comm-transmit-power-norm", 0.0 );
#	}
#}
# setlistener("/sim/current-view/view-number", fgcomstuff);
# setlistener("an24/SPU-7/source_viewnr0", fgcomstuff);
# setlistener("an24/SPU-7/source_viewnr8", fgcomstuff);
# setlistener("an24/SPU-7/source_viewnr9", fgcomstuff);
# setlistener("an24/SPU-7/source_viewnr10", fgcomstuff);
# setlistener("an24/R-802/memscrew", fgcomstuff);
# setlistener("an24/R-802/rememscrew", fgcomstuff);
# setlistener("an24/R-802/channel", fgcomstuff);
# setlistener("an24/R-802/finalfreq", fgcomstuff);
# setlistener("an24/R-802/finalfreq", fgcomstuff);
# setlistener("an24/R-836/channel_viewnr8", fgcomstuff);
# setlistener("an24/R-836/channel_viewnr9", fgcomstuff);
# setlistener("an24/R-836/operator", fgcomstuff);
# setlistener("an24/US-8K/band", fgcomstuff);
# setlistener("instrumentation/adf[0]/frequencies/selected-khz", fgcomstuff);
# setlistener("instrumentation/adf[1]/frequencies/selected-khz", fgcomstuff);

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
	if ( getprop("an24/SPU-7/source_viewnr" ~ viewnr ~ "") == 0.0 ) {
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
 setlistener("an24/SPU-7/source_viewnr0", r8021audible);
 setlistener("an24/SPU-7/source_viewnr8", r8021audible);
 setlistener("an24/SPU-7/source_viewnr9", r8021audible);
 setlistener("an24/SPU-7/source_viewnr10", r8021audible);
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
	if ( getprop("an24/SPU-7/source_viewnr" ~ viewnr ~ "") == 3.0 ) {
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
 setlistener("an24/SPU-7/source_viewnr0", r8022audible);
 setlistener("an24/SPU-7/source_viewnr8", r8022audible);
 setlistener("an24/SPU-7/source_viewnr9", r8022audible);
 setlistener("an24/SPU-7/source_viewnr10", r8022audible);
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
	if ( getprop("an24/Kurs-MP/vor1-ark1") == -1.0 and getprop("an24/SPU-7/source_viewnr" ~ viewnr ~ "") == 4.0 ) {
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
 setlistener("an24/SPU-7/source_viewnr0", ark1audible);
 setlistener("an24/SPU-7/source_viewnr8", ark1audible);
 setlistener("an24/SPU-7/source_viewnr9", ark1audible);
 setlistener("an24/SPU-7/source_viewnr10", ark1audible);
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
	if ( getprop("an24/Kurs-MP/vor2-ark2") == -1.0 and getprop("an24/SPU-7/source_viewnr" ~ viewnr ~ "") == 5.0 ) {
	var toheadset = volumeknob * getprop("an24/ARK-11/vol-2");
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
 setlistener("an24/SPU-7/source_viewnr0", ark2audible);
 setlistener("an24/SPU-7/source_viewnr8", ark2audible);
 setlistener("an24/SPU-7/source_viewnr9", ark2audible);
 setlistener("an24/SPU-7/source_viewnr10", ark2audible);
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
	if ( getprop("an24/Kurs-MP/vor1-ark1") == 1.0 and getprop("an24/SPU-7/source_viewnr" ~ viewnr ~ "") == 4.0 ) {
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
 setlistener("an24/SPU-7/source_viewnr0", kursmp1audible);
 setlistener("an24/SPU-7/source_viewnr8", kursmp1audible);
 setlistener("an24/SPU-7/source_viewnr9", kursmp1audible);
 setlistener("an24/SPU-7/source_viewnr10", kursmp1audible);
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
	if ( getprop("an24/Kurs-MP/vor2-ark2") == 1.0 and getprop("an24/SPU-7/source_viewnr" ~ viewnr ~ "") == 5.0 ) {
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
 setlistener("an24/SPU-7/source_viewnr0", kursmp2audible);
 setlistener("an24/SPU-7/source_viewnr8", kursmp2audible);
 setlistener("an24/SPU-7/source_viewnr9", kursmp2audible);
 setlistener("an24/SPU-7/source_viewnr10", kursmp2audible);
 setlistener("an24/Kurs-MP/vor2-ark2", kursmp2audible);
 setlistener("instrumentation/nav[1]/serviceable", kursmp2audible);
