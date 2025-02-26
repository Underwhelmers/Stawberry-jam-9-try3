function ecs_setup_action_look() {
    ecs_setup_system_player_action(
        "look around",
        ["is_location", "shares_pc_location"], // Targets current location
        function(entity) {
            scr_inform("You look around the {0}.", entity.name);
        }
    );
}