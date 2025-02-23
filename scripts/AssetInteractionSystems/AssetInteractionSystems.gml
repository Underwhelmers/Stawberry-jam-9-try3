function AssetInteractionSystems() constructor {
	
}


function scr_setup_player_actions_with_assets() {
	AssetInteractionSystems.Take = ecs_setup_system_player_action("take", ["on_the_floor","is_in_reach","storable_in_backpack"], function(entity) {
		var manager = obj_ecs_manager.component_manager;
		ecs_change_state_with_comps(entity,
			["on_the_floor", "is_in_reach"],
			["on_inventory"]
		);
	});
	
	AssetInteractionSystems.Drop = ecs_setup_system_player_action("drop", ["on_inventory"], function(entity) {
		var manager = obj_ecs_manager.component_manager;
		ecs_change_state_with_comps(entity,
			["on_inventory"],
			["on_the_floor", "is_in_reach"]
		);
	});
	
	AssetInteractionSystems.Throw = ecs_setup_system_player_action("throw", ["on_inventory"], function(entity) {
		var manager = obj_ecs_manager.component_manager;
		if (manager.has_component(entity,"fragile")) {
			if(success(entity.fragile.break_chance)) {
				obj_ecs_manager.entity_manager.destroy_entity(entity);
				scr_inform("{0} destroyed on impact.",string_capitalize(entity.name));
				return;
			}
		}
		
		ecs_change_state_with_comps(entity,
			["on_inventory"],
			["on_the_floor", "out_of_reach"]
		);
	});
}
