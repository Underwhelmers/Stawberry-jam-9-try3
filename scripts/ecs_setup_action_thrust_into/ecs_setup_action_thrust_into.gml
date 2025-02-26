function ecs_setup_action_thrust_into() {
    ecs_setup_system_multiplayer_action(
        "thrust into {name1}'s {name2}",
        [["is_present", "is_naked", "is_aroused"], ["is_body_part"]],
        function(entities) {
            var char = entities[0];
            var bodypart = entities[1];
            scr_inform("You thrust into {0}'s {1}.", (char.name), bodypart.name);
            StateComponents.types[$ "is_penetrated"].add_to(char);
            char.arousal_level += 50;
            if (char.arousal_level >= 100) {
                StateComponents.types[$ "has_climaxed"].add_to(char);
                scr_chat((char.name), "*Screams in climax*");
            } else {
                scr_chat((char.name), "*Moans deeply*");
            }
        }
    );
}