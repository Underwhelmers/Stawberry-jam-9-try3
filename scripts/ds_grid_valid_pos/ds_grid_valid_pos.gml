function ds_grid_valid_pos(_index, _x, _y) {
	return _x >= 0 && _y >= 0 && _x < ds_grid_width(_index) && _y < ds_grid_height(_index);
}