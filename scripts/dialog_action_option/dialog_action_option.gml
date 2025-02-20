function dialog_action_choice(_data) {
	var _ii = 0;
	var _count = instance_number(obj_dialog_option) + 1;
			
	var _button = instance_create_depth(x,y,depth-1,obj_dialog_option);
	with (_button) {
		text = _data[1];
		create_data = _data;
		image_yscale = 128/sprite_get_height(sprite_index);
	}
			
	with(obj_dialog_option) {
		var _scale = room_width / (_count+1);
		image_xscale = _scale / sprite_get_width(sprite_index);
		y = room_height - (sprite_height + 20);
		x = (0.5 + _ii++) * sprite_width - sprite_xoffset;
	}
	
	return true;
}