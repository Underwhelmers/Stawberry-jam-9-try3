function DialogImage(_backbox) constructor {
    backbox = _backbox;
	
	size = 400;
	yoffset = -300;
    
    static reset = function() {
        x = 0;
        y = 0;
        scale = 0;
        sprite = noone;
    }
    
    static update = function(_sprite_index) {
		if (!sprite_exists(_sprite_index))
			return;
		
        sprite = _sprite_index;
        scale = size / max(sprite_get_width(_sprite_index),sprite_get_height(_sprite_index));
        x = backbox.x           + sprite_get_xoffset(_sprite_index) * scale;
        y = backbox.y + yoffset + sprite_get_yoffset(_sprite_index) * scale;
    }
    
    static draw = function() {
        if (sprite == noone)
            return;
        
        draw_sprite_ext(sprite,0, x, y, scale, scale, 0, c_white, 1);
    }
    
    reset();
}
