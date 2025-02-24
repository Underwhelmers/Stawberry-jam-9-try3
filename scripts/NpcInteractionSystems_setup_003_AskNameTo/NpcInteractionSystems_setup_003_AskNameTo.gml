function NpcInteractionSystems_setup_003_AskNameTo() {
	NpcInteractionSystems.AskNameTo = ecs_setup_system_player_npc_interaction(
        "ask name to {name}", 
        ["in_conversation", "relationship_with_pc", "traits", "!name_is_known"], 
        function(entity, args) {
			// Effect: Name is revealed.
            entity.name = entity.truename;
			entity.relationship_with_pc.interact(3);
            StateComponents.types[$ "name_is_known"].add_to(entity);
			
			// Give feedback to player
            scr_chat(entity.name, "ask_name_to_response", entity.name);
        }
    );
	
	new_word_variant("ask_name_to_response", [
		"My name? It's {0}.", 
		"I'm {0}, |nice to meet you|.", 
		"Call me {0}."
	]);
}