function ecs_setup_system_faction_reaction() {
    var executer = new ECS_SystemInstance(["is_npc", "faction", "position"], {});
    executer.execute_logic = method(executer, function(entity, args) {
        var nearby_entities = ds_list_create();
        // Find nearby entities in the same location
        for (var i = 0; i < ds_list_size(entity.position.location.contents); i++) {
            var _other = entity.position.location.contents[| i];
            if (_other != entity) ds_list_add(nearby_entities, _other);
        }

        for (var i = 0; i < ds_list_size(nearby_entities); i++) {
            var target = nearby_entities[| i];
            var target_faction = struct_exists(target, "faction") ? target.faction.faction_name : undefined;
            var player_check = struct_exists(target, "is_player");

            if (player_check || target_faction != undefined) {
                var rep = 0;
                if (player_check) {
                    rep = entity.faction.get_reputation(entity, "player");
                } else {
                    rep = entity.faction.get_reputation(entity, target_faction);
                    if (rep == 0) rep = global.faction_manager.get_faction_relation(entity.faction.faction_name, target_faction);
                }

                if (rep < -0.5) {
                    scr_chat((entity.name), "You’re with {0}? Get outta here!", player_check ? "them" : target_faction);
                    // Could trigger combat or fleeing behavior
                } else if (rep > 0.5) {
                    scr_chat((entity.name), "Always good to see a friend of {0}.", player_check ? "us" : target_faction);
                }
            }
        }
    });
    obj_ecs_manager.system_manager.register_system(executer);
}