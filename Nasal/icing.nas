#setprop("an24/Anti-Ice/conditions/frost", 0 );
#setprop("an24/Anti-Ice/conditions/advection", 0.0 );

#var icing_condition = maketimer(1, func() {
#        var dewpoint = getprop("/environment/dewpoint-degc");
#        var temperature = getprop("/environment/temperature-degc");
#        var humidity = getprop("/environment/relative-humidity");
#        var speed = getprop("/velocities/airspeed-kt");
#	var speedup = getprop("/sim/speed-up");
#	if ( temperature < dewpoint < 0.0 ) {
#	var frost = 1;
#	}
#	else {
#	var frost = 0;
#	}
#	setprop("an24/Anti-Ice/conditions/frost", frost );
#	var advection = temperature * speed ;
#});
#icing_condition.start();

# Let's iron all properties to values from around 0-1 (temperature to -1 to 1) at extreme conditions:
# temp-degc -60 (1) to +60 (-1), effective-visibility-m 0 to 32000, airspeed-kt from 0 to 250 (VNE);
# finally, have icing become something between around -1 (ice melts fast) to around +1 (severe icing)
var conditions = maketimer(5, func() {
        var temperature = getprop("/environment/temperature-degc") / -60;
        var visibility = getprop("/environment/effective-visibility-m");
	if (visibility < 32000) {
        var humidity = 1.0 - (visibility/32000);
	}
	else {
	var humidity = 0.0;
	}
        var speed = abs(getprop("/velocities/airspeed-kt")) / 250;
	setprop("an24/Anti-Ice/conditions/temperature", temperature );
	setprop("an24/Anti-Ice/conditions/humidity", humidity );
	setprop("an24/Anti-Ice/conditions/speed", speed );
	setprop("an24/Anti-Ice/conditions/icing", ((speed + humidity + abs(temperature) )/3) * temperature );

});
conditions.start();

