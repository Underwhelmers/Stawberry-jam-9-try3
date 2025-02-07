function ds_list_foreach(_list, _func) {
	var _size = ds_list_size(_list)
	for(var _idx = 0; _idx < _size; _idx++) {
		_func(_list[|_idx]);
	}
}