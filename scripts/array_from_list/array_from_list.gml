function array_from_list(_list) {
	var _size = ds_list_size(_list);
	var _result = array_create(_size)
	
	for (var i=0; i<_size; i++)
		_result[i] = _list[|i];
	
	return _result;
}
