function scr_build_action_tree(player_actions) {
    var tree = new PhraseBuilderByStepsNode(function(_text, _args) {
        // _args.entities is an array of entities involved in the action
        var entities = _args.entities;
        var action_field = ecs_action_verb_to_used_field(_args.action_verb);

		obj_ecs_manager.component_manager.add_component(
            entities[0], 
            action_field, 
            entities
        );
    });
	for (var i = 0, count = array_length(player_actions); i < count; i++) {
		if (player_actions[i].multientity) { // Multi-entity action
            var entity_combinations = generate_entity_combinations(player_actions[i].trackers);
            
            for (var j = 0; j < array_length(entity_combinations); j++) {
                var combo = entity_combinations[j];
                tree.add_leaf( player_actions[i].get_text(combo), {
                        entities: combo, // Array of entities (e.g., [Oil, Lara])
                        action_verb: player_actions[i].action_verb
                    }
                );
            }
		} else { // Single-entity action
			var candidates = ds_map_keys_to_array(player_actions[i].tracker.entities);
		
			for (var j = 0, count2 = array_length(candidates); j < count2; j++) {
				var action = player_actions[i];
				tree.add_leaf(
					action.get_text(candidates[j]), {
						entities: [candidates[j]],
						action_verb: action.action_verb
					}
				);
			}
		}
	}
    
    return tree;
}

function generate_entity_combinations(trackers) {
	var combinations = [];
	var cant_trackers = array_length(trackers);
	var entities = array_create(cant_trackers);
	
	for (var i = 0; i < cant_trackers; i++) {
		entities[i] = ds_map_keys_to_array(trackers[i].entities);
	}
	
	array_cross_examine_ext(
		entities, combinations, 
		function (items, comb) {
			array_push(comb, array_clone(items));
		}
	);
	
    return combinations;
}