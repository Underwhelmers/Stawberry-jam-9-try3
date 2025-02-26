function ecs_setup_action_rest_with() {
    ecs_setup_system_player_action(
        "rest with {name}",
        ["is_present", "has_climaxed"],
        function(entity) {
            scr_inform("You rest with {0}.", (entity.name));
            entity.arousal_level = 0; // Reset arousal
            scr_chat((entity.name), "*Lies beside you peacefully*");
        }
    );
}