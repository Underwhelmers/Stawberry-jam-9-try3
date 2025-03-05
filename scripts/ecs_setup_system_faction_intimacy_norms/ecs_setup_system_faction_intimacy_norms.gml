function ecs_setup_system_faction_intimacy_norms() {
    var executer = new ECS_SystemInstance(["is_npc", "faction", "position"], {});
    executer.execute_logic = method(executer, function(entity, args) {
        if (entity.faction.cultural_norms != "conservative" && entity.faction.cultural_norms != "taboo") return;

        var nearby_entities = ds_list_create();
        for (var i = 0; i < ds_list_size(entity.position.location.contents); i++) {
            var _other = entity.position.location.contents[| i];
            if (_other != entity) ds_list_add(nearby_entities, _other);
        }

        for (var i = 0; i < ds_list_size(nearby_entities); i++) {
            var target = nearby_entities[| i];
            if (struct_exists(target, "body_fluid")) {
                var fluids = struct_get_names(target.body_fluid.fluids);
                var has_taboo_fluid = false;
                for (var j = 0; j < array_length(fluids); j++) {
                    if (fluids[j] == "semen" || fluids[j] == "vaginal_lubrication") {
                        if (target.body_fluid.fluids[$ fluids[j]] > 0.5) {
                            has_taboo_fluid = true;
                            break;
                        }
                    }
                }
                if (has_taboo_fluid) {
                    scr_chat((entity.name), "Your scent is disgraceful! Have you no shame?");
                    var rep_system = obj_ecs_manager.system_manager.get_system("faction_reputation_update");
                    rep_system.add_action_log(target, entity, "social_misstep", 0.8);
                }
            }
			if (struct_exists(target, "hygiene") && target.hygiene.cleanliness < 0.3) {
                scr_chat((entity.name), "Your filth is an affront to our values!");
                var rep_system = obj_ecs_manager.system_manager.get_system("faction_reputation_update");
                rep_system.add_action_log(target, entity, "social_misstep", 0.6);
            }
        }
    });
    obj_ecs_manager.system_manager.register_system(executer);
}