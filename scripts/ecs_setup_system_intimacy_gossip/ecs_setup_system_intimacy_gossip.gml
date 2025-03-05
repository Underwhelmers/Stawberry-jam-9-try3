function ecs_setup_system_intimacy_gossip() {
    var executer = new ECS_SystemInstance(["is_npc", "intimacy_history", "position"], {});
    executer.execute_logic = method(executer, function(entity, args) {
        var nearby_npcs = ds_list_create();
        for (var i = 0; i < ds_list_size(entity.position.location.contents); i++) {
            var _other = entity.position.location.contents[| i];
            if (struct_exists(_other, "is_npc") && _other != entity) {
                ds_list_add(nearby_npcs, _other);
            }
        }

        if (!ds_list_empty(nearby_npcs) && !ds_list_empty(entity.intimacy_history.contents)) {
            var event = entity.intimacy_history.contents[| ds_list_size(entity.intimacy_history.contents) - 1];
            if (event.partner != global.player_entity) return;

            var target = nearby_npcs[| 0];
            if (event.outcome == "positive") {
                scr_chat((entity.name), "Hey {0}, I had quite the time with {1}...", target.name, event.partner.name);
                if (struct_exists(target, "relationship") && target.relationship.target == global.player_entity) {
                    target.relationship.adjust_jealousy(target, global.player_entity, target.relationship.jealousy_tendency * 0.4);
                    target.mood.jealousy_intensity = target.relationship.jealousy;
                }
                if (struct_exists(target, "knowledge")) {
                    target.knowledge.add_fact(target, "{0} had intimacy with player", entity.name);
                }
            }
        }
    });
    obj_ecs_manager.system_manager.register_system(executer);
}