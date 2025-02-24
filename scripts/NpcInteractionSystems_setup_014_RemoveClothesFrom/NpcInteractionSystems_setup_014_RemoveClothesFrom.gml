function NpcInteractionSystems_setup_014_RemoveClothesFrom() {
	NpcInteractionSystems.RemoveClothesFrom = ecs_setup_system_player_npc_interaction(
        "remove clothes from", 
        ["npc_is_ready_for_intimacy", "relationship_with_pc", "!is_naked", "traits", "alone_with_pc"], 
        function(entity, args) {
            var manager = obj_ecs_manager.component_manager;
            var npc = entity.relationship_with_pc;
            if (npc.check_trust(50)) {
                ecs_change_state_with_comps(entity, [], ["is_naked"]);
                npc.attraction += 15;
                npc.desire += 10; // Undressing increases desire
                npc.interact(15);
                scr_chat(entity.name, global.chat_texts[? "remove_clothes_from_positive"]);
            } else {
                scr_chat(entity.name, global.chat_texts[? "remove_clothes_from_negative"]);
                npc.interact(-10);
            }
        }
    );
}