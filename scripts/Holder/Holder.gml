function Holder(
	_position, 
	_width, 
	_height,
	_center_xoffset,
	_center_yoffset,
	_item_pivot_x = HOLDER_ITEM_PIVOT_X.CENTER, 
	_item_pivot_y = HOLDER_ITEM_PIVOT_Y.CENTER
) constructor {
	width = _width;
	height = _height;
	position = _position;
	item_pivot_x = _item_pivot_x;
	item_pivot_y = _item_pivot_y;
	center_xoffset = _center_xoffset;
	center_yoffset = _center_yoffset;
	
	
	item_yoff = item_pivot_y * height / 2 - _center_yoffset;
	item_xoff = 0;
	item_width = 0;
	
	set_total = function(_total) {
		item_width = width / _total;
		item_xoff = item_pivot_x * item_width / 2 - _center_xoffset;
	}
	
	get_x_for = function(_index) {
		return position.x + item_xoff + _index * item_width;
	}
	get_y_for = function(_index) {
		return position.y + item_yoff;
	}
}

enum HOLDER_ITEM_PIVOT_X {
	LEFT = 0, CENTER = 1, RIGHT = 2
}
enum HOLDER_ITEM_PIVOT_Y {
	TOP = 0, CENTER = 1, BOTTOM = 2
}