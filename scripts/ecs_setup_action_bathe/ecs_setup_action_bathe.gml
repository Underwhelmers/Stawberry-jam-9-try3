function ecs_setup_action_bathe() {
    ecs_setup_system_player_action(
        "bathe",
        ["is_player", "hygiene"],
        function(entity) {
            entity.hygiene.adjust_cleanliness(entity, 0.5);
            // Reset fluid modifiers
            var fluids = struct_get_names(entity.body_fluid.fluids);
            for (var i = 0; i < array_length(fluids); i++) {
                entity.body_fluid.remove_fluid(entity, fluids[i], entity.body_fluid.fluids[$ fluids[i]]);
                entity.hygiene.set_modifier(entity, "fluid", fluids[i], 0);
            }
            // Reset body part modifiers
            entity.hygiene.set_modifier(entity, "body_part", "anal", 0);
            scr_inform("You feel refreshed and clean after bathing.");
        }
    );

    // NPC version
    ecs_setup_system_player_action(
        "request {name} to bathe",
        ["is_npc", "hygiene"],
        function(entity) {
            if (entity.relationship.affinity > 0.3) {
                scr_chat((entity.name), "Fine, I’ll clean up for you...");
                entity.hygiene.adjust_cleanliness(entity, 0.4);
                var fluids = struct_get_names(entity.body_fluid.fluids);
                for (var i = 0; i < array_length(fluids); i++) {
                    entity.body_fluid.remove_fluid(entity, fluids[i], entity.body_fluid.fluids[$ fluids[i]]);
                    entity.hygiene.set_modifier(entity, "fluid", fluids[i], 0);
                }
                entity.hygiene.set_modifier(entity, "body_part", "anal", 0);
            } else {
                scr_chat((entity.name), "Why should I listen to you?");
            }
        }
    );
}