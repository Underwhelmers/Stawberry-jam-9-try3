if (updating) {
	updating = false;
	
	instance_destroy(obj_usable_action_part);
    var tree = scr_build_action_tree(pending_actions);
    var root = instance_create_depth(SCREEN_W * 0.5, SCREEN_H * 0.5, 0, obj_usable_action_part, {
        node: tree,
    });
	
    if (tree.mytext == "") { // First node might be empty
		with (root) {
			x = -100;
			node_depth = -1;
			visible = false;
			scr_usable_action_part_callback();
		}
	}
}

if (require_update) {
	updating = true;
	require_update = false;
    pending_actions = []; // Clear old actions
}