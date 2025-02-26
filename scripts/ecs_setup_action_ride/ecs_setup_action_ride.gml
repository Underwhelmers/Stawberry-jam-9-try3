function ecs_setup_action_ride() {
    ecs_setup_system_multiplayer_action(
        "ride {name1}'s {name2}",
        [["is_present", "is_naked", "is_aroused"], ["is_phallus"]],
        function(entities) {
            var char = entities[0];
            var bodypart = entities[1];
            scr_inform("You ride {0}'s {1}.", (char.name), bodypart.name);
            char.arousal_level += 40;
            if (char.arousal_level >= 100) {
                StateComponents.types[$ "has_climaxed"].add_to(char);
                scr_chat((char.name), "*Cries out in climax*");
            } else {
                scr_chat((char.name), "*Groans with intensity*");
            }
        }
    );
}