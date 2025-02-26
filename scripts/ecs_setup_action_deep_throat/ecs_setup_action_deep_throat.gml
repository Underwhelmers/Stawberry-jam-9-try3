function ecs_setup_action_deep_throat() {
    ecs_setup_system_multiplayer_action(
        "deep throat {name1}'s {name2}",
        [["is_present", "is_naked"], ["is_phallus"]],
        function(entities) {
            var char = entities[0];
            var bodypart = entities[1];
            scr_inform("You deep throat {0}'s {1}.", (char.name), bodypart.name);
            char.arousal_level += 40;
            scr_chat((char.name), "*Groans deeply*");
        }
    );
}