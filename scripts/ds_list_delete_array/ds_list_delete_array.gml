function ds_list_delete_array(_list, _array) {
	var _size = ds_list_size(_list);
	var _size2 = array_length(_array);
	for (var _idx = 0; _idx < _size; _idx++) {
		var _list_item = _list[| _idx];
		
		for (var _idx2 = 0; _idx2 < _size2; _idx2++) {
			if (_list_item == _array[_idx2]) {
				ds_list_delete(_list,_idx);
				_idx--;
				break;
			}
		}
	}
	return false;
}