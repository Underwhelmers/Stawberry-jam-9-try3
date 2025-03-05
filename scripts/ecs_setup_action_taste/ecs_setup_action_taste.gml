function ecs_setup_action_taste() {
    ecs_setup_system_player_action(
        "taste {name}'s {part}",
        ["is_npc", "body_fluid", "sensory_profile"],
        function(entity) {
            var part = args.part;
            if (part == "body") {
                var fluids = struct_get_names(entity.body_fluid.fluids);
                var strongest_fluid = "";
                var max_intensity = 0;
                for (var i = 0; i < array_length(fluids); i++) {
                    var intensity = entity.body_fluid.fluids[$ fluids[i]];
                    if (intensity > max_intensity) {
                        max_intensity = intensity;
                        strongest_fluid = fluids[i];
                    }
                }
                if (strongest_fluid != "") {
                    var taste = entity.sensory_profile.get_taste(entity, strongest_fluid);
                    scr_inform("You taste {0} on {1}: {2}.", strongest_fluid, entity.name, taste);
                    if (struct_exists(entity, "intimacy_history")) {
                        entity.intimacy_history.add_event(entity, global.player_entity, "taste", "positive", true);
                    }
                } else {
                    scr_inform("There’s nothing strong enough to taste on {0}.", entity.name);
                }
            } else if (part == "anal") {
                var anal_taste = entity.sensory_profile.get_anal_traits(entity, "taste");
                scr_inform("You taste {0}’s anal region: {1}.", entity.name, anal_taste);
                if (struct_exists(entity, "intimacy_history")) {
                    entity.intimacy_history.add_event(entity, global.player_entity, "taste_anal", "positive", true);
                }
            }
        }
    );
}