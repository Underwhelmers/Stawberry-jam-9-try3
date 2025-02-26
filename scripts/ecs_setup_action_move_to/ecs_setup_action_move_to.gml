function ecs_setup_action_move_to() {
    ecs_setup_system_player_action(
        "move to {name}",
        ["is_location"], // Targets a location
        function(entity) {
            scr_inform("You move to the {0}.", entity.name);
            // Update player's location state (assumes a player entity exists)
            global.player_entity.current_location = entity.name;
        }
    );
}