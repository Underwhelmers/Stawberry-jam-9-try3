function ecs_setup_action_suck() {
    ecs_setup_system_multiplayer_action(
        "suck {name1}'s {name2}",
        [["is_present", "is_naked"], ["is_body_part"]],
        function(entities) {
            var char = entities[0];
            var bodypart = entities[1];
            scr_inform("You suck {0}'s {1}.", (char.name), bodypart.name);
            char.arousal_level += 30;
            scr_chat((char.name), "*Groans in ecstasy*");
        }
    );
}