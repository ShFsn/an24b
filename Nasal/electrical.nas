var random_voltage = func {
	setprop("an24/Electrics/random_stg18l", rand() * 4 + 26.5 );
	setprop("an24/Electrics/random_stg18r", rand() * 4 + 26.5 );
	setprop("an24/Electrics/random_gs24", rand() * 4 + 26.5 );
	setprop("an24/Electrics/random_go16l", rand() * 10 + 110 );
	setprop("an24/Electrics/random_go16r", rand() * 10 + 110 );
}
 setlistener("sim/signals/fdm-initialized", random_voltage);

# Sources
setprop("an24/Electrics/DC_Batt_12SAM1_V", 24.2 );
setprop("an24/Electrics/DC_Batt_12SAM2_V", 24.8 );
setprop("an24/Electrics/DC_AUX_ShRAP500a_V", 0.0 );
setprop("an24/Electrics/DC_AUX_ShRAP500b_V", 0.0 );
setprop("an24/Electrics/AC_AUX_ShRA200_V", 0.0 ); #115V AC AUX
# gui
setprop("sim/gui/an24b/shrap500a", 0 );
setprop("sim/gui/an24b/shrap500b", 0 );

##############################
## Auxiliary: GS-24 (APU) or Aerodrome Power
##############################
var DC_AUX = func {
	var gs24_switch = getprop("an24/Electrical_Panel/sw_gs24") ;
	var gs24 = getprop("an24/Electrics/DC_Gen_GS-24_V") ;
	var bordaero_switch = getprop("an24/Electrics/board-aerodrome") ;
	var aerodromefactor = getprop("sim/gui/an24b/shrap500a") + getprop("sim/gui/an24b/shrap500b") ;
	if ( aerodromefactor != 0 ) {
		var aerodrome = ( getprop("an24/Electrics/DC_AUX_ShRAP500a_V") + getprop("an24/Electrics/DC_AUX_ShRAP500b_V") ) / aerodromefactor ;
		}
		else {
		var aerodrome = 0.0 ;
		}
#
	if ( bordaero_switch == -1.0 and aerodrome > 5.0 ) {
	var aux_to_dc_v = aerodrome ;
	setprop("an24/Electrics/DC_Bus_27V_main_fedby", "AERODROME" );
	}
	else if ( bordaero_switch == 1.0 and gs24_switch == 1.0 and gs24 > 5.0 ) {
	var aux_to_dc_v = gs24 ;
	setprop("an24/Electrics/DC_Bus_27V_main_fedby", "GS-24" );
	}
	else {
	var aux_to_dc_v = 0.0 ;
#	setprop("an24/Electrics/DC_Bus_27V_main_fedby", "NONE" );
	}
	setprop("an24/Electrics/DC_AUX_SOURCE_V", aux_to_dc_v );
}
 setlistener("an24/Electrics/board-aerodrome", DC_AUX);
 setlistener("an24/Electrical_Panel/sw_gs24", DC_AUX);
 setlistener("an24/Electrics/DC_AUX_ShRAP500a_V", DC_AUX);
 setlistener("an24/Electrics/DC_AUX_ShRAP500b_V", DC_AUX);
 setlistener("an24/Electrics/DC_Gen_GS-24_V", DC_AUX, 1, 0);

##############################
## Lighting
##############################
# Left Console
var lc_light = func {
	if ( getprop("controls/lighting/lamps_have_power") == 1 ) {
	setprop("controls/lighting/console-l_red", getprop("controls/lighting/kn_console-l") );
	}
	else {
	interpolate("controls/lighting/console-l_red", 0.0, 0.2 );
	}
}
 setlistener("controls/lighting/kn_console-l", lc_light, 0, 0 );
 setlistener("controls/lighting/lamps_have_power", lc_light, 0, 0 );

# Left Panel
var lp_light = func {
	if ( getprop("controls/lighting/lamps_have_power") == 1 ) {
	setprop("controls/lighting/panel-l_red", getprop("controls/lighting/kn_panel-l") );
	}
	else {
	interpolate("controls/lighting/panel-l_red", 0.0, 0.2 );
	}
}
 setlistener("controls/lighting/kn_panel-l", lp_light, 0, 0 );
 setlistener("controls/lighting/lamps_have_power", lp_light, 0, 0 );

