callback = function() {
	y = 64;
	x = clicked_x;
	
	if (selected) {
		var previous = noone;
		var is_lats = true; 
		with (obj_usable_action_part) {
			if (selected) {
				if (node_depth == other.node_depth-1) {
					previous = id;
				}
			
				if (node_depth > other.node_depth) {
					is_lats = false;
					instance_destroy();
				}
			}
		}
		
		if (is_lats) {
			previous.callback();
			exit;
		}
	}
	
	selected = true;
	
	
	if (ds_map_size(node.childrens) == 0) {
		visible = false;
		node.callback(node.mytext, node.args);
	} else {
		with(obj_usable_action_part) {
			if (!selected) {
				instance_destroy();
			}
		}
		
		var _childs = ds_map_values_to_array(node.childrens);
		for (var i = 0, count = array_length(_childs); i < count; i++) {
			var _child = _childs[i];
			var isnt = instance_create_depth(SCREEN_W + 12, SCREEN_H / 2, 0, obj_usable_action_part, { 
				node: _child,
				clicked_x: x + sprite_width + 16,
				node_depth: node_depth + 1
			});
		}
		scr_distribute_usable_action_parts();
	}
};

showntext = node.mytext;
if (!string_ends_with(showntext, "-")) {
	showntext += " ..."
}
draw_set_font(fnt_default_button);
var w = string_width(showntext);
var h = string_height(showntext);
draw_set_font(fnt_default);
image_scale_to(w+16,h+16);

rectangle = new Rectangle(0,0,sprite_width,sprite_height);
drawer = new SpriteDelayedDrawer(id,0.2);