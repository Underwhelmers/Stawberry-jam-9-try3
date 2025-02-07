function TentEncPrecond(_nested , _params, _callback) constructor {
	own_params = _params;
	callback = _callback;
	nested = _nested;
	
	// this is not thread safe.
	_check_fulfilled_by = false;
	static fulfilled_by = function(_encounter) {
		if (_check_fulfilled_by)
			return false;
			
		_check_fulfilled_by = true;
		for (var i = 0; i < array_length(nested); i++) {
			if (! nested[i].fulfilled_by(_encounter)) {
				_check_fulfilled_by = false;
				return false;
			}
		}
		
		_check_fulfilled_by = false;
		return callback(own_params, _encounter);
	}
}


function scr_setup_tent_enc_preconds() {
    // --- Core attribute precondition helpers ---
    TentEncPrecond._ATTRIBUTE_HAS_ALL = function(_ATTRIBUTE, _tags) {
        return new TentEncPrecond([],
            { ATTRIBUTE: _ATTRIBUTE, tags: _tags },
            function(_params, _enc) {
                var _enctags = _enc[$ _params.ATTRIBUTE].tags;
                for (var i = 0; i < array_length(_params.tags); i++) {
                    if (! _enctags.is_valid(_params.tags[i]))
                        return false;
                }
                return true;
            }
        );
    };
    TentEncPrecond._ATTRIBUTE_HAS_ANY = function(_ATTRIBUTE, _tags) {
        return new TentEncPrecond([],
            { ATTRIBUTE: _ATTRIBUTE, tags: _tags },
            function(_params, _enc) {
                var _enctags = _enc[$ _params.ATTRIBUTE].tags;
                for (var i = 0; i < array_length(_params.tags); i++) {
                    if (_enctags.is_valid(_params.tags[i]))
                        return true;
                }
                return false;
            }
        );
    };
    TentEncPrecond._ATTRIBUTE_HAS = function(_ATTRIBUTE, _tag) {
        return new TentEncPrecond([],
            { ATTRIBUTE: _ATTRIBUTE, tag: _tag },
            function(_params, _enc) {
                return _enc[$ _params.ATTRIBUTE].is_valid(_params.tag);
            }
        );
    };
    TentEncPrecond._ATTRIBUTE_USING = function(_ATTRIBUTE, _tag) {
        return new TentEncPrecond([],
            { ATTRIBUTE: "used_tags_for_" + _ATTRIBUTE, tag: _tag },
            function(_params, _enc) {
                return _enc[$ _params.ATTRIBUTE].is_valid(_params.tag);
            }
        );
    };
    TentEncPrecond._ATTRIBUTE_UNUSED = function(_ATTRIBUTE, _tag) {
        return new TentEncPrecond([TentEncPrecond._ATTRIBUTE_HAS(_ATTRIBUTE, _tag)],
            { ATTRIBUTE: "used_tags_for_" + _ATTRIBUTE, tag: _tag },
            function(_params, _enc) {
                return !_enc[$ _params.ATTRIBUTE].is_valid(_params.tag);
            }
        );
    };
    
    // --- Precondition shortcuts for PLAYER and PARTNER ---
    TentEncPrecond.PLAYER_HAS     = function(_tag) { return TentEncPrecond._ATTRIBUTE_HAS("player", _tag); };
    TentEncPrecond.PLAYER_HAS_ALL = function(_tags) { return TentEncPrecond._ATTRIBUTE_HAS_ALL("player", _tags); };
    TentEncPrecond.PLAYER_HAS_ANY = function(_tags) { return TentEncPrecond._ATTRIBUTE_HAS_ANY("player", _tags); };
    TentEncPrecond.PLAYER_UNUSED  = function(_tag) { return TentEncPrecond._ATTRIBUTE_UNUSED("player", _tag); };
    TentEncPrecond.PLAYER_USING   = function(_tag) { return TentEncPrecond._ATTRIBUTE_USING("player", _tag); };
    
    TentEncPrecond.PARTNER_HAS     = function(_tag) { return TentEncPrecond._ATTRIBUTE_HAS("partner", _tag); };
    TentEncPrecond.PARTNER_HAS_ALL = function(_tags) { return TentEncPrecond._ATTRIBUTE_HAS_ALL("partner", _tags); };
    TentEncPrecond.PARTNER_HAS_ANY = function(_tags) { return TentEncPrecond._ATTRIBUTE_HAS_ANY("partner", _tags); };
    TentEncPrecond.PARTNER_UNUSED  = function(_tag) { return TentEncPrecond._ATTRIBUTE_UNUSED("partner", _tag); };
    TentEncPrecond.PARTNER_USING   = function(_tag) { return TentEncPrecond._ATTRIBUTE_USING("partner", _tag); };
    
    TentEncPrecond.PLAYER_HAS_TARGET_FOR = function(_tag) {
        return new TentEncPrecond([TentEncPrecond.PLAYER_HAS(_tag)],
            { tag: _tag },
            function(_params, _enc) {
                return _enc.player_target_for.is_valid(_params.tag);
            }
        );
    };
    
    TentEncPrecond.PLAYER_TARGET_FOR_IS = function(_tag, _targ) {
        return new TentEncPrecond([
                TentEncPrecond.PLAYER_HAS_TARGET_FOR(_tag),
                TentEncPrecond.PARTNER_HAS(_targ)
            ],
            { tag: _tag, targ: _targ },
            function(_params, _enc) {
                return _enc.player_target_for.get(_params.tag).is_valid(_params.targ);
            }
        );
    };
    
    // --- Additional preconditions for extended categories ---
    
    // Environment-based preconditions:
    TentEncPrecond.ENVIRONMENT_HAS = function(_tag) {
        return TentEncPrecond._ATTRIBUTE_HAS("environment", _tag);
    };
    TentEncPrecond.ENVIRONMENT_HAS_ALL = function(_tags) {
        return TentEncPrecond._ATTRIBUTE_HAS_ALL("environment", _tags);
    };
    TentEncPrecond.ENVIRONMENT_HAS_ANY = function(_tags) {
        return TentEncPrecond._ATTRIBUTE_HAS_ANY("environment", _tags);
    };
    
    // Emotion-based preconditions:
    TentEncPrecond.PLAYER_FEELS = function(_tag) {
        return TentEncPrecond._ATTRIBUTE_HAS("player_emotion", _tag);
    };
    TentEncPrecond.PARTNER_FEELS = function(_tag) {
        return TentEncPrecond._ATTRIBUTE_HAS("partner_emotion", _tag);
    };
    
    // Role preconditions (e.g., active, passive, dominant, submissive):
    TentEncPrecond.PLAYER_ROLE_IS = function(_tag) {
        return TentEncPrecond._ATTRIBUTE_HAS("player_role", _tag);
    };
    TentEncPrecond.PARTNER_ROLE_IS = function(_tag) {
        return TentEncPrecond._ATTRIBUTE_HAS("partner_role", _tag);
    };
    
    // Body part preconditions (to check if a given body attribute includes a certain tag)
    TentEncPrecond.PLAYER_BODY_HAS = function(_tag) {
        return TentEncPrecond._ATTRIBUTE_HAS("player_body", _tag);
    };
    TentEncPrecond.PARTNER_BODY_HAS = function(_tag) {
        return TentEncPrecond._ATTRIBUTE_HAS("partner_body", _tag);
    };
    
    // Interaction preconditions:
    TentEncPrecond.INTERACTION_HAS = function(_tag) {
        return TentEncPrecond._ATTRIBUTE_HAS("interaction", _tag);
    };
    TentEncPrecond.INTERACTION_HAS_ALL = function(_tags) {
        return TentEncPrecond._ATTRIBUTE_HAS_ALL("interaction", _tags);
    };
    TentEncPrecond.INTERACTION_HAS_ANY = function(_tags) {
        return TentEncPrecond._ATTRIBUTE_HAS_ANY("interaction", _tags);
    };
    
    // Fluid preconditions:
    TentEncPrecond.FLUID_HAS = function(_tag) {
        return TentEncPrecond._ATTRIBUTE_HAS("fluid", _tag);
    };
    TentEncPrecond.FLUID_HAS_ALL = function(_tags) {
        return TentEncPrecond._ATTRIBUTE_HAS_ALL("fluid", _tags);
    };
    TentEncPrecond.FLUID_HAS_ANY = function(_tags) {
        return TentEncPrecond._ATTRIBUTE_HAS_ANY("fluid", _tags);
    };
    
    // Toy and device preconditions:
    TentEncPrecond.TOYS_HAS = function(_tag) {
        return TentEncPrecond._ATTRIBUTE_HAS("toys", _tag);
    };
    
    // Clothing preconditions:
    TentEncPrecond.CLOTHING_HAS = function(_tag) {
        return TentEncPrecond._ATTRIBUTE_HAS("clothing", _tag);
    };
    
    // --- Combined / Composite preconditions ---
    // For example: ensure that the player’s body has a given part *and* they are in a specific environment.
    TentEncPrecond.PLAYER_BODY_AND_ENVIRONMENT = function(_bodyTag, _envTag) {
        return new TentEncPrecond([
                TentEncPrecond.PLAYER_BODY_HAS(_bodyTag),
                TentEncPrecond.ENVIRONMENT_HAS(_envTag)
            ],
            { body: _bodyTag, environment: _envTag },
            function(_params, _enc) {
                // Both nested preconditions must be fulfilled.
                return true;
            }
        );
    };
    
    // Another example: check that the player's emotional state and role match specific tags.
    TentEncPrecond.PLAYER_FEELS_AND_ROLE = function(_emotionTag, _roleTag) {
        return new TentEncPrecond([
                TentEncPrecond.PLAYER_FEELS(_emotionTag),
                TentEncPrecond.PLAYER_ROLE_IS(_roleTag)
            ],
            { emotion: _emotionTag, role: _roleTag },
            function(_params, _enc) {
                return true;
            }
        );
    };
    
    // You can add further specialized preconditions following the patterns above.
}