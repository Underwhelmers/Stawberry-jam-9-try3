function ecs_setup_action_undress() {
    ecs_setup_system_player_action(
        "undress {name}",
        ["is_present", "has_talked"],
        function(entity) {
            scr_inform("You undress {0}.", (entity.name));
            StateComponents.types[$ "is_naked"].add_to(entity);
            entity.arousal_level += 20;
            scr_chat((entity.name), "*Breathes faster*");
        }
    );
}