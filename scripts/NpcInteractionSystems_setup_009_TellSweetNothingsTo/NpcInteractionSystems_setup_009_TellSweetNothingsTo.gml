function NpcInteractionSystems_setup_009_TellSweetNothingsTo() {
	NpcInteractionSystems.TellSweetNothingsTo = ecs_setup_system_player_npc_interaction(
        "tell sweet nothings to {name}", 
        ["already_introduced", "name_is_known", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            npc.attraction += 2;
            npc.desire += 1; // Subtle intimacy boost
            npc.interact(0);
            scr_chat(entity.name, "tell_sweet_nothings_to_response");
        }
    );
	
	new_word_variant("tell_sweet_nothings_to_response", ["Aww <3", "Oh, cute!", "That's sweet!"]);
}