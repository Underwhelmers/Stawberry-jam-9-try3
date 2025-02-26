function scr_build_action_tree(player_actions) {
    var tree = new PhraseBuilderByStepsNode(function(_text, _args) {
        // _args.entities is an array of entities involved in the action
        var entities = _args.entities;
        var action_field = ecs_action_verb_to_used_field(_args.action_verb);

        // Add the action component to all involved entities
        for (var i = 0; i < array_length(entities); i++) {
            obj_ecs_manager.component_manager.add_component(
                entities[i], 
                action_field, 
                true
            );
        }
    });
	for (var i = 0, count = array_length(player_actions); i < count; i++) {
		if (struct_exists(player_actions[i],"tracker")) {
			var candidates = ds_map_keys_to_array(player_actions[i].tracker.entities);
		
			for (var j = 0, count2 = array_length(candidates); j < count2; j++) {
				var action = player_actions[i];
				tree.add_leaf(
					action.get_text(candidates[j]), {
						entity: candidates[j],
						action_verb: action.action_verb
					}
				);
			}
		} else {
			// Multi-entity action
            var entity_combinations = generate_entity_combinations(player_actions[i].trackers);
            
            for (var j = 0; j < array_length(entity_combinations); j++) {
                var combo = entity_combinations[j];
                tree.add_leaf( player_actions[i].get_text(combo), {
                        entities: combo, // Array of entities (e.g., [Lara, Kael])
                        action_verb: player_actions[i].action_verb
                    }
                );
            }
		}
	}
    
    return tree;
}

function generate_entity_combinations(trackers) {
    var entities1 = ds_map_keys_to_array(tracker[0].entities);
	var entities2 = ds_map_keys_to_array(tracker[1].entities);
	
	array_cross_examine()
	
	if (array_length(trackers) == 1) return combinations; // Shouldn’t happen here
    
    
    for (var i = 0; i < array_length(entities1); i++) {
        for (var j = 0; j < array_length(entities2); j++) {
            if (entities1[i] != entities2[j]) { // Avoid self-interaction
                array_push(combinations, [entities1[i], entities2[j]]);
            }
        }
    }
    return combinations;
}