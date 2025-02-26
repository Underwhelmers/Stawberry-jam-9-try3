function ecs_setup_action_talk_to() {
    ecs_setup_system_player_action(
        "talk to {name}",
        ["is_present", "is_character"],
        function(entity) {
            scr_inform("You talk to {0}.", entity.name);
            StateComponents.types[$ "has_talked"].add_to(entity);
            scr_chat(entity.name, "*Nods in response*");
        }
    );
}