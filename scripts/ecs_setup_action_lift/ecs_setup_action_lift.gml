function ecs_setup_action_lift() {
    ecs_setup_system_multiplayer_action(
        "lift {name1}'s {name2}",
        [["is_present", "is_character", "!is_naked"], ["is_clothing"]],
        function(entities) {
            var char = entities[0];
            var bodypart = entities[1];
            scr_inform("You lift {0}'s {1}.", (char.name), bodypart.name);
            char.arousal_level += 10;
            scr_chat((char.name), "*Tenses briefly*");
        }
    );
}