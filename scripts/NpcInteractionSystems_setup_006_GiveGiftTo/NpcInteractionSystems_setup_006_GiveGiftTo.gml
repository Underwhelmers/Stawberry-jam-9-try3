function NpcInteractionSystems_setup_006_GiveGiftTo() {
	NpcInteractionSystems.GiveGiftTo = ecs_setup_system_player_npc_interaction(
        "give gift to {name}", 
        ["already_introduced", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (random(100) < 75) {
                npc.trust += 5;
                npc.interact(15);
                scr_chat(entity.name, "give_gift_to_positive");
            } else {
                npc.interact(5);
                scr_inform("Miss.");
                scr_chat(entity.name, "give_gift_to_neutral");
            }
        }
    );
	
    new_word_variant("give_gift_to_positive", ["Thanks <3", "Oh, thank you!", "Love it, thanks!"]);
    new_word_variant("give_gift_to_neutral", ["Thanks? ._.", "Uh, thanks I guess.", "Oh, thanks..."]);
}