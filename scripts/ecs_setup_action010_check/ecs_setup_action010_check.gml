function ecs_setup_action010_check() {
    ecs_setup_system_player_action(
        "check {name}",
        ["identity", "is_in_reach"],
        function(entity) {
			if (struct_exists(entity, "checks") && (entity.checks.index < entity.checks.size)) {
				scr_chat("CHECK-RESULT", entity.checks.values[entity.checks.index++]);
			} else {
				scr_chat("CHECK-RESULT", "I won't learn anything new from this {0}.", entity.name);
			}
        }
    );
	
	global.chat.user_colour[? "CHECK-RESULT"] = make_color_hsv(125,125,125);
	
	Components.types.checks = new Components(
		"checks", undefined,
		function(entity, values) {
			default_add(entity, {
				index: 0,
				size: array_length(values),
				values: values,
			});
		}
	)
}