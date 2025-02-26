function ecs_setup_action_finger() {
    ecs_setup_system_multiplayer_action(
        "finger {name1}'s {name2}",
        [["is_present", "is_naked"], ["is_cavity"]],
        function(entities) {
            var char = entities[0];
            var bodypart = entities[1];
            scr_inform("You finger {0}'s {1}.", (char.name), bodypart.name);
            StateComponents.types[$ "is_intimate"].add_to(char);
            char.arousal_level += 30;
            scr_chat((char.name), "*Moans loudly*");
        }
    );
}