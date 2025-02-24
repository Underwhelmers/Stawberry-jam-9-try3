function NpcInteractionSystems_setup_028_PullOut() {
    NpcInteractionSystems.PullOut = ecs_setup_system_player_npc_interaction(
        "pull out of",
        ["npc_is_ready_for_intimacy", "is_aroused", "banging_state", "relationship_with_pc", "traits"],
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (npc.check_trust(50)) {
				ecs_change_state_with_comps(entity, ["banging_state"],[]);
                scr_chat(entity.name, global.chat_texts[? "pull_out_positive"]);
            } else {
                scr_chat(entity.name, global.chat_texts[? "pull_out_negative"]);
                npc.interact(-5);
            }
        }
    );
}