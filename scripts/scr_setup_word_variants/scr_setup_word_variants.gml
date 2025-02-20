function scr_setup_word_variants() {
	global.word_variants = ds_map_create();
	
	global.language_rules = {
		place_indefinite_article: function(_word) {
			_word = string_trim(_word);
			if (string_length(_word) == 0) return "";
			var first_letter = string_lower(string_copy(_word, 1, 1));
			if (first_letter == "a" || first_letter == "e" || first_letter == "i" || first_letter == "o" || first_letter == "u")
				return "an "+_word;
			return "a "+_word;
		},
		
		
		irregular_plurals: ds_map_create(),
		es_exception_plurals: ["photo", "piano", "halo", "solo"],
		pluralize_word: function(_word) {
			_word = string_trim(_word);
			if (string_length(_word) == 0)
				return "";

			// Irregular plural dictionary
			if (ds_map_exists(irregular_plurals, _word)) {
				return irregular_plurals[? _word];
			}

			var last_letter = string_lower(string_copy(_word, string_length(_word), 1));
			var last_two_letters = string_lower(string_copy(_word, string_length(_word) - 1, 2));

			// Nouns ending in s, x, z, ch, sh add "es"
			if (string_pos(last_two_letters, "ch") > 0 || string_pos(last_two_letters, "sh") > 0 ||
				last_letter == "s" || last_letter == "x" || last_letter == "z") {
				return _word + "es";
			}

			// Nouns ending in consonant + y replace "y" with "ies"
			if (last_letter == "y" && !string_pos("aeiou", string_copy(_word, string_length(_word) - 1, 1))) {
				return string_copy(_word, 1, string_length(_word) - 1) + "ies";
			}

			// Nouns ending in "f" or "fe" replace with "ves"
			if (last_letter == "f") {
				return string_copy(_word, 1, string_length(_word) - 1) + "ves";
			}

			if (last_two_letters == "fe") {
				return string_copy(_word, 1, string_length(_word) - 2) + "ves";
			}

			// Nouns ending in "o": some take "es", others just "s"
			if (last_letter == "o") {
				if (array_contains(es_exception_plurals, _word)) {
					return _word + "s";
				}
				return _word + "es";
			}

			// Default: Add "s"
			return _word + "s";
		}
	}
	
    ds_map_add(global.language_rules.irregular_plurals, "child", "children");
    ds_map_add(global.language_rules.irregular_plurals, "man", "men");
    ds_map_add(global.language_rules.irregular_plurals, "woman", "women");
    ds_map_add(global.language_rules.irregular_plurals, "tooth", "teeth");
    ds_map_add(global.language_rules.irregular_plurals, "foot", "feet");
    ds_map_add(global.language_rules.irregular_plurals, "mouse", "mice");
    ds_map_add(global.language_rules.irregular_plurals, "person", "people");
    ds_map_add(global.language_rules.irregular_plurals, "goose", "geese");
    ds_map_add(global.language_rules.irregular_plurals, "sheep", "sheep");
    ds_map_add(global.language_rules.irregular_plurals, "fish", "fish");
}