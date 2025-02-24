function NpcInteractionSystems_setup_022_Massage(){
	NpcInteractionSystems.Massage = ecs_setup_system_player_npc_interaction(
        "give massage to", 
        ["npc_is_ready_for_intimacy", "alone_with_pc", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (npc.check_attraction(50)) {
                npc.attraction += 15;
                npc.stimulation += 20; // Massage increases stimulation
                npc.desire += 10; // And desire
                ecs_change_state_with_comps(entity, ["not_intimating"], ["is_aroused"]);
                scr_chat(entity.name, global.chat_texts[? "give_massage_to_positive"]);
            } else {
                scr_chat(entity.name, global.chat_texts[? "give_massage_to_negative"]);
                npc.interact(-5);
            }
        }
    );
}