function scr_distribute_usable_action_parts() {
	var parts_array = [];
	
	with(obj_usable_action_part) {
		if (!selected) {
			array_push(parts_array, rectangle);
		}
	}
	
	pos_separated_squares(SCREEN_W*.2, SCREEN_H*.2,parts_array);
	
	with(obj_usable_action_part) {
		if (!selected) {
			x = floor(SCREEN_W*0.55 + rectangle.xleft);
			y = floor(SCREEN_H*0.55 + rectangle.ycenter);
			
			show_debug_message("pos {0},{1}", x, y);
		}
	}
}