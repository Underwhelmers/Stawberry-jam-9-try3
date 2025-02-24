function NpcInteractionSystems_setup_031_StartBangingWith() {
   NpcInteractionSystems.StartBangingWith = ecs_setup_system_player_npc_interaction(
        "start banging with",
        ["npc_is_ready_for_intimacy", "is_aroused", "relationship_with_pc", "traits", "!is_banging", "!banging_state"],
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            
			if (entity.traits.check_all(undefined,60,60,60,60)) {
				ecs_setup_component_banging_state(obj_ecs_manager.component_manager, entity);
				// No immediate banging start—just sets up state and prompts alignment
		        scr_chat(entity.name, global.chat_texts[? "start_banging_with_positive"]);
			} else {
				scr_chat(entity.name, global.chat_texts[? "start_banging_with_negative"]);
			}
        }
    );
}