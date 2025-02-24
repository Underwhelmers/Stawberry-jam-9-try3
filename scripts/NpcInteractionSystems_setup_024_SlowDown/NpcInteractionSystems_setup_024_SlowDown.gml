function NpcInteractionSystems_setup_024_SlowDown() {
    NpcInteractionSystems.SlowDown = ecs_setup_system_player_npc_interaction(
        "slow down banging {name}",
        ["is_aroused", "banging_state", "relationship_with_pc", "traits"],
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            var banging = entity.banging_state;
            if (npc.check_trust(60)) {
                npc.trust += 10;
                npc.stimulation += 5;
                banging.intensity = max(banging.intensity - 10, 0); // Reduce intensity
                scr_chat(entity.name, "slow_down_banging_positive");
            } else {
                scr_chat(entity.name, "slow_down_banging_neutral");
            }
        }
    );
	
    new_word_variant("slow_down_banging_positive", ["|Mmm|, I like it slow.", "Oh, slow is good.", "|Yes|, keep it |gentle|."]);
    new_word_variant("slow_down_banging_neutral", ["Just... keep going.", "Don't stop, just go.", "Keep it up..."]);
}