function ecs_setup_action001_describe() {
    ecs_setup_system_player_action(
        "describe {name}",
        ["identity", "!is_bodypart", "sharing_room"],
        function(entity) {
            var desc = entity.identity.description;
            scr_chat("THOUGHT", "{0}... {1}", string_capitalize(entity.name), desc);
        }
    );
}