########################
# Windows
# Front window A (center)
# Let's pretend there's always hot air
########################
var fronta_icing = maketimer(10, func() {
        var thickness = getprop("an24/Anti-Ice/elements/fronta_cm");
        var cmpermin = getprop("an24/Anti-Ice/conditions/icing") - getprop("an24/Air-Cond/handle_left") - getprop("an24/Air-Cond/handle_right") ;
	if ( (thickness < 1.5 and cmpermin > 0.0) or (thickness > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	interpolate("an24/Anti-Ice/elements/fronta_cm", thickness + (cmpermin/6*speedup), 9 );
#	setprop("an24/Anti-Ice/elements/cmpermin", cmpermin );
	}
});
fronta_icing.start();

########################
# Left front window B
# Let's pretend there's always hot air
# low window heat switch 0.25 (?W), intense 1.0 (?W), so full power 1.25; fantasy numbers, real ones need to be investigated
########################
var Lfrontb_icing = maketimer(10, func() {
        var thickness = getprop("an24/Anti-Ice/elements/frontbL_cm");
        var cmpermin = getprop("an24/Anti-Ice/conditions/icing") - getprop("an24/Air-Cond/handle_left") - getprop("an24/Anti-Ice/window_heating-left-low") - getprop("an24/Anti-Ice/window_heating-left-intense") ;
	if ( (thickness < 1.5 and cmpermin > 0.0) or (thickness > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	interpolate("an24/Anti-Ice/elements/frontbL_cm", thickness + (cmpermin/6*speedup), 9 );
#	setprop("an24/Anti-Ice/elements/cmpermin", cmpermin );
	}
});
Lfrontb_icing.start();

########################
# Right front window B
# Let's pretend there's always hot air
# low window heat switch 0.25 (?W), intense 1.0 (?W), so full power 1.25; fantasy numbers, real ones need to be investigated
########################
var Rfrontb_icing = maketimer(10, func() {
        var thickness = getprop("an24/Anti-Ice/elements/frontbR_cm");
        var cmpermin = getprop("an24/Anti-Ice/conditions/icing") - getprop("an24/Air-Cond/handle_right") - getprop("an24/Anti-Ice/window_heating-right-low") - getprop("an24/Anti-Ice/window_heating-right-intense") ;
	if ( (thickness < 1.5 and cmpermin > 0.0) or (thickness > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	interpolate("an24/Anti-Ice/elements/frontbR_cm", thickness + (cmpermin/6*speedup), 9 );
#	setprop("an24/Anti-Ice/elements/cmpermin", cmpermin );
	}
});
Rfrontb_icing.start();

########################
# Side windows C,D left
# Let's pretend there's always hot air
########################
var Lsidecd_icing = maketimer(10, func() {
        var thickness = getprop("an24/Anti-Ice/elements/sidecdL_cm");
        var cmpermin = getprop("an24/Anti-Ice/conditions/icing") - getprop("an24/Air-Cond/handle_left") ;
	if ( (thickness < 1.5 and cmpermin > 0.0) or (thickness > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	interpolate("an24/Anti-Ice/elements/sidecdL_cm", thickness + (cmpermin/6*speedup), 9 );
#	setprop("an24/Anti-Ice/elements/cmpermin", cmpermin );
	}
});
Lsidecd_icing.start();


########################
# Windows C,D right
# Let's pretend there's always hot air
########################
var Rsidecd_icing = maketimer(10, func() {
        var thickness = getprop("an24/Anti-Ice/elements/sidecdR_cm");
        var cmpermin = getprop("an24/Anti-Ice/conditions/icing") - getprop("an24/Air-Cond/handle_right") ;
	if ( (thickness < 1.5 and cmpermin > 0.0) or (thickness > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	interpolate("an24/Anti-Ice/elements/sidecdR_cm", thickness + (cmpermin/6*speedup), 9 );
#	setprop("an24/Anti-Ice/elements/cmpermin", cmpermin );
	}
});
Rsidecd_icing.start();

########################
# Navigator's and Engineer's windows
# Let's pretend there's always hot air, and as there's no valve in between...
########################

########################
# Top windows
# Let's pretend there's always hot air
# They seem to have no heating, so let's just take something like cabin temp...
########################
var topwindows_icing = maketimer(10, func() {
        var thickness = getprop("an24/Anti-Ice/elements/topwindows_cm");
        var cmpermin = getprop("an24/Anti-Ice/conditions/icing") - ( (getprop("an24/Air-Cond/handle_right") + getprop("an24/Air-Cond/handle_right"))/4);
	if ( (thickness < 0.8 and cmpermin > 0.0) or (thickness > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	interpolate("an24/Anti-Ice/elements/topwindows_cm", thickness + (cmpermin/6*speedup), 9 );
#	setprop("an24/Anti-Ice/elements/cmpermin", cmpermin );
	}
});
topwindows_icing.start();

#############################################################################
# Pitots
#############################################################################
var pitots1s5a1_icing = maketimer(10, func() {
        var thickness = getprop("an24/Anti-Ice/elements/pitot_S1S5A1_cm");
        var cmpermin = getprop("an24/Anti-Ice/conditions/icing") - abs(getprop("an24/Anti-Ice/pitot_S1S5A1")) ;
	if ( (thickness < 1.0 and cmpermin > 0.0) or (thickness > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	interpolate("an24/Anti-Ice/elements/pitot_S1S5A1_cm", thickness + (cmpermin/6*speedup), 9 );
	}
	if ( thickness > 0.9 ) {
	setprop("/systems/static[0]/serviceable", 0 );
	setprop("/systems/static[4]/serviceable", 0 );
	setprop("/systems/pitot[0]/serviceable", 0 );
	}
	else {
	setprop("/systems/static[0]/serviceable", 1 );
	setprop("/systems/static[4]/serviceable", 1 );
	setprop("/systems/pitot[0]/serviceable", 1 );
	}
});
pitots1s5a1_icing.start();

var pitots3a2_icing = maketimer(10, func() {
        var thickness = getprop("an24/Anti-Ice/elements/pitot_S3A2_cm");
        var cmpermin = getprop("an24/Anti-Ice/conditions/icing") - abs(getprop("an24/Anti-Ice/pitot_S3A2")) ;
	if ( (thickness < 1.0 and cmpermin > 0.0) or (thickness > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	interpolate("an24/Anti-Ice/elements/pitot_S3A2_cm", thickness + (cmpermin/6*speedup), 9 );
	}
	if ( thickness > 0.9 ) {
	setprop("/systems/static[2]/serviceable", 0 );
	setprop("/systems/pitot[1]/serviceable", 0 );
	}
	else {
	setprop("/systems/static[2]/serviceable", 1 );
	setprop("/systems/pitot[1]/serviceable", 1 );
	}
});
pitots3a2_icing.start();

setprop("an24/Anti-Ice/elements/pitot_S2S6A3_cm", 0.0 );

var pitots2s6a3_icing = maketimer(10, func() {
        var thickness = getprop("an24/Anti-Ice/elements/pitot_S2S6A3_cm");
        var cmpermin = getprop("an24/Anti-Ice/conditions/icing") - abs(getprop("an24/Anti-Ice/pitot_S2S6A3")) ;
	if ( (thickness < 1.0 and cmpermin > 0.0) or (thickness > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	interpolate("an24/Anti-Ice/elements/pitot_S2S6A3_cm", thickness + (cmpermin/6*speedup), 9 );
	}
	if ( thickness > 0.9 ) {
	setprop("/systems/static[1]/serviceable", 0 );
	setprop("/systems/static[5]/serviceable", 0 );
	setprop("/systems/pitot[2]/serviceable", 0 );
	}
	else {
	setprop("/systems/static[1]/serviceable", 1 );
	setprop("/systems/static[5]/serviceable", 1 );
	setprop("/systems/pitot[2]/serviceable", 1 );
	}
});
pitots2s6a3_icing.start();

var pitots4s7_icing = maketimer(10, func() {
        var thickness = getprop("an24/Anti-Ice/elements/pitot_S4S7_cm");
        var cmpermin = getprop("an24/Anti-Ice/conditions/icing") - abs(getprop("an24/Anti-Ice/pitot_S4S7")) ;
	if ( (thickness < 1.0 and cmpermin > 0.0) or (thickness > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	interpolate("an24/Anti-Ice/elements/pitot_S4S7_cm", thickness + (cmpermin/6*speedup), 9 );
	}
	if ( thickness > 0.9 ) {
	setprop("/systems/static[3]/serviceable", 0 );
	setprop("/systems/static[6]/serviceable", 0 );
	}
	else {
	setprop("/systems/static[3]/serviceable", 1 );
	setprop("/systems/static[6]/serviceable", 1 );
	}
});
pitots4s7_icing.start();
