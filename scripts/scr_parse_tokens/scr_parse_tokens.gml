function scr_parse_tokens(tokens) {
    var cmd = new ActionCommand();
    var i = 0;
    var token_count = array_length(tokens);

    // Step 1: Check for actor (optional, must be a character)
    if (token_count > 0 && tokens[i].target == "character") {
        cmd.actor = tokens[i].word;
        i++;
    }

    // Step 2: Find the action (required)
    while (i < token_count && is_undefined(tokens[i].action)) i++;
    if (i < token_count) {
        cmd.action = tokens[i].action;
        i++;
    } else {
        return undefined; // No valid action found
    }

    // Step 3: Find modifier (optional, can appear anywhere)
    var modifier_index = -1;
    for (var j = 0; j < token_count; j++) {
        if (!is_undefined(tokens[j].modifier)) {
            modifier_index = j;
            cmd.modifier = tokens[j].modifier;
            break;
        }
    }
    if (modifier_index != -1) {
        array_delete(tokens, modifier_index, 1); // Remove modifier from further processing
        token_count--;
    }

    // Step 4: Collect targets (remaining valid nouns)
    while (i < token_count) {
        if (!is_undefined(tokens[i].target)) {
            array_push(cmd.targets, tokens[i].word);
        } else {
			array_push(cmd.unknown_words, tokens[i].word);
		}
        i++;
    }
	
    return cmd;
}