function Point2d(_x = 0, _y = 0, _xoff = 0, _yoff = 0) constructor {
	x = _x;
	y = _y;
	
	initialx = _x;
	initialy = _y;
	
	xoffset = _xoff;
	yoffset = _yoff;
		
	static update_initials = function(_x = x, _y = y) {
		initialx = x;
		initialy = y;
	}
	
	static reset_position = function() {
		x = initialx;
		y = initialy;
	}
	
	static clone = function() {
		return new Point2d(x,y);
	}
	
	static times = function(_lambda) {
		x = x*_lambda;
		y = y*_lambda;
	}
	
	static add_point = function(_point) {
		x += _point.x;
		y += _point.y;
	}
	
	static add = function(_x, _y) {
		x += _x;
		y += _y;
	}
	
	static is = function(_x, _y) {
		return x == _x && y == _y;
	}
	
	static set = function(_x, _y) {
		x = _x;
		y = _y;
	}
	
	static take_offsets = function(_sprite_index, _view_halign, _view_valign) {
		var _anchor = new ViewAnchor(
			sprite_get_xoffset(_sprite_index),
			sprite_get_yoffset(_sprite_index),
			_view_halign, _view_valign
		);
		var _new_offsets = new Point2d();
		
		_anchor.set_position(
			sprite_get_width(_sprite_index),
			sprite_get_height(_sprite_index),
			_new_offsets
		);
		
		xoffset = _new_offsets.x;
		yoffset = _new_offsets.y;
		
		delete _new_offsets;
		delete _anchor;
	}
	static draw_x = function() {
		return x + xoffset;
	}
	static draw_y = function() {
		return y + yoffset;
	}
}