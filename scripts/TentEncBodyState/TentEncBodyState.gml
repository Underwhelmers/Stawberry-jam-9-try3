function TentEncBodyState(_id, _descriptor, _breathing_rate, _skin_color_blend) constructor {
	identifier = _id;
	descriptor = _descriptor;
	breathing_rate = _breathing_rate;
	skin_color_blend = _skin_color_blend;
	
	static apply = function(_body) {
		_body.morph_state = self;
		_body.breathing_rate = breathing_rate;
		_body.skin_color_blend = skin_color_blend;
	}
}

function scr_setup_tent_enc_body_states() {
	TentEncBodyState.NORMAL    = new TentEncBodyState(
		"normal" ,"normal", 1.0, make_color_rgb(255,255,255)
	);
	
	TentEncBodyState.AROUSED   = new TentEncBodyState(
		"aroused","aroused", 1.5, make_color_rgb(255,205,205)
	);
	
	TentEncBodyState.CLIMAXING = new TentEncBodyState(
		"climaxing","climaxing", 3.0, make_color_rgb(255,150,150)
	);
}