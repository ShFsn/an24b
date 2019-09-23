#  Middle panel Stopwatch
var mp_stopwatch = maketimer(1, func(){
	var speedup = getprop("/sim/speed-up");
	var sw_time = getprop("an24/AChS/mp_stopwatch");
	var sw_time = sw_time + speedup ;
	setprop("an24/AChS/mp_stopwatch", int(sw_time));
});

# Middle panel Flighttime
var mp_flitetimer = maketimer(1, func(){
	var speedup = getprop("/sim/speed-up");
	var fl_time = getprop("an24/AChS/mp_flighttime");
	var fl_time = fl_time + speedup ;
	setprop("an24/AChS/mp_flighttime", int(fl_time));
});

# Middle panel wind-up/freeze mechanism; "running" 0 means not winded up, "serviceable" 0 clock frozen (not heated, not implemented yet)
var mp_wtimer = maketimer(10, func(){
	var speedup = getprop("/sim/speed-up");
	var windup = getprop("an24/AChS/mp_wind_up");
	if ( getprop("an24/AChS/mp_wind_up") > 0 and getprop("/instrumentation/clock/serviceable") == 1 ) {
	var windup = windup - speedup ;
	setprop("an24/AChS/mp_wind_up", int(windup));
	setprop("an24/AChS/mp_running", 1 );
	}
	else {
	setprop("an24/AChS/mp_running", 0 );
	mp_wtimer.stop();
	mp_stopwatch.stop();
	mp_flitetimer.stop();
	}
});
mp_wtimer.start();

#  Right console Stopwatch
var rc_stopwatch = maketimer(1, func(){
	var speedup = getprop("/sim/speed-up");
	var sw_time = getprop("an24/AChS/rc_stopwatch");
	var sw_time = sw_time + speedup ;
	setprop("an24/AChS/rc_stopwatch", int(sw_time));
});

# Right console Flighttime
var rc_flitetimer = maketimer(1, func(){
	var speedup = getprop("/sim/speed-up");
	var fl_time = getprop("an24/AChS/rc_flighttime");
	var fl_time = fl_time + speedup ;
	setprop("an24/AChS/rc_flighttime", int(fl_time));
});

# Right console wind-up/freeze mechanism; "running" 0 means not winded up, "serviceable" 0 clock frozen (not heated, not implemented yet)
var rc_wtimer = maketimer(10, func(){
	var speedup = getprop("/sim/speed-up");
	var windup = getprop("an24/AChS/rc_wind_up");
	if ( getprop("an24/AChS/rc_wind_up") > 0 and getprop("/instrumentation/clock[1]/serviceable") == 1 ) {
	var windup = windup - speedup ;
	setprop("an24/AChS/rc_wind_up", int(windup));
	setprop("an24/AChS/rc_running", 1 );
	}
	else {
	setprop("an24/AChS/rc_running", 0 );
	rc_wtimer.stop();
	rc_stopwatch.stop();
	rc_flitetimer.stop();
	}
});
rc_wtimer.start();

#  Navigator's Stopwatch
var nav_stopwatch = maketimer(1, func(){
	var speedup = getprop("/sim/speed-up");
	var sw_time = getprop("an24/AChS/nav_stopwatch");
	var sw_time = sw_time + speedup ;
	setprop("an24/AChS/nav_stopwatch", int(sw_time));
});

# Navigator's Flighttime
var nav_flitetimer = maketimer(1, func(){
	var speedup = getprop("/sim/speed-up");
	var fl_time = getprop("an24/AChS/nav_flighttime");
	var fl_time = fl_time + speedup ;
	setprop("an24/AChS/nav_flighttime", int(fl_time));
});

# Navigator's wind-up/freeze mechanism; "running" 0 means not winded up, "serviceable" 0 clock frozen (not heated, not implemented yet)
var nav_wtimer = maketimer(10, func(){
	var speedup = getprop("/sim/speed-up");
	var windup = getprop("an24/AChS/nav_wind_up");
	if ( getprop("an24/AChS/nav_wind_up") > 0 and getprop("/instrumentation/clock[2]/serviceable") == 1 ) {
	var windup = windup - speedup ;
	setprop("an24/AChS/nav_wind_up", int(windup));
	setprop("an24/AChS/nav_running", 1 );
	}
	else {
	setprop("an24/AChS/nav_running", 0 );
	nav_wtimer.stop();
	nav_stopwatch.stop();
	nav_flitetimer.stop();
	}
});
nav_wtimer.start();
