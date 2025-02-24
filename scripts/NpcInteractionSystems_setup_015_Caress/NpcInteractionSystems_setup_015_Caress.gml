function NpcInteractionSystems_setup_015_Caress() {
	NpcInteractionSystems.Caress = ecs_setup_system_player_npc_interaction(
        "stroke gently {name}", 
        ["interested_sexualy", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (npc.check_attraction(80)) {
                npc.attraction += 10;
                npc.stimulation += 20; // Caressing significantly boosts stimulation
				StateComponents.types[$ "is_aroused"].add_to(entity);
				
                scr_chat(entity.name, "give_caress_to_positive");
            } else {
                npc.attraction += 5;
                scr_chat(entity.name, "give_caress_to_negative");
            }
        }
    );
	
    new_word_variant("give_caress_to_positive", ["That feels so good...", "Oh, |mmm|, yes...", "So |nice| to feel..."]);
    new_word_variant("give_caress_to_negative", ["Hey, slow down a bit.", "Not so fast, okay?", "Ease up please."]);
}