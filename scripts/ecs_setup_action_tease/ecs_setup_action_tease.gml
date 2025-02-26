function ecs_setup_action_tease() {
    ecs_setup_system_multiplayer_action(
        "tease {name1}'s {name2}",
        [["is_present", "has_talked"], ["is_body_part"]],
        function(entities) {
            var char = entities[0];
            var bodypart = entities[1];
            scr_inform("You tease {0}'s {1}.", (char.name), bodypart.name);
            char.arousal_level += 15;
            scr_chat((char.name), "*Squirms playfully*");
        }
    );
}