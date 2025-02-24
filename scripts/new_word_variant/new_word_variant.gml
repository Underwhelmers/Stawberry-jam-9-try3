function new_word_variant(_word, _values) {
	var _capvalues = array_map(_values,
		function(_val, _idx) { return string_capitalize(_val) }
	);
	
	global.word_variants[? string_capitalize(_word)] = new ValueBag(_capvalues);
	global.word_variants[? _word] = new ValueBag(_values);
}


function new_word_variant_from_key(_word, _values) {
	var _capvalues = array_map(_values,
		function(_val, _idx) { return string_capitalize(_val) }
	);
	
	global.word_variants[? string_capitalize(_word)] = new ValueBag(_capvalues);
	global.word_variants[? _word] = new ValueBag(_values);
}

function new_word_variant_from_adj(_adj, _values) {
	new_word_variant_from_key(_adj, _values);
	
	var _superlvalues = array_map(_values,
		function(_val, _idx) { return global.language_rules.make_superlative(_val) }
	);
	new_word_variant_from_key(global.language_rules.make_superlative(_adj), _superlvalues);
	
	
	var _advervalues = array_map(_values,
		function(_val, _idx) { return global.language_rules.make_adverb_from_adj(_val) }
	);
	new_word_variant_from_key(global.language_rules.make_adverb_from_adj(_adj), _advervalues);

}

function new_word_variant_from_noun(_noun, _values) {
	new_word_variant_from_key(_noun, _values);
	
	var _pluralvalues = array_map(_values,
		function(_val, _idx) { return global.language_rules.make_plural(_val) }
	);
	new_word_variant_from_key(global.language_rules.make_plural(_noun), _pluralvalues);

}


function new_word_variant_from_verb(_verb, _values) {
	new_word_variant_from_key(_verb, _values);
	
	var _ingvalues = array_map(_values,
		function(_val, _idx) { return global.language_rules.make_ing_from_verb(_val) }
	);
	new_word_variant_from_key(global.language_rules.make_ing_from_verb(_verb), _ingvalues);
}
