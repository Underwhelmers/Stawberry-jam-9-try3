function ecs_setup_action_ask_name_to() {
    ecs_setup_system_player_action(
        "ask name to {name}",
        ["is_present", "has_talked"],
        function(entity) {
            scr_inform("You flirt with {0}.", entity.name);
            StateComponents.types[$ "is_aroused"].add_to(entity);
            entity.arousal_level += 15;
            scr_chat(entity.name, "*Smiles coyly*");
        }
    );
}