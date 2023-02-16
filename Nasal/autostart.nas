# Simple autostart

var step = 0;

var startup = func {
setprop("an24/AChS/mp_wind_up", 1000 );
setprop("an24/AChS/nav_wind_up", 1000 );
setprop("an24/AChS/rc_wind_up", 1000 );
	 	step = 1;
	 	t = 0.0;

		screen.log.write("AZS circuit-breaker panel and batteries", 1, 1, 1);
		setprop("an24/RKCrew/sw01_batt1", 1.0 );
		setprop("an24/RKCrew/sw02_batt2", 1.0 );
		setprop("an24/RKCrew/sw03_pt-1000", 1.0 );
		
		setprop("an24/AZS/sw0101", 1.0 );
		setprop("an24/AZS/sw0102", 1.0 );
		setprop("an24/AZS/sw0103", 1.0 );
	 	t += 0.2;

		settimer( func{
		setprop("an24/AZS/sw0104", 1.0 );
		setprop("an24/AZS/sw0105", 1.0 );
		setprop("an24/AZS/sw0106", 1.0 );
		}, t); t += 0.2;

	 	settimer( func{
		setprop("an24/AZS/sw0108", 1.0 );
		setprop("an24/AZS/sw0109", 1.0 );
		}, t); t += 0.2;

	 	settimer( func{
        	setprop("an24/AZS/sw0110", 1.0 );
        	setprop("an24/AZS/sw0111", 1.0 );
        	setprop("an24/AZS/sw0112", 1.0 );
		}, t); t += 0.2;

	 	settimer( func{
		setprop("an24/AZS/sw0113", 1.0 );
		setprop("an24/AZS/sw0114", 1.0 );
		setprop("an24/AZS/sw0115", 1.0 );
		}, t); t += 0.2;

	 	settimer( func{
		setprop("an24/AZS/sw0116", 1.0 );
		setprop("an24/AZS/sw0117", 1.0 );
		setprop("an24/AZS/sw0118", 1.0 );
		}, t); t += 0.2;
#
#
#
	 	settimer( func{
		setprop("an24/AZS/sw0201", 1.0 );
		setprop("an24/AZS/sw0202", 1.0 );
		setprop("an24/AZS/sw0203", 1.0 );
		}, t); t += 0.15;

		settimer( func{
		setprop("an24/AZS/sw0204", 1.0 );
		setprop("an24/AZS/sw0205", 1.0 );
		setprop("an24/AZS/sw0206", 1.0 );
		}, t); t += 0.15;

		settimer( func{
		setprop("an24/AZS/sw0207", 1.0 );
		setprop("an24/AZS/sw0208", 1.0 );
		setprop("an24/AZS/sw0209", 1.0 );
		}, t); t += 0.15;

	 	settimer( func{
		setprop("an24/AZS/sw0210", 1.0 );
		setprop("an24/AZS/sw0211", 1.0 );
		setprop("an24/AZS/sw0212", 1.0 );
		}, t); t += 0.15;

		settimer( func{
		setprop("an24/AZS/sw0213", 1.0 );
		setprop("an24/AZS/sw0214", 1.0 );
		setprop("an24/AZS/sw0215", 1.0 );
		}, t); t += 0.15;

		settimer( func{
		setprop("an24/AZS/sw0216", 1.0 );
		setprop("an24/AZS/sw0217", 1.0 );
		setprop("an24/AZS/sw0218", 1.0 );
		}, t); t += 0.15;
#
#
#
	 	settimer( func{
		setprop("an24/AZS/sw0301", 1.0 );
		setprop("an24/AZS/sw0302", 1.0 );
		setprop("an24/AZS/sw0303", 1.0 );
		}, t); t += 0.1;

	 	settimer( func{
		setprop("an24/AZS/sw0304", 1.0 );
		setprop("an24/AZS/sw0305", 1.0 );
		setprop("an24/AZS/sw0306", 1.0 );
		}, t); t += 0.1;

	 	settimer( func{
		setprop("an24/AZS/sw0308", 1.0 );
		setprop("an24/AZS/sw0309", 1.0 );
		}, t); t += 0.1;

		settimer( func{
		setprop("an24/AZS/sw0310", 1.0 );
		setprop("an24/AZS/sw0312", 1.0 );
		}, t); t += 0.1;

		settimer( func{
		setprop("an24/AZS/sw0313", 1.0 );
		setprop("an24/AZS/sw0314", 1.0 );
		setprop("an24/AZS/sw0315", 1.0 );
		}, t); t += 0.1;

		settimer( func{
		setprop("an24/AZS/sw0316", 1.0 );
		setprop("an24/AZS/sw0317", 1.0 );
		setprop("an24/AZS/sw0318", 1.0 );
		}, t); t += 0.1;
#
#
#
	 	settimer( func{
		setprop("an24/AZS/sw0401", 1.0 );
		setprop("an24/AZS/sw0402", 1.0 );
		setprop("an24/AZS/sw0403", 1.0 );
		}, t); t += 0.1;

	 	settimer( func{
		setprop("an24/AZS/sw0404", 1.0 );
		setprop("an24/AZS/sw0406", 1.0 );
		}, t); t += 0.1;

	 	settimer( func{
		setprop("an24/AZS/sw0407", 1.0 );
		setprop("an24/AZS/sw0408", 1.0 );
		setprop("an24/AZS/sw0409", 1.0 );
		}, t); t += 0.1;

		settimer( func{
		setprop("an24/AZS/sw0410", 1.0 );
		setprop("an24/AZS/sw0411", 1.0 );
		setprop("an24/AZS/sw0412", 1.0 );
		}, t); t += 0.1;

		settimer( func{
		setprop("an24/AZS/sw0413", 1.0 );
		setprop("an24/AZS/sw0414", 1.0 );
		setprop("an24/AZS/sw0415", 1.0 );
		}, t); t += 0.1;

		settimer( func{
		setprop("an24/AZS/sw0416", 1.0 );
		setprop("an24/AZS/sw0417", 1.0 );
		setprop("an24/AZS/sw0418", 1.0 );
		}, t); t += 0.1;
#
#
#
	 	settimer( func{
		setprop("an24/AZS/sw0504", 1.0 );
		setprop("an24/AZS/sw0506", 1.0 );
		}, t); t += 0.1;

	 	settimer( func{
		setprop("an24/AZS/sw0507", 1.0 );
		setprop("an24/AZS/sw0508", 1.0 );
		setprop("an24/AZS/sw0509", 1.0 );
		}, t); t += 0.2;

	 	settimer( func{
		setprop("an24/AZS/sw0510", 1.0 );
		setprop("an24/AZS/sw0511", 1.0 );
		setprop("an24/AZS/sw0512", 1.0 );
		}, t); t += 0.1;

		settimer( func{
		setprop("an24/AZS/sw0513", 1.0 );
		setprop("an24/AZS/sw0514", 1.0 );
		setprop("an24/AZS/sw0515", 1.0 );
		}, t); t += 0.1;

		settimer( func{
		setprop("an24/AZS/sw0516", 1.0 );
		setprop("an24/AZS/sw0517", 1.0 );
		setprop("an24/AZS/sw0518", 1.0 );
		}, t); t += 0.1;
#
#
#
	 	settimer( func{
		setprop("an24/AZS/sw0602", 1.0 );
		setprop("an24/AZS/sw0603", 1.0 );
		}, t); t += 0.1;

	 	settimer( func{
		setprop("an24/AZS/sw0604", 1.0 );
		setprop("an24/AZS/sw0605", 1.0 );
		}, t); t += 0.2;

	 	settimer( func{
		setprop("an24/AZS/sw0608", 1.0 );
		setprop("an24/AZS/sw0609", 1.0 );
		}, t); t += 0.1;

		settimer( func{
		setprop("an24/AZS/sw0610", 1.0 );
		setprop("an24/AZS/sw0611", 1.0 );
		setprop("an24/AZS/sw0612", 1.0 );
		}, t); t += 0.1;

		settimer( func{
		setprop("an24/AZS/sw0613", 1.0 );
		setprop("an24/AZS/sw0614", 1.0 );
		setprop("an24/AZS/sw0615", 1.0 );
		}, t); t += 0.1;

		settimer( func{
		setprop("an24/AZS/sw0616", 1.0 );
		setprop("an24/AZS/sw0617", 1.0 );
		setprop("an24/AZS/sw0618", 1.0 );
		}, t); t += 0.1;
#
#
#
	 	settimer( func{
		setprop("an24/AZS/sw0701", 1.0 );
		setprop("an24/AZS/sw0702", 1.0 );
		setprop("an24/AZS/sw0703", 1.0 );
		}, t); t += 0.08;

	 	settimer( func{
		setprop("an24/AZS/sw0704", 1.0 );
		setprop("an24/AZS/sw0705", 1.0 );
		setprop("an24/AZS/sw0706", 1.0 );
		}, t); t += 0.08;

	 	settimer( func{
		setprop("an24/AZS/sw0707", 1.0 );
		setprop("an24/AZS/sw0708", 1.0 );
		setprop("an24/AZS/sw0709", 1.0 );
		}, t); t += 0.08;

		settimer( func{
		setprop("an24/AZS/sw0710", 1.0 );
		setprop("an24/AZS/sw0711", 1.0 );
		setprop("an24/AZS/sw0712", 1.0 );
		}, t); t += 0.08;

		settimer( func{
		setprop("an24/AZS/sw0713", 1.0 );
		setprop("an24/AZS/sw0714", 1.0 );
		setprop("an24/AZS/sw0715", 1.0 );
		}, t); t += 0.08;

		settimer( func{
		setprop("an24/AZS/sw0716", 1.0 );
		setprop("an24/AZS/sw0717", 1.0 );
		setprop("an24/AZS/sw0718", 1.0 );
		}, t); t += 0.08;

# Fuel System
		settimer( func{
		screen.log.write("Fuel System", 1, 1, 1);
		setprop("an24/FuelControl/sw0402", 1.0 );
		}, t); t += 0.3;

		settimer( func{
		setprop("an24/FuelControl/sw0403", 1.0 );
		setprop("an24/FuelControl/lrear463_press", 0.16 );
		setprop("an24/FuelControl/lfront463_press", 0.16 );
		}, t); t += 0.2;

		settimer( func{
		setprop("an24/FuelControl/sw0405", 1.0 );
		setprop("an24/FuelControl/rrear463_press", 0.16 );
		setprop("an24/FuelControl/rfront463_press", 0.16 );
		}, t); t += 0.3;

		settimer( func{
		setprop("an24/FuelControl/sw0406", 1.0 );
		}, t); t += 0.3;

		settimer( func{
		setprop("an24/FuelControl/sw0401", 0.0 );
		setprop("an24/FuelControl/cutoff-l-by-sw", 0.0 );
		setprop("controls/engines/engine[0]/cutoff", 0 );
		}, t); t += 0.8;

		settimer( func{
		setprop("an24/FuelControl/sw0407", 0.0 );
		setprop("an24/FuelControl/cutoff-r-by-sw", 0.0 );
		setprop("controls/engines/engine[1]/cutoff", 0 );
		}, t); t += 0.2;

# Fire protect system check
		settimer( func{
		interpolate("an24/FireFeather/main", -1.0, 1.2 );
		setprop("an24/FireFeather/mainresetdone", 1.0 );
#
		if ( getprop("an24/FireFeather/sw_main") == 0.0 ) {
		settimer(func {interpolate("an24/FireFeather/sw_main", -1.0, 0.1);}, 0.4);
		interpolate("an24/FireFeather/lock_main", -1.0, 0.3 );
		}
		else if ( getprop("an24/FireFeather/sw_main") == 1.0 ) {
		interpolate("an24/FireFeather/sw_main", 0.0, 0.1, 0.0, 1.1, -1.0, 0,1 );
		settimer(func {interpolate("an24/FireFeather/lock_main", 0.0, 0.3, 0.0, 0.2, -1.0, 0.3);}, 0.2);
		}
		}, t); t += 2.0;

# Aerodrome power and electrical panel
		settimer( func{
		screen.log.write("Aerodrome power, preparing electrical system", 1, 1, 1);
		interpolate("an24/Electrics/DC_AUX_ShRAP500a_V", 28.2, 0.2 );
		setprop("sim/gui/an24b/shrap500a", 1);
		interpolate("an24/Electrics/DC_AUX_ShRAP500b_V", 24.9, 0.2 );
		setprop("sim/gui/an24b/shrap500b", 1);

		setprop("an24/AC_Panel/sw_PO-750_earth-air", 0.0 );
		interpolate("an24/Electrical_Panel/sw_po-750", 1.0, 0.1 );
		setprop("an24/Electrics/PO-750", 1 );
		interpolate("an24/Electrical_Panel/sw_pt-1000", 1.0, 0.1 );
		interpolate("an24/Electrical_Panel/sw_board-aerodrome", -1.0, 0.1 );
		setprop("an24/Electrics/board-aerodrome", -1.0 );
		interpolate("an24/Electrical_Panel/sw_emerg-bus", -1.0, 0.1 );

		interpolate("an24/Electrical_Panel/vf-150_go-16l", 1.0, 0.6 );
		interpolate("an24/Electrical_Panel/vf-150_go-16r", 0.0, 0.5 );
		interpolate("an24/Electrical_Panel/vf-150_ap28", 0.0, 0.7 );
		interpolate("an24/Electrical_Panel/vf-150_emerg-bus", 0.0, 0.5 );
		interpolate("an24/Electrical_Panel/vf-150_prop-heat", 0.0, 0.7 );
		interpolate("an24/Electrical_Panel/vf-150_main-bus", 0.0, 0.5 );
		interpolate("an24/Electrical_Panel/vf-150_aerodrome", 0.0, 0.7 );
		setprop("an24/Electrical_Panel/knob_vf-150_anim", 30 );

		interpolate("an24/Electrical_Panel/v-1_ar1", 0.0, 0.7 );
		interpolate("an24/Electrical_Panel/v-1_ar2", 0.0, 0.5 );
		interpolate("an24/Electrical_Panel/v-1_akk1", 0.0, 0.7 );
		interpolate("an24/Electrical_Panel/v-1_akk2", 0.0, 0.5 );
		interpolate("an24/Electrical_Panel/v-1_gs-24", 0.0, 0.7 );
		interpolate("an24/Electrical_Panel/v-1_stg18l", 1.0, 0.7 );
		interpolate("an24/Electrical_Panel/v-1_stg18r", 0.0, 0.5 );
		interpolate("an24/Electrical_Panel/v-1_tsrul", 0.0, 0.5 );
		interpolate("an24/Electrical_Panel/v-1_tsrur", 0.0, 0.7 );
		interpolate("an24/Electrical_Panel/v-1_emerg", 0.0, 0.7 );
		setprop("an24/Electrical_Panel/dc_ind_source", 6.0 );
		}, t); t += 2.0;

# Fire protect system ON
		settimer( func{
		interpolate("an24/FireFeather/main", 1.0, 1.2 );
#
		if ( getprop("an24/FireFeather/sw_main") == 0.0 ) {
		settimer(func {interpolate("an24/FireFeather/sw_main", 1.0, 0.1);}, 0.4);
		interpolate("an24/FireFeather/lock_main", 1.0, 0.3 );
		}
		else if ( getprop("an24/FireFeather/sw_main") == -1.0 ) {
		interpolate("an24/FireFeather/sw_main", 0.0, 0.1, 0.0, 1.1, 1.0, 0,1 );
		settimer(func {interpolate("an24/FireFeather/lock_main", 0.0, 0.3, 0.0, 0.2, 1.0, 0.3);}, 0.2);
		}
		}, t); t += 2.0;

# Left engine start
		settimer( func{
		screen.log.write("Left engine start", 1, 1, 1);
		setprop("an24/Start-Panel/left-right", '0' ); # needs to be a string to pass it to electrical.nas
		interpolate("an24/Start-Panel/left-right_sw", 0.0, 0.1 );
		interpolate("an24/Start-Panel/startai24-btn", 1.0, 0.3, 0.0, 0.2 );
		enginestart.apdtimer.start();

		setprop("an24/FuelControl/flow-meter", 1.0 );
		setprop("an24/FuelControl/sw_flow-meter", 1.0 );
		}, t); t += 2.5;

# Switches, switches, switches...
		settimer( func{
		screen.log.write("Meanwhile initialize AGDs, EUP, CGV etc...", 1, 1, 1);
		interpolate("an24/AGD/sw_agd-l", 1.0, 0.1 );
		interpolate("an24/AGD/sw_agd-r", 1.0, 0.1 );
		interpolate("an24/PPS/light-test-knob", 1.0, 0.2, 1.0, 0.3, 0.0, 0.2 );
		interpolate("an24/PPS/lighting", 1.0, 0.2, 1.0, 0.3, 0.0, 0.2, 0.0, 0.4, 1.0, 0.4 );
		}, t); t += 0.2;

		settimer( func{
		interpolate("an24/EUP-53/sw_eup", 1.0, 0.1 );
		setprop("an24/SP-50/on", 1.0 );
		setprop("instrumentation/nav/serviceable", 1.0 );
		setprop("instrumentation/nav/cdi/serviceable", 1.0 );
		setprop("instrumentation/nav/gs/serviceable", 1.0 );
		if (getprop("an24/radio-equip") == "Kurs-MP" ) {
		setprop("an24/Kurs-MP/sw_vor1on", 1.0 );
		}
		}, t); t += 0.2;

		settimer( func{
		setprop("an24/instrumentation/cgv", 1.0 );
		setprop("an24/instrumentation/sw_cgv", 1.0 );
		}, t); t += 0.2;

		settimer( func{
		screen.log.write("...and compasses GIK and GPK", 1, 1, 1);
		setprop("an24/GIK-1/sw_gik-1", 1.0 );
		}, t); t += 0.2;

		settimer( func{
		interpolate("an24/GPK-52/sw_gpk", 1.0, 0.1 );
		interpolate("an24/GPK-52/sw_ctrl", 1.0, 0.1 );
		}, t); t += 0.2;

		settimer( func{
		screen.log.write("Now aligning GIK...", 1, 1, 1);
		interpolate("an24/GIK-1/delta-heading", 0.0, 3.0 );
		}, t); t += 2.0;

		settimer( func{
		screen.log.write("...and align GPK with GIK heading and set latitude", 1, 1, 1);

		interpolate("an24/GPK-52/lat-nut", getprop("position/latitude-deg"), 3.0 );
		}, t); t += 4.0;

# Left engine-start stop and some more electrical panel stuff
		settimer( func{
		interpolate("an24/GPK-52/init-error-deg",0.0 , 3.0 );
	        interpolate("an24/Electrical_Panel/sw_go16l", 1.0, 0.1 );
		enginestart.apdtimer.stop();
		setprop("an24/Electrics/StartCircuit/apdtime", 0 );
		setprop("controls/electric/engine[0]/generator", 0 );
		setprop("controls/engines/engine[0]/starter", 0);
# Transponder
		screen.log.write("Transponder Low Sense, Mode C, SQUAWk 4630", 1, 1, 1);
		setprop("instrumentation/transponder/serviceable", 1 );
		setprop("instrumentation/transponder/inputs/serviceable", 1 );
		setprop("instrumentation/transponder/inputs/sensitivity", 0 );
		setprop("instrumentation/transponder/inputs/knob-mode", 3 );
		setprop("instrumentation/transponder/inputs/anim-knob-mode", 2 );
		setprop("instrumentation/transponder/inputs/digit[3]", 4 );
		setprop("instrumentation/transponder/inputs/digit[2]", 6 );
		setprop("instrumentation/transponder/inputs/digit[1]", 3 );
		setprop("instrumentation/transponder/inputs/digit", 0 );
		}, t); t += 2.0;

# Engine start right
		settimer( func{
		screen.log.write("Right engine start", 1, 1, 1);
		setprop("an24/Start-Panel/left-right", '1' ); # needs to be a string to pass it to electrical.nas
		interpolate("an24/Start-Panel/left-right_sw", 1.0, 0.1 );
		interpolate("an24/Start-Panel/startai24-btn", 1.0, 0.3, 0.0, 0.2 );
		enginestart.apdtimer.start();
		}, t); t += 0.5;

		settimer( func{
		screen.log.write("Power on autopilot AP-28L1", 1, 1, 1);
		interpolate("an24/AP-28l1/sw_power", 1.0, 0.1 );
		setprop("an24/AP-28l1/internal/powered", 1 );
		interpolate("an24/AP-28l1/sw_pitch", 1.0, 0.1 );
		interpolate("an24/AP-28l1/sw_autotrim", 1.0, 0.1 );
		}, t); t += 10.0;

		settimer( func{
		screen.log.write("Fuel indicators ON and to sum", 1, 1, 1);
		setprop("an24/FuelControl/fuel-meter-l", 1.0 );
		setprop("an24/FuelControl/fuel-meter-r", 1.0 );
		}, t); t += 1.0;

		settimer( func{
		screen.log.write("Setting RTMS fuel-flow counters", 1, 1, 1);
		interpolate("an24/RTMS/fuel-offset-l", (getprop("/consumables/fuel/tank/level-kg") + getprop("/consumables/fuel/tank[1]/level-kg") + getprop("/consumables/fuel/tank[2]/level-kg")) * -2.2, 4.4 );
		interpolate("an24/RTMS/fuel-offset-r", (getprop("/consumables/fuel/tank[3]/level-kg") + getprop("/consumables/fuel/tank[4]/level-kg") + getprop("/consumables/fuel/tank[5]/level-kg")) * -2.2, 4.2 );
		interpolate("an24/PG4and2PPT1/selected-ind", -18.0, 0.1 );
		}, t); t += 1.0;

# Some more electrical panel stuff
		settimer( func{
	        interpolate("an24/Electrical_Panel/sw_go16r", 1.0, 0.1 );
		}, t); t += 2.0;

# SPU and Radios and stuff
		settimer( func{
		screen.log.write("SPU-7 Comm device and R-802 Radios ON and Volume set", 1, 1, 1);
		setprop("an24/SPU-7/spu_radio_viewnr0", 0.0 );
		interpolate("an24/SPU-7/sw_spu_radio_viewnr8", 0.0, 0.1 );
		setprop("an24/SPU-7/spu_radio_viewnr0", 0.0 );
		interpolate("an24/SPU-7/sw_spu_radio_viewnr8", 0.0, 0.1 );
		setprop("an24/SPU-7/spu_radio_viewnr9", 1.0 );
		interpolate("an24/SPU-7/sw_spu_radio_viewnr9", 1.0, 0.1 );
		setprop("an24/SPU-7/spu_radio_viewnr10", 0.0 );
		interpolate("an24/SPU-7/sw_spu_radio_viewnr10", 0.0, 0.1 );
		interpolate("an24/SPU-7/listen_viewnr0", 0.5, 0.4 );
		interpolate("an24/SPU-7/listen_viewnr8", 0.5, 0.4 );
		interpolate("an24/SPU-7/listen_viewnr9", 0.5, 0.4 );
		interpolate("an24/SPU-7/listen_viewnr10", 0.5, 0.4 );
		interpolate("an24/SPU-7/general_viewnr0", 1.0, 0.8 );
		interpolate("an24/SPU-7/general_viewnr8", 1.0, 0.8 );
		interpolate("an24/SPU-7/general_viewnr9", 1.0, 0.8 );
		interpolate("an24/SPU-7/general_viewnr10", 1.0, 0.8 );
		setprop("an24/SPU-7/nav_source", 4.0 );
		}, t); t += 0.5;

		settimer( func{
		screen.log.write("Set flaps to T/O - 15 degrees ", 1, 1, 1);
		interpolate("/controls/flight/flaps/", 0.4033333, 4.0 );
		}, t); t += 5.0;

# STG-18 to net
		settimer( func{
		if ( getprop("an24/Electrics/DC_Gen_18TMOl_V") > 24.0 ) {
		setprop("an24/Electrical_Panel/stg-18l_voltreg", 28/getprop("an24/Electrics/DC_Gen_18TMOl_V") );
		interpolate("an24/Electrical_Panel/sw_stg18l", 1.0, 0.1 );
		}
		if ( getprop("an24/Electrics/DC_Gen_18TMOr_V") > 24.0 ) {
		setprop("an24/Electrical_Panel/stg-18r_voltreg", 28/getprop("an24/Electrics/DC_Gen_18TMOr_V") );
		interpolate("an24/Electrical_Panel/sw_stg18r", 1.0, 0.1 );
		}
		}, t); t += 5.0;

# Aerodrome power off, board sources to boardnet
		settimer( func{
		interpolate("an24/Electrics/DC_AUX_ShRAP500a_V", 0.0, 0.2 );
		setprop("sim/gui/an24b/shrap500a", 0);
		interpolate("an24/Electrics/DC_AUX_ShRAP500b_V", 0.0, 0.2 );
		setprop("sim/gui/an24b/shrap500b", 0);
		interpolate("an24/Electrical_Panel/sw_board-aerodrome", 0.0, 0.1, 0.0, 0.7, 1.0, 0.1 );
		interpolate("an24/Electrical_Panel/slider", 1.0, 0.4, 0.0, 0.2 );
		setprop("an24/Electrics/board-aerodrome", 1.0 );
		interpolate("fdm/jsbsim/fcs/prop-governor/cvr_proplock", 0.0, 0.2 );
		}, t); t += 1.0;

# ARK and more radio stuff
		settimer( func{
		setprop("an24/ARK-11/mode-nav", 1 );
		setprop("/instrumentation/adf/mode", "adf" );
		setprop("/instrumentation/adf[2]/mode", "off" );
		interpolate("an24/ARK-11/kn_volume-nav", 1.0, 1.0 );
		setprop("an24/R-802/sw_power-1", 1.0 );
		setprop("an24/R-802/sw_power-2", 1.0 );
		setprop("an24/R-802/power-1", 1.0 );
		setprop("an24/R-802/power-2", 1.0 );
		interpolate("an24/R-802/kn_volume-1", 1.0, 1.0 );
		interpolate("an24/R-802/kn_volume-2", 1.0, 1.0 );
		setprop("an24/Kurs-MP/markermode", 1.0 );
		setprop("instrumentation/marker-beacon/serviceable", 1 );
		interpolate("fdm/jsbsim/fcs/prop-governor/cvr_proplock", 1.0, 0.2 );
		}, t); t += 0.8;
#
		settimer( func{
		screen.log.write("Set UPORA propeller pitch lock ON (19 degrees minimum)", 1, 1, 1);
		interpolate("fdm/jsbsim/fcs/prop-governor/sw_proplock", 1.0, 0.1 );
		interpolate("fdm/jsbsim/fcs/prop-governor/min-blade-angle[0]", 19.0, 1.0 );
		setprop("an24/Electrical_Panel/add_go16l", 1 );
		}, t); t += 1.0;

		settimer( func{
		screen.log.write("Done! So let's go!", 1, 1, 1);
		interpolate("fdm/jsbsim/fcs/prop-governor/min-blade-angle[1]", 19.0, 1.0 );
		}, t); t += 30.0;

		settimer( func{
		interpolate("an24/Air-Cond/sw_bleedairL", 1.0, 0.1 );
		interpolate("an24/Air-Cond/sw_bleedairR", 1.0, 0.1 );
		}, t);

};
