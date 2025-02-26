function ecs_setup_action_dress() {
    ecs_setup_system_player_action(
        "dress {name}",
        ["is_present", "is_naked"],
        function(entity) {
            scr_inform("You help dress {0}.", (entity.name));
            StateComponents.types[$ "is_naked"].remove_from(entity);
            scr_chat((entity.name), "*Slips into their garments*");
        }
    );
}