function ecs_setup_system_npc_initiate_advance() {
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
        if (!player_nearby) return;

        var desire = entity.mood.desire;
        var proactivity = entity.mood.proactivity;
        var affinity = entity.relationship.affinity;
        var intimacy = entity.relationship.intimacy;
        var attraction = entity.relationship.attraction;
        var jealousy = entity.relationship.jealousy;
        var faction_openness = struct_exists(entity, "faction") ? entity.faction.social_openness : 0.5;
        var hygiene_modifier = struct_exists(player, "hygiene") ? player.hygiene.cleanliness - 0.5 : 0;

        var likelihood = (affinity * 0.3 + intimacy * 0.2 + attraction * 0.3 + proactivity * 0.1 + faction_openness * 0.1 + hygiene_modifier * 0.2);
        if (desire == "repulsed") likelihood -= 0.5;
        if (desire == "aroused") likelihood += 0.3;
        if (jealousy > 0.5) likelihood -= 0.2;
        else if (jealousy > 0.2) likelihood += 0.1;

        if (random(1) < likelihood) {
            if (intimacy < 0.5 && attraction > 0.5) {
                scr_chat((entity.name), hygiene_modifier < 0 ? "Maybe clean up first, but I like you..." : "You know, you’re kinda cute...");
                npc_initiate_flirt(entity);
            } else if (intimacy >= 0.5 && attraction > 0.7 && struct_exists(entity, "fetish")) {
                var fetish = entity.fetish.preferences[| 0];
                scr_chat((entity.name), hygiene_modifier < 0 ? "Clean up and I’d love some {0}..." : "How’d you feel about some {0}?", fetish);
                npc_initiate_fetish_proposal(entity, fetish);
            } else if (intimacy >= 0.7 && desire == "aroused") {
                scr_chat((entity.name), hygiene_modifier < 0 ? "You’re tempting, but a bath wouldn’t hurt..." : "Want to find somewhere private?");
                npc_initiate_intercourse(entity);
            }
        }
    });
    obj_ecs_manager.system_manager.register_system(executer);
}