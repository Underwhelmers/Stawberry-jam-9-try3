function TentEncEffect(_params, _callback) constructor {
    own_params = _params;
    callback   = _callback;
    
    static apply_to = function(_encounter) {
        return callback(own_params, _encounter);
    }
}

function scr_setup_tent_enc_effects() {
    // -----------------------------
    // Original Effects
    // -----------------------------
    TentEncEffect.PLAYER_AIM_AT = function(_player_tag, _partner_tag) {
        return new TentEncEffect(
            { player_tag: _player_tag, partner_tag: _partner_tag },
            function (_params, _enc) {
                _enc.player_target_for.set(_params.player_tag, _params.partner_tag);
            }
        );
    };

    TentEncEffect.INSERT = function(_tag) {
        return new TentEncEffect(
            { tag: _tag },
            function (_params, _enc) {
                var _targ_tag = _enc.player_target_for.get(_params.tag);
                _enc.partner.get_aroused_with_on(_params.tag, _targ_tag);
                
                var _tool = _enc.player.tags.get(_params.tag);
                var _targ = _enc.partner.tags.get(_targ_tag);
                
                _enc.used_tags_for_player.set(_params.tag);
                _enc.used_tags_for_partner.set(_targ_tag);
                
                _targ.penetrate_using(_tool, 5);
            }
        );
    };

    TentEncEffect.PULL_OUT = function(_tag) {
        return new TentEncEffect(
            { tag: _tag },
            function (_params, _enc) {
                var _targ_tag = _enc.player_target_for.get(_params.tag);
                _enc.partner.get_aroused_with_on(_params.tag, _targ_tag);
                
                var _tool = _enc.player.tags.get(_params.tag);
                var _targ = _enc.partner.tags.get(_targ_tag);
                
                _enc.used_tags_for_player.remove(_params.tag);
                _enc.used_tags_for_partner.remove(_targ_tag);
                
                _targ.pull_out(_tool, 5);
            }
        );
    };

    TentEncEffect.TEASE_WITH = function(_tag) {
        return new TentEncEffect(
            { tag: _tag },
            function (_params, _enc) {
                var _targ_tag = _enc.player_target_for.get(_params.tag);
                _enc.partner.get_aroused_with_on(_params.tag, _targ_tag);
            }
        );
    };

    TentEncEffect.LUBRICATE_WITH = function(_tag_lubricant, _tag_target) {
        return new TentEncEffect(
            { lubricant: _tag_lubricant, target: _tag_target },
            function (_params, _enc) {
                _enc.partner.apply_lubricant(_params.lubricant, _params.target);
            }
        );
    };

    // -----------------------------
    // Extended Effects
    // -----------------------------

    // SET_ENVIRONMENT: Update the simulation's environment attribute.
    TentEncEffect.SET_ENVIRONMENT = function(_env_tag) {
        return new TentEncEffect(
            { env: _env_tag },
            function (_params, _enc) {
                _enc.environment.set(_params.env);
            }
        );
    };

    // CHANGE_PLAYER_EMOTION: Update the player's emotion state.
    TentEncEffect.CHANGE_PLAYER_EMOTION = function(_emotion_tag) {
        return new TentEncEffect(
            { emotion: _emotion_tag },
            function (_params, _enc) {
                _enc.player_emotion.set(_params.emotion);
            }
        );
    };

    // CHANGE_PARTNER_EMOTION: Update the partner's emotion state.
    TentEncEffect.CHANGE_PARTNER_EMOTION = function(_emotion_tag) {
        return new TentEncEffect(
            { emotion: _emotion_tag },
            function (_params, _enc) {
                _enc.partner_emotion.set(_params.emotion);
            }
        );
    };

    // SET_PLAYER_ROLE: Update the player's role (for example, active/dominant).
    TentEncEffect.SET_PLAYER_ROLE = function(_role_tag) {
        return new TentEncEffect(
            { role: _role_tag },
            function (_params, _enc) {
                _enc.player_role.set(_params.role);
            }
        );
    };

    // SET_PARTNER_ROLE: Update the partner's role (for example, passive/submissive).
    TentEncEffect.SET_PARTNER_ROLE = function(_role_tag) {
        return new TentEncEffect(
            { role: _role_tag },
            function (_params, _enc) {
                _enc.partner_role.set(_params.role);
            }
        );
    };

    // ADD_PLAYER_BODY_TAG: Add a body-part tag to the player's body state.
    TentEncEffect.ADD_PLAYER_BODY_TAG = function(_body_tag) {
        return new TentEncEffect(
            { body: _body_tag },
            function (_params, _enc) {
                _enc.player_body.set(_params.body);
            }
        );
    };

    // ADD_PARTNER_BODY_TAG: Add a body-part tag to the partner's body state.
    TentEncEffect.ADD_PARTNER_BODY_TAG = function(_body_tag) {
        return new TentEncEffect(
            { body: _body_tag },
            function (_params, _enc) {
                _enc.partner_body.set(_params.body);
            }
        );
    };

    // ADD_INTERACTION: Register an interaction tag (for instance, "caress", "lick", etc.).
    TentEncEffect.ADD_INTERACTION = function(_interaction_tag) {
        return new TentEncEffect(
            { interaction: _interaction_tag },
            function (_params, _enc) {
                _enc.interaction.set(_params.interaction);
            }
        );
    };

    // ADD_FLUID: Register a fluid tag (e.g., "lubricant", "saliva", etc.).
    TentEncEffect.ADD_FLUID = function(_fluid_tag) {
        return new TentEncEffect(
            { fluid: _fluid_tag },
            function (_params, _enc) {
                _enc.fluid.set(_params.fluid);
            }
        );
    };

    // APPLY_TOY: Register the use of a toy or device.
    TentEncEffect.APPLY_TOY = function(_toy_tag) {
        return new TentEncEffect(
            { toy: _toy_tag },
            function (_params, _enc) {
                _enc.toys.set(_params.toy);
            }
        );
    };

    // SET_CLOTHING: Update the clothing or costume state.
    TentEncEffect.SET_CLOTHING = function(_clothing_tag) {
        return new TentEncEffect(
            { clothing: _clothing_tag },
            function (_params, _enc) {
                _enc.clothing.set(_params.clothing);
            }
        );
    };
	
	TentEncEffect.SET_AROUSAL_LEVEL = function(_tag, _level) {
	    return new TentEncEffect(
	        { tag: _tag, level: _level },
	        function (_params, _enc) {
	            _enc.set_arousal_level(_params.tag, _params.level);
	        }
	    );
	};

	// APPLY_STIMULATION: Apply stimulation to a target body part.
	TentEncEffect.APPLY_STIMULATION = function(_tag, _intensity) {
	    return new TentEncEffect(
	        { tag: _tag, intensity: _intensity },
	        function (_params, _enc) {
	            var _target_tag = _enc.player_target_for.get(_params.tag);
	            _enc.stimulate(_target_tag, _params.intensity);
	        }
	    );
	};

	// REGISTER_SOUND_CUE: Add an audio cue to the interaction.
	TentEncEffect.REGISTER_SOUND_CUE = function(_sound_tag) {
	    return new TentEncEffect(
	        { sound: _sound_tag },
	        function (_params, _enc) {
	            _enc.sound_cues.add(_params.sound);
	        }
	    );
	};

	// TRACK_PARTNER_REACTION: Record and analyze the partner's reaction.
	TentEncEffect.TRACK_PARTNER_REACTION = function() {
	    return new TentEncEffect(
	        {},
	        function (_params, _enc) {
	            _enc.partner.track_reaction();
	        }
	    );
	};

	// TRIGGER_ORGASM: Force an orgasm on a target (player or partner).
	TentEncEffect.TRIGGER_ORGASM = function(_tag) {
	    return new TentEncEffect(
	        { tag: _tag },
	        function (_params, _enc) {
	            _enc.trigger_orgasm(_params.tag);
	        }
	    );
	};

	// SYNC_BREATHING: Synchronize breathing between player and partner.
	TentEncEffect.SYNC_BREATHING = function() {
	    return new TentEncEffect(
	        {},
	        function (_params, _enc) {
	            _enc.sync_breathing();
	        }
	    );
	};
	
	TentEncEffect.KISS = function(_tag_source, _tag_target) {
	    return new TentEncEffect(
	        { source: _tag_source, target: _tag_target },
	        function (_params, _enc) {
	            var _source_tag = _enc.player.tags.get(_params.source);
	            var _target_tag = _enc.partner.tags.get(_params.target);
            
	            // Trigger arousal response and mark tags as engaged
	            _enc.partner.get_aroused_with_on(_params.source, _params.target);
            
	            // Perform the kiss interaction, influencing arousal or reactions
	            _target_tag.receive_kiss_from(_source_tag);
            
	            _enc.used_tags_for_player.set(_params.source);
	            _enc.used_tags_for_partner.set(_params.target);
	        }
	    );
	};
	
	TentEncEffect.DEEP_KISS = function() {
	    return new TentEncEffect(
	        {},
	        function (_params, _enc) {
	            _enc.partner_emotion.increase_intimacy(5);
	        }
	    );
	};
	
	TentEncEffect.LICK = function(_body) {
	    return new TentEncEffect(
	        { body: _body },
	        function (_params, _enc) {
	            var _target_tag = _enc.partner.tags.get(_params.body);

	            // Arouse partner with the lick action
	            _enc.partner.get_aroused_with_on(TentEncTag.TONGUE, _params.body, 2);

	            // Apply the lick interaction on the specified body part
	            _target_tag.receive_lick();

	            // Mark the interaction for both player and partner
	            _enc.used_tags_for_player.set(TentEncTag.TONGUE);
	            _enc.used_tags_for_partner.set(_params.body);
	        }
	    );
	};
	
	TentEncEffect.STROKE = function(_body) {
    return new TentEncEffect(
        { body: _body },
        function (_params, _enc) {
            var _target_tag = _enc.partner.tags.get(_params.body);

            // Arouse the partner gently through the stroking action
            _enc.partner.get_aroused_with_on(TentEncTag.HAND, _params.body, 1);

            // Execute the stroke action on the specified body part
            _target_tag.receive_stroke();

            // Track usage of tags for player and partner
            _enc.used_tags_for_player.set(TentEncTag.HAND);
            _enc.used_tags_for_partner.set(_params.body);
        }
    );
};
}
