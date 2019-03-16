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
#
# thickness of ice from -0.1cm (minus because element has no ice and is still warm) up to 1.5cm
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
	setprop("an24/Anti-Ice/conditions/icing", ((speed + humidity + abs(temperature) )/3) * temperature );

});
conditions.start();

########################
# Windows
# Front window A (center)
# Let's pretend the air is always hot and 50% left and 50% right of it reach the pipes
########################
var fronta_icing = maketimer(10, func() {
	var thickness = getprop("an24/Anti-Ice/elements/fronta_cm");
# divide by 10, because that results in factor 1 at full airflow (5 from left and 5 from right engine)
	var avg_airflow = (getprop("an24/URVK-18/airflowL") + getprop("an24/URVK-18/airflowR"))/10 ;
	var handles = ( (getprop("an24/Air-Cond/handle_left")*0.5) + (getprop("an24/Air-Cond/handle_right")*0.5)) * avg_airflow ;
	var cmpermin = getprop("an24/Anti-Ice/conditions/icing") - handles ;
	if ( (thickness < 1.5 and cmpermin > 0.0) or (thickness > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	interpolate("an24/Anti-Ice/elements/fronta_cm", thickness + (cmpermin/6*speedup), 9 );
#debug	setprop("an24/Anti-Ice/elements/cmperminA", cmpermin );
	}
});
fronta_icing.start();

########################
# Left front window B
# Let's pretend the air is always hot
# low window heat switch 0.25 (?W), intense 1.0 (?W), so full power 1.25; fantasy numbers, real ones need to be investigated
########################
var Lfrontb_icing = maketimer(10, func() {
        var thickness = getprop("an24/Anti-Ice/elements/frontbL_cm");
# divide by 10, because that results in factor 1 at full airflow (5 from left and 5 from right engine)
	var avg_airflow = (getprop("an24/URVK-18/airflowL") + getprop("an24/URVK-18/airflowR"))/10 ;
	var handleL = getprop("an24/Air-Cond/handle_left") * avg_airflow ;
	var elec_heatingL = getprop("an24/Anti-Ice/window_heating-left-low") + getprop("an24/Anti-Ice/window_heating-left-intense");

        var cmpermin = getprop("an24/Anti-Ice/conditions/icing") - handleL - elec_heatingL ;
	if ( (thickness < 1.5 and cmpermin > 0.0) or (thickness > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	interpolate("an24/Anti-Ice/elements/frontbL_cm", thickness + (cmpermin/6*speedup), 9 );
#debug	setprop("an24/Anti-Ice/elements/cmperminBL", cmpermin );
	}
});
Lfrontb_icing.start();

########################
# Right front window B
# Let's pretend the air is always hot
# low window heat switch 0.25 (?W), intense 1.0 (?W), so full power 1.25; fantasy numbers, real ones need to be investigated
########################
var Rfrontb_icing = maketimer(10, func() {
        var thickness = getprop("an24/Anti-Ice/elements/frontbR_cm");
# divide by 10, because that results in factor 1 at full airflow (5 from left and 5 from right engine)
	var avg_airflow = (getprop("an24/URVK-18/airflowL") + getprop("an24/URVK-18/airflowR"))/10 ;
	var handleR = getprop("an24/Air-Cond/handle_right") * avg_airflow ;
	var elec_heatingR = getprop("an24/Anti-Ice/window_heating-right-low") + getprop("an24/Anti-Ice/window_heating-right-intense");

        var cmpermin = getprop("an24/Anti-Ice/conditions/icing") - handleR - elec_heatingR ;
	if ( (thickness < 1.5 and cmpermin > 0.0) or (thickness > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	interpolate("an24/Anti-Ice/elements/frontbR_cm", thickness + (cmpermin/6*speedup), 9 );
#debug	setprop("an24/Anti-Ice/elements/cmperminBR", cmpermin );
	}
});
Rfrontb_icing.start();

########################
# Side windows C,D left
# Let's pretend the air is always hot
########################
var Lsidecd_icing = maketimer(10, func() {
        var thickness = getprop("an24/Anti-Ice/elements/sidecdL_cm");
# divide by 10, because that results in factor 1 at full airflow (5 from left and 5 from right engine)
	var avg_airflow = (getprop("an24/URVK-18/airflowL") + getprop("an24/URVK-18/airflowR"))/10 ;
	var handleL = getprop("an24/Air-Cond/handle_left") * avg_airflow ;

        var cmpermin = getprop("an24/Anti-Ice/conditions/icing") - handleL ;
	if ( (thickness < 1.5 and cmpermin > 0.0) or (thickness > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	interpolate("an24/Anti-Ice/elements/sidecdL_cm", thickness + (cmpermin/6*speedup), 9 );
#debug	setprop("an24/Anti-Ice/elements/cmpermincdL", cmpermin );
	}
});
Lsidecd_icing.start();


########################
# Windows C,D right
# Let's pretend the air is always hot
########################
var Rsidecd_icing = maketimer(10, func() {
        var thickness = getprop("an24/Anti-Ice/elements/sidecdR_cm");
# divide by 10, because that results in factor 1 at full airflow (5 from left and 5 from right engine)
	var avg_airflow = (getprop("an24/URVK-18/airflowL") + getprop("an24/URVK-18/airflowR"))/10 ;
	var handleR = getprop("an24/Air-Cond/handle_right") * avg_airflow ;

        var cmpermin = getprop("an24/Anti-Ice/conditions/icing") - handleR ;
	if ( (thickness < 1.5 and cmpermin > 0.0) or (thickness > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	interpolate("an24/Anti-Ice/elements/sidecdR_cm", thickness + (cmpermin/6*speedup), 9 );
#debug	setprop("an24/Anti-Ice/elements/cmpermincdR", cmpermin );
	}
});
Rsidecd_icing.start();

########################
# Navigator's and Engineer's windows
# Let's pretend the air is always hot, and as there's no valve in between...
########################
var sidenaveng_icing = maketimer(10, func() {
        var thickness_nav = getprop("an24/Anti-Ice/elements/sidenavL_cm");
        var thickness_eng = getprop("an24/Anti-Ice/elements/sideengR_cm");
# divide by 10, because that results in factor 1 at full airflow (5 from left and 5 from right engine)
	var avg_airflow = (getprop("an24/URVK-18/airflowL") + getprop("an24/URVK-18/airflowR"))/10 ;

        var cmpermin = getprop("an24/Anti-Ice/conditions/icing") - avg_airflow ;

	if ( (thickness_nav < 1.5 and cmpermin > 0.0) or (thickness_nav > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	interpolate("an24/Anti-Ice/elements/sidenavL_cm", thickness_nav + (cmpermin/6*speedup), 9 );
	}

	if ( (thickness_eng < 1.5 and cmpermin > 0.0) or (thickness_eng > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	interpolate("an24/Anti-Ice/elements/sideengR_cm", thickness_eng + (cmpermin/6*speedup), 9 );
#debug	setprop("an24/Anti-Ice/elements/cmperminnaveng", cmpermin );
	}
});
sidenaveng_icing.start();

########################
# Top windows
# Let's pretend there's always hot air
# They seem to have no heating, so let's just take something like cabin temp...
########################
var topwindows_icing = maketimer(10, func() {
        var thickness = getprop("an24/Anti-Ice/elements/topwindows_cm");
# divide by 10, because that results in factor 1 at full airflow (5 from left and 5 from right engine)
	var avg_airflow = (getprop("an24/URVK-18/airflowL") + getprop("an24/URVK-18/airflowR"))/10 ;

        var cmpermin = getprop("an24/Anti-Ice/conditions/icing") - avg_airflow ;
	if ( (thickness < 1.4 and cmpermin > 0.0) or (thickness > -0.1 and cmpermin < 0.0) ) {
	var speedup = getprop("/sim/speed-up");
	interpolate("an24/Anti-Ice/elements/topwindows_cm", thickness + (cmpermin/6*speedup), 9 );
#debug	setprop("an24/Anti-Ice/elements/cmpermintop", cmpermin );
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
