function ds_list_any_fulfills(_list, _condition) {
	var _size = ds_list_size(_list);
	for (var _idx = 0; _idx < _size; _idx++) {
		if (_condition(ds_list_find_value(_list,_idx)))
			return true;
	}
	return false;
}