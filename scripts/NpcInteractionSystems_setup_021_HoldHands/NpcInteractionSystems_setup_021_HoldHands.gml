function NpcInteractionSystems_setup_021_HoldHands() {
	NpcInteractionSystems.HoldHands = ecs_setup_system_player_npc_interaction(
        "hold hands with {name}", 
        ["already_introduced", "sitting_together", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (npc.check_trust(30)) {
                npc.trust += 10;
                npc.attraction += 5;
                scr_chat(entity.name, "hold_hands_with_positive");
				
				StateComponents.types[$ "is_comfortable"].add_to(entity);
            } else {
                scr_chat(entity.name, "hold_hands_with_negative");
                npc.interact(-5);
            }
        }
    );
	
    new_word_variant("hold_hands_with_positive", ["I like this.", "Feels good.", "Love holding you."]);
    new_word_variant("hold_hands_with_negative", ["Not yet, okay?", "Wait a bit, please.", "Not |now|, sorry."]);
}