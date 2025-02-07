function image_scale_to(_width, _height, _sprite_id = sprite_index) {
	var _imagew = sprite_get_width (_sprite_id);
	var _imageh = sprite_get_height(_sprite_id);
	
	image_xscale =  _width / _imagew;
	image_yscale = _height / _imageh;
}