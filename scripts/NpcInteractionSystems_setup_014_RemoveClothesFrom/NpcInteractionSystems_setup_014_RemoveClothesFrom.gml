function NpcInteractionSystems_setup_014_RemoveClothesFrom() {
	NpcInteractionSystems.RemoveClothesFrom = ecs_setup_system_player_npc_interaction(
        "remove clothes from {name}", 
        ["interested_sexualy", "relationship_with_pc", "!is_naked", "traits", "alone_with_pc"], 
        function(entity, args) {
            var manager = obj_ecs_manager.component_manager;
            var npc = entity.relationship_with_pc;
            if (npc.check_trust(50)) {
				StateComponents.types[$ "is_naked"].add_to(entity);
                npc.attraction += 15;
                npc.desire += 10; // Undressing increases desire
                npc.interact(15);
                scr_chat(entity.name, "remove_clothes_from_positive");
            } else {
                scr_chat(entity.name, "remove_clothes_from_negative");
                npc.interact(-10);
            }
        }
    );
	
    new_word_variant("remove_clothes_from_positive", ["Alright, let's get comfortable.", "Okay, off they go!", "Sure, let's strip."]);
    new_word_variant("remove_clothes_from_negative", ["I'm not ready for that!", "No way, not yet!", "Keep them on!"]);
}