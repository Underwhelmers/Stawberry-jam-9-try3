function SurfaceSpriteDrawer() constructor {
	instance = noone;
	draw_xoff = 0;
	draw_yoff = 0;
	
	static is_loaded = function() {
		return surface_exists(instance);
	}
	
	static load = function(_sprite) {
		instance = surface_create(sprite_get_width(_sprite), sprite_get_height(_sprite));
		draw_xoff = sprite_get_xoffset(_sprite);
		draw_yoff = sprite_get_yoffset(_sprite);		
	}
	
	static set_surface = function(_depth = 0) {
		surface_set_target(instance,_depth);
	}
	
	static reset_surface = function() {
		surface_reset_target();
	}
	
	static draw = function(_x, _y, _scale, _angle) {
		// Offset rotation adjustment
		var _cos_angle = dcos(_angle);
		var _sin_angle =-dsin(_angle);
			
		// Calculate the rotated position of the offset
		var _rotated_xoff = draw_xoff * _cos_angle - draw_yoff * _sin_angle;
		var _rotated_yoff = draw_xoff * _sin_angle + draw_yoff * _cos_angle;
			
		// Draw the surface with the adjusted pivot
		draw_surface_ext(
			instance,
			_x - _rotated_xoff * _scale,
			_y - _rotated_yoff * _scale,
			_scale,
			_scale,
			_angle,
			c_white,
			1
		);
	}
	
}