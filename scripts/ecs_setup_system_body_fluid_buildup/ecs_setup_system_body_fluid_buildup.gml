function ecs_setup_system_body_fluid_buildup() {
    var executer = new ECS_SystemInstance(["is_npc", "mood", "body_fluid"], {});
    executer.execute_logic = method(executer, function(entity, args) {
		var fluids = entity.body_fluid;
		
        // Sweat buildup based on activity or mood
        if (entity.mood.state == "angry" || entity.mood.state == "excited") {
            fluids.add_fluid("sweat", 0.1);
        }

        // Arousal-based fluids
        if (entity.mood.desire == "aroused") {
            fluids.add_fluid("precum", 0.05);
            fluids.add_fluid("vaginal_lubrication", 0.05);
        }

        // Gradual decay of fluids over time
        var currfluids = struct_get_names(fluids.fluids);
        for (var i = 0; i < array_length(currfluids); i++) {
            var fluid = currfluids[i];
            fluids.remove_fluid(fluid, 0.02);
        }
    });
    obj_ecs_manager.system_manager.register_system(executer);
}