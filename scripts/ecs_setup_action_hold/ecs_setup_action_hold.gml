function ecs_setup_action_hold() {
    ecs_setup_system_player_action(
        "hold {name}",
        ["is_present", "has_talked"],
        function(entity) {
            scr_inform("You hold {0} gently.", entity.name);
            StateComponents.types[$ "is_embraced"].add_to(entity);
            entity.arousal_level += 10;
            scr_chat(entity.name, "*Rests against you*");
        }
    );
}