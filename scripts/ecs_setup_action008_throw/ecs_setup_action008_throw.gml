function ecs_setup_action008_throw() {
    ecs_setup_system_player_action(
        "throw {name}",
        ["is_item", "in_inventory"],
        function(item) {
			
			Components.types.in_inventory.remove_from(item);
			Components.types.is_in_reach.remove_from(item);
			
			if (struct_exists(item,"fragility") && success(item.fragility)) {
				obj_ecs_manager.entity_manager.destroy_entity(item);
				scr_inform("You throwed the {0} and broke on contact.", item.name);
			} else {
				scr_inform("You throwed the {0}.", item.name);
			}
        },
    );	
}