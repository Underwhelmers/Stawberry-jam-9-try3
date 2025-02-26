function ecs_setup_action_squeeze() {
    ecs_setup_system_multiplayer_action(
        "squeeze {name1}'s {name2}",
        [["is_present", "is_aroused"], ["is_body_part"]],
        function(entities) {
            var char = entities[0];
            var bodypart = entities[1];
            scr_inform("You squeeze {0}'s {1}.", (char.name), bodypart.name);
            char.arousal_level += 20;
            scr_chat((char.name), "*Gasps at the pressure*");
        }
    );
}