function scr_tokenize_command(command) {
    var words = string_split(string_lower(command), " ", true);
    var tokens = [];
    for (var i = 0; i < array_length(words); i++) {
        var word = words[i];
        var action = ds_map_find_value(global.command_synonyms.actions, word);
        var modifier = ds_map_find_value(global.command_synonyms.modifiers, word);
        var target = ds_map_find_value(global.command_synonyms.targets, word);
        array_push(tokens, {
            word: word,
            action: action,
            modifier: modifier,
            target: target
        });
    }
    return tokens;
}