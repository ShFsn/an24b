# Sources
setprop("an24/Electrics/DC_Batt_12SAM1_V", 24.8 );
setprop("an24/Electrics/DC_Batt_12SAM2_V", 24.8 );
setprop("an24/Electrics/DC_Batt_12SAM1_V_out", 0.0 );
setprop("an24/Electrics/DC_Batt_12SAM2_V_out", 0.0 );
setprop("an24/Electrics/DC_AUX_ShRAP500a_V", 0.0 ); # ?V DC AUX
setprop("an24/Electrics/DC_AUX_ShRAP500b_V", 0.0 );
setprop("an24/Electrics/DC_AUX_ShRAP500a_V", 0.0 ); # ?V DC AUX
setprop("an24/Electrics/DC_AUX_ShRAP500b_V", 0.0 ); 
setprop("an24/Electrics/DC_Gen_18TMOl_V", 0.0 );
setprop("an24/Electrics/DC_Gen_18TMOr_V", 0.0 );
setprop("an24/Electrics/DC_Gen_GS-24_V", 0.0 );
setprop("an24/Electrics/AC_Gen_GO16l_V", 0.0 );
setprop("an24/Electrics/AC_Gen_GO16r_V", 0.0 );
setprop("an24/Electrics/AC_Gen_GO16l_V_out", 0.0 );
setprop("an24/Electrics/AC_Gen_GO16r_V_out", 0.0 );
setprop("an24/Electrics/AC_AUX_ShRAP200_V", 0.0 ); # 115V AC AUX
# Buses
setprop("an24/Electrics/AC_Bus_115V_main", 0.0 );
setprop("an24/Electrics/AC_Bus_115V_emerg", 0.0 );
#
setprop("an24/Electrics/prop-heat_V", 0.0 );
setprop("an24/Electrics/main-bus_V", 0.0 );
setprop("an24/Electrics/aerodrome_V", 0.0 );
setprop("an24/Electrics/ap28_V", 102.0 );
setprop("an24/Electrics/emerg-bus_V", 102.0 );

setprop("engines/engine[0]/n1", 0.0 );
setprop("engines/engine[1]/n1", 0.0 );
setprop("engines/engine[2]/n1", 0.0 );

setprop("an24/Electrical_Panel/add_go16l", 0.0 );

##############################
## Batteries (totally simplified!)
##############################
var batt1_discharge = maketimer(20, func(){
	var speedup = getprop("/sim/speed-up");
	var voltage = getprop("an24/Electrics/DC_Batt_12SAM1_V");
	if ( voltage > 0 ) {
	var voltage = voltage - (speedup * 0.001);
	}
	else {
	batt1_discharge.stop();
	}
});
batt1_discharge.start();

var batt2_discharge = maketimer(20, func(){
	var speedup = getprop("/sim/speed-up");
	var voltage = getprop("an24/Electrics/DC_Batt_12SAM2_V");
	if ( voltage > 0 ) {
	var voltage = voltage - (speedup * 0.001);
	}
	else {
	batt2_discharge.stop();
	}
});
batt2_discharge.start();

##############################
## STG-18 DC Generators
##############################
var stg18l_rand = rand() * 0.1 + 0.22; # 27V +-5V
var stg18l = maketimer(1.0, func(){
	var stg18l_out = stg18l_rand * getprop("engines/engine[0]/n1") * getprop("an24/Electrical_Panel/sw_stg18l") * getprop("an24/Electrical_Panel/stg-18l_voltreg");
	interpolate("an24/Electrics/DC_Gen_18TMOl_V", stg18l_out, 1.0 );
});

var stg18r_rand = rand() * 0.1 + 0.22; # 27V +-5V
var stg18r = maketimer(1.0, func(){
	var stg18r_out = stg18r_rand * getprop("engines/engine[1]/n1") * getprop("an24/Electrical_Panel/sw_stg18r") * getprop("an24/Electrical_Panel/stg-18r_voltreg");
	interpolate("an24/Electrics/DC_Gen_18TMOr_V", stg18r_out, 1.0 );
});

##############################
## GS-24 Generator of APU
##############################
var gs24_rand = rand() * 0.1 + 0.22; # 27V +-5V
var gs24 = maketimer(1.0, func(){
	var gs24_out = gs24_rand * getprop("engines/engine[2]/n1") * getprop("an24/Electrical_Panel/sw_gs24") * getprop("an24/Electrical_Panel/gs24_voltreg");
	interpolate("an24/Electrics/DC_Gen_GS-24_V", gs24_out, 1.0 );
});

##############################
## GO-16 AC Generators
##############################
var go16l_rand = rand() * 0.2 + 1.05; # 115V +-10V
var go16l = maketimer(1.0, func(){
	var go16l_work = go16l_rand * getprop("engines/engine[0]/n1") * getprop("an24/Electrical_Panel/sw_go16l") * getprop("an24/Electrical_Panel/go-16l_voltreg");
	interpolate("an24/Electrics/AC_Gen_GO16l_V", go16l_work, 1.0 );
	setprop("an24/Electrics/AC_Gen_GO16l_V_out", go16l_work * getprop("an24/Electrical_Panel/add_go16l") );
});

var go16r_rand = rand() * 0.2 + 1.05; # 115V +-10V
var go16r = maketimer(1.0, func(){
	var go16r_work = go16r_rand * getprop("engines/engine[1]/n1") * getprop("an24/Electrical_Panel/sw_go16r") * getprop("an24/Electrical_Panel/go-16r_voltreg");
	interpolate("an24/Electrics/AC_Gen_GO16r_V", go16r_work, 1.0 );
	setprop("an24/Electrics/AC_Gen_GO16r_V_out", go16r_work );
});

##############################
## 115/36V AC BUS
##############################
var AC_bus115V_main = func {
	if (getprop("an24/Electrics/AC_Gen_GO16l_V_out") > 70) {
	setprop("an24/Electrics/AC_Bus_115V_main", getprop("an24/Electrics/AC_Gen_GO16l_V_out") );
	}
	else {
	setprop("an24/Electrics/AC_Bus_115V_main", getprop("an24/Electrics/AC_Gen_GO16r_V_out") );
#	else if (getprop("an24/Electrics/AC_Gen_GO16r_V_out") < 70) {
	setprop("an24/Electrical_Panel/add_go16l", 0.0 );
	}
#	if (getprop("an24/Electrics/AC_Gen_GO16r_V_out") < 70) {
#	setprop("an24/Electrical_Panel/add_go16r", 0.0 );
#	}	
}
 setlistener("an24/Electrics/AC_Gen_GO16l_V", AC_bus115V_main);
 setlistener("an24/Electrics/AC_Gen_GO16r_V", AC_bus115V_main);
 setlistener("an24/Electrical_Panel/btn_add_go16l", AC_bus115V_main);
