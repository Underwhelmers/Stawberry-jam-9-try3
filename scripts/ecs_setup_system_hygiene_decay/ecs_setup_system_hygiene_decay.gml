function ecs_setup_system_hygiene_decay() {
    var executer = new ECS_SystemInstance(["is_npc", "hygiene", "body_fluid"], {});
    executer.execute_logic = method(executer, function(entity, args) {
        // Base decay over time
        entity.hygiene.adjust_cleanliness(-0.02);

        // Decay faster if sweating heavily
        if (entity.body_fluid.fluids[$ "sweat"] > 0.5) {
            entity.hygiene.adjust_cleanliness(-0.05);
            entity.hygiene.set_modifier("fluid", "sweat", -0.1);
        }

        // Decay anal hygiene after intimate interactions
        if (struct_exists(entity, "intimacy_history")) {
            var last_event = ds_list_size(entity.intimacy_history.contents) > 0 ? entity.intimacy_history.contents[| ds_list_size(entity.intimacy_history.contents) - 1] : undefined;
            if (last_event && last_event.type == "intercourse" && last_event.outcome == "positive") {
                entity.hygiene.set_modifier("body_part", "anal", -0.1);
            }
        }
    });
    obj_ecs_manager.system_manager.register_system(executer);
}