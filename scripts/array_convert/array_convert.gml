function array_convert(_array, _function) {
	var _size = array_length(_array);
	var _result = array_create(_size);
	
	for (var _idx = 0; _idx < _size; _idx++)
		_result[_idx] = _function(_array[_idx]);
	
	return _result;
}