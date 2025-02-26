function ecs_setup_system_multiplayer_action(_action_verb, _entity_requirements_array, _effect) {
    // _action_verb: e.g., "{name1} dances with {name2}"
    // _entity_requirements_array: Array of requirement arrays, e.g., [["is_present"], ["is_present"]]
    // _effect: Function taking an array of entities, e.g., function(entities) { ... }

    // Create a unique field for tracking this action
    var action_field = ecs_action_verb_to_used_field(_action_verb);
    var executer = new ECS_SystemInstance([action_field], {});
    executer.true_effect = method(executer, _effect);
    executer.execute_logic = method(executer, function(entity, args) {
        // Entity here is an array of entities [entity1, entity2, ...]
        true_effect(entity);
        // Remove the action field from all entities involved to prevent repeat execution
        for (var i = 0; i < array_length(entity); i++) {
            obj_ecs_manager.component_manager.remove_component(entity[i], action_field);
        }
        obj_usable_action_manager.require_update = true;
    });

    // Define the action object with a multi-entity tracker
    var _action = {
        trackers: [], // Array of ECS_EntityTracker for each entity type
        action_verb: _action_verb,
        get_text: function(entities) {
            var text = action_verb;
            text = string_replace_all(text, "{name1}", entities[0].name);
            if (array_length(entities) > 1) {
                text = string_replace_all(text, "{name2}", entities[1].name);
            }
            return "-" + text + "-";
        }
    };

    // Create trackers for each entity type based on their requirements
    for (var i = 0; i < array_length(_entity_requirements_array); i++) {
        var tracker = new ECS_EntityTracker(_entity_requirements_array[i]);
        array_push(_action.trackers, tracker);
    }

    // Register the system and action
    obj_ecs_manager.system_manager.register_system(executer);
    array_push(obj_usable_action_manager.player_actions, _action);
    return executer;
}