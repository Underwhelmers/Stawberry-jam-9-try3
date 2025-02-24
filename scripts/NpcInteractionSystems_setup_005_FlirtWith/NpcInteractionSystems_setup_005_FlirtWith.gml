function NpcInteractionSystems_setup_005_FlirtWith() {
	NpcInteractionSystems.FlirtWith = ecs_setup_system_player_npc_interaction(
        "flirt with {name}", 
        ["already_introduced", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (npc.check_opinion(20)) {
                npc.attraction += 5;
                npc.desire += 3; // Flirting sparks desire
                npc.interact(10);
	            scr_chat(entity.name, 
					struct_exists(args, "final_chat")? 
					args.final_chat : "flirt_with_positive"
				);
            } else {
                scr_chat(entity.name, "flirt_with_negative");
                npc.interact(-5);
            }
        }
    );
	
	new_word_variant("flirt_with_positive", [
		"Yes?... what else?", 
		"Yes?, tell me more.", 
		"Oh, yes. Go on."
	]);
	new_word_variant("flirt_with_negative", [
		"Stay back please.", 
		"Not now, back off.", 
		"Keep your distance."
	]);
}