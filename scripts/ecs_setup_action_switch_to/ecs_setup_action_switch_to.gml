function ecs_setup_action_switch_to() {
    ecs_setup_system_multiplayer_action(
        "switch to {name1}'s {name2}",
        [["is_present", "is_penetrated"], ["is_body_part"]],
        function(entities) {
            var char = entities[0];
            var new_bodypart = entities[1];
            scr_inform("You switch to {0}'s {1}.", (char.name), new_bodypart.name);
            char.arousal_level += 20;
            scr_chat((char.name), "*Adjusts with a groan*");
        }
    );
}