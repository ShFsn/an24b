# sources
setprop("an24/Electrics/DC_Gen_18TMOl_V", 0.0 );
setprop("an24/Electrics/DC_Gen_18TMOr_V", 0.0 );
setprop("an24/Electrics/DC_Gen_GS-24_V", 0.0 );
setprop("an24/Electrics/AC_Gen_GO16l_V", 0.0 );
setprop("an24/Electrics/AC_Gen_GO16r_V", 0.0 );
setprop("an24/Electrics/DC_Batt_12SAM1_V", 24.8 );
setprop("an24/Electrics/DC_Batt_12SAM2_V", 24.8 );
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
setprop("an24/Electrical_Panel/stg-18l_voltreg", 0.0 );
setprop("an24/Electrical_Panel/stg-18r_voltreg", 0.0 );
setprop("an24/Electrical_Panel/gs-24_voltreg", 0.0 );

setprop("engines/engine[0]/n1", 0.0 );
setprop("engines/engine[1]/n1", 0.0 );
setprop("engines/engine[2]/n1", 0.0 );

# DC Sources
## Battery discharge (totally simplified!)
var batt1_discharge = maketimer(20, func(){
	var speedup = getprop("/sim/speed-up");
	var voltage = getprop("an24/Electrics/DC_Batt_12SAM1_V");
	if ( voltage > 0 ) {
	var voltage = voltage - (speedup * 0.001);
	setprop("an24/Electrics/DC_Batt_12SAM1_V", voltage);
	}
	else {
	batt_discharge.stop();
	}
});
batt1_discharge.start();

var batt2_discharge = maketimer(20, func(){
	var speedup = getprop("/sim/speed-up");
	var voltage = getprop("an24/Electrics/DC_Batt_12SAM2_V");
	if ( voltage > 0 ) {
	var voltage = voltage - (speedup * 0.001);
	setprop("an24/Electrics/DC_Batt_12SAM2_V", voltage);
	}
	else {
	batt_discharge.stop();
	}
});
batt2_discharge.start();

## STG-18 DC Generators
var stg18l = maketimer(1.0, func(){
	var enginel_n1 = getprop("engines/engine[0]/n1");
	var vs25l = getprop("an24/Electrical_Panel/stg-18l_voltreg");
	interpolate("an24/Electrics/DC_Gen_18TMOl_V", 0.275 * enginel_n1 + vs25l, 1.0 );
});
stg18l.start();

var stg18r = maketimer(1.0, func(){
	var enginer_n1 = getprop("engines/engine[1]/n1");
	var vs25r = getprop("an24/Electrical_Panel/stg-18r_voltreg");
	interpolate("an24/Electrics/DC_Gen_18TMOr_V", 0.275 * enginer_n1 + vs25r, 1.0 );
});
stg18r.start();

var gs24 = maketimer(1.0, func(){
	var gs24_n1 = getprop("engines/engine[2]/n1");
	var vs25gs = getprop("an24/Electrical_Panel/gs-24_voltreg");
	interpolate("an24/Electrics/DC_Gen_GS-24_V", 0.4 * gs24_n1 + vs25gs, 1.0 );
});
gs24.start();

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
