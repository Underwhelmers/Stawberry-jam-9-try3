function NpcInteractionSystems_setup_022_Massage(){
	NpcInteractionSystems.Massage = ecs_setup_system_player_npc_interaction(
        "give massage to {name}", 
        ["interested_sexualy", "alone_with_pc", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (npc.check_attraction(50)) {
                npc.attraction += 15;
                npc.stimulation += 20; // Massage increases stimulation
                npc.desire += 10; // And desire
				
				StateComponents[$ "is_aroused"].add_to(entity);
                scr_chat(entity.name, "give_massage_to_positive");
            } else {
                scr_chat(entity.name, "give_massage_to_negative");
                npc.interact(-5);
            }
        }
    );
	
    new_word_variant("give_massage_to_positive", ["Oh, that's perfect...", "|Mmm|, so good...", "Yes, nice..."]);
    new_word_variant("give_massage_to_negative", ["Um, maybe later.", "Not |now|, thanks.", "Hold off a bit."]);
}