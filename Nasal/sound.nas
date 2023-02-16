##########################################
# Positional Click Sound Helper
# (from FlightGear's Space Shuttle)
##########################################

var click = func (name, xpos, ypos, zpos, timeout=0.1, delay=0.) {

	var sound_prop = "an24/sound/click_" ~ name;

	setprop("an24/sound/click-pos-x", xpos);
	setprop("an24/sound/click-pos-y", ypos);
	setprop("an24/sound/click-pos-z", zpos);

    settimer(func {
        # Play the sound
        setprop(sound_prop, 1);

        # Reset the property after "timeout" so that the sound can be played again.
        settimer(func {
            setprop(sound_prop, 0);
        }, timeout);
    }, delay);
};
