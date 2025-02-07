function DialogName(_backbox) constructor {
    backbox = _backbox;
    
    static reset = function() {
        x = 0;
        y = 0;
        value = "";
        back_xscale = 0;
        back_yscale = 0;
        back_image = spr_dialog_background;    
    }
    
    static update = function(_new_value) {
        value = _new_value;
        x = backbox.x + 12;
        y = backbox.y - 35;
        draw_set_font(fnt_dialog);
        back_xscale = (110+string_width (_new_value)) / sprite_get_width (back_image);
        back_yscale = ( 75+string_height(_new_value)) / sprite_get_height(back_image);
        draw_set_font(fnt_default);
    }
    
    static draw = function() {
        if (value == "")
            return;
            
        draw_sprite_ext(back_image,0,x,y,back_xscale,back_yscale,0,c_white,1);
        draw_text(x+45,y+35,value);
    }
    
    reset();
}
