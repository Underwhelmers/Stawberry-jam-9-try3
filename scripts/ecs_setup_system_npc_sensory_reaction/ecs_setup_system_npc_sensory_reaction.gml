function ecs_setup_system_npc_sensory_reaction() {
    var executer = new ECS_SystemInstance(["is_npc", "mood", "relationship", "position"], {});
    executer.execute_logic = method(executer, function(entity, args) {
        var player_nearby = false;
        var player = undefined;
        for (var i = 0; i < ds_list_size(entity.position.location.contents); i++) {
            var _other = entity.position.location.contents[| i];
            if (struct_exists(_other, "is_player")) {
                player_nearby = true;
                player = _other;
                break;
            }
        }
        if (!player_nearby || !struct_exists(player, "body_fluid") || !struct_exists(player, "sensory_profile")) return;

        // Check for strong fluids on the player
        var fluids = struct_get_names(player.body_fluid.fluids);
        var strongest_fluid = "";
        var max_intensity = 0;
        for (var i = 0; i < array_length(fluids); i++) {
            var intensity = player.body_fluid.fluids[$ fluids[i]];
            if (intensity > max_intensity) {
                max_intensity = intensity;
                strongest_fluid = fluids[i];
            }
        }

        if (max_intensity > 0.5) {
            var smell = player.sensory_profile.smell_traits[$ strongest_fluid];
            if (entity.mood.desire == "aroused") {
                scr_chat((entity.name), "You smell like {0}... It’s driving me wild.", strongest_fluid);
                entity.relationship.intimacy = min(1, entity.relationship.intimacy + 0.1);
            } else {
                scr_chat((entity.name), "You’ve got a strong {0} scent on you...", strongest_fluid);
            }
        }
    });
    obj_ecs_manager.system_manager.register_system(executer);
}