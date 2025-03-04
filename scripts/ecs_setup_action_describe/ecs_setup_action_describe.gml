function ecs_setup_action_describe() {
    ecs_setup_system_player_action(
        "describe {name}",
        ["identity"],
        function(entity) {
            var desc = entity.identity.description;
            scr_chat("THOUGHT", "{0}. {1}", (entity.name), desc);
        }
    );
}