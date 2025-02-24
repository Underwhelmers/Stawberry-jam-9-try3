function NpcInteractionSystems_setup_016_Thrust() {
    NpcInteractionSystems.Thrust = ecs_setup_system_player_npc_interaction(
        "thrust",
        ["npc_is_ready_for_intimacy", "is_aroused", "relationship_with_pc", "traits", "banging_state"],
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            var banging = entity.banging_state;
            if (npc.check_all(undefined, 60, 90, 50, 70)) {
                if (!banging.is_banging) {
                    banging.is_banging = true; // Start banging if not already
                    banging.position = "inside"; // Default to inside
                    banging.cavity = "front"; // Default cavity (can be overridden)
                }
                npc.attraction += 15;
                npc.trust += 5;
                npc.stimulation += 25;
                banging.intensity = min(banging.intensity + 20, 100); // Build intensity
                if (npc.stimulation >= 100) {
                    scr_chat(entity.name, global.chat_texts[? "thrust_positive_high"]);
                } else {
                    scr_chat(entity.name, global.chat_texts[? "thrust_positive_low"]);
                }
            } else {
                scr_chat(entity.name, global.chat_texts[? "thrust_negative"]);
                npc.interact(-15);
            }
        }
    );
}