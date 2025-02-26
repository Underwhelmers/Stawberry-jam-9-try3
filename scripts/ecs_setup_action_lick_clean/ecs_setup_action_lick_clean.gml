function ecs_setup_action_lick_clean() {
    ecs_setup_system_multiplayer_action(
        "lick clean {name1}'s {name2}",
        [["is_present", "has_climaxed"], ["is_body_part"]],
        function(entities) {
            var char = entities[0];
            var bodypart = entities[1];
            scr_inform("You lick clean {0}'s {1}.", (char.name), bodypart.name);
            scr_chat((char.name), "*Sighs in contentment*");
        }
    );
}