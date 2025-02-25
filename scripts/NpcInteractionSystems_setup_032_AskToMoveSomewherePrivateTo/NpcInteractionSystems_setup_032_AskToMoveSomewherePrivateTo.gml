function NpcInteractionSystems_setup_032_AskToMoveSomewherePrivateTo() {
    NpcInteractionSystems.AskToMoveSomewherePrivateTo = ecs_setup_system_player_npc_interaction(
        "ask {name} to move somewhere private",
        ["interested_sexualy", "is_aroused", "!alone_with_pc", "relationship_with_pc", "traits", "sitting_together", "in_conversation"],
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            
            // Conditions for moving to a private room
            if (npc.check_all(undefined, 50, 60, 60)) { // Requires moderate trust and desire
				
                // Success: Move to private setting
				StateComponents.types[$ "sitting_together"].remove_from(entity);
				StateComponents.types[$ "in_conversation"].remove_from(entity);
				StateComponents.types[$ "alone_with_pc"].add_to(entity);
				
                npc.trust += 10; // Privacy builds trust
                npc.desire += 15; // Heightens anticipation
                scr_chat(entity.name, "ask_to_move_somewhere_more_private_to_positive");
            } else {
                // Failure: Stay public
                scr_chat(entity.name, "ask_to_move_somewhere_more_private_to_negative");
                npc.interact(-5); // Slight opinion dip for rejection
            }
        }
    );
	
    new_word_variant("ask_to_move_somewhere_more_private_to_positive", ["|Mmm|, privacy |sounds| good!", "Oh, |yes|, let's go |tight|!", "|yes|, a quiet spot!"]);
    new_word_variant("ask_to_move_somewhere_more_private_to_negative", ["Not yet, I'm good here.", "No|, this is fine.", "Wait, I like it here."]);
}