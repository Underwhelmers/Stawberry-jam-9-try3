function ecs_setup_system_fluid_transfer() {
    var executer = new ECS_SystemInstance(["is_npc", "body_fluid", "intimacy_history"], {});
    executer.execute_logic = method(executer, function(entity, args) {
        if (ds_list_empty(entity.intimacy_history.contents)) return;
        var last_event = entity.intimacy_history.contents[| ds_list_size(entity.intimacy_history.contents) - 1];
        if (last_event.outcome != "positive") return;

        var partner = last_event.partner;
        if (!struct_exists(partner, "body_fluid")) return;

        switch (last_event.type) {
            case "flirt":
                // Light saliva transfer during close flirting
                entity.body_fluid.add_fluid(entity, "saliva", 0.05);
                partner.body_fluid.add_fluid(partner, "saliva", 0.05);
                break;
            case "intercourse":
                // Transfer arousal-based fluids
                entity.body_fluid.add_fluid(entity, "semen", 0.2);
                entity.body_fluid.add_fluid(entity, "vaginal_lubrication", 0.2);
                partner.body_fluid.add_fluid(partner, "semen", 0.1);
                partner.body_fluid.add_fluid(partner, "vaginal_lubrication", 0.1);
                break;
            case "fetish_proposal":
                // Depends on fetish; assume some fluid exchange
                entity.body_fluid.add_fluid(entity, "sweat", 0.1);
                partner.body_fluid.add_fluid(partner, "sweat", 0.1);
                break;
        }
    });
    obj_ecs_manager.system_manager.register_system(executer);
}