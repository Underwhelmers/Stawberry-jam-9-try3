function scr_build_action_menu() {
    instance_destroy(obj_usable_action_part); // Clear old UI
    
	var actions = obj_usable_action_manager.available_actions;
    var action_count = array_length(actions);
    if (action_count == 0) return;

    var start_x = SCREEN_W * 0.75;
    var start_y = SCREEN_H * 0.2;
    var spacing = 40; // Vertical spacing between items
    
    for (var i = 0; i < action_count; i++) {
        var action = actions[i];
        instance_create_depth(start_x, start_y + i * spacing, 0, obj_usable_action_part, {
            text: action.text,
            callback: action.callback
        });
    }
}