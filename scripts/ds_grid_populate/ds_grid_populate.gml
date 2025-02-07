function ds_grid_populate(_grid, _func) {
	var _width = ds_grid_width(_grid);
	var _height = ds_grid_height(_grid);
	
	for (var _xx = 0; _xx < _width; _xx++) {
	for (var _yy = 0; _yy < _height; _yy++) {
		ds_grid_set(_grid, _xx, _yy, _func(_xx, _yy));
	}}
}