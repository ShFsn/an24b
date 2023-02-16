# Disable AP Menu
settimer(func { gui.menuEnable("autopilot", 0) }, 2);

####################
# Powered-to-Armed timer
####################
var powerOn = func {
	if ( getprop("/an24/AP-28l1/internal/powered") == 1.0 ) {
	setprop("/an24/AP-28l1/internal/power-on-time", getprop("/sim/time/elapsed-sec") + 5 + rand()*10);
	}
}
 setlistener("an24/AP-28l1/internal/powered", powerOn, 0, 0);

####################
# (Dis-)Engage Buttons
####################
var engage_ap = func(APbtn) {
		if (getprop("an24/AP-28l1/internal/armed") == 1) {
			if (APbtn == 1) { # Big btn on remote
			setprop("an24/AP-28l1/internal/engaged", 1);
			setprop("an24/AP-28l1/internal/kv", 0);
			setprop("an24/AP-28l1/internal/horizon-mode", 0);
			setprop("an24/AP-28l1/internal/target-pitch", getprop("instrumentation/agd-r[1]/indicated-pitch-deg"));
			setprop("an24/AP-28l1/internal/target-bank", 0.0);
			headings_write();
			}
			if (APbtn == 2) { # Horizon btn on remote
			setprop("an24/AP-28l1/internal/engaged", 1);
			setprop("an24/AP-28l1/internal/horizon-mode", 1);
			setprop("an24/AP-28l1/internal/target-pitch", 0.0);
			settimer(engage_kv_mode,10);
			}
			if (APbtn == 3 and getprop("an24/AP-28l1/internal/disengaged_by") == 5) { # Lever on yoke released
			setprop("an24/AP-28l1/internal/engaged", 1);
			setprop("an24/AP-28l1/internal/kv", 0);
			setprop("an24/AP-28l1/internal/horizon-mode", 0);
			headings_write();
			}
		}
		if (getprop("an24/AP-28l1/internal/engaged") == 1 ) {
			if (APbtn == 2) { # Horizon btn on remote
			setprop("an24/AP-28l1/internal/horizon-mode", 1);
			setprop("an24/AP-28l1/internal/target-pitch", 0.0);
			settimer(engage_kv_mode,10);
			}
			if (APbtn == 4) { # Off-btn on yoke
			setprop("an24/AP-28l1/internal/engaged", 0);
			setprop("an24/AP-28l1/internal/kv", 0);
			setprop("an24/AP-28l1/internal/horizon-mode", 0);
			setprop("an24/AP-28l1/internal/disengaged_by", 4);
			}
			if (APbtn == 5) { # Lever on yoke pressed
			setprop("an24/AP-28l1/internal/engaged", 0);
			setprop("an24/AP-28l1/internal/kv", 0);
			setprop("an24/AP-28l1/internal/horizon-mode", 0);
			setprop("an24/AP-28l1/internal/disengaged_by", 5);
			}
		}
}

####################
# Roll Knob on Remote/ ZK-2 Heading
####################
var RollControl = func(rollstep) {
	if ( getprop("an24/AP-28l1/sw_roll-mode") == -1.0 ) {
	setprop("an24/ZK-2/mp_heading-bug", math.periodic(0, 360, getprop("an24/ZK-2/mp_heading-bug") + rollstep) );
	}
	else {
	setprop("an24/AP-28l1/knob_roll-control", math.clamp( (getprop("an24/AP-28l1/knob_roll-control") + (rollstep*2.5) ), -30, 30 ) );
	}
}

####################
# Pitch Switches on Remote
####################
var PitchSwitch = func(pitchstep) {
	setprop("an24/AP-28l1/internal/pitch-switch", pitchstep);
	setprop("an24/AP-28l1/internal/kv", 0);
	interpolate("an24/AP-28l1/sw_up-down-l", pitchstep, 0.1 );
	interpolate("an24/AP-28l1/sw_up-down-r", pitchstep, 0.1 );
	}

####################
# KV (Alt Hold) Knob on Remote
####################
var engage_kv_mode = func {
	if ( getprop("an24/AP-28l1/internal/engaged") == 1 ) {
	setprop("/an24/AP-28l1/internal/target-pressure-inhg", getprop("fdm/jsbsim/systems/pitot-static/S1orE1pressure-inhg"));
	setprop("/an24/AP-28l1/internal/kv", 1);
	}
}

# Helper
var headings_write = func {
	setprop("/an24/AP-28l1/internal/target-heading-gpk-52", getprop("an24/GPK-52/indicated-heading-deg"));
	setprop("/an24/AP-28l1/internal/target-heading-gik-1", getprop("an24/GIK-1/indicated-heading"));
	setprop("/an24/AP-28l1/internal/rudder-gik-1-integrator", 0);
}
 setlistener("/an24/AP-28l1/internal/yaw-mode", headings_write, 0, 0);
