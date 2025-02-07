// First setup the global: global.word_variants = {};
// Then setup the options: new_word_variant("player_name", ["Jhon", "Paul", "Dan"]);
// Finally use it in game: var _greeting = generate_phrase_with_variants("Hello |player_name|, how are you?.");
function generate_phrase_with_variants(_string, _is_iteration = false) {
	var _splits = string_split(_string,"|",true);
	var _splits_size = array_length(_splits);
	
	if (_splits_size == 1 && _is_iteration) 
		return _splits[0];

	if (_splits_size == 0) 
		return "";
	
	var _wordbag = global.word_variants;
	for (var _idx=0; _idx<_splits_size; _idx++) {
		if (struct_exists(_wordbag,_splits[_idx]))
			_splits[_idx] = struct_get(_wordbag,_splits[_idx]).get();
	}
	
	return generate_phrase_with_variants(string_concat_ext(_splits), true);
}
