function parse_command(input) {
    var words = string_split(string_lower(input), " ");
    if (array_length(words) < 2) {
        scr_chat("Player", "I don't understand.");
        return;
    }
	
	if (!ds_map_exists(global.action_synonyms, words[0])) {
		scr_chat("Player", string("I can't perform the '{0}'. It's not legal here...", words[0]));
        return;
	}
	
    var verb = global.action_synonyms[? words[0]];
    var noun = words[1];
	
	action_apply_on(verb, noun);
}
