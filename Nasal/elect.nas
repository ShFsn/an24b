# sources
setprop("an24/Electrics/DC_Gen_18TMOl_V", 0.0 );
setprop("an24/Electrics/DC_Gen_18TMOr_V", 0.0 );
setprop("an24/Electrics/AC_Gen_GO16l_V", 0.0 );
setprop("an24/Electrics/AC_Gen_GO16r_V", 0.0 );
setprop("an24/Electrics/DC_Batt_12SAM_V", 24.8 );
setprop("an24/Electrics/DC_AUX_ShRAP500a_V", 0.0 ); # ?V DC AUX
setprop("an24/Electrics/DC_AUX_ShRAP500b_V", 0.0 ); 
setprop("an24/Electrics/AC_AUX_ShRAP200_V", 0.0 ); # 115V AC AUX

setprop("an24/Electrics/prop-heat_V", 0.0 );
setprop("an24/Electrics/main-bus_V", 0.0 );
setprop("an24/Electrics/aerodrome_V", 0.0 );
setprop("an24/Electrics/ap28_V", 102.0 );
setprop("an24/Electrics/emerg-bus_V", 102.0 );

setprop("an24/Electrical_Panel/go-16l_voltreg", 0.0 );
setprop("an24/Electrical_Panel/go-16r_voltreg", 0.0 );

setprop("engines/engine[0]/n1", 0.0 );
setprop("engines/engine[1]/n1", 0.0 );

## Battery discharge
var batt_discharge = maketimer(20, func(){
	var speedup = getprop("/sim/speed-up");
	var voltage = getprop("an24/Electrics/DC_Batt_12SAM_V");
	var charging = getprop("an24/Electrics/DC_Batt_12SAM_V");
	if ( voltage > 0 ) {
	var voltage = voltage - (speedup * 0.001);
	setprop("an24/Electrics/DC_Batt_12SAM_V", voltage);
	}
	else {
	batt_discharge.stop();
	}
});
batt_discharge.start();

## GO-16 AC Generators
var go16l = maketimer(1.0, func(){
	var enginel_n1 = getprop("engines/engine[0]/n1");
	var vs33l = getprop("an24/Electrical_Panel/go-16l_voltreg");
	interpolate("an24/Electrics/AC_Gen_GO16l_V", 1.2 * enginel_n1 + vs33l, 1.0 );
});
go16l.start();

var go16r = maketimer(1.0, func(){
	var enginer_n1 = getprop("engines/engine[1]/n1");
	var vs33r = getprop("an24/Electrical_Panel/go-16r_voltreg");
	interpolate("an24/Electrics/AC_Gen_GO16R_V", 1.2 * enginer_n1 + vs33r, 1.0 );
});
go16r.start();

#var go16l_ind = func {
#	if ( getprop("an24/Electrical_Panel/knob_ac_ind_sel") == 4 ) {
#	interpolate("an24/Electrical_Panel/vf-150", getprop("an24/Electrics/AC_Gen_GO16l_V") * getprop("an24/Electrical_Panel/ac_ind_anim"), 1.6 );
#	}
#}
#setlistener("an24/Electrical_Panel/knob_ac_ind_sel", go16l_ind, 0, 0);
#var go16check = {
#	if ( enginel_n1 > 50 ) {	
#	var enginel_n1 = getprop("engines/engine[0]/n1");
#	go16.start();
#	else {
#	go16.stop();
#	}

#setlistener("an24/Electrical_Panel/sw_stgl_coupled", bus_36V_AC_V);
