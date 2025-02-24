function NpcInteractionSystems_setup_024_SlowDown() {
    NpcInteractionSystems.SlowDown = ecs_setup_system_player_npc_interaction(
        "slow down banging",
        ["is_aroused", "banging_state", "relationship_with_pc", "traits"],
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            var banging = entity.banging_state;
            if (npc.check_trust(60)) {
                npc.trust += 10;
                npc.stimulation += 5;
                banging.intensity = max(banging.intensity - 10, 0); // Reduce intensity
                scr_chat(entity.name, global.chat_texts[? "slow_down_banging_positive"]);
            } else {
                scr_chat(entity.name, global.chat_texts[? "slow_down_banging_neutral"]);
            }
        }
    );
}