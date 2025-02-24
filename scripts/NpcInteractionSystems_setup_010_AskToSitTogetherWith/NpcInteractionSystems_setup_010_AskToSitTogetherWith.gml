function NpcInteractionSystems_setup_010_AskToSitTogetherWith() {
	NpcInteractionSystems.AskToSitTogetherWith = ecs_setup_system_player_npc_interaction(
        "ask to sit together with", 
        ["already_introduced", "!sitting_together", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
			
            var npc = entity.relationship_with_pc;
            if (npc.check_trust(10)) {
                ecs_change_state_with_comps(entity, [], ["sitting_together"]);
                scr_chat(entity.name, global.chat_texts[? "ask_to_sit_together_with_positive"]);
            } else {
                scr_chat(entity.name, global.chat_texts[? "ask_to_sit_together_with_negative"]);
            }
        }
    );
}