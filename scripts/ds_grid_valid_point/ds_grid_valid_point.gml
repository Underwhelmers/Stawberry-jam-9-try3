function ds_grid_valid_point(_index, _point) {
	return _point.x >= 0 && _point.y >= 0 && _point.x < ds_grid_width(_index) && _point.y < ds_grid_height(_index);
}