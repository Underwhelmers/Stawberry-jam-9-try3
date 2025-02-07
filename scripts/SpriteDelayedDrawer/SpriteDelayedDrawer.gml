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
		x            = lerp(x           , drawed.x           , speed);
		y            = lerp(y           , drawed.y           , speed);
		sprite_index = lerp(sprite_index, drawed.sprite_index, speed);
		image_index  = lerp(image_index , drawed.image_index , speed);
		image_xscale = lerp(image_xscale, drawed.image_xscale, speed);
		image_yscale = lerp(image_yscale, drawed.image_yscale, speed);
		image_alpha  = lerp(image_alpha , drawed.image_alpha , speed);
		image_blend  = lerp(image_blend , drawed.image_blend , speed);
		image_angle  = lerp(image_angle , drawed.image_angle , speed);
	}
}