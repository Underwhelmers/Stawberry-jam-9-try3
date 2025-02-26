function ecs_setup_action_flirt_with() {
    ecs_setup_system_player_action(
        "flirt with {name}",
        ["is_present", "has_talked"],
        function(entity) {
            scr_inform("You flirt with {0}.", entity.name);
            StateComponents.types[$ "is_aroused"].add_to(entity);
            entity.arousal_level += 15;
            scr_chat(entity.name, "*Smiles coyly*");
        }
    );
}