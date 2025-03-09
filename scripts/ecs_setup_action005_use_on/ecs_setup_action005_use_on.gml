function ecs_setup_action005_use_on() {
    ecs_setup_system_multiplayer_action(
        "use {name1} on {name2}",
        [["is_item", "in_inventory"], ["is_in_reach"]],
        function(entities) {
            var item = entities[0];
            var target = entities[1];
			
            scr_inform("You used the {0} on {1}.", item.name, target.name);
			item.use_on(target);
        },
    );
	
	ecs_setup_system_multiplayer_action(
        "use {name1} on self",
        [["is_item", "in_inventory"]],
        function(entities) {
            var item = entities[0];
			
            scr_inform("You used the {0} on yourself.", item.name);
			item.use_on(global.player);
        },
    );
	
}