function NpcInteractionSystems_setup_012_StartTouching(){
    NpcInteractionSystems.StartTouching = ecs_setup_system_player_npc_interaction(
        "start touching", 
        ["npc_is_ready_for_intimacy", "relationship_with_pc", "traits"],
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (npc.check_all(undefined, 40, 60)) {
                npc.stimulation += 15; // Physical touch increases stimulation
                ecs_change_state_with_comps(entity, ["not_intimating"], ["is_aroused"]);
                scr_chat(entity.name, global.chat_texts[? "start_touching_positive"]);
            } else {
                scr_chat(entity.name, global.chat_texts[? "start_touching_negative"]);
            }
        }
    );
}