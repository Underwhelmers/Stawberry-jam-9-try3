function ecs_setup_action_free() {
    ecs_setup_system_player_action(
        "free {name}",
        ["is_present", "is_bound"],
        function(entity) {
            scr_inform("You free {0} from their bonds.", (entity.name));
            StateComponents.types[$ "is_bound"].remove_from(entity);
            scr_chat((entity.name), "*Stretches with relief*");
        }
    );
}