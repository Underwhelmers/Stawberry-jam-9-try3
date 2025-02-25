function scr_tokenize_command(command) {
    var words = string_split(string_lower(command), " ", true); // Split input into words
    var tokens = [];
    var i = 0;
    
    while (i < array_length(words)) {
        var word = words[i];
        var action = undefined;
        var modifier = ds_map_find_value(global.command_synonyms.modifiers, word);
        var target = ds_map_find_value(global.command_synonyms.targets, word);

        // Check for multi-word actions (up to 3 words)
        if (i + 2 < array_length(words)) {
            var three_word_action = word + " " + words[i+1] + " " + words[i+2];
            if (ds_map_exists(global.command_synonyms.actions, three_word_action)) {
                action = ds_map_find_value(global.command_synonyms.actions, three_word_action);
                array_push(tokens, { word: three_word_action, action: action, modifier: undefined, target: undefined });
                i += 3;
                continue;
            }
        }
        if (i + 1 < array_length(words)) {
            var two_word_action = word + " " + words[i+1];
            if (ds_map_exists(global.command_synonyms.actions, two_word_action)) {
                action = ds_map_find_value(global.command_synonyms.actions, two_word_action);
                array_push(tokens, { word: two_word_action, action: action, modifier: undefined, target: undefined });
                i += 2;
                continue;
            }
        }
        if (ds_map_exists(global.command_synonyms.actions, word)) {
            action = ds_map_find_value(global.command_synonyms.actions, word);
        }

        array_push(tokens, {
            word: word,
            action: action,
            modifier: modifier,
            target: target
        });
        i++;
    }
    return tokens;
}