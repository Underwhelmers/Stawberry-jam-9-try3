function NpcInteractionSystems_setup_027_PushOutOf() {
    NpcInteractionSystems.PushOutOf = ecs_setup_system_player_npc_interaction(
        "push out of",
        ["npc_is_ready_for_intimacy", "is_aroused", "banging_state", "relationship_with_pc", "traits"],
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            var banging = entity.banging_state;
            if (banging.position == "outside") return; // Must be inside
            if (npc.check_trust(40)) {
                banging.position = "outside";
                npc.stimulation += 10;
                banging.intensity = min(banging.intensity + 5, 100);
                scr_chat(entity.name, global.chat_texts[? "push_out_of_positive"]);
            } else {
                scr_chat(entity.name, global.chat_texts[? "push_out_of_negative"]);
                npc.interact(-5);
            }
        }
    );
}