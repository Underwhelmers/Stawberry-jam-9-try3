function ecs_setup_action_ask_name_to() {
    ecs_setup_system_player_action(
        "ask name to {name}",
        ["is_present", "has_talked", "!name_known"],
        function(entity) {
            scr_inform("You asked name to the.", entity.name);
            StateComponents.types[$ "name_known"].add_to(entity);
			entity.name = entity.truename;
            scr_chat(entity.name, "*Smiles coyly*");
        }
    );
}