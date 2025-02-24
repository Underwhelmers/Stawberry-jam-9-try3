function NpcInteractionSystems_setup_013_GiveKissTo(){
	NpcInteractionSystems.Kiss = ecs_setup_system_player_npc_interaction(
        "give kiss to {name}", 
        ["interested_sexualy", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (npc.check_attraction(70)) {
                npc.attraction += 10;
                npc.trust += 5;
                npc.stimulation += 10; // Kissing boosts stimulation
                npc.interact(10);
                scr_chat(entity.name, "give_kiss_to_positive");
            } else {
                npc.attraction += 5;
                scr_chat(entity.name, "give_kiss_to_neutral");
            }
        }
    );
	
    new_word_variant("give_kiss_to_positive", ["Your lips feel amazing...", "That kiss was wow...", "Lips so good..."]);
    new_word_variant("give_kiss_to_neutral", ["|Mmm|, |nice|.", "Oh, good.", "|Mmm|, okay."]);
}