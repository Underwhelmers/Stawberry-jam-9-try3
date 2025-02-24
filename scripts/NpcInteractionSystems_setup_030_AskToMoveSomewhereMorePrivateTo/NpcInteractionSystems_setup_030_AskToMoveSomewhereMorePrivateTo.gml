function NpcInteractionSystems_setup_030_AskToMoveSomewhereMorePrivateTo() {
    NpcInteractionSystems.AskToMoveSomewhereMorePrivateTo = ecs_setup_system_player_npc_interaction(
        "ask to move somewhere more private to",
        ["npc_is_ready_for_intimacy", "is_aroused", "!alone_with_pc", "relationship_with_pc", "traits"],
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            
            // Conditions for moving to a private room
            if (npc.check_all(undefined, 50, 60, 60)) { // Requires moderate trust and desire
                // Success: Move to private setting
                ecs_change_state_with_comps(entity, ["sitting_together", "in_conversation"], ["alone_with_pc"]);
                npc.trust += 10; // Privacy builds trust
                npc.desire += 15; // Heightens anticipation
                scr_chat(entity.name, global.chat_texts[? "ask_to_move_somewhere_more_private_to_positive"]);
            } else {
                // Failure: Stay public
                scr_chat(entity.name, global.chat_texts[? "ask_to_move_somewhere_more_private_to_negative"]);
                npc.interact(-5); // Slight opinion dip for rejection
            }
        }
    );
}