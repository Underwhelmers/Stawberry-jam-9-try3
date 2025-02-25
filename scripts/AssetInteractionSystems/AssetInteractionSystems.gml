function AssetInteractionSystems() constructor {
	
}


function scr_setup_player_actions_with_assets() {
	AssetInteractionSystems.Take = ecs_setup_system_player_action(
		"take {name}", 
		["on_the_floor","is_in_reach","storable_in_backpack", "!on_inventory"], 
		function(entity) {
			StateComponents.types[$ "on_inventory"].add_to(entity);
			StateComponents.types[$ "on_the_floor"].remove_from(entity);
		}
	);
	
	AssetInteractionSystems.Drop = ecs_setup_system_player_action(
		"drop {name}", 
		["on_inventory"], 
		function(entity) {
			StateComponents.types[$ "on_inventory"].remove_from(entity);
			StateComponents.types[$ "on_the_floor"].add_to(entity);
		}
	);
	
	AssetInteractionSystems.Throw = ecs_setup_system_player_action(
		"throw {name}", 
		["on_inventory"], 
		function(entity) {
			if (StateComponents.types[$ "fragile"].exists_on(entity)) {
				if(success(entity.fragile.durability / 100)) {
					obj_ecs_manager.entity_manager.destroy_entity(entity);
					scr_inform("{0} destroyed on impact.",string_capitalize(entity.name));
					return;
				}
			}
			StateComponents.types[$ "on_inventory"].remove_from(entity);
			StateComponents.types[$ "on_the_floor"].add_to(entity);
		}
	);
	
	AssetInteractionSystems.Use = ecs_setup_system_player_action(
		"use {name}", 
		["is_in_reach", "door"], 
		function(entity) {
			var old_location = global.player.location;
            var new_location = entity.door.target_location;
                
            // Update player location
            global.player.location = new_location;
                
            // Update shares_location_with_pc
			var others = ds_map_values_to_array(obj_ecs_manager.entity_manager.entities);
			var shared_location = StateComponents.types.shares_location_with_pc;
			
			StateComponents.types.is_in_reach.remove_from(entity);
			
			for (var i = 0, count = array_length(others); i < count; i++) {
				var itm = others[i];
				if (struct_exists(itm, "location")) {
                    if (itm.location == old_location) {
						shared_location.remove_from(itm);
					}
					if (itm.location == new_location)
						shared_location.add_to(itm);
                }
			}
            scr_chat(global.player.name, "moved_to_new_location");
			scr_inform("Entered {0}:", new_location.name)
		}
	);
	
	new_word_variant("moved_to_new_location", ["Moved to a new spot!", "Stepped through!", "Here we are!"]);
}
