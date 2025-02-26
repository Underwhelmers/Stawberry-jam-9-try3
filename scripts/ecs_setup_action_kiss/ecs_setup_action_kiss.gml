function ecs_setup_action_kiss() {
    ecs_setup_system_multiplayer_action(
        "kiss {name1}'s {name2}",
        [["is_present", "has_talked"], ["is_body_part"]],
        function(entities) {
            var char = entities[0];
            var bodypart = entities[1];
            scr_inform("You kiss {0}'s {1}.", (char.name), bodypart.name);
            StateComponents.types[$ "is_aroused"].add_to(char);
            char.arousal_level += 20;
            scr_chat((char.name), "*Gasps softly*");
        }
    );
}