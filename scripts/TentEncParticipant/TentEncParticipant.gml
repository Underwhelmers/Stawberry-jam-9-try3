function TentEncParticipant(_params) constructor {
	name = _params.name;
	tags = new TentEncTagValues();
	likes = new TentEncTagValues();
	dislikes = new TentEncTagValues();
	
	static new_tag = function(_tag, _value) {
		tags.set(_tag, _value);
	}
	
	static get_aroused_with_on = function(_tag1, _tag2) {
		
	}
	
	static apply_lubricant = function(_tag_lube, _tag_place) {
		
	}
};

function TentEncPlayer(_params): TentEncParticipant(_params) constructor {
	new_tag(TentEncTag.DICK, new Phallus("dick",15,1));
	new_tag(TentEncTag.TONGUE, new Phallus("tongue",15,1));
	
	var _ends = Cavity.generate_digestive_track(1);
	new_tag(TentEncTag.ANUS, _ends.anus);
	new_tag(TentEncTag.MOUTH, _ends.mouth);
	//new_tag(TentEncTag.HAND_L, new Phallus("hand_l",15,1));
	//new_tag(TentEncTag.HAND_R, new Phallus("hand_r",15,1));
}

function TentEncKobold(_params): TentEncParticipant(_params) constructor {
	var _ends = Cavity.generate_digestive_track(1);
	new_tag(TentEncTag.ANUS, _ends.anus);
	new_tag(TentEncTag.MOUTH, _ends.mouth);
	new_tag(TentEncTag.PUSSY, Cavity.generate_vagina(1));
	
	new_tag(TentEncTag.TAIL  , new Phallus("tail",50,1));
	new_tag(TentEncTag.TONGUE, new Phallus("tongue",15,1));
	new_tag(TentEncTag.HAND_L, new Phallus("hand_l",15,1));
	new_tag(TentEncTag.HAND_R, new Phallus("hand_r",15,1));
	
	likes.set(TentEncTag.DICK, 2);
	likes.set(TentEncTag.ANUS, 2);
	likes.set(TentEncTag.PUSSY, 1);
	likes.set(TentEncTag.TAIL, 1);
	
	dislikes.set(TentEncTag.MOUTH, 2);
	dislikes.set(TentEncTag.TONGUE,1);
}
