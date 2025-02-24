function NpcInteractionSystems_setup_016_Thrust() {
    NpcInteractionSystems.Thrust = ecs_setup_system_player_npc_interaction(
        "thrust into {name}",
        ["interested_sexualy", "is_aroused", "relationship_with_pc", "traits", "banging_state"],
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            var banging = entity.banging_state;
            if (npc.check_all(undefined, 60, 90, 50, 70)) {
                banging.position = "inside";
				
                npc.attraction += 15;
                npc.trust += 5;
                npc.stimulation += 25;
                banging.intensity = min(banging.intensity + 20, 100); // Build intensity
                if (npc.stimulation >= 100) {
                    scr_chat(entity.name, "thrust_positive_high");
                } else {
                    scr_chat(entity.name, "thrust_positive_low");
                }
            } else {
                scr_chat(entity.name, "thrust_negative");
                npc.interact(-15);
            }
        }
    );
	
    new_word_variant("thrust_positive_high", [
		"I can't hold back now!",
		"Oh, I'm done now!",
		"Oh, I'm losing it!",
		"Too much to take!",
		"Too much, now!"
	]);
	
    new_word_variant("thrust_positive_low", [
		"Oh yes, keep going!", 
		"Yes, more please!", 
		"Don't stop, Yes!",
		"Keep going!",
		"Oh yes, more!",
		"Don't stop!"
	]);
	
    new_word_variant("thrust_negative", [
		"Not so fast!", 
		"Slow it down!", 
		"Too fast, wait!",
		"Too |quick|, slow!",
		"|Wait|, ease up!",
	]);
}