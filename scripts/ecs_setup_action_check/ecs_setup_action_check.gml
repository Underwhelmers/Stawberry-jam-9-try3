function ecs_setup_action_check() {
    ecs_setup_system_player_action(
        "check {name}",
        ["is_present"],
        function(entity) {
            var desc = entity.basic_description;
            if (entity.arousal_level > 0) desc += " They seem aroused.";
            if (StateComponents.types[$ "is_naked"].exists_on(entity)) desc += " They’re naked.";
            scr_inform("You check {0}: {1}", (entity.name), desc);
        }
    );
}