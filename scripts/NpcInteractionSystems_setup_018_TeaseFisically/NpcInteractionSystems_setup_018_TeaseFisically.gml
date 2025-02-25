function NpcInteractionSystems_setup_018_TeaseFisically(){
	NpcInteractionSystems.TeaseFisically = ecs_setup_system_player_npc_interaction(
        "tease {name} fisically", 
        ["already_introduced", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (npc.check_all(undefined,50,50)) {
                npc.attraction += 8;
                npc.desire += 5; // Teasing builds desire
                npc.interact(5);
                scr_chat(entity.name, "tease_positive");
            } else {
                scr_chat(entity.name, "tease_negative");
                npc.interact(-5);
            }
        }
    );
	
    new_word_variant("tease_positive", ["Oh, you're bad!", "You're so naughty!", "What a tease!"]);
    new_word_variant("tease_negative", ["That's not funny.", "Not amusing.", "Stop that."]);
}