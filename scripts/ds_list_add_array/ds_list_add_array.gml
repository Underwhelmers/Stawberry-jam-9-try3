function ds_list_add_array(_list, _array, _cond = global.empty_func_1param) {
	var _size = array_length(_array);
	for (var _idx = 0; _idx < _size; _idx++) {
		if (_cond == noone || _cond(_array[_idx]))
			ds_list_add(_list,_array[_idx]);
	}
}