function DialogText(_backbox) constructor {
    backbox = _backbox;
    
    to_display = "";
    full_text = "";
    progress = 0;
    x = 48 + backbox.x;
    y = 46 + backbox.y;
    width = room_width - 88;
    base_progress_speed = 0.5;
	halign = fa_left;
    
    static restart_tags = function() {
        progress_speed = base_progress_speed;
        unskippable = false;
        dont_wait = false;
		halign = fa_left;
		x = 48 + backbox.x;
		y = 46 + backbox.y;
    }
    static set_speed = function(_value) {
        progress_speed = base_progress_speed * _value;
    }
    static set_full_text = function(_new_text) {
        full_text = _new_text;
        to_display = "";
        progress = 0;
    }
    static append = function(_new_text) {
        full_text += _new_text;
    }
    
    static update = function() {        
        if (progress < string_length(full_text)) {
            progress += progress_speed;
            to_display = string_copy(full_text,0,progress);
        } 
    }
    
    static is_loading = function() {
        return progress < string_length(full_text) ;
    }
    
    static load_all_instantly = function() {
        if (unskippable) return; 
        
        progress = string_length(full_text);
        to_display = full_text;
    }
    
    static draw = function() {
		draw_set_halign(halign);
        draw_text_ext(x,y,to_display,-1,width);
		draw_set_halign(fa_left);
    }
}
