function NpcInteractionSystems_setup_013_GiveKissTo(){
	NpcInteractionSystems.Kiss = ecs_setup_system_player_npc_interaction(
        "give kiss to", 
        ["npc_is_ready_for_intimacy", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (npc.check_attraction(70)) {
                npc.attraction += 10;
                npc.trust += 5;
                npc.stimulation += 10; // Kissing boosts stimulation
                npc.interact(10);
                scr_chat(entity.name, global.chat_texts[? "give_kiss_to_positive"]);
            } else {
                npc.attraction += 5;
                scr_chat(entity.name, global.chat_texts[? "give_kiss_to_neutral"]);
            }
        }
    );
}