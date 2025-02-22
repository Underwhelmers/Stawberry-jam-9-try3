function GeneralInteractionSystems() constructor {
	
}

function scr_setup_general_interaction_systems() {
	GeneralInteractionSystems.Approach = ecs_setup_system_player_action("approach", ["out_of_reach"], function(entity, args) {
		var manager = obj_ecs_manager.component_manager;
		if (args.old_entity) {
			scr_inform("You left '{0}' behind.", args.old_entity.name);
			ecs_change_state_with_comps(args.old_entity,
				["is_in_reach", "in_conversation","sitting_together","npc_is_ready_for_intimacy","is_naked","making_love"],
				["out_of_reach"]
			);
		}
		
		scr_inform("Approached to {0}", entity.name);
		ecs_change_state_with_comps(entity,
			["out_of_reach"],
			["is_in_reach"]
		);
		args.old_entity = entity;
	});
	GeneralInteractionSystems.Approach.execute_args.old_entity = undefined;
	
	
}
