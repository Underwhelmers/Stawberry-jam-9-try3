function ecs_setup_action_gag_on() {
    ecs_setup_system_multiplayer_action(
        "gag {name1} with {name2}",
        [["is_present", "is_naked"], ["is_phallus"]],
        function(entities) {
            var char = entities[0];
            var bodypart = entities[1];
            scr_inform("You gag {0} with your {1}.", (char.name), bodypart.name);
            char.arousal_level += 30;
            scr_chat((char.name), "*Chokes with a shiver*");
        }
    );
}