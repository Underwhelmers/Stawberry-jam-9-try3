function ecs_setup_system_faction_jealousy_conflict() {
    var executer = new ECS_SystemInstance(["is_npc", "faction", "relationship"], {});
    executer.execute_logic = method(executer, function(entity, args) {
        if (entity.relationship.jealousy <= 0.5) return;

        var nearby_npcs = ds_list_create();
        for (var i = 0; i < ds_list_size(entity.position.location.contents); i++) {
            var _other = entity.position.location.contents[| i];
            if (struct_exists(_other, "is_npc") && _other != entity && struct_exists(_other, "faction") && _other.faction.faction_name == entity.faction.faction_name) {
                ds_list_add(nearby_npcs, _other);
            }
        }

        var jealousy_count = 0;
        for (var i = 0; i < ds_list_size(nearby_npcs); i++) {
            var _other = nearby_npcs[| i];
            if (struct_exists(_other, "relationship") && _other.relationship.target == global.player_entity && _other.relationship.jealousy > 0.5) {
                jealousy_count++;
            }
        }

        if (jealousy_count >= 2) {
            scr_chat((entity.name), "We’re all tired of {0} playing us! Let’s deal with this.");
            var rep_system = obj_ecs_manager.system_manager.get_system("faction_reputation_update");
            rep_system.add_action_log(global.player_entity, entity, "social_misstep", 0.8);
        }
    });
    obj_ecs_manager.system_manager.register_system(executer);
}