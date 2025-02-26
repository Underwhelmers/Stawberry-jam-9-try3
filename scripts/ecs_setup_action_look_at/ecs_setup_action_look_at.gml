function ecs_setup_action_look_at() {
    ecs_setup_system_multiplayer_action(
        "look at {name1}'s {name2}",
        [["is_present", "is_character"], ["is_body_part"]],
        function(entities) {
            var char = entities[0];
            var bodypart = entities[1];
            scr_inform("You look at {0}'s {1}.", (char.name), bodypart.name);
            scr_chat((char.name), "*Notices your gaze*");
        }
    );
}