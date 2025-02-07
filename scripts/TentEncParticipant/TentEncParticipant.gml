/// Base participant class, inheriting from TentEncTagValues
function TentEncParticipant(_params): TentEncTagValues() constructor {
    name     = _params.name;
    likes    = new TentEncTagValues();
    dislikes = new TentEncTagValues();
    
    // A simple numeric arousal meter
    arousal = 0;
    // A map (or another container) to record where lubricant is applied.
    lubrication = ds_map_create();
    
    // This function wraps the inherited 'set' method for convenience.
    static new_tag = function(_tag, _value) {
        // Inherited from TentEncTagValues
        set(_tag, _value);
    }
    
    // Called when the participant is aroused using a given tool on a target.
    static get_aroused_with_on = function(_tag1, _tag2) {
        show_debug_message("Participant " + name + " gets aroused using " + _tag1.name + " on " + _tag2.name);
        // Increase arousal by an arbitrary amount.
        arousal += 10;
        // Optionally, mark the participant as aroused (for example, by setting an ARMOUSAL tag).
        // new_tag(TentEncTag.AROUSAL, true);
    }
    
    // Applies a lubricant (given by _tag_lube) to a specific place (given by _tag_place).
    static apply_lubricant = function(_tag_lube, _tag_place) {
        show_debug_message("Participant " + name + " has lubricant " + _tag_lube.name + " applied on " + _tag_place.name);
        // Record this lubricant application in the lubrication map.
        lubrication[? _tag_place.name] = _tag_lube;
        // Optionally, you could also update the participant's tags to reflect the lubricated state.
        // new_tag(TentEncTag.LUBRICATED, _tag_place);
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

/// A randomly generated participant that inherits from TentEncParticipant.
function TentEncRandomParticipant(_params) : TentEncParticipant(_params) constructor {
    // Randomly decide on a gender.
    var gender = choose("male", "female", "hermaphrodite");
    
    // Based on gender, assign anatomical parts.
    if (gender == "male") {
        // Male anatomy: assign a dick, a tongue, digestive track (mouth and anus) and hands.
        new_tag(TentEncTag.DICK, new Phallus("dick", 15 + irandom(5), 1));
        new_tag(TentEncTag.TONGUE, new Phallus("tongue", 15 + irandom(5), 1));
        var _ends = Cavity.generate_digestive_track(1);
        new_tag(TentEncTag.ANUS, _ends.anus);
        new_tag(TentEncTag.MOUTH, _ends.mouth);
        new_tag(TentEncTag.HAND_L, new Phallus("hand_l", 15, 1));
        new_tag(TentEncTag.HAND_R, new Phallus("hand_r", 15, 1));
    }
    else if (gender == "female") {
        // Female anatomy: assign a vagina, tongue, digestive track, and hands.
        var _ends = Cavity.generate_digestive_track(1);
        new_tag(TentEncTag.ANUS, _ends.anus);
        new_tag(TentEncTag.MOUTH, _ends.mouth);
        new_tag(TentEncTag.PUSSY, Cavity.generate_vagina(1));
        new_tag(TentEncTag.TONGUE, new Phallus("tongue", 15 + irandom(5), 1));
        new_tag(TentEncTag.HAND_L, new Phallus("hand_l", 15, 1));
        new_tag(TentEncTag.HAND_R, new Phallus("hand_r", 15, 1));
    }
    else { // hermaphrodite
        // Hermaphrodite: combine male and female anatomy.
        new_tag(TentEncTag.DICK, new Phallus("dick", 15 + irandom(5), 1));
        new_tag(TentEncTag.PUSSY, Cavity.generate_vagina(1));
        new_tag(TentEncTag.TONGUE, new Phallus("tongue", 15 + irandom(5), 1));
        var _ends = Cavity.generate_digestive_track(1);
        new_tag(TentEncTag.ANUS, _ends.anus);
        new_tag(TentEncTag.MOUTH, _ends.mouth);
        new_tag(TentEncTag.HAND_L, new Phallus("hand_l", 15, 1));
        new_tag(TentEncTag.HAND_R, new Phallus("hand_r", 15, 1));
    }
    
    // --- Extended Preferences ---
    // Retrieve the "leaf" tags (those without further children) from your extended categories.
    var emo_leafs   = TentEncTag.EMOTION.outter_childs();
    var role_leafs  = TentEncTag.ROLE.outter_childs();
    var body_leafs  = TentEncTag.BODY_PART.outter_childs();
    var env_leafs   = TentEncTag.ENVIRONMENT.outter_childs();
    var inter_leafs = TentEncTag.INTERACTION.outter_childs();
    var fluid_leafs = TentEncTag.FLUID.outter_childs();
    var toy_leafs   = TentEncTag.TOYS.outter_childs();
    var cloth_leafs = TentEncTag.CLOTHING.outter_childs();
    
    // For each category, randomly assign a "like" (with a random weight between 1 and 3).
    likes.set(choose_from(emo_leafs), 1 + irandom(2));
    likes.set(choose_from(role_leafs), 1 + irandom(2));
    likes.set(choose_from(body_leafs), 1 + irandom(2));
    likes.set(choose_from(env_leafs), 1 + irandom(2));
    likes.set(choose_from(inter_leafs), 1 + irandom(2));
    likes.set(choose_from(fluid_leafs), 1 + irandom(2));
    likes.set(choose_from(toy_leafs), 1 + irandom(2));
    likes.set(choose_from(cloth_leafs), 1 + irandom(2));
    
    // Also assign some random dislikes from the same categories.
    dislikes.set(choose_from(emo_leafs), 1 + irandom(2));
    dislikes.set(choose_from(role_leafs), 1 + irandom(2));
    dislikes.set(choose_from(body_leafs), 1 + irandom(2));
    dislikes.set(choose_from(env_leafs), 1 + irandom(2));
    dislikes.set(choose_from(inter_leafs), 1 + irandom(2));
    dislikes.set(choose_from(fluid_leafs), 1 + irandom(2));
    dislikes.set(choose_from(toy_leafs), 1 + irandom(2));
    dislikes.set(choose_from(cloth_leafs), 1 + irandom(2));
}
