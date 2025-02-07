function ds_grid_valid_x(_grid, _x) {
	return _x >= 0 && ds_grid_width(_grid) > _x;
}