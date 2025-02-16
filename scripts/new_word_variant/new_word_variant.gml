function new_word_variant(_word, _values) {
	struct_set(global.word_variants,_word, new ValueBag(_values));
	
	var _capvalues = array_map(_values,function(_val, _idx) { return string_capitalize(_val) });
	struct_set(global.word_variants,string_capitalize(_word), new ValueBag(_capvalues));
}
