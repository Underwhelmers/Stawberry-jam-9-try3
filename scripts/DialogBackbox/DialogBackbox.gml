
function DialogBackbox() constructor {
    x = 0;
    y = 0;
	
    height = 323;
    image = spr_dialog_background;
    
    yscale = height / sprite_get_height(image);
    xscale = SCREEN_WIDTH / sprite_get_width(image);
	
	width = SCREEN_WIDTH;
    
    static draw = function() {
        draw_sprite_ext(image, 0, x, y, xscale, yscale,0,c_white,1);
    }
}
