function SpriteDrawer(_sprite_index_template) constructor {
	_base_size = new Point2d(
		sprite_get_width(_sprite_index_template),
		sprite_get_height(_sprite_index_template)
	);
	_base_draw_offset = new Point2d(
		sprite_get_xoffset(_sprite_index_template),
		sprite_get_yoffset(_sprite_index_template)
	);
	
	scale = new Point2d(1,1);
	size = _base_size.clone();
	draw_offset = _base_draw_offset.clone();
	
	draw_angle = 0;
	draw_colour = c_white;
	draw_alpha = 1;
	
	offset_anchor = {
		offset: new Point2d(),
		relative_offset: true,
		get_offset_for: function(_width, _height, _output = new Point2d()) {
			if (!relative_offset) {
				_output.set(offset.x, offset.y);
				return _output;
			} 
			_output.set(-offset.x * _width, -offset.y * _height);
			return _output;
		}
	};
	
	static set_image_scale = function(_image_xscale, _image_yscale) {
		scale.set(
			_image_xscale, 
			_image_yscale
		);
		
		size.set(
			abs(_base_size.x * _image_xscale), 
			abs(_base_size.y * _image_yscale)
		);
		
		offset_anchor.get_offset_for(size.x, size.y, draw_offset);
		draw_offset.add_pos(
			_base_draw_offset.x * _image_xscale,
			_base_draw_offset.y * _image_yscale
		);
		
		return self;
	};
	static set_image_new_size = function(_width, _height) {
		if (_width == 0 || _height == 0) {
			using_image_scale(0,0);
		} else {
			using_image_scale(_base_size.x / _width, _base_size.y / _height);
		}
		return self;
	};
	static set_draw_anchor = function(_xval, _yval, _is_relative_to_sprite = true) {
		offset_anchor.offset.set(_xval, _yval);
		offset_anchor.relative_offset = _is_relative_to_sprite;
		return self;
	};
	static set_angle = function(_angle) {
		draw_angle = _angle;
		return self;
	};
	static set_colour = function(_colour) {
		draw_colour = _colour;
		return self;
	};
	static set_alpha = function(_alpha) {
		draw_alpha = _alpha;
		return self;
	};
	static set_draw_ext = function(_angle, _colour, _alpha) {
		draw_angle = _angle;
		draw_colour = _colour;
		draw_alpha = _alpha;
		return self;
	};
	
	static draw = function(_sprite_index, _image_index, _x, _y) {
		draw_sprite_ext(
			_sprite_index,
			_image_index,
			draw_offset.x + _x, 
			draw_offset.y + _y, 
			scale.x,
			scale.y,
			draw_angle,
			draw_colour,
			draw_alpha
		);
	};
	static transform_instance = function(_instance_id, _update_position = false, _fit_sprite_to_size = false) {
		var _transform = self;
		with (_instance_id) {
			if (_fit_sprite_to_size) {
				var _width = sprite_get_width(sprite_index);
				var _height = sprite_get_height(sprite_index);
				var _xoffset = sprite_get_xoffset(sprite_index);
				var _yoffset = sprite_get_yoffset(sprite_index);
				
				var _image_xscale = _transform.scale.x * _width  / _transform._base_size.x;
				var _image_yscale = _transform.scale.y * _height / _transform._base_size.y;
				
				if (_update_position) {
					var _draw_offset = _transform
						.offset_anchor
						.get_offset_for(
							_transform.size.x, 
							_transform.size.y
						);
					_draw_offset.add_pos(_xoffset, _yoffset);
				
					x += _draw_offset.x - _xoffset * image_xscale;
					y += _draw_offset.y - _yoffset * image_yscale;
				}
				
				image_xscale = _image_xscale;
				image_yscale = _image_yscale;
			} else {
				if (_update_position) {
					x += _transform.draw_offset.x - _transform._base_draw_offset.x * image_xscale;
					y += _transform.draw_offset.y - _transform._base_draw_offset.y * image_yscale;
				}
				image_xscale = _transform.scale.x;
				image_yscale = _transform.scale.y;
			} 
			
			image_angle = _transform.draw_angle;
			image_blend = _transform.draw_colour;
			image_alpha = _transform.draw_alpha;
		}
		return self;
	};
}
