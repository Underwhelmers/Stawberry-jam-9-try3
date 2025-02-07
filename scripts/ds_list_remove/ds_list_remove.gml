function ds_list_remove(_id, _item) {
	var _idx = ds_list_find_index(_id, _item);
	if (_idx >=0) ds_list_delete(_id, _idx);
}