# Middle Panel
var mp_light = func {
	if ( getprop("controls/lighting/lamps_have_power") == 1 ) {
	setprop("controls/lighting/panel-m_red", getprop("controls/lighting/kn_panel-m") );
	}
	else {
	interpolate("controls/lighting/panel-m_red", 0.0, 0.2 );
	}
}
 setlistener("controls/lighting/kn_panel-m", mp_light, 0, 0 );
 setlistener("controls/lighting/lamps_have_power", mp_light, 0, 0 );

# Right Panel
var rp_light = func {
	if ( getprop("controls/lighting/lamps_have_power") == 1 ) {
	setprop("controls/lighting/panel-r_red", getprop("controls/lighting/kn_panel-r") );
	}
	else {
	interpolate("controls/lighting/panel-r_red", 0.0, 0.2 );
	}
}
 setlistener("controls/lighting/kn_panel-r", rp_light, 0, 0 );
 setlistener("controls/lighting/lamps_have_power", rp_light, 0, 0 );

# Right Console
var rc_light = func {
	if ( getprop("controls/lighting/lamps_have_power") == 1 ) {
	setprop("controls/lighting/console-r_red", getprop("controls/lighting/kn_console-r") );
	}
	else {
	interpolate("controls/lighting/console-r_red", 0.0, 0.2 );
	}
}
 setlistener("controls/lighting/kn_console-r", rc_light, 0, 0 );
 setlistener("controls/lighting/lamps_have_power", rc_light, 0, 0 );

# Radio Op's Panel, Electrical Panel, Fuse Panel
var rop_light = func {
	if ( getprop("controls/lighting/lamps_have_power") == 1 ) {
	setprop("controls/lighting/radioopstationlight", getprop("controls/lighting/sw_radioopstationlight") );
	}
	else {
	interpolate("controls/lighting/radioopstationlight", 0.0, 0.2 );
	}
}
 setlistener("controls/lighting/sw_radioopstationlight", rop_light, 0, 0 );
 setlistener("controls/lighting/lamps_have_power", rop_light, 0, 0 );

# AZS Panel
var azs_light = func {
	if ( getprop("controls/lighting/lamps_have_power") == 1 ) {
	setprop("controls/lighting/azspanel", getprop("controls/lighting/sw_azspanel") );
	}
	else {
	interpolate("controls/lighting/azspanel", 0.0, 0.2 );
	}
}
 setlistener("controls/lighting/sw_azspanel", azs_light, 0, 0 );
 setlistener("controls/lighting/lamps_have_power", azs_light, 0, 0 );

# Radio Panel Instruments
var radiopanelinstr_light = func {
	if ( getprop("controls/lighting/lamps_have_power") == 1 ) {
	setprop("controls/lighting/radio_panel_instr", getprop("controls/lighting/kn_radio_panel_instr") );
	}
	else {
	interpolate("controls/lighting/radio_panel_instr", 0.0, 0.2 );
	}
}
 setlistener("controls/lighting/kn_radio_panel_instr", radiopanelinstr_light, 0, 0 );
 setlistener("controls/lighting/lamps_have_power", radiopanelinstr_light, 0, 0 );

# Electrical Panel Instruments
var epi_light = func {
	if ( getprop("controls/lighting/lamps_have_power") == 1 ) {
	setprop("controls/lighting/panel-elec_red", getprop("controls/lighting/kn_panel-elec") );
	}
	else {
	interpolate("controls/lighting/panel-elec_red", 0.0, 0.2 );
	}
}
 setlistener("controls/lighting/kn_panel-elec", epi_light, 0, 0 );
 setlistener("controls/lighting/lamps_have_power", epi_light, 0, 0 );

# Navigator's Panel
var np_light = func {
	if ( getprop("controls/lighting/lamps_have_power") == 1 ) {
	setprop("controls/lighting/nav_panel_red", getprop("controls/lighting/kn_nav_panel") );
	}
	else {
	interpolate("controls/lighting/nav_panel_red", 0.0, 0.2 );
	}
}
 setlistener("controls/lighting/kn_nav_panel", np_light, 0, 0 );
 setlistener("controls/lighting/lamps_have_power", np_light, 0, 0 );

# Navigator's Panel Instruments
var npi_light = func {
	if ( getprop("controls/lighting/lamps_have_power") == 1 ) {
	setprop("controls/lighting/nav_panel_instr_red", getprop("controls/lighting/kn_nav_panel_instr") );
	}
	else {
	interpolate("controls/lighting/nav_panel_instr_red", 0.0, 0.2 );
	}
}
 setlistener("controls/lighting/kn_nav_panel_instr", npi_light, 0, 0 );
 setlistener("controls/lighting/lamps_have_power", npi_light, 0, 0 );
