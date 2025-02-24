function NpcInteractionSystems_setup_025_FinishTogether() {
    NpcInteractionSystems.FinishTogether = ecs_setup_system_player_npc_interaction(
        "finish together with",
        ["npc_is_ready_for_intimacy", "is_aroused", "banging_state", "relationship_with_pc", "traits"],
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            var banging = entity.banging_state;
            if (npc.check_all(undefined, 70, 90, 60, 80)) {
                if (banging.position == "inside") {
                    scr_chat(entity.name, global.chat_texts[? "finish_together_inside_" + banging.cavity]);
                } else {
                    scr_chat(entity.name, global.chat_texts[? "finish_together_outside"]);
                }
                ecs_change_state_with_comps(entity, [], ["reached_climax"]);
                npc.attraction = 30;
                npc.desire = 20;
                npc.stimulation = 0;
                npc.trust += 15;
				
                banging.position = "outside";
                banging.cavity = "none";
                banging.intensity = 0;
            } else {
                scr_chat(entity.name, global.chat_texts[? "finish_together_negative"]);
                npc.interact(-5);
            }
        }
    );
}