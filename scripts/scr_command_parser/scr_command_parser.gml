function scr_command_parser(input) {
    var tokens = scr_tokenize_command(input);
    var cmd = new ActionCommand();
		//{ action: "", actor: "You", modifier: "", targets: [] }; // Default command object
    var token_count = array_length(tokens);
    var i = 0;

    // Step 1: Check for actor (optional, assume "You" if not specified)
    if (token_count > 0 && ds_map_exists(global.command_synonyms.targets, tokens[i].word)) {
        cmd.actor = tokens[i].word;
        i++;
    }

    // Step 2: Find the action (required)
    while (i < token_count && is_undefined(tokens[i].action)) i++;
    if (i < token_count) {
        cmd.action = tokens[i].action;
        i++;
    } else {
        cmd.action = "unknown"; // Will trigger "Unknown command" in scr_process_command
        return cmd;
    }

    // Step 3: Find modifier (optional)
    for (var j = 0; j < token_count; j++) {
        if (!is_undefined(tokens[j].modifier)) {
            cmd.modifier = tokens[j].modifier;
            array_delete(tokens, j, 1); // Remove modifier token
            token_count--;
            break;
        }
    }

    // Step 4: Collect targets (remaining valid nouns)
    while (i < token_count) {
        if (!is_undefined(tokens[i].target)) {
            array_push(cmd.targets, tokens[i].word);
        }
        i++;
    }

    return cmd;
}