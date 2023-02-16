#settimer(func { setprop("an24/Anti-Ice/environment-set", 1 ) }, 30);
#################################
# PU-24A(M) Panel; Prop (electrical) and VNA engine inlets (by hot air) heating
### D-2R: Set of timed microswitches
### SO-4: Icing sensors in VNA engine inlets
### DMR-600T: Differential Minimum Relais (used here to indicate working STG-18)
#################################
var d2r_timer = maketimer(1, func() {
	var dmr_l = getprop("an24/Electrics/contactorl") ; # STG-18 left DMR-600T
	var dmr_r = getprop("an24/Electrics/contactorr") ; # STG-18 right DMR-600T
	var so4l_signal = getprop("an24/Anti-Ice/so4l-signal");
	var so4r_signal = getprop("an24/Anti-Ice/so4r-signal");
	var d2r_time = getprop("an24/Anti-Ice/D2R_time");

	if ( dmr_l == 1 or dmr_r == 1 ) {
		var d2r_time = d2r_time + 1 ;
		setprop("an24/Anti-Ice/D2R_time", int(d2r_time) );

		if ( d2r_time > 144 ) {
			if ( so4l_signal == 1 or so4r_signal == 1 ) { 
			setprop("an24/Anti-Ice/D2R_time", 0 );
			}
			else {
			d2r_timer.stop();
			setprop("an24/Anti-Ice/D2R_time", 0 );
			}
		}
	}
	else {
	d2r_timer.stop();
	setprop("an24/Anti-Ice/D2R_time", 0 );
	}
});

var pu24panel = func() {
	var propheatmode = getprop("an24/Anti-Ice/propheat") ; # Mode switch (832); 1=Normal; 0=OFF; -1=Emergency
	var pu24_azs1 = getprop("an24/AZS/sw0408") ; # (840)
	var pu24_27Vnorm = getprop("an24/Electrics/AZSmain_V") ;
	var so4l_iced = getprop("an24/Anti-Ice/so-4_icedL") ; # Icing signalisator SO-4 (845) IS iced
	var so4r_iced = getprop("an24/Anti-Ice/so-4_icedR") ; # Icing signalisator SO-4 (844) IS iced
	var so4_check = getprop("an24/Anti-Ice/controlL-R") ; # Check-switch (830) PRETENDS that SO-4 signals ice
	var dmr_l = getprop("an24/Electrics/contactorl") ; # STG-18 left DMR-600T
	var dmr_r = getprop("an24/Electrics/contactorr") ; # STG-18 right DMR-600T

	if ( pu24_azs1 == 1.0 and pu24_27Vnorm > 24.0 and propheatmode == 1 ) {
		if ( so4l_iced == 1 or so4_check == -1 ) {
		setprop("an24/Anti-Ice/so4l-signal", 1 );
			if ( dmr_l == 1 ) {
			d2r_timer.start();
			}
			else if ( dmr_r == 0 ) {
			d2r_timer.stop();
			setprop("an24/Anti-Ice/D2R_time", 0 );
			}
		}
		else {
		setprop("an24/Anti-Ice/so4l-signal", 0 );
		}

		if ( so4r_iced == 1 or so4_check == 1 ) {
		setprop("an24/Anti-Ice/so4r-signal", 1 );
			if ( dmr_r == 1 ) {
			d2r_timer.start();
			}
			else if ( dmr_l == 0 ) {
			d2r_timer.stop();
			setprop("an24/Anti-Ice/D2R_time", 0 );
			}
		}
		else {
		setprop("an24/Anti-Ice/so4r-signal", 0 );
		}
	}

	else {
	setprop("an24/Anti-Ice/so4l-signal", 0 );
	setprop("an24/Anti-Ice/so4r-signal", 0 );
	d2r_timer.stop();
	setprop("an24/Anti-Ice/D2R_time", 0 );
	}
}
 setlistener("an24/Electrics/AZSmain_V", pu24panel, 1, 0);
 setlistener("an24/AZS/sw0408", pu24panel, 1, 0);
 setlistener("an24/Anti-Ice/propheat", pu24panel, 1, 0);
 setlistener("an24/Anti-Ice/so-4_icedL", pu24panel, 1, 0);
 setlistener("an24/Anti-Ice/so-4_icedR", pu24panel, 1, 0);
 setlistener("an24/Anti-Ice/controlL-R", pu24panel, 1, 0);
 setlistener("an24/Electrics/contactorl", pu24panel, 1, 0);
 setlistener("an24/Electrics/contactorr", pu24panel, 1, 0);

var propheating = func() {
	var propheatbus_power = getprop("an24/Electrics/RK115V_phIIa_V");
	var dmr2_l = getprop("an24/Electrics/contactorl");
	var dmr2_r = getprop("an24/Electrics/contactorr");
	var timer = getprop("an24/Anti-Ice/D2R_time");

	if ( propheatbus_power > 110 ) {
		if ( dmr2_l == 1 and ((timer > 0 and timer <= 24) or (timer > 48 and timer <= 72) or (timer > 96 and timer <= 120)) ) {
		setprop("an24/Anti-Ice/propheatL", 1 );
		}
		else {
		setprop("an24/Anti-Ice/propheatL", 0 );
		}

		if ( dmr2_r == 1 and ((timer > 24 and timer <= 48) or (timer > 72 and timer <= 96) or (timer > 120 and timer <= 144)) ) {
		setprop("an24/Anti-Ice/propheatR", 1 );
		}
		else {
		setprop("an24/Anti-Ice/propheatR", 0 );
		}
	}
	else {
	setprop("an24/Anti-Ice/propheatL", 0 );
	setprop("an24/Anti-Ice/propheatR", 0 );
	}
}
 setlistener("an24/Anti-Ice/D2R_time", propheating, 1, 0);
