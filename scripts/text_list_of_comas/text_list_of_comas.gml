function text_list_of_comas(_array, _final_join_format = "{0}, and {1}") {
	var count = array_length(_array);
	if (count == 0) return "";
	if (count == 1) return _array[0];
	
	var result = _array[0];
	for (var i = 1; i < count-1; i++) {
		result = string("{0}, {1}", result, _array[i]);
	}
	
	return string(_final_join_format, result, _array[count-1]);
}
