function ecs_setup_action_spank() {
    ecs_setup_system_multiplayer_action(
        "spank {name1}'s {name2}",
        [["is_present", "is_aroused"], ["is_body_part"]],
        function(entities) {
            var char = entities[0];
            var bodypart = entities[1];
            scr_inform("You spank {0}'s {1}.", (char.name), bodypart.name);
            char.arousal_level += 20;
            if (StateComponents.types[$ "has_fetish_dominance"].exists_on(char)) {
                scr_chat((char.name), "*Grins at the sting*");
            } else {
                scr_chat((char.name), "*Yelps softly*");
            }
        }
    );
}