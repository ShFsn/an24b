


var aircond = maketimer(2, func(){
## Simplified model of the cooling effect of the air-to-air-coolers behind the air inlets behind the propellers
#
	var airspeed_meter_per_s = getprop("velocities/airspeed-kt")*0.55 ;
	var density_kg_per_meter3 = getprop("environment/density-slugft3")*515 ;
	var env_temp_k_effect = 100/(getprop("environment/temperature-degc") + 273) ;
	var propind_v_meter_per_sL = getprop("fdm/jsbsim/propulsion/engine[0]/prop-induced-velocity_fps")*0.305 ;
	var propind_v_meter_per_sR = getprop("fdm/jsbsim/propulsion/engine[1]/prop-induced-velocity_fps")*0.305 ;
	var air_cooler_effectL = density_kg_per_meter3 * env_temp_k_effect * (airspeed_meter_per_s + propind_v_meter_per_sL) ;
	var air_cooler_effectR = density_kg_per_meter3 * env_temp_k_effect * (airspeed_meter_per_s + propind_v_meter_per_sR) ;
	setprop("an24/Air-Cond/cooler-testL", air_cooler_effectL );
	setprop("an24/Air-Cond/cooler-testR", air_cooler_effectR );
## Simplified model of the airflow from the compressor stages (bleed air)
#
	var airflowL = getprop("engines/engine[0]/n1") * getprop("an24/Air-Cond/bleedairL");
	var airflowR = getprop("engines/engine[1]/n1") * getprop("an24/Air-Cond/bleedairR");
	interpolate("an24/URVK-18/airflowL", airflowL/20, 2.0 );
	interpolate("an24/URVK-18/airflowR", airflowR/20, 2.0 );
});
 aircond.start();
