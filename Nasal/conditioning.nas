setprop("an24/Air-Cond/mix-valveL", 0);
setprop("an24/Air-Cond/mix-valveR", 0);

var aircond_left = func {
#	if ( getprop("aux-air-supply") == 1.0 ) {
#	var airintake_left = getprop("aux-air-supply-temp";
#	}
#	else {
	var air_air_cooler_effectL =  getprop("fdm/jsbsim/propulsion/engine/prop-induced-velocity_fps") / (getprop("/environment/temperature-degc") + 273);
#	}
	var engineair_temp_kelvinL = engtemp-c + 273;
}
