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
    // ***********************
    // Fundamental / Meta Categories
    // ***********************
    TentEncTag.POSSIBLE_PREFERENCE = new TentEncTag("possible preference");
    
    // These are used by your original systems:
    TentEncTag.CAVITY_STIMULATOR  = new TentEncTag("cavity stimulator");
    TentEncTag.PHALLUS_STIMULATOR = new TentEncTag("phallus stimulator");
    
    // Basic content types
    TentEncTag.FLUID            = new TentEncTag("fluid", [TentEncTag.POSSIBLE_PREFERENCE]);
    TentEncTag.PHALLUS          = new TentEncTag("phallus", [TentEncTag.POSSIBLE_PREFERENCE]);
    TentEncTag.SITUATION        = new TentEncTag("situation", [TentEncTag.POSSIBLE_PREFERENCE]);
    TentEncTag.INTERACTION      = new TentEncTag("interaction", [TentEncTag.POSSIBLE_PREFERENCE]);
    TentEncTag.CAVITY_ENTRANCE  = new TentEncTag("cavity entrance", [TentEncTag.POSSIBLE_PREFERENCE]);
    
    // *******************************
    // Original Anatomical/Stimulator Tags
    // *******************************
    TentEncTag.DICK    = new TentEncTag("dick",   [TentEncTag.PHALLUS, TentEncTag.CAVITY_STIMULATOR]);
    TentEncTag.TAIL    = new TentEncTag("tail",   [TentEncTag.PHALLUS, TentEncTag.CAVITY_STIMULATOR]);
    TentEncTag.TONGUE  = new TentEncTag("tongue", [TentEncTag.PHALLUS, TentEncTag.CAVITY_STIMULATOR, TentEncTag.PHALLUS_STIMULATOR]);
    
    TentEncTag.MOUTH   = new TentEncTag("mouth",  [TentEncTag.CAVITY_ENTRANCE, TentEncTag.CAVITY_STIMULATOR, TentEncTag.PHALLUS_STIMULATOR]);
    TentEncTag.PUSSY   = new TentEncTag("pussy",  [TentEncTag.CAVITY_ENTRANCE, TentEncTag.PHALLUS_STIMULATOR]);
    TentEncTag.ANUS    = new TentEncTag("anus",   [TentEncTag.CAVITY_ENTRANCE, TentEncTag.PHALLUS_STIMULATOR]);
    
    TentEncTag.LUBRICANT = new TentEncTag("lubricant", [TentEncTag.FLUID]);
    TentEncTag.SEMEN     = new TentEncTag("semen",     [TentEncTag.LUBRICANT]);
    TentEncTag.SALIVA    = new TentEncTag("saliva",    [TentEncTag.LUBRICANT]);
    
	TentEncTag.HAND		 = new TentEncTag("hand",  [TentEncTag.PHALLUS_STIMULATOR, TentEncTag.CAVITY_STIMULATOR]);
    TentEncTag.HAND_L    = new TentEncTag("left hand",  [TentEncTag.HAND]);
    TentEncTag.HAND_R    = new TentEncTag("right hand", [TentEncTag.HAND]);
    
    TentEncTag.NEGLECTED      = new TentEncTag("neglected",      [TentEncTag.SITUATION]);
    TentEncTag.OVER_STRETCHED = new TentEncTag("over stretched", [TentEncTag.SITUATION]);
    
    TentEncTag.TEASE    = new TentEncTag("tease",    [TentEncTag.INTERACTION]);
    TentEncTag.STIMULATE = new TentEncTag("stimulate", [TentEncTag.INTERACTION]);
    
    // *******************************
    // Extended Categories and Sub-Categories
    // *******************************
    
    // Body Parts
    TentEncTag.BODY_PART = new TentEncTag("body part", [TentEncTag.POSSIBLE_PREFERENCE]);
    TentEncTag.BREASTS   = new TentEncTag("breasts",   [TentEncTag.BODY_PART]);
    TentEncTag.NIPPLES   = new TentEncTag("nipples",   [TentEncTag.BODY_PART, TentEncTag.CAVITY_STIMULATOR]);
    TentEncTag.ASS       = new TentEncTag("ass",       [TentEncTag.BODY_PART, TentEncTag.CAVITY_ENTRANCE]);
    TentEncTag.VAGINA    = new TentEncTag("vagina",    [TentEncTag.BODY_PART, TentEncTag.CAVITY_ENTRANCE]);
    TentEncTag.CLITORIS  = new TentEncTag("clitoris",  [TentEncTag.BODY_PART, TentEncTag.CAVITY_STIMULATOR]);
    TentEncTag.EARS      = new TentEncTag("ears",      [TentEncTag.BODY_PART]);
    TentEncTag.LEGS      = new TentEncTag("legs",      [TentEncTag.BODY_PART]);
    TentEncTag.ARMS      = new TentEncTag("arms",      [TentEncTag.BODY_PART]);
    TentEncTag.FINGERS   = new TentEncTag("fingers",   [TentEncTag.BODY_PART, TentEncTag.PHALLUS_STIMULATOR]);
    TentEncTag.FEET      = new TentEncTag("feet",      [TentEncTag.BODY_PART, TentEncTag.CAVITY_STIMULATOR]);
    
    // Actions / Interactions
    TentEncTag.ACTION = new TentEncTag("action", [TentEncTag.POSSIBLE_PREFERENCE]);
    TentEncTag.CARESS  = new TentEncTag("caress",  [TentEncTag.ACTION, TentEncTag.INTERACTION]);
    TentEncTag.SUCK    = new TentEncTag("suck",    [TentEncTag.ACTION, TentEncTag.INTERACTION]);
    TentEncTag.LICK    = new TentEncTag("lick",    [TentEncTag.ACTION, TentEncTag.INTERACTION]);
    TentEncTag.STROKE  = new TentEncTag("stroke",  [TentEncTag.ACTION, TentEncTag.INTERACTION]);
    TentEncTag.PENETRATE = new TentEncTag("penetrate", [TentEncTag.ACTION, TentEncTag.INTERACTION]);
    TentEncTag.THRUST    = new TentEncTag("thrust",    [TentEncTag.ACTION, TentEncTag.INTERACTION]);
	TentEncTag.FINGERING = new TentEncTag("fingering", [TentEncTag.ACTION, TentEncTag.INTERACTION]);
    
    // BDSM & Role Dynamics
    TentEncTag.BDSM      = new TentEncTag("bdsm",      [TentEncTag.SITUATION]);
    TentEncTag.BONDAGE   = new TentEncTag("bondage",   [TentEncTag.BDSM, TentEncTag.INTERACTION]);
    TentEncTag.DOMINANT  = new TentEncTag("dominant",  [TentEncTag.BDSM]);
    TentEncTag.SUBMISSIVE = new TentEncTag("submissive", [TentEncTag.BDSM]);
    TentEncTag.SPANKING  = new TentEncTag("spanking",  [TentEncTag.BDSM, TentEncTag.INTERACTION]);
    TentEncTag.WHIP      = new TentEncTag("whip",      [TentEncTag.BDSM, TentEncTag.INTERACTION]);
    
    TentEncTag.ROLE   = new TentEncTag("role",   [TentEncTag.POSSIBLE_PREFERENCE]);
    TentEncTag.ACTIVE = new TentEncTag("active", [TentEncTag.ROLE]);
    TentEncTag.PASSIVE= new TentEncTag("passive",[TentEncTag.ROLE]);
    
    // Sexual Positions
    TentEncTag.POSITION      = new TentEncTag("position", [TentEncTag.POSSIBLE_PREFERENCE]);
    TentEncTag.MISSIONARY   = new TentEncTag("missionary",    [TentEncTag.POSITION]);
    TentEncTag.DOGGY_STYLE  = new TentEncTag("doggy style",   [TentEncTag.POSITION]);
    TentEncTag.COWGIRL      = new TentEncTag("cowgirl",       [TentEncTag.POSITION]);
    TentEncTag.REVERSE_COWGIRL = new TentEncTag("reverse cowgirl", [TentEncTag.POSITION]);
    TentEncTag.SIXTY_NINE   = new TentEncTag("sixty nine",    [TentEncTag.POSITION]);
    TentEncTag.STANDING     = new TentEncTag("standing",      [TentEncTag.POSITION]);
    TentEncTag.SPOONING     = new TentEncTag("spooning",      [TentEncTag.POSITION]);
    
    // Sensory Modes
    TentEncTag.SENSORY     = new TentEncTag("sensory", [TentEncTag.POSSIBLE_PREFERENCE]);
    TentEncTag.VISUAL      = new TentEncTag("visual",  [TentEncTag.SENSORY]);
    TentEncTag.AUDITORY    = new TentEncTag("auditory",[TentEncTag.SENSORY]);
    TentEncTag.TACTILE     = new TentEncTag("tactile", [TentEncTag.SENSORY]);
    TentEncTag.OLFACTORY   = new TentEncTag("olfactory",[TentEncTag.SENSORY]);
    TentEncTag.GUSTATORY   = new TentEncTag("gustatory",[TentEncTag.SENSORY]);
    
    // Emotions & Arousal
    TentEncTag.EMOTION     = new TentEncTag("emotion", [TentEncTag.POSSIBLE_PREFERENCE]);
    TentEncTag.PASSION     = new TentEncTag("passion", [TentEncTag.EMOTION]);
    TentEncTag.AROUSAL     = new TentEncTag("arousal", [TentEncTag.EMOTION]);
    TentEncTag.ECSTASY     = new TentEncTag("ecstasy", [TentEncTag.EMOTION]);
    TentEncTag.ORGASM      = new TentEncTag("orgasm", [TentEncTag.EMOTION]);
    TentEncTag.SATISFACTION = new TentEncTag("satisfaction", [TentEncTag.EMOTION]);
    
    // Environments / Settings
    TentEncTag.ENVIRONMENT = new TentEncTag("environment", [TentEncTag.POSSIBLE_PREFERENCE]);
    TentEncTag.BEDROOM     = new TentEncTag("bedroom",     [TentEncTag.ENVIRONMENT]);
    TentEncTag.LIVING_ROOM = new TentEncTag("living room", [TentEncTag.ENVIRONMENT]);
    TentEncTag.PUBLIC      = new TentEncTag("public",      [TentEncTag.ENVIRONMENT]);
    TentEncTag.CAR         = new TentEncTag("car",         [TentEncTag.ENVIRONMENT]);
    TentEncTag.OUTDOORS    = new TentEncTag("outdoors",    [TentEncTag.ENVIRONMENT]);
    TentEncTag.CLUB        = new TentEncTag("club",        [TentEncTag.ENVIRONMENT]);
    TentEncTag.BAR         = new TentEncTag("bar",         [TentEncTag.ENVIRONMENT]);
    
    // Fantasy / Exotic Themes
    TentEncTag.FANTASY  = new TentEncTag("fantasy", [TentEncTag.POSSIBLE_PREFERENCE]);
    TentEncTag.TENTACLE = new TentEncTag("tentacle", [TentEncTag.FANTASY]);
    TentEncTag.ALIEN    = new TentEncTag("alien",    [TentEncTag.FANTASY]);
    TentEncTag.MYTHICAL = new TentEncTag("mythical", [TentEncTag.FANTASY]);
    TentEncTag.ROBOTIC  = new TentEncTag("robotic",  [TentEncTag.FANTASY]);
    
    // Additional Body Fluids
    TentEncTag.BODY_FLUIDS = new TentEncTag("body fluids", [TentEncTag.POSSIBLE_PREFERENCE]);
    TentEncTag.SWEAT       = new TentEncTag("sweat",       [TentEncTag.BODY_FLUIDS, TentEncTag.FLUID]);
    TentEncTag.MOISTURE    = new TentEncTag("moisture",    [TentEncTag.BODY_FLUIDS, TentEncTag.FLUID]);
    TentEncTag.PRE_CUM     = new TentEncTag("pre cum",     [TentEncTag.BODY_FLUIDS, TentEncTag.FLUID]);
    
    // Sex Toys / Devices
    TentEncTag.TOYS      = new TentEncTag("toys", [TentEncTag.POSSIBLE_PREFERENCE]);
    TentEncTag.VIBRATOR  = new TentEncTag("vibrator",  [TentEncTag.TOYS, TentEncTag.PHALLUS_STIMULATOR, TentEncTag.CAVITY_STIMULATOR]);
    TentEncTag.DILDO     = new TentEncTag("dildo",     [TentEncTag.TOYS, TentEncTag.PHALLUS_STIMULATOR, TentEncTag.CAVITY_ENTRANCE]);
    TentEncTag.BUTT_PLUG = new TentEncTag("butt plug", [TentEncTag.TOYS, TentEncTag.CAVITY_ENTRANCE]);
    
    // Clothing / Costuming
    TentEncTag.CLOTHING  = new TentEncTag("clothing", [TentEncTag.POSSIBLE_PREFERENCE]);
    TentEncTag.LINGERIE  = new TentEncTag("lingerie", [TentEncTag.CLOTHING]);
    TentEncTag.UNDERWEAR = new TentEncTag("underwear",[TentEncTag.CLOTHING]);
    TentEncTag.COSTUME   = new TentEncTag("costume",  [TentEncTag.CLOTHING, TentEncTag.FANTASY]);
}