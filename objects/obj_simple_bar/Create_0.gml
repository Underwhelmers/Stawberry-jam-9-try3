act_value = 0;
min_value = 0;
max_value = 1000;
progress = 0;

margin_witdth = nineslice_left+nineslice_right;
img_progress_offset = (margin_witdth) / (sprite_get_width(sprite_index));


draw_value = 0;
draw_add_speed = 0.125;
draw_remove_speed = 0.25;


text_yoffset = sprite_height - sprite_yoffset

add = function(_value) {
	act_value += _value;
	post_update();
}

set = function(_value) {
	act_value = _value;
	post_update();
}

draw_on_bar = function(_sprite_index, _progress, _index = 0, _xscale = 1, _yscale = 1) {
	var _len = nineslice_left+(sprite_width-margin_witdth)*_progress;
	var _relx = lengthdir_x(_len,image_angle);
	var _rely = lengthdir_y(_len,image_angle);
	
	draw_sprite_ext(_sprite_index,_index,x+_relx,y+_rely,_xscale,_yscale, image_angle, image_blend, image_alpha);
};

get_xpos = function (_progress) {
	var _len = nineslice_left + (sprite_width - margin_witdth) * _progress;
	return x + lengthdir_x(_len, image_angle);
};

get_ypos = function (_progress) {
	var _len = nineslice_left + (sprite_width - margin_witdth) * _progress;
	return y + lengthdir_y(_len, image_angle);
};

post_update = function() {
	act_value = clamp(act_value, min_value, max_value);
	progress = (act_value - min_value) / (max_value - min_value);
};