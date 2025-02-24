function NpcInteractionSystems_setup_020_Whisper(){
	NpcInteractionSystems.Whisper = ecs_setup_system_player_npc_interaction(
        "whisper to", 
        ["already_introduced", "sitting_together", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (npc.check_trust(20)) {
                npc.attraction += 10;
                npc.desire += 5; // Whispering boosts desire
                scr_chat(entity.name, global.chat_texts[? "whisper_to_positive"]);
            } else {
                scr_chat(entity.name, global.chat_texts[? "whisper_to_negative"]);
                npc.interact(-3);
            }
        }
    );
}