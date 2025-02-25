function scr_setup_word_variants() {
	global.word_variants = ds_map_create();
	
	global.language_rules = {
		place_article: text_place_article,
		
		irregular_plurals: ds_map_create(),
		es_exception_plurals: ["photo", "piano", "halo", "solo"],
		make_plural: text_make_plural,
		
		irregular_superlatives: ds_map_create(),
		make_superlative: text_make_superlative,
		
		make_adverb_from_adj: text_make_adverb_from_adj,
		
		irregular_ing_from_verb: ds_map_create(),
		make_ing_from_verb: text_make_ing_from_verb,
		
		make_third_person_singular_present_from_verb: text_make_third_person_singular_present_from_verb
	};
	
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
	
	ds_map_add(global.language_rules.irregular_superlatives, "good", "best");
    ds_map_add(global.language_rules.irregular_superlatives, "bad", "worst");
    ds_map_add(global.language_rules.irregular_superlatives, "far", "farthest");
    ds_map_add(global.language_rules.irregular_superlatives, "little", "least");
    ds_map_add(global.language_rules.irregular_superlatives, "many", "most");
    ds_map_add(global.language_rules.irregular_superlatives, "much", "most");
    ds_map_add(global.language_rules.irregular_superlatives, "well", "best");
    ds_map_add(global.language_rules.irregular_superlatives, "big", "biggest");
	
	
	ds_map_add(global.language_rules.irregular_ing_from_verb, "quit" , "quitting");
	ds_map_add(global.language_rules.irregular_ing_from_verb, "debut", "debuting");
	ds_map_add(global.language_rules.irregular_ing_from_verb, "exit" , "exiting");
	ds_map_add(global.language_rules.irregular_ing_from_verb, "tie"  , "tying");
	ds_map_add(global.language_rules.irregular_ing_from_verb, "die"  , "dying");
	ds_map_add(global.language_rules.irregular_ing_from_verb, "lie"  , "lying");
}

function text_place_article(_word) {
	_word = string_trim(_word);
	var _size = string_length(_word)
	if (_size == 0) return "";
	
	var _first_word = _word;
	var _first_space = string_pos(_word, " ");
	if (_first_space > 0) {
		var _first_word = string_copy(_word,1,_first_space);
	}
	
	if (string_ends_with(_first_word, "st")) {
		return "the "+_word;
	}
	
	var first_letter = string_lower(string_copy(_word, 1, 1));
	if (first_letter == "a" || first_letter == "e" || first_letter == "i" || first_letter == "o" || first_letter == "u")
		return "an "+_word;
	return "a "+_word;
}

function text_make_plural(_word) {
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

function text_make_superlative(_word) {
    _word = string_trim(_word); // Trim spaces

    // Check if the word is in the irregular map
    if (ds_map_exists(irregular_superlatives, _word)) {
		return irregular_superlatives[? _word];
	}

    // Rule 1: If the word ends in "e", add "st"
    if (string_ends_with(_word, "e")) {
        return _word + "st";
    }

    // Rule 2: If the word ends in "y", change "y" to "iest"
    if (string_ends_with(_word, "y")) {
        return string_copy(_word, 1, string_length(_word) - 1) + "iest";
    }

    // Rule 3: Otherwise, add "est"
    return _word + "est";
}


function text_make_adverb_from_adj(_adj) {
    // Rule 1: Adjectives ending in "y" change to "ily"
    if (string_ends_with(_adj, "y")) {
        return string_copy(_adj, 1, string_length(_adj) - 1) + "ily";
    }
    
    // Rule 2: Adjectives ending in "le" change to "ly"
    if (string_ends_with(_adj, "le")) {
        return string_copy(_adj, 1, string_length(_adj) - 2) + "ly";
    }
    
    // Rule 3: Adjectives ending in "ic" change to "ally"
    if (string_ends_with(_adj, "ic")) {
        return _adj + "ally";
    }
    
    // Rule 4: If the adjective ends in "ly", no change
    if (string_ends_with(_adj, "ly")) {
        return _adj;
    }
    
    // Default rule: Add "ly" to the adjective
    return _adj + "ly";
}


function text_make_ing_from_verb(_verb) {
    _verb = string_trim(_verb);  // Trim any whitespace
	
	// Check if the word is in the irregular map
    if (ds_map_exists(irregular_ing_from_verb, _verb)) {
		return irregular_ing_from_verb[? _verb];
	}
    var _last_char = string_copy(_verb, -1, 1);
	
    // Rule 1: If the verb ends in "e", drop the "e" and add "ing"
    if (_last_char == "e") {
        return string_copy(_verb, 1, string_length(_verb) - 1) + "ing";
    }
	
    // Rule 2: If the verb ends with "y", do not change (e.g., "study" -> "studying")
    if (_last_char == "y" || _last_char == "x" || _last_char == "w") {
        return _verb + "ing";
    }

    // Rule 1: In a one-syllable verb ending in one consonant letter preceded by one vowel letter,
    // double the final consonant letter.
    if (string_length(_verb) > 2) {
        var _second_last_char = string_copy(_verb, -2, 1);
        var _third_last_char = string_copy(_verb, -3, 1);
        
        // Check if the last two characters are vowel + consonant and the consonant is not a part of a digraph or silent
        if (string_pos("aeiou", _second_last_char) != -1 && string_pos("bcdfghjklmnpqrstvwxz", _last_char) != -1) {
            if (_third_last_char != "e" && string_pos("aeiou", _last_char) == -1) {
                return _verb + _last_char + "ing"; // Double the consonant
            }
        }
		
        // Check if there are two vowels before the final consonant
        if (string_pos("aeiou", _second_last_char) != -1 && string_pos("aeiou", _third_last_char) != -1) {
            return _verb + "ing"; // No doubling
        }
		
        // Check for stress based on the assumption that stress on the last syllable triggers doubling
        if (string_pos("aeiou", _second_last_char) != -1 && string_pos("bcdfghjklmnpqrstvwxz", _third_last_char) == -1) {
            return _verb + _last_char + "ing"; // Double the consonant
        }
    }

    // Rule 4: Default case (for regular verbs that don't fall into the above rules)
    return _verb + "ing";
}

function text_make_third_person_singular_present_from_verb(_verb) {
    static es_terminations = ["s","x","z","ch","sh"];
	
	for (var i = 0, count = array_length(es_terminations); i < count; i++) {
		if (string_ends_with(_verb,es_terminations[i]))
			return _verb + "es";
	}
	
    if (string_ends_with(_verb, "y")) {
        return string_copy(_verb, 1, string_length(_verb) - 1) + "ies";
    }
	
    return _verb + "s";
}