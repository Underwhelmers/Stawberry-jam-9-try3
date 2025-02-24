function NpcInteractionSystems_setup_021_HoldHands() {
	NpcInteractionSystems.HoldHands = ecs_setup_system_player_npc_interaction(
        "hold hands with", 
        ["already_introduced", "sitting_together", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (npc.check_trust(30)) {
                npc.trust += 10;
                npc.attraction += 5;
                scr_chat(entity.name, global.chat_texts[? "hold_hands_with_positive"]);
                obj_ecs_manager.component_manager.add_component(entity, "is_comfortable", true);
            } else {
                scr_chat(entity.name, global.chat_texts[? "hold_hands_with_negative"]);
                npc.interact(-5);
            }
        }
    );
}