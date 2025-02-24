function NpcInteractionSystems_setup_005_FlirtWith() {
	NpcInteractionSystems.FlirtWith = ecs_setup_system_player_npc_interaction(
        "flirt with", 
        ["already_introduced", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (npc.check_opinion(20)) {
                npc.attraction += 5;
                npc.desire += 3; // Flirting sparks desire
                npc.interact(10);
	            scr_chat(entity.name, 
					struct_exists(args, "final_chat")? 
					args.final_chat : global.chat_texts[? "flirt_with_positive"]
				);
            } else {
                scr_chat(entity.name, global.chat_texts[? "flirt_with_negative"]);
                npc.interact(-5);
            }
        }
    );
}