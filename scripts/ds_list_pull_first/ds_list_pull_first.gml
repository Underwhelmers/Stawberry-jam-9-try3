function ds_list_pull_first(_list, _condition) {
	var _size = ds_list_size(_list);
	for (var _idx = 0; _idx < _size; _idx++) {
		var _value = ds_list_find_value(_list,_idx);
		if (_condition(_value)) {
			ds_list_delete(_list,_idx);
			return _value;
		}
	}
	return noone;
}