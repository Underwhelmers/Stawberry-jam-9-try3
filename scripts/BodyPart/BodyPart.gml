function BodyPart(_body, _name, _type, ) constructor {
	body = _body;
	type = _type;
	preference = 1;
	neglection = 1;
	ghost_pleasure = 0;

	// here store ghost stimulations 
	static arouse = function(_tag_used) {
		body.arousal += max(-5, 
			neglection * body.prefernce_for([
				type.tag,
				_tag_used,
				TentEncTag.GETTING_NEGLECTED
			])
			(body.preference_for[? type.tag] +
			 body.preference_for[? _tag_used] +
			 body.preference_for[? TentEncTag.GETTING_NEGLECTED])
		);
		neglection += 1;
	}
	static stimulate = function(_tag_used) {
		body.pleasure += preference * neglection;
		neglection *= 0.5;
		ghost_pleasure += preference * neglection;
	}
}