function NpcInteractionSystems_setup_018_Tease(){
	NpcInteractionSystems.Tease = ecs_setup_system_player_npc_interaction(
        "tease", 
        ["already_introduced", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (npc.check_attraction(30)) {
                npc.attraction += 8;
                npc.desire += 5; // Teasing builds desire
                npc.interact(5);
                scr_chat(entity.name, global.chat_texts[? "tease_positive"]);
            } else {
                scr_chat(entity.name, global.chat_texts[? "tease_negative"]);
                npc.interact(-5);
            }
        }
    );
}