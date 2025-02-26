function ecs_setup_action_whisper_to() {
    ecs_setup_system_player_action(
        "whisper to {name}",
        ["is_present", "has_talked"],
        function(entity) {
            scr_inform("You whisper to {0}.", entity.name);
            entity.arousal_level += 10;
            scr_chat(entity.name, "*Leans closer to hear*");
        }
    );
}