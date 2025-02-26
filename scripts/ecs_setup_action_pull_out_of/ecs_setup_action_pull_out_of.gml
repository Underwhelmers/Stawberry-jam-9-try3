function ecs_setup_action_pull_out_of() {
    ecs_setup_system_multiplayer_action(
        "pull out of {name1}'s {name2}",
        [["is_present", "is_penetrated"], ["is_body_part"]],
        function(entities) {
            var char = entities[0];
            var bodypart = entities[1];
            scr_inform("You pull out of {0}'s {1}.", (char.name), bodypart.name);
            StateComponents.types[$ "is_penetrated"].remove_from(char);
            scr_chat((char.name), "*Pants heavily*");
        }
    );
}