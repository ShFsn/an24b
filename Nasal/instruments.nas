## Before anything else change random seed.
srand();


# Creating random offsets on left and right KPPM
var kppm_init = func(i) {
	var kppm_start_offset = int(360*rand());
	setprop("/instrumentation/kppm["~i~"]/scale-offset", kppm_start_offset);
	setprop("/instrumentation/nav["~i~"]/radials/selected-deg", kppm_start_offset);
}

kppm_init(0);
kppm_init(1);

#Creating random magnetic heading indication on start-up
var gik_init = func {
	var gik_indicated_heading = 360*rand();
	setprop("/instrumentation/gik-1/indicated-heading", gik_indicated_heading);
	setprop("/instrumentation/gik-1/correction-speed-degsec", 0.05);
}

gik_init();


# Code for GIK-1

var gik_update = func(period) {
	var input_heading = getprop("/orientation/heading-magnetic-deg");
	var indicated_heading = getprop("/instrumentation/gik-1/indicated-heading");
	var yaw_rate = getprop("/orientation/yaw-rate-degps");
	if ( yaw_rate == nil ) yaw_rate = 0.0;
	var delta_heading = geo.normdeg180(indicated_heading - input_heading);

	if (delta_heading < 0) {
		var correction_speed = getprop("/instrumentation/gik-1/correction-speed-degsec");
	} else if (delta_heading >= 0) {
		var correction_speed = getprop("/instrumentation/gik-1/correction-speed-degsec") * -1;
	}

	if (abs(yaw_rate) > 0.2) {
		correction_speed = yaw_rate;
	}

	controls.slewProp ("/instrumentation/gik-1/indicated-heading", correction_speed );
	indicated_heading = geo.normdeg(getprop("/instrumentation/gik-1/indicated-heading"));
	setprop("/instrumentation/gik-1/indicated-heading", indicated_heading);
	#setprop("/instrumentation/gik-1/delta-heading", delta_heading); # FOR DEBUG
	#setprop("/instrumentation/gik-1/corr-speed-fact", correction_speed); # FOR DEBUG
	settimer(func {gik_update(period);}, period);
}

gik_update(0); #run GIK-1 at framerate rate

#set parking brake after simulator start-up

var parkBrakeSet = func {
	setprop("/controls/gear/brake-parking", 1);
}
setlistener("/sim/signals/fdm-initialized", parkBrakeSet);

## 2PPT1-4 Fuel Level Indicator
#

setprop("an24/PG4and2PPT1/selected-ind", -50.0 );
setprop("an24/FuelControl/fuel-meter-l", 0.0 );
setprop("an24/FuelControl/fuel-meter-r", 0.0 );
var fuelind = func {
	if ( getprop("an24/PG4and2PPT1/selected-ind") == -18.0 ) {
        var indicatedl = (getprop("/consumables/fuel/tank[0]/level-kg") + getprop("/consumables/fuel/tank[1]/level-kg") + getprop("/consumables/fuel/tank[2]/level-kg")) * 2 / 3;
        var indicatedr = (getprop("/consumables/fuel/tank[3]/level-kg") + getprop("/consumables/fuel/tank[4]/level-kg") + getprop("/consumables/fuel/tank[5]/level-kg")) * 2 / 3;
	}
	else if ( getprop("an24/PG4and2PPT1/selected-ind") == 18.0 ) {
        var indicatedl = getprop("/consumables/fuel/tank[0]/level-kg") + getprop("/consumables/fuel/tank[1]/level-kg");
        var indicatedr = getprop("/consumables/fuel/tank[4]/level-kg") + getprop("/consumables/fuel/tank[5]/level-kg");
	}
	else if ( getprop("an24/PG4and2PPT1/selected-ind") == 50.0 ) {
        var indicatedl = getprop("/consumables/fuel/tank[2]/level-kg");
        var indicatedr = getprop("/consumables/fuel/tank[3]/level-kg");
	}
	else {
        var indicatedl = 0.0;
        var indicatedr = 0.0;
	}
	interpolate("an24/PG4and2PPT1/indicatedl", indicatedl * getprop("an24/FuelControl/fuel-meter-l"), 0.8 );
	interpolate("an24/PG4and2PPT1/indicatedr", indicatedr * getprop("an24/FuelControl/fuel-meter-r"), 0.8 );
	settimer(fuelind, 23);
}

 setlistener("an24/PG4and2PPT1/selected-ind", fuelind);
 setlistener("an24/FuelControl/fuel-meter-l", fuelind);
 setlistener("an24/FuelControl/fuel-meter-r", fuelind);
