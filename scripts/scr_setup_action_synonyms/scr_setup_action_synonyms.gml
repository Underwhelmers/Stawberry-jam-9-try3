function normalize_action(action) {
    if (ds_map_exists(global.action_synonyms, action)) {
        return ds_map_find_value(global.action_synonyms, action);
    }
    return action; // Return unchanged if no synonym exists
}

function scr_setup_action_synonyms() {
	global.action_synonyms = ds_map_create();
	
    // Inspection verbs
    ds_map_add(global.action_synonyms, "inspect", "inspect");
    ds_map_add(global.action_synonyms, "look", "inspect");
    ds_map_add(global.action_synonyms, "describe", "inspect");
    ds_map_add(global.action_synonyms, "examine", "inspect");
    ds_map_add(global.action_synonyms, "view", "inspect");
    ds_map_add(global.action_synonyms, "check", "inspect");
    ds_map_add(global.action_synonyms, "see", "inspect");

    // Use verbs
    ds_map_add(global.action_synonyms, "use", "use");
    ds_map_add(global.action_synonyms, "activate", "use");
    ds_map_add(global.action_synonyms, "turn", "use");
    ds_map_add(global.action_synonyms, "switch", "use");

    // Attack verbs
    ds_map_add(global.action_synonyms, "attack", "attack");
    ds_map_add(global.action_synonyms, "hit", "attack");
    ds_map_add(global.action_synonyms, "strike", "attack");
    ds_map_add(global.action_synonyms, "punch", "attack");
    ds_map_add(global.action_synonyms, "fight", "attack");
    
    // Movement verbs (optional addition)
    ds_map_add(global.action_synonyms, "move", "move");
    ds_map_add(global.action_synonyms, "go", "move");
    ds_map_add(global.action_synonyms, "walk", "move");
    ds_map_add(global.action_synonyms, "run", "move");

    // Taking objects
    ds_map_add(global.action_synonyms, "take", "take");
    ds_map_add(global.action_synonyms, "grab", "take");
    ds_map_add(global.action_synonyms, "pick", "take");
    ds_map_add(global.action_synonyms, "collect", "take");
    ds_map_add(global.action_synonyms, "get", "take");

    // Dropping objects
    ds_map_add(global.action_synonyms, "drop", "drop");
    ds_map_add(global.action_synonyms, "leave", "drop");
    ds_map_add(global.action_synonyms, "discard", "drop");
	
    ds_map_add(global.action_synonyms, "eat", "consume");
    ds_map_add(global.action_synonyms, "consume", "consume");

}