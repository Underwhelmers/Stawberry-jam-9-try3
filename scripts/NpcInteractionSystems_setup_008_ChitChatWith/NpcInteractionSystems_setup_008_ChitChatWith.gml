function NpcInteractionSystems_setup_008_ChitChatWith() {
	NpcInteractionSystems.ChitChatWith = ecs_setup_system_player_npc_interaction(
        "tell lots of nothing to",
        ["already_introduced", "name_is_known", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
            entity.relationship_with_pc.interact(5);
			
            scr_chat(entity.name, global.chat_texts[? "tell_lots_of_nothing_to_response"]);
        }
    );
}