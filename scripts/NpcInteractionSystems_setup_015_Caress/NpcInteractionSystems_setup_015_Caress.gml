function NpcInteractionSystems_setup_015_Caress() {
	NpcInteractionSystems.Caress = ecs_setup_system_player_npc_interaction(
        "give caress to", 
        ["npc_is_ready_for_intimacy", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (npc.check_attraction(80)) {
                npc.attraction += 10;
                npc.stimulation += 20; // Caressing significantly boosts stimulation
                ecs_change_state_with_comps(entity, ["not_intimating"], ["is_aroused"]);
                scr_chat(entity.name, global.chat_texts[? "give_caress_to_positive"]);
            } else {
                npc.attraction += 5;
                scr_chat(entity.name, global.chat_texts[? "give_caress_to_negative"]);
            }
        }
    );
}