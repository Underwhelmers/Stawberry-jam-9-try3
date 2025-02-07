function TentEncTag(_name, _inner_tags = []) constructor {
	name = _name;
	subtags = _inner_tags;
	
	childs = [];
	for (var i = 0; i < array_length(subtags); i++) {
		subtags[i].childs[array_length(subtags[i].childs)] = self;
	}
	
	
	// this is not thread safe.
	_check_is_valid = false;
	static is_valid = function(_tag) {
		if (_check_is_valid)
			return false;
		_check_is_valid = true;
		
		if(name == _tag.name) {
			_check_is_valid = false;
			return true;
		}
		
		for (var i = 0; i < array_length(subtags); i++) {
			if (subtags[i].is_valid(_tag)) {
				_check_is_valid = false;
				return true;
			}
		}
		
		_check_is_valid = false;
		return false;
	}
	// end of is_valid
	
	static get_form = function(_inst) {
		if (is_struct(_inst))
			return _inst[$name];
		if (instance_exists(_inst))
			return instance_get_value(_inst,name);
		return undefined;
	}
	
	static outter_childs = function() {
		var _results = [];
		
		for (var i = 0; i < array_length(childs); i++) {
			if (array_length(childs[i].childs) == 0) {
				array_push(_results,childs[i]);
			} else {
				_results = array_concat(_results, childs[i].outter_childs());
			}
		}
		
		return array_unique(_results);
	}
}

function scr_setup_tent_enc_tags() {
	TentEncTag.POSSIBLE_PREFERENCE = new TentEncTag("possible_preference");
	TentEncTag.INTERACTION_PREFERENCE = new TentEncTag("interaction_preference", [TentEncTag.POSSIBLE_PREFERENCE]);
	TentEncTag.GETTING_NEGLECTED = new TentEncTag("getting_neglected", [TentEncTag.INTERACTION_PREFERENCE]);
	
	TentEncTag.FLUID = new TentEncTag("fluid", [TentEncTag.POSSIBLE_PREFERENCE]);
	TentEncTag.PHALLUS = new TentEncTag("phallus", [TentEncTag.POSSIBLE_PREFERENCE]);
	TentEncTag.CAVITY_ENTRANCE = new TentEncTag("cavity_entrance", [TentEncTag.POSSIBLE_PREFERENCE]);
	
	TentEncTag.CAVITY_STIMULATOR  = new TentEncTag("cavity_stimulator" );
	TentEncTag.PHALLUS_STIMULATOR = new TentEncTag("phallus_stimulator");

	TentEncTag.DICK   = new TentEncTag("dick"   , [TentEncTag.PHALLUS, TentEncTag.CAVITY_STIMULATOR]);
	TentEncTag.TAIL   = new TentEncTag("tail"   , [TentEncTag.PHALLUS, TentEncTag.CAVITY_STIMULATOR]);
	TentEncTag.TONGUE = new TentEncTag("tongue" , [TentEncTag.PHALLUS, TentEncTag.CAVITY_STIMULATOR, TentEncTag.PHALLUS_STIMULATOR]);

	TentEncTag.MOUTH = new TentEncTag("mouth", [TentEncTag.CAVITY_ENTRANCE, TentEncTag.CAVITY_STIMULATOR, TentEncTag.PHALLUS_STIMULATOR]);
	TentEncTag.PUSSY = new TentEncTag("pussy", [TentEncTag.CAVITY_ENTRANCE, TentEncTag.PHALLUS_STIMULATOR]);
	TentEncTag.ANUS  = new TentEncTag("anus" , [TentEncTag.CAVITY_ENTRANCE, TentEncTag.PHALLUS_STIMULATOR]);
	
	TentEncTag.LUBRICANT = new TentEncTag("lubricant" , [TentEncTag.FLUID]);
	
	TentEncTag.SEMEN = new TentEncTag("semen" , [TentEncTag.LUBRICANT]);
	TentEncTag.SALIVA = new TentEncTag("saliva" , [TentEncTag.LUBRICANT]);
	
	TentEncTag.HAND_L = new TentEncTag("left-hand"  , [TentEncTag.PHALLUS_STIMULATOR, TentEncTag.CAVITY_STIMULATOR]);
	TentEncTag.HAND_R = new TentEncTag("right-hand" , [TentEncTag.PHALLUS_STIMULATOR, TentEncTag.CAVITY_STIMULATOR]);
	
	
}
