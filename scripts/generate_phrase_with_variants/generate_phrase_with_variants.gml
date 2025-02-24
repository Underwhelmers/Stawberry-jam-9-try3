// First setup the global: global.word_variants = {};
// Then setup the options: new_word_variant("player_name", ["Jhon", "Paul", "Dan"]);
// Finally use it in game: var _greeting = generate_phrase_with_variants("Hello |player_name|, how are you?.");

/// @returns {string} The phrase changed to it's concrete formation;
function generate_phrase_with_variants(_string) {
    // Continue processing until no substitution tokens remain.
    do {
        var parts = string_split(_string, "|", true);
        var parts_count = array_length(parts);
        
        // Replace any part that matches a key in the word variants bag.
        for (var i = 0; i < parts_count; i++) {
			if (string_char_at(parts[i],0) == "~") {
				parts[i] = "|"+string_delete(parts[i],1,1)+"|";
				continue;
			}
			
			if (ds_map_exists(global.word_variants, parts[i])) {
                parts[i] = global.word_variants[? parts[i]].get();
            }
			
			var _pref_word = string_split(parts[i], "''", false);
			if (array_length(_pref_word) != 2) continue;
			
			if (_pref_word[0] == "a" || _pref_word[0] == "an") {
				var _word = global.word_variants[? _pref_word[1]].get();
				var _progress = generate_phrase_with_variants(_word);
				
				parts[i] = global.language_rules.place_article(_progress);
			}
				
			
			if (_pref_word[1] == "s") {
				parts[i] = global.language_rules.make_plural(
					generate_phrase_with_variants(
						global.word_variants[? _pref_word[0]].get()
					)
				);
			} else if (_pref_word[1] == "st" || _pref_word[1] == "est") {
				parts[i] = global.language_rules.make_superlative(
					generate_phrase_with_variants(
						global.word_variants[? _pref_word[0]].get()
					)
				);
			}
			
			switch(_pref_word[1]) {
				case "s":
					
					break;
				case "st": 
			}
        }
		
        _string = string_concat_ext(parts);
    } until (string_pos("|", _string) == 0);
	
	
	while(string_pos(" the the ", _string) > 0)
		_string = string_replace_all(_string, " the the ", " the ");
	
	while(string_pos(" a a ", _string) > 0)
		_string = string_replace_all(_string, " a a ", " a ");
	
	while(string_pos(" an an ", _string) > 0)
		_string = string_replace_all(_string, " an an ", " an ");
	
	while(string_pos("  ", _string) > 0)
		_string = string_replace_all(_string, "  ", " ");

	_string = string_replace_all(_string, " an a ", " a ");
	_string = string_replace_all(_string, " a an ", " an ");
	_string = string_replace_all(_string, " the a ", " the ");
	_string = string_replace_all(_string, " the an ", " the ");
	
    return _string;
}
