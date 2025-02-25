function scr_setup_command_synonyms() {
    // Actions (verbs) and their canonical forms
    var action_synonyms = ds_map_create();
	ds_map_add(action_synonyms, "look", "look");
    ds_map_add(action_synonyms, "gaze", "look");
    ds_map_add(action_synonyms, "peer", "look");
    ds_map_add(action_synonyms, "stare", "look");
    ds_map_add(action_synonyms, "examine", "look");

    ds_map_add(action_synonyms, "touch", "touch");
    ds_map_add(action_synonyms, "caress", "touch");
    ds_map_add(action_synonyms, "stroke", "touch");
    ds_map_add(action_synonyms, "feel", "touch");

    ds_map_add(action_synonyms, "kiss", "kiss");
    ds_map_add(action_synonyms, "peck", "kiss");
    ds_map_add(action_synonyms, "smooch", "kiss");
    // Add more as needed

    // Modifiers (adjectives/adverbs) and their canonical forms
    var modifier_synonyms = ds_map_create();
	ds_map_add(modifier_synonyms, "gently", "gently");
    ds_map_add(modifier_synonyms, "softly", "gently");
    ds_map_add(modifier_synonyms, "lightly", "gently");

    ds_map_add(modifier_synonyms, "firmly", "firmly");
    ds_map_add(modifier_synonyms, "hard", "firmly");
    ds_map_add(modifier_synonyms, "strongly", "firmly");

    ds_map_add(modifier_synonyms, "slowly", "slowly");
    ds_map_add(modifier_synonyms, "gradually", "slowly");
    ds_map_add(modifier_synonyms, "deliberately", "slowly");

    ds_map_add(modifier_synonyms, "quickly", "quickly");
    ds_map_add(modifier_synonyms, "swiftly", "quickly");
    ds_map_add(modifier_synonyms, "fast", "quickly");

    // Targets (nouns) will be populated dynamically based on game state
    var target_categories = ds_map_create();

    // Store globally for access
    global.command_synonyms = {
        actions: action_synonyms,
        modifiers: modifier_synonyms,
        targets: target_categories
    };
}