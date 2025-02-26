function ecs_setup_action_cuddle() {
    ecs_setup_system_player_action(
        "cuddle {name}",
        ["is_present", "is_aroused"],
        function(entity) {
            scr_inform("You cuddle {0}.", (entity.name));
            StateComponents.types[$ "is_embraced"].add_to(entity);
            entity.relationship_level += 5;
            scr_chat((entity.name), "*Snuggles closer*");
        }
    );
}