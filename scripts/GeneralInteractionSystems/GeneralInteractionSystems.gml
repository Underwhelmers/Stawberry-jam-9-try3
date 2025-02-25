function GeneralInteractionSystems() constructor {
	
}

function scr_setup_general_interaction_systems() {
	GeneralInteractionSystems.Approach = ecs_setup_system_player_action(
		"approach {name}", 
		["!is_in_reach", "shares_location_with_pc"], 
		function(entity, args) {
		var manager = obj_ecs_manager.component_manager;
		if (args.old_entity) {
			scr_inform("You left '{0}' behind.", args.old_entity.name);
			StateComponents.types.is_in_reach.remove_from(args.old_entity);
		}
		
		scr_inform("Approached to {0}", entity.name);
		StateComponents.types.is_in_reach.add_to(entity);
		args.old_entity = entity;
	});
	GeneralInteractionSystems.Approach.execute_args.old_entity = undefined;
	
	
}
