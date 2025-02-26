function ecs_setup_action_climax() {
    ecs_setup_system_player_action(
        "climax with {name}",
        ["is_present", "is_intimate"],
        function(entity) {
            scr_inform("You climax with {0}.", (entity.name));
            StateComponents.types[$ "has_climaxed"].add_to(entity);
            entity.arousal_level = 0;
            scr_chat((entity.name), "*Shudders in release*");
        }
    );
}