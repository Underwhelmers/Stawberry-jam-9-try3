function scr_register_targets() {
    var target_categories = global.command_synonyms.targets;
    ds_map_clear(target_categories); // Reset for current scene

    // Add characters from game manager
    var character_keys = ds_map_keys_to_array(obj_game_manager.characters);
    for (var i = 0; i < array_length(character_keys); i++) {
        ds_map_add(target_categories, character_keys[i], "character");
    }

    // Add scene objects (e.g., furniture)
    var furniture = global.word_variants[? "scene_furniture"].realvalues;
    for (var i = 0; i < array_length(furniture); i++) {
        ds_map_add(target_categories, furniture[i], "object");
    }

    // Add body parts or other categories as needed
    var body_parts = ["breasts", "thighs", "hands"]; // Example list
    for (var i = 0; i < array_length(body_parts); i++) {
        ds_map_add(target_categories, body_parts[i], "body_part");
    }
}