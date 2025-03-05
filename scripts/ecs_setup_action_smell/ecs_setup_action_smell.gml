function ecs_setup_action_smell() {
    ecs_setup_system_player_action(
        "smell {name}'s {part}",
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
                    var smell = entity.sensory_profile.get_smell(entity, strongest_fluid);
                    scr_inform("You smell {0} on {1}: {2}.", strongest_fluid, entity.name, smell);
                } else {
                    scr_inform("You don’t smell much on {0}.", entity.name);
                }
            } else if (part == "anal") {
                var anal_smell = entity.sensory_profile.get_anal_traits(entity, "smell");
                scr_inform("You smell {0}’s anal region: {1}.", entity.name, anal_smell);
            }
        }
    );
}

