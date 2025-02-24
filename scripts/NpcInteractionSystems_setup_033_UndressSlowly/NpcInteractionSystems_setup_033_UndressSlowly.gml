function NpcInteractionSystems_setup_033_UndressSlowly() {
    NpcInteractionSystems.UndressSlowly = ecs_setup_system_player_npc_interaction(
        "undress {name} slowly",
        ["npc_is_ready_for_intimacy", "alone_with_pc", "relationship_with_pc", "traits", "!is_naked"],
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (npc.check_trust(60)) {
                ecs_change_state_with_comps(entity, [], ["is_naked"]);
                npc.attraction += 15;
                npc.desire += 20;
                npc.stimulation += 10;
                scr_chat(entity.name, "undress_slowly_positive");
            } else {
                scr_chat(entity.name, "undress_slowly_negative");
                npc.interact(-10);
            }
        }
    );
    
    new_word_variant("undress_slowly_positive", [
        "|Mmm|, take it |slow|—yes!",
        "Oh, |good|, I’m bare |now|!",
        "|Yes|, this |feels| so |nice|!"
    ]);
    new_word_variant("undress_slowly_negative", [
        "Not |now|, too |fast|!",
        "|No|, I’m not there yet.",
        "Wait, |please|, not yet!"
    ]);
}