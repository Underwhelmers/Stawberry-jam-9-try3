function scr_command_parser(command) {
    var tokens = scr_tokenize_command(command);
    var parsed_cmd = scr_parse_tokens(tokens);
    if (is_undefined(parsed_cmd)) {
        return undefined; // Invalid command
    }

    // Validate targets against game state
    for (var i = 0; i < array_length(parsed_cmd.targets); i++) {
        var target = parsed_cmd.targets[i];
        if (!ds_map_exists(global.command_synonyms.targets, target)) {
            return undefined; // Target not in current scene
        }
    }

    return parsed_cmd;
}