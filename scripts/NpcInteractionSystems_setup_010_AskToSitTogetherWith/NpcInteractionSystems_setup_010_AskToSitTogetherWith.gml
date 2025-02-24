function NpcInteractionSystems_setup_010_AskToSitTogetherWith() {
	NpcInteractionSystems.AskToSitTogetherWith = ecs_setup_system_player_npc_interaction(
        "ask to sit together with {name}", 
        ["already_introduced", "!sitting_together", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
			
            var npc = entity.relationship_with_pc;
            if (npc.check_trust(10)) {
				StateComponents[$ "sitting_together"].add_to(entity);
                scr_chat(entity.name, "ask_to_sit_together_with_positive");
            } else {
                scr_chat(entity.name, "ask_to_sit_together_with_negative");
            }
        }
    );
	
    new_word_variant("ask_to_sit_together_with_positive", ["Come here :D.", "Sit with me!", "Join me here!"]);
    new_word_variant("ask_to_sit_together_with_negative", ["|Nope|...", "Not now.", "Pass for now."]);
}