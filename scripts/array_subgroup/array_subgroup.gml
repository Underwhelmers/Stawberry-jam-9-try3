function array_subgroup(_source, _from, _to = -1) {
	// Ensure the source is valid
    if (!is_array(_source)) return [];

    // Handle default `_to` value
    if (_to == -1) _to = array_length(_source);
    if (_to > array_length(_source)) _to = array_length(_source);
	
    // Validate range
    if (_from < 0) _from = 0;
	if (_to < _from) return [];

    // Extract subarray
    var _result = array_create(_to-_from);
    for (var _i = 0; _i < _to-_from; _i++)
		_result[_i] = _source[_i+_from];
	
	return _result;
}