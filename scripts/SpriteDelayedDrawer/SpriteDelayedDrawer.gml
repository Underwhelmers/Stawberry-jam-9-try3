function SpriteDelayedDrawer(_drawed, _speed) constructor {
	drawed = _drawed;
	speed  = _speed;
	x = drawed.x;
	y = drawed.y;
	sprite_index = drawed.sprite_index;
	image_index = drawed.image_index;
	image_xscale = drawed.image_xscale;
	image_yscale = drawed.image_yscale;
	image_alpha = drawed.image_alpha;
	image_blend = drawed.image_blend;
	image_angle = drawed.image_angle;
	
	static update = function() {
		image_index  = drawed.image_index;
		sprite_index = drawed.sprite_index;
		
		x            = lerp(x           , drawed.x           , speed);
		y            = lerp(y           , drawed.y           , speed);
		image_xscale = lerp(image_xscale, drawed.image_xscale, speed);
		image_yscale = lerp(image_yscale, drawed.image_yscale, speed);
		image_alpha  = lerp(image_alpha , drawed.image_alpha , speed);
		image_blend  = lerp(image_blend , drawed.image_blend , speed);
		
		image_angle  = lerp(image_angle , drawed.image_angle , speed);
	}
	
	static draw = function() {
		draw_sprite_ext(
			sprite_index,
			image_index,
			x,y,
			image_xscale,
			image_yscale,
			image_angle,
			image_blend,
			image_alpha
		);
	};
	
	static get_position_offset = function() {
		return new Point2d(x - drawed.x, y - drawed.y);
	}
}