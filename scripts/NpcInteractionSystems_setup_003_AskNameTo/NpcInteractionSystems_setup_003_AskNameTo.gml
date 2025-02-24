function NpcInteractionSystems_setup_003_AskNameTo() {
	NpcInteractionSystems.AskNameTo = ecs_setup_system_player_npc_interaction(
        "ask name to", 
        ["in_conversation", "relationship_with_pc", "traits", "!name_is_known"], 
        function(entity, args) {
			// Effect: Name is revealed.
            entity.name = entity.truename;
			entity.relationship_with_pc.interact(3);
            ecs_change_state_with_comps(entity, [], ["name_is_known"]);
			
			// Give feedback to player
            scr_chat(entity.name, string(global.chat_texts[? "ask_name_to_response"], entity.name));
        }
    );
}