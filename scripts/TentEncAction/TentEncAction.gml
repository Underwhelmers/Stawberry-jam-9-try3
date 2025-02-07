function TentEncAction(_option_text, _description, _preconditions, _effects) constructor {
	option_text = _option_text;
	description = _description;
	preconditions = _preconditions;
	effects = _effects;
	
	static can_use = function(_encounter) {
		for (var i = 0; i < array_length(preconditions); i++) {
			if (! preconditions[i].fulfilled_by(_encounter)) {
				return false;
			}
		}
		return true;
	}
	
	static apply = function(_encounter) {
		for (var i = 0; i < array_length(effects); i++) {
			effects[i].apply_to(_encounter);
		}
	}
	
	ds_list_add(global.all_tent_actions, self);
}

function scr_setup_tent_enc_actions() {
    // Create the global list of actions.
    global.all_tent_actions = ds_list_create();
    TentEncAction.NO_ACTION = new TentEncAction("NOACTION", "NOACTION", [], []);
    ds_list_clear(global.all_tent_actions);
    
    //////////////////////////////
    // Extended: Environment Actions
    //////////////////////////////
    // Loop over all leaf environments.
    var _env_leafs = TentEncTag.ENVIRONMENT.outter_childs();
    for (var i = 0; i < array_length(_env_leafs); i++) {
        var _env = _env_leafs[i];
        // Only allow the change if the current environment is not already _env.
        TentEncAction[$ string("SET_ENVIRONMENT_{0}", string_upper(_env.name))] = new TentEncAction(
            string("Change setting to {0}", _env.name),
            string("You transform the scene into a {0} setting.", _env.name),
            [ TentEncPrecond._ATTRIBUTE_UNUSED("environment", _env) ],
            [ TentEncEffect.SET_ENVIRONMENT(_env) ]
        );
    }
    
    //////////////////////////////
    // Extended: Emotion Actions
    //////////////////////////////
    var _emotion_leafs = TentEncTag.EMOTION.outter_childs();
    for (var i = 0; i < array_length(_emotion_leafs); i++) {
        var _emo = _emotion_leafs[i];
        // For the player:
        TentEncAction[$ string("SET_PLAYER_EMOTION_{0}", string_upper(_emo.name))] = new TentEncAction(
            string("Feel {0}", _emo.name),
            string("A surge of {0} washes over you.", _emo.name),
            [ TentEncPrecond.PLAYER_UNUSED(_emo) ],
            [ TentEncEffect.CHANGE_PLAYER_EMOTION(_emo) ]
        );
        // For the partner:
        TentEncAction[$ string("SET_PARTNER_EMOTION_{0}", string_upper(_emo.name))] = new TentEncAction(
            string("Induce {0} in partner", _emo.name),
            string("You evoke a sense of {0} in your partner.", _emo.name),
            [ TentEncPrecond.PARTNER_UNUSED(_emo) ],
            [ TentEncEffect.CHANGE_PARTNER_EMOTION(_emo) ]
        );
    }
    
    //////////////////////////////
    // Extended: Role Actions
    //////////////////////////////
    var _role_leafs = TentEncTag.ROLE.outter_childs();
    for (var i = 0; i < array_length(_role_leafs); i++) {
        var _role = _role_leafs[i];
        // Set player's role.
        TentEncAction[$ string("SET_PLAYER_ROLE_{0}", string_upper(_role.name))] = new TentEncAction(
            string("Adopt {0} role", _role.name),
            string("You embrace a {0} persona.", _role.name),
            [ TentEncPrecond.PLAYER_UNUSED(_role) ],
            [ TentEncEffect.SET_PLAYER_ROLE(_role) ]
        );
        // Set partner's role.
        TentEncAction[$ string("SET_PARTNER_ROLE_{0}", string_upper(_role.name))] = new TentEncAction(
            string("Have partner adopt {0} role", _role.name),
            string("Your partner becomes {0}.", _role.name),
            [ TentEncPrecond.PARTNER_UNUSED(_role) ],
            [ TentEncEffect.SET_PARTNER_ROLE(_role) ]
        );
    }
    
    //////////////////////////////
    // Extended: Body-Part Actions
    //////////////////////////////
    var _body_leafs = TentEncTag.BODY_PART.outter_childs();
    for (var i = 0; i < array_length(_body_leafs); i++) {
        var _body = _body_leafs[i];
        // For the player:
        TentEncAction[$ string("ADD_PLAYER_BODY_{0}", string_upper(_body.name))] = new TentEncAction(
            string("Expose your {0}", _body.name),
            string("You reveal your {0}.", _body.name),
            [ TentEncPrecond.PLAYER_UNUSED(_body) ],
            [ TentEncEffect.ADD_PLAYER_BODY_TAG(_body) ]
        );
        // For the partner:
        TentEncAction[$ string("ADD_PARTNER_BODY_{0}", string_upper(_body.name))] = new TentEncAction(
            string("Expose partner's {0}", _body.name),
            string("Your partner reveals their {0}.", _body.name),
            [ TentEncPrecond.PARTNER_UNUSED(_body) ],
            [ TentEncEffect.ADD_PARTNER_BODY_TAG(_body) ]
        );
    }
    
    //////////////////////////////
    // Extended: Interaction Actions
    //////////////////////////////
    var _interaction_leafs = TentEncTag.INTERACTION.outter_childs();
    for (var i = 0; i < array_length(_interaction_leafs); i++) {
        var _int = _interaction_leafs[i];
        TentEncAction[$ string("ADD_INTERACTION_{0}", string_upper(_int.name))] = new TentEncAction(
            string("Engage in {0}", _int.name),
            string("You initiate a {0} interaction.", _int.name),
            [ TentEncPrecond.PLAYER_UNUSED(_int) ],
            [ TentEncEffect.ADD_INTERACTION(_int) ]
        );
    }
    
    //////////////////////////////
    // Extended: Fluid Actions
    //////////////////////////////
    var _fluid_leafs = TentEncTag.FLUID.outter_childs();
    for (var i = 0; i < array_length(_fluid_leafs); i++) {
        var _fl = _fluid_leafs[i];
        TentEncAction[$ string("ADD_FLUID_{0}", string_upper(_fl.name))] = new TentEncAction(
            string("Introduce {0}", _fl.name),
            string("You add {0} to the encounter.", _fl.name),
            [ TentEncPrecond.PARTNER_UNUSED(_fl) ],
            [ TentEncEffect.ADD_FLUID(_fl) ]
        );
    }
    
    //////////////////////////////
    // Extended: Toy Actions
    //////////////////////////////
    var _toy_leafs = TentEncTag.TOYS.outter_childs();
    for (var i = 0; i < array_length(_toy_leafs); i++) {
        var _toy = _toy_leafs[i];
        TentEncAction[$ string("APPLY_TOY_{0}", string_upper(_toy.name))] = new TentEncAction(
            string("Use the {0}", _toy.name),
            string("You apply the {0} to intensify the pleasure.", _toy.name),
            [ TentEncPrecond.PLAYER_UNUSED(_toy) ],
            [ TentEncEffect.APPLY_TOY(_toy) ]
        );
    }
    
    //////////////////////////////
    // Extended: Clothing Actions
    //////////////////////////////
    var _clothing_leafs = TentEncTag.CLOTHING.outter_childs();
    for (var i = 0; i < array_length(_clothing_leafs); i++) {
        var _cloth = _clothing_leafs[i];
        TentEncAction[$ string("SET_CLOTHING_{0}", string_upper(_cloth.name))] = new TentEncAction(
            string("Change outfit to {0}", _cloth.name),
            string("You switch into {0}.", _cloth.name),
            [ TentEncPrecond.PLAYER_UNUSED(_cloth) ],
            [ TentEncEffect.SET_CLOTHING(_cloth) ]
        );
    }
    
    //////////////////////////////
    // Original: Tool–Target Actions
    //////////////////////////////
    var _tools   = TentEncTag.CAVITY_STIMULATOR.outter_childs();
    var _targets = TentEncTag.CAVITY_ENTRANCE.outter_childs();
    
    for (var i = 0; i < array_length(_tools); i++) {
        var _tool = _tools[i];
        
        // TEASE_WITH: Only available if the player has a target for _tool and isn’t already using it.
        TentEncAction[$ string("TEASE_WITH_{0}", string_upper(_tool.name))] = new TentEncAction(
            string("Tease them with your {0}", _tool.name),
            string("You tease them using your |{0}|.", _tool.name),
            [ TentEncPrecond.PLAYER_HAS_TARGET_FOR(_tool), TentEncPrecond.PLAYER_UNUSED(_tool) ],
            [ TentEncEffect.TEASE_WITH(_tool) ]
        );
        
        // INSERT: Only if the tool is a valid phallus, and if the partner’s cavity is available.
        if (_tool.is_valid(TentEncTag.PHALLUS)) {
            TentEncAction[$ string("INSERT_{0}", string_upper(_tool.name))] = new TentEncAction(
                string("Push your {0} in", _tool.name),
                string("You slide your |{0}| in.", _tool.name),
                [ TentEncPrecond.PLAYER_TARGET_FOR_IS(_tool, TentEncTag.CAVITY_ENTRANCE), TentEncPrecond.PLAYER_UNUSED(_tool) ],
                [ TentEncEffect.INSERT(_tool) ]
            );
        }
        
        // PULL_OUT: Only available when the player is already using the tool.
        TentEncAction[$ string("PULL_OUT_{0}", string_upper(_tool.name))] = new TentEncAction(
            string("Pull your {0} out", _tool.name),
            string("You withdraw your |{0}|.", _tool.name),
            [ TentEncPrecond.PLAYER_USING(_tool) ],
            [ TentEncEffect.PULL_OUT(_tool) ]
        );
        
        // ALIGN: Align a tool with every available target.
        for (var j = 0; j < array_length(_targets); j++) {
            var _targ = _targets[j];
            
            TentEncAction[$ string("ALIGN_{0}_{1}", string_upper(_tool.name), string_upper(_targ.name))] = new TentEncAction(
                string("Align {0} to {1}", _tool.name, _targ.name),
                string("You bring your |{0}| to |their| |{1}|.", _tool.name, _targ.name),
                [ TentEncPrecond.PLAYER_UNUSED(_tool), TentEncPrecond.PARTNER_HAS(_targ) ],
                [ TentEncEffect.PLAYER_AIM_AT(_tool, _targ) ]
            );
        }
    }
    
    // SPIT_AT: Example action using a mouth tool.
    for (var j = 0; j < array_length(_targets); j++) {
        var _targ = _targets[j];
        TentEncAction[$ string("SPIT_AT_{0}", string_upper(_targ.name))] = new TentEncAction(
            string("Spit on their {0}", _targ.name),
            string("You lubricate their |{0}| with saliva.", _targ.name),
            [ TentEncPrecond.PLAYER_TARGET_FOR_IS(TentEncTag.MOUTH, _targ), TentEncPrecond.PLAYER_UNUSED(TentEncTag.MOUTH) ],
            [ TentEncEffect.LUBRICATE_WITH(TentEncTag.SALIVA, _targ) ]
        );
    }
    
    //////////////////////////////
    // Extended: Oral Actions
    //////////////////////////////
    // These actions simulate kissing and licking using the mouth and tongue.
    // Assumes that TentEncEffect.KISS, TentEncEffect.DEEP_KISS, and TentEncEffect.LICK are defined.
    
    // KISS: A light kiss between mouths.
    TentEncAction.KISS_MOUTH = new TentEncAction(
         "Kiss on the Mouth",
         "You lean in and share a tender kiss.",
         [ TentEncPrecond.PLAYER_HAS_TARGET_FOR(TentEncTag.MOUTH),
           TentEncPrecond.PLAYER_UNUSED(TentEncTag.MOUTH),
           TentEncPrecond.PARTNER_HAS(TentEncTag.MOUTH) ],
         [ TentEncEffect.KISS(TentEncTag.MOUTH) ]
    );
    
    // DEEP KISS: A more passionate kiss using the tongue.
    TentEncAction.DEEP_KISS = new TentEncAction(
         "Deep Kiss",
         "You deepen the kiss with your tongue.",
         [ TentEncPrecond.PLAYER_HAS_TARGET_FOR(TentEncTag.TONGUE),
           TentEncPrecond.PLAYER_UNUSED(TentEncTag.TONGUE),
           TentEncPrecond.PARTNER_HAS(TentEncTag.MOUTH) ],
         [ TentEncEffect.DEEP_KISS() ]
    );
    
    // LICK actions on partner's non-mouth body parts.
    var _partner_body_leafs = TentEncTag.BODY_PART.outter_childs();
    for (var i = 0; i < array_length(_partner_body_leafs); i++) {
         var _body = _partner_body_leafs[i];
         if (string_lower(_body.name) != "mouth") {
             TentEncAction[$ string("LICK_{0}", string_upper(_body.name))] = new TentEncAction(
                 string("Lick their {0}", _body.name),
                 string("Using your tongue, you lick their {0}.", _body.name),
                 [ TentEncPrecond.PLAYER_HAS_TARGET_FOR(TentEncTag.TONGUE),
                   TentEncPrecond.PLAYER_UNUSED(TentEncTag.TONGUE),
                   TentEncPrecond.PARTNER_HAS(_body) ],
                 [ TentEncEffect.LICK(_body) ]
             );
         }
    }
    
    //////////////////////////////
    // Extended: Manual (Hand) Actions
    //////////////////////////////
    // These actions simulate stroking or caressing with the hands.
    // Assumes that TentEncEffect.STROKE is defined.
    for (var i = 0; i < array_length(_partner_body_leafs); i++) {
         var _body = _partner_body_leafs[i];
         TentEncAction[$ string("STROKE_{0}", string_upper(_body.name))] = new TentEncAction(
             string("Stroke their {0}", _body.name),
             string("You gently stroke their {0} with your hands.", _body.name),
             [ TentEncPrecond.PARTNER_HAS(_body) ],
             [ TentEncEffect.STROKE(_body) ]
         );
    }
}
