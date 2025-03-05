function ecs_setup_system_jealousy_detection() {
    var executer = new ECS_SystemInstance(["is_npc", "relationship", "position", "mood"], {});
    executer.execute_logic = method(executer, function(entity, args) {
        var nearby_entities = ds_list_create();
        for (var i = 0; i < ds_list_size(entity.position.location.contents); i++) {
            var _other = entity.position.location.contents[| i];
            if (_other != entity) ds_list_add(nearby_entities, _other);
        }

        for (var i = 0; i < ds_list_size(nearby_entities); i++) {
            var target = nearby_entities[| i];
            if (target == global.player_entity && struct_exists(target, "body_fluid")) {
                var fluids = struct_get_names(target.body_fluid.fluids);
                var has_intimate_fluid = false;
                for (var j = 0; j < array_length(fluids); j++) {
                    if (fluids[j] == "semen" || fluids[j] == "vaginal_lubrication") {
                        if (target.body_fluid.fluids[$ fluids[j]] > 0.3) {
                            has_intimate_fluid = true;
                            break;
                        }
                    }
                }
                if (has_intimate_fluid && entity.relationship.target == global.player_entity && (entity.relationship.affinity > 0.3 || entity.relationship.intimacy > 0.3)) {
                    var jealousy_amount = entity.relationship.jealousy_tendency * 0.5;
                    entity.relationship.adjust_jealousy(entity, global.player_entity, jealousy_amount);
                    entity.mood.jealousy_intensity = entity.relationship.jealousy;
                    scr_chat((entity.name), "You smell like someone else... Who’ve you been with?");
                }
            }
        }
    });
    obj_ecs_manager.system_manager.register_system(executer);
}