function scr_usable_action_part_callback() {
	if (!selected) {
		selected = true;
		
		y = irandom_range(64,80);
		x = (node_depth == 0) ? SCREEN_W/2 : clicked_x;
	} else {
		var is_last = true;
		var prev_part = noone;
		with (obj_usable_action_part) {
            if (!selected) instance_destroy();
			else if (node_depth > other.node_depth) {
				is_last = false;
				instance_destroy();
			} else if (node_depth == other.node_depth-1) {
				prev_part = id;
			}
        }
		
		if (is_last && prev_part) {
			with (prev_part) 
				scr_usable_action_part_callback();
			return;
		}
	}
	
    if (ds_map_size(node.childrens) == 0) {
        visible = false;
        node.callback(node.mytext, node.args); // Final action
    } else {
		// Clean unselected
        with (obj_usable_action_part) {
            if (!selected) instance_destroy();
        }
		
        var children = ds_map_values_to_array(node.childrens);
        var child_count = array_length(children);
        var angle_step = 360 / max(1, child_count);
        var radius = 16 * sqrt(child_count);
        for (var i = 0; i < child_count; i++) {
            var angle = angle_step * i + random_range(-angle_step/2, angle_step/2); // Slight randomness
            var child_x = SCREEN_W*0.6 + lengthdir_x(radius, angle);
            var child_y = SCREEN_H*0.6 + lengthdir_y(radius, angle);
			
			var cx = SCREEN_W * 0.5 +lengthdir_x(SCREEN_W,angle);
			var cy = SCREEN_H * 0.5 +lengthdir_y(SCREEN_H,angle);
            var inst = instance_create_depth(cx, cy, 0, obj_usable_action_part, {
                node: children[i],
				node_depth: node_depth + 1,
				clicked_x: x+sprite_width+8,
            });
			
			inst.x = child_x;
			inst.y = child_y;
        }
    }
}