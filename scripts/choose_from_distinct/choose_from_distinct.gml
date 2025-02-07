function choose_from_distinct(_array, _ammount) {
	var _orig_size = array_length(_array);
	if (_orig_size < _ammount) {
		throw ("Ammount bigger than array.");
	}
	var _indexes = array_create(_orig_size);
	for (var _idx = 0; _idx < _orig_size; _idx++)
		_indexes[_idx] = _idx;
	
	for (var _idx = 0; _idx < _orig_size; _idx++) {
		var _new_idx = irandom(_orig_size-1);
		var _tmp = _indexes[_idx];
		_indexes[_idx] = _indexes[_new_idx];
		_indexes[_new_idx] = _tmp;
	}
	
	var _result = array_create(_ammount);
	for (var _idx = 0; _idx < _ammount; _idx++) {
		_result[_idx] = _array[_indexes[_idx]];
	}
	
	return _result;
}