function ecs_setup_components_npc() {
	StateComponents.types.mood = new StateComponents("mood");
	StateComponents.types.mood.add_to = method(
	    StateComponents.types.mood,
	    function(entity, _mood_state, _intensity = 1, _desire = "neutral", _proactivity = 0.5, _jealousy_intensity = 0) {
	        default_add(entity, {
	            state: _mood_state, // e.g., "happy", "angry"
	            intensity: _intensity, // Scale of 0 to 1
	            desire: _desire, // e.g., "neutral", "aroused", "repulsed"
	            proactivity: _proactivity, // 0 (passive) to 1 (very forward)
				jealousy_intensity: _jealousy_intensity // 0 (not jealous) to 1 (consumed by jealousy)
	        });
	    }
	);

	StateComponents.types.relationship = new StateComponents("relationship");
	StateComponents.types.relationship.add_to = method(
	    StateComponents.types.relationship,
	    function(entity, _target_entity, _affinity = 0, _intimacy = 0, _attraction = 0, _jealousy = 0, _jealousy_tendency = 0.5) {
	        default_add(entity, {
	            target: _target_entity,
	            affinity: _affinity, // -1 (hostile) to 1 (friendly)
	            intimacy: _intimacy, // 0 (none) to 1 (very intimate)
	            attraction: _attraction, // 0 (not attracted) to 1 (highly attracted)
	            jealousy: _jealousy, // 0 (not jealous) to 1 (very jealous)
	            jealousy_tendency: _jealousy_tendency, // 0 (not prone) to 1 (very prone)
				
				adjust_jealousy: function(_target_entity, _amount) {
			        if (target == _target_entity) {
			            jealousy = clamp(jealousy + _amount, 0, 1);
			        }
			    }
	        });
	    }
	);
	StateComponents.types.relationship.adjust_jealousy = method(
	    StateComponents.types.relationship,
	    function(entity, _target_entity, _amount) {
	        if (entity.relationship.target == _target_entity) {
	            entity.relationship.jealousy = clamp(entity.relationship.jealousy + _amount, 0, 1);
	        }
	    }
	);

	StateComponents.types.knowledge = new StateComponents("knowledge");
	StateComponents.types.knowledge.add_to = method(
	    StateComponents.types.knowledge,
	    function(entity) {
	        default_add(entity, { 
				contents: ds_list_create(),
				add_fact: function(_fact) {
					ds_list_add(contents, _fact);
				}
			});
	    }
	);
	StateComponents.types.knowledge.add_fact = method(
	    StateComponents.types.knowledge,
	    function(entity, _fact) {
	        ds_list_add(entity.knowledge.contents,_fact);
	    }
	);

	StateComponents.types.inventory = new StateComponents("inventory");
	StateComponents.types.inventory.add_to = method(
	    StateComponents.types.inventory,
	    function(entity) {
	        default_add(entity, { 
				contents: ds_list_create(),
				add_item: function(_item) {
					ds_list_add(contents, _item);
				}
			});
	    }
	);
	StateComponents.types.inventory.add_item = method(
	    StateComponents.types.inventory,
	    function(entity, _item) {
	        ds_list_add(entity.inventory.contents,_item);
	    }
	);
	
	StateComponents.types.fetish = new StateComponents("fetish");
	StateComponents.types.fetish.add_to = method(
	    StateComponents.types.fetish,
	    function(entity, _preferences = []) {
	        default_add(entity, {
	            preferences: _preferences // Array of strings, e.g., ["roleplay", "bondage"]
	        });
	    }
	);
	StateComponents.types.fetish.matches_preference = method(
	    StateComponents.types.fetish,
	    function(entity, _preference) {
	        return array_contains(entity.fetish.preferences, _preference);
	    }
	);
	
	
	StateComponents.types.intimacy_history = new StateComponents("intimacy_history");
	StateComponents.types.intimacy_history.add_to = method(
	    StateComponents.types.intimacy_history,
	    function(entity) {
	        default_add(entity, { contents: ds_list_create() }); // List of {partner, type, outcome} structs
	    }
	);
	StateComponents.types.intimacy_history.add_event = method(
	    StateComponents.types.intimacy_history,
	    function(entity, _partner, _type, _outcome, _witnessed = false) {
	        ds_list_add(entity.intimacy_history.contents, {
	            partner: _partner,
	            type: _type, // e.g., "flirt", "intercourse"
	            outcome: _outcome, // e.g., " positive", "negative"
	            witnessed: _witnessed // Boolean: Was this seen by others?
	        });
	    }
	);
}