function NpcInteractionSystems_setup_002_StartConversationWith() {
	NpcInteractionSystems.StartConversationWith = ecs_setup_system_player_action(
        "start conversation with", 
        ["already_introduced", "is_in_reach", "relationship_with_pc", "traits", "!in_conversation"], 
        function(entity, args) {
			resp = scr_apply_traits(entity, args.system_event, { behaviour_is_overriten: false });
            if (resp.behaviour_is_overriten) return;
			
			
            scr_chat(global.player.name, global.chat_texts[? "greet_player"]);
            scr_chat(entity.name, 
				struct_exists(args, "final_chat")? 
				args.final_chat : global.chat_texts[? "greet_positive"]
			);
			
            var manager = obj_ecs_manager.component_manager;
            ecs_change_state_with_comps(entity, [], ["in_conversation"]);
            entity.relationship_with_pc.interact(5);
        }
    );
}