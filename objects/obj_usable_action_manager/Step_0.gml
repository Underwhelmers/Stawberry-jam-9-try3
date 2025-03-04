if (!generate_player_actions) {
	exit;
}

if (require_update) {
	require_update = false;
    tree = scr_build_action_tree(player_actions);
	
	instance_destroy(obj_usable_action_part);
    var root = instance_create_depth(SCREEN_W * 0.5, SCREEN_H * 0.5, 0, obj_usable_action_part, {
        node: tree,
    });
	
	
    if (tree.mytext == "") { // First node might be empty
		if (ds_map_empty(tree.childrens)) {
			instance_destroy(root);
		}
		with (root) {
			x = -100;
			node_depth = -1;
			visible = false;
			scr_usable_action_part_callback();
		}
	}
}