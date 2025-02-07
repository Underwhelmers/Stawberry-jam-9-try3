function ds_list_pull_random(_list) {
	var _size = ds_list_size(_list);
	if (_size == 0)
		return noone;
	
	var _idx = irandom(_size-1);
	var _value = ds_list_find_value(_list, _idx);
	ds_list_delete(_list, _idx);
	
	return _value;
}