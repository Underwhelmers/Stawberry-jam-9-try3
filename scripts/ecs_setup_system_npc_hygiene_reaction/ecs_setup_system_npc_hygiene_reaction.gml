function ecs_setup_system_npc_hygiene_reaction() {
    var executer = new ECS_SystemInstance(["is_npc", "relationship", "position"], {});
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
        if (!player_nearby || !struct_exists(player, "hygiene")) return;

        var cleanliness = player.hygiene.cleanliness;
        if (cleanliness < 0.3) {
            scr_chat((entity.name), "You could use a bath... No offense.");
            entity.relationship.attraction = max(0, entity.relationship.attraction - 0.1);
            entity.mood.desire = entity.mood.desire == "aroused" ? "neutral" : entity.mood.desire;
        } else if (cleanliness > 0.8) {
            scr_chat((entity.name), "You smell so fresh... I like that.");
            entity.relationship.attraction = min(1, entity.relationship.attraction + 0.1);
            if (entity.mood.desire == "neutral") entity.mood.desire = "aroused";
        }

        // Jealousy if player smells clean after being with someone else
        if (cleanliness > 0.8 && struct_exists(entity, "knowledge")) {
            for (var i = 0; i < ds_list_size(entity.knowledge.contents); i++) {
                var fact = entity.knowledge.contents[| i];
                if (string_pos("intimacy with player", fact) != 0 && entity.relationship.target == global.player_entity) {
                    entity.relationship.adjust_jealousy(entity, global.player_entity, entity.relationship.jealousy_tendency * 0.3);
                    scr_chat((entity.name), "You cleaned up nice after being with someone else, huh?");
                }
            }
        }
    });
    obj_ecs_manager.system_manager.register_system(executer);
}