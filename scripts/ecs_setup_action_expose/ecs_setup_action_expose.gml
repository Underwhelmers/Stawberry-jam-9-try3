function ecs_setup_action_expose() {
    ecs_setup_system_multiplayer_action(
        "expose {name1}s {name2}",
        [["is_present", "has_talked","!is_naked"], ["is_body_part"]],
        function(entities) {
            var char = entities[0];
            var bodypart = entities[1];
            scr_inform("You expose {0}'s {1}.", (char.name), bodypart.name);
            StateComponents.types[$ "is_naked"].add_to(char);
            char.arousal_level += 25;
            scr_chat((char.name), "*Blushes deeply*");
        }
    );
}