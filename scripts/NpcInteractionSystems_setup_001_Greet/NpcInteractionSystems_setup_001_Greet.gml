function NpcInteractionSystems_setup_001_Greet() {
	NpcInteractionSystems.Greet = ecs_setup_system_player_action(
        "greet", 
        ["!already_introduced", "is_in_reach", "relationship_with_pc", "traits"], 
        function(entity, args) {
            scr_chat(global.player.name, "Hello!");
            var resp = scr_apply_traits(entity, "on_interaction", { 
				behaviour_is_overriten: false,
				final_chat: "Hi!"
			});
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            scr_chat(entity.name, resp.final_chat);
			
            var manager = obj_ecs_manager.component_manager;
            ecs_change_state_with_comps(entity, [], ["in_conversation", "already_introduced"]);
            entity.relationship_with_pc.interact(5);
        }
    );